---
layout: post

title: "JAVA Chapter08 입출력 스트림과 파일 입출력 - 바이트 스트림과 문자 스트림 / 문자 스트림 클래스 / 파일 입출력과 예외처리 / InputStreamReader / FileWriter / FileOututStream / FileInputStream / 버퍼입출력과 파일 입출력 / 버퍼에 남아 있는 데이터 출력(flush) / File 클래스 / 블록 단위로 파일 고속 복사"
excerpt: "바이트 스트림과 문자 스트림 / 문자 스트림 클래스 / 파일 입출력과 예외처리 / InputStreamReader / FileWriter / FileOututStream / FileInputStream / 버퍼입출력과 파일 입출력 / 버퍼에 남아 있는 데이터 출력(flush) / File 클래스 / 블록 단위로 파일 고속 복사"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 08. 입출력 스트림과 파일 입출력

### 스트림 입출력이란?

컴퓨터공학에서 연속적인 데이터의 흐름 혹은 데이터를 전송하는 소프트웨어 모듈을 일컫는다. 컴퓨터에서 스트림은 도착한 순서대로 데이터를 흘러 보낸다.

자바에서 입출력 스트림으 응용프로그램과 입출력 장치를 연결하는 소프트웨어 모듈이다. 

* 스트림의 양끝에는 입출력 장치와 자바 응용프로그램이 연결된다. 
* 스트림은 **단방향** 이다 : input, output스트림 두가지 기능을 모두 가진 스트림은 없다.
* 스트림을 통해 흘러가는 기본 단위는 바이트나 문자다
* 스트림은 선입선출, 즉 FIFO 구조이다.(ex 키보드, 스택은 후입선출)

---

### 바이트 스트림과 문자 스트림

자바에서 입출력 스트림은 <u>바이트스트림(~Stream)과 문자스트림(Reader, Writer)</u>의 2종류이다.
바이트스트림은 정보를 단순 바이너리(비트들)로 다루기 때문에 문자든 이미지든 상관없이 흘려보낸다.      
문자스트림은 문자만 다루기 때문에 문자가 아닌 데이터가 출력되면 보이지 않거나, 엉뚱한 기호가 출력된다.   

---

##### 스트림 연결

스트림은 서로 연결될 수 있다.(ex 쿠키 굽는 시스템)   
키보드와 연결된 표준 입력스트림인 System.in 

```java
InputStream rd = new InputStream(System.in);
int c = rd.read();  //입력 스트림으로부터 키 입력. c는 입력된 키의 문자값
```

---

### 문자 스트림 클래스

<u>2바이트의 유니코드 문자</u>를 단위로 입출력하는 스트림이다.(문자스트림은 정말로 문자만!) 

---

##### 파일 입력 스트림 생성

```java
FileReader fin = new FileReader("c:\\test.txt");
```

##### 파일 읽기

```java
int c;   //2바이트로 끊음
while( (c = fin.read()) != -1 ){   //문자 하나에 c를 읽어들인다. 파일을 끝까지 반복한다.
  System.out.print((char)c);  //char 형변환해서 사용
}
```

##### 파일이 큰 경우 버퍼 사용

```java
char [] buf = new char[1024];   //1024는 1KB이다
int n = fin.read(buf);  //한번에 1024개 문자를 읽어 buh[]에 저장하고 리턴
```

---

### 스트림 닫기

```java
fin.close();
```

---

### 파일 입출력과 예외처리

첫째, 파일의 경로명이 틀린 경우 <u>FileNotFoundException</u> 예외 발생

```java
FileReader fin = new FileReader("c:\\test.txt");
```

둘째, 파일 읽기, 쓰기, 닫기를 하는 동안 입출력 오류가 발생하면 <u>IOException</u> 에외 발생

```java
int c = fin.read();
```

그러므로 파일 입출력 코드에 try-catch 블록이 필요하다

```java
//구조 순서?
Exception
ㄴIOE
  ㄴFileNotFoundException

try{
  FileReader fin = new FileReader("c:\\test.txt");  //FileNotFoundException 오류 발생 가능
  ...
  int c = fin.read();  //IOException 오류 발생 가능
  ...
  fin.close();  //fin이 null상태이거나 파일을 열고있지 않았을때 오류 발생 가능
}catch(FileNotFoundException e){
  System.out.ptintln("파일을 읽을 수 없음");
}catch(IOEception){
  System.out.ptintln("입출력 오류");
}

//catch문 맨 위에(첫번째로) Exception 넣으면 오류 발생시 얘가 다 채가서 안된다. catch문은 순서대로(위에서 아래)로 잡기 때문. java문 맨 위에 구조순서? 참조!
//그렇기때문에 중요한 예외는 전용으로 만들어서 위로 뺀다!!!
```

예제 8-1) FileReader로 텍스트 파일 읽기

```java
import java.io.*;

public class FileReaderEx{
  public static void main(String[] args){
    FileReader fin = null;
    try{
      fin = new FileReader("c:\\windows\\system.ini"); //문자 입력 스트림 생성. 오류 발생 가능->FileNotFound 경로에 파일 없을때 
      int c;
      while( (c = fin.read()) != -1 ){  //오류 발생 가능->읽는 중 오류
        System.out.print((char)c);
      }
      fin.close();  //오류 발생 가능->fin이 null상태일때, 파일을 열고있지 않았을 때 
    }catch(IOException e){   //이 위에 catch로 IOE보다 상위인 Exception 넣으면 얘가 다 채가서 안된다. 중요한 예외는 전용으로 만들어서 위로 뺄 것!!!!!!!!! catch는 위에서 아래로 순서대로 잡힘
      System.out.println("입출력 오류");
    }
  }
}
```

---

### 문자 집합과 InputStreamReader를 이용한 텍스트 파일 읽기

InputStreamReader는 스트림에 입력되는 바이트 데이터를 문자 집합을 통해 문자로 변환한다. (인풋 스트림은 읽을때 쓸때 바이트 단위로!!!) 

---

### InputStreamReader로 문자 입력 스트림 생성

```java
FileInutStream fin = new FileInputStream("c:\\Temp\\hangul.txt");  //바이로 읽음
InputStreamReader in = new InputStreamReader(fin, "UTF-8");  //글자로 바꿔줌
```

예제 8-2) InputStreamReader로 한글 텍스트 파일 읽기

```java
import java.io.*;
public class FileReadHangulSuccess {

	public static void main(String[] args) {
		InputStreamReader in = null;
		FileInputStream fin = null;
		
		try{
			fin = new FileInputStream("D:\\C_project\\hangul.txt");
			in = new InputStreamReader(fin, "UTF-8");
			int c;
			
			System.out.println("인코딩 문자 집합은 " + in.getEncoding());  //in.getEncoding은 
			while((c = in.read()) != -1 ) {
				System.out.print((char)c);
			}
			in.close();
			fin.close();
			
		}catch(IOException e) {
			System.out.println("입출력 오류");
		}

	}

}
```

---

### FileWriter를 이용한 텍스트 파일 쓰기(문자로 기록)

##### 파일 출력 스트림 생성


```java
FileWriter fout = new FileWriter("c:\\Temp\\test.txt");
```

FileWriter의 생성자는 c:\\Temp\\test.txt 파일을 열어 스트림과 연결한다. 파일이 빈 경우 빈 파일을 생성하며, 이미 파일이 있는 경우 파일 내용을 지우고 파일의 처음부터 쓸 준비를 한다.

##### 파일 쓰기

```java
fout.write('A');   //close까지해줘야 기록됨

char [] buf = new char[1024];   //1024까지 담을 수 있는 버퍼 만들기
fout.write(buf, 0, buf.length;)   //0은 시작위치값, 그뒤는 길이(쓸 갯수)
```

##### 스트림 닫기

```java
fout.close();
```

예제 8-4) 키보드 입력을 파일로 저장하기

```java
import java.io.*;
import java.util.*;

public class FileWriterEx {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		FileWriter fout = null;
		//int c;
		try {
			fout = new FileWriter("D:\\C_project\\hangul.txt");
			while(true) {
				String line = scanner.nextLine();  //빈 칸을 포함하여 한 줄 읽기. line에는 \n이 들어가지 않음
				if(line.length() == 0) {  // 한 줄에 enter키만 입력한 경우
					break;
				}
				fout.write(line, 0, line.length());  //읽은 문자열을 파일에 저장
				fout.write("\r\n", 0, 2);  //한 줄 띄기 위해 \r\n을 파일에 
			}
			fout.close();
		}catch(IOException e) {
			System.out.println("입출력 오류");
		}
		scanner.close();
	}

}
```

---

### 바이트 스트림 클래스

바이트 단위로 바이너리 데이터가 흐르는 스트림이다. 이미지나 동여앙 파일 입출력에 필수적이고, 문자들로 구성된 텍스트 파일도 입출력 할 수 있다

* InputStream/OutputStream : 추상클래스이며, 바이트 입출력 처리를 위한 공통 기능을 가진 슈퍼 클래스이다.
* FileInputStream/FileOutputStream : 파일 입출력을 위한 클래스로서, 파일로부터 바이너리 데이터를 읽거나 파일에 바이너리 데이터를 저장할 수 있다.
* DataInputStream/dataOutputStream : 이 스트림을 이용하면 boolean, char ... 타입의 값을 바이너리 형태로 입출력한다. 문자열도 바이너리 형태로 입출력한다.

---

### FileOututStream을 이용한 바이너리 파일 쓰기

바이너리값을 그대로 파일에 저장해야하는 경우가 있다. 메모리에 있는 이미지 비트들을 그대로 이미지 파일로 저장하는 경우이다. 

##### 파일 출력 스트림 생성

```java
FileOutputStream fout = new FileOutputStream("c:\\Temp\\test.out");
```

파일이 이미 있으면 그 내용을 지우고 스트림에 연결한다. 쓰기가 이루어지면 해당 파일은 바이너리 파일이 된다.

##### 파일 쓰기

```java
byte b[] = {7,51,3,4,-1,24};
for(int i=0; i<b.length; i++){
  fout.write(b[i]);
}

//for문 없이 한번에 배열 b[]를 저장할 수도 있다.
fout.write(b);
```

예제 8-5) FileOututStream로 바이너리 파일 쓰기

```java
import java.io.*;

public class FileOutputStreamEx {

	public static void main(String[] args) {
		byte b[] = {7, 51, 3, 4, -1, 24};
		
		try {
			FileOutputStream fout = new FileOutputStream("D:\\C_project\\test.out");
			for(int i=0; i<b.length; i++) {
				fout.write(b[i]);
			}
			fout.close();
		}catch(IOException e) {
			System.out.println("D:\\C_project\\hangul.txt에 저장할 수 없습니다. 경로명 확인");
			return;
		}
		System.out.println("D:\\C_project\\hangul.txt을 저장했습니다.");
	}

}
```

---

### FileInputStream을 이용한 바이너리 파일 읽기

##### 파일 입력 스트림 생성

```java
FileInputStream fin = new FileInputStream("c:\\Temp\\test.out");
```

##### 파일 읽기

```java
byte b[] = new byte [6];  //비어있는 배열
int n=0, c;
while( (c=fin.read()) != -1 ){  //파일 끝(EOF)까지 한 바이트씩 읽기
  b[n] = (byte)c;  //읽은 바이트를 배열에 저장
  n++;
}
for(int i=0; i<b.length; i++){
  fout.write(b[i]);
}

//이 코드의 끝에 있는 다섯 줄은 한줄로 한번에 배열로 읽어들일 수 있다
fin.read(b);  //파일에서 배열 b[]의 크기만큼 바이트 읽기
```

##### 스트림 닫기

```java
fin.close();
```

8-6) FileInputStream로 바이너리 파일 읽기

```java
import java.io.*;

public class FileInputStreamEx {

	public static void main(String[] args) {
		byte b[] = new byte[6];
		try {
			FileInputStream fin = new FileInputStream("D:\\C_project\\test.out");
			int n=0, c;
			while((c = fin.read()) != -1 ) {
				b[n] = (byte)c;
				n++;
			}
			System.out.println("D:\\C_project\\hangul.txt에서 읽은 배열을 출력합니다.");
			for(int i=0; i<b.length; i++) {
				System.out.println(b[i] + " ");
			}
			System.out.println();
			
			fin.close();
		}catch(IOException e) {
			System.out.println("D:\\C_project\\hangul.txt에서 읽지 못했습니다. 경로명 체크");
		}
	}

}
```

---

### 버퍼입출력과 파일 입출력

버퍼스트림 역시 데이터의 타입에 따라 바이트 버퍼 스트림과 문자 버퍼 스트림으로 구분된다.

##### 버퍼 출력 스트림 생성

```java
BufferedOutputStream bout = new BufferedOutputStream(System.out, 20);
```

##### 스트림 출력

```java
FileReader fin = new FileReader("c:\\test.txt");
int c;
while( (c=fin.read()) != -1 ){  //파일 끝을 만날 때까지 문자들을 하나씩 읽는다
  bout.write((char)c);  //읽은 문자를 버퍼 출력 스트림에 쓴다. 출력 스트림과 연결된 화면에 출력된다
}
```

---

### 버퍼에 남아 있는 데이터 출력★★★

버퍼는 꽉 찼을 때 출력된다. 버퍼가 다 차지 않는 상태에서 버퍼에 있는 데이터를 강제로 출력장치로 보내려면 flush() 메소드를 호출하면 된다.

```java
bout.flush();  //데이터가 다 차지 않더라도 남아있는 데이터 모두 출력!!!
```

##### 스트림 닫기

```java
bout.close();
fin.close();
```

예제 8-7) 버퍼 스트림을 이용한 출력

```java
import java.io.*;
import java.util.Scanner;

public class BufferedIOEx {

	public static void main(String[] args) {
		FileReader fin = null;
		int c;
		try {
			fin = new FileReader("D:\\C_project\\test2.txt");
			BufferedOutputStream out = new BufferedOutputStream(System.out, 5);
			while((c = fin.read()) != -1) {  //파일 데이터를 모두 스크린에 출력
				out.write(c);
			}
      //파일 데이터가 모두 출력된 상태
			new Scanner(System.in).nextLine(); //enter키 입력. 정상적으로 출력되는지 확인
			out.flush();  //버퍼에 남아있던 문자 모두 출력
			fin.close();
			out.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

}
```

---

### File 클래스

파일이나 디렉터리에 대해 <u>경로명, 크기, 타입, 수정날짜 등의 속성 정보를 제공</u>하고, <u>파일삭제, 디렉터리 생성, 파일 이름 변경, 디렉터리 내의 파일 리스트 제공 등 다양한 파일 관리 작업을 지원</u>한다. File클래스에는 파일 입출력 기능은 없다.

* length() : 파일이나 디렉터리 크기 리턴
* getName() : 파일명만
* getPath() : 완전 경로명
* getParent() : 부모 디렉터리를 문자열로 리턴
* isFile() : 파일인경우 true 리턴
* isDirectory() : 디렉터리인 경우 true 리턴
* listFiles() : 모든 파일과 서브디렉터리의 리스트를 얻을 수 있다.

예제 8-8) file 클래스를 활용한 파일관리

```java
import java.io.File;

public class fileEx {
	public static void listDirectory(File dir) {  //디렉토리에 포함된 파일과 서브 디렉토리의 이름, 크기, 수정 시간을 출력하는 메소드
		System.out.println("------" + dir.getPath() + "의 서브 리스트입니다.-------");
		
		File[] subFiles = dir.listFiles();  //디렉토리에 포함된 파일과 디렉토리 이름의 리스트 얻기
		
		for(int i=0; i<subFiles.length; i++) {  //subFiles 배열의 각 File에 대해 루프
			File f = subFiles[i];
			long t = f.lastModified();  //마지막으로 수정된 시간
			System.out.print(f.getName());
			System.out.print("\t파일크기 : " + f.length());  //파일크기
			System.out.printf("\t수정한 시간 : %tb %td %ta %tT\n", t, t, t, t);  //포맷 출력
		}
	}

	public static void main(String[] args) {
		File f1 = new File("C:\\Windows\\system.ini");
		System.out.println(f1.getPath() + ", " + f1.getParent() + ", " + f1.getName());
		
		String res = "";
		if(f1.isFile()) {  //파일타입이면
			res = "파일";
		}else if(f1.isDirectory()) {  //디렉토리 타입이면
			res = "디렉토리";
		}
		System.out.println(f1.getPath() + "은 " + res + "입니다.");
		
		File f2 = new File("C:\\Temp\\java_sample");  //새로 만들고자 하는 디렉토리
		if( !(f2.exists()) ) {  //f2 디렉터리가 존재하는지 검사
			f2.mkdir();  //존재하지 않으면 디렉토리 생성. mkdir은 폴더 만드는 명령
		}
		
		listDirectory(new File("C:\\Temp"));  //파일 리스트 출력
		f2.renameTo(new File("C:\\Temp\\javasample"));  //java_sample->javasample로 파일 이름 변경/ renameTo는 파일 폴더 이름 바꾸기
		listDirectory(new File("C:\\Temp"));  //javasample로 변경한 후 리스트 출력
	}

}
```

---

### 텍스트 파일 복사

텍스트파일은 문자 스트림이나 바이트 스트림 중 어떤 것을 사용해도 무관하다.   
FileReader를 이용하여 텍스트 파일을 읽고, FileWriter로 텍스트 파일에 복사한다. 파일 경로명은 File 객체를 이용한다

---

### 바이너리 파일 복사

바이너리파일은 바이트스트림으로 읽고 써야 정확하게 복사가 이루어진다.
이미지, 동영상, 실행파일(exe)뿐만 아니라 텍스트 파일도 복사 가능하다.

---

### 블록 단위로 파일 고속 복사(묶은 단위로 복사할 때 복사가 더 빠르다. 그래서 고속복사)

버퍼 사용한다. 일정 사이즈 잡고 파일 복사한다. 많이 쓴다~~

예제 8-11) 블록 단위로 바이너리 파일 고속 복사

```java
import java.io.*;

public class BlockBinaryCopyEx {

	public static void main(String[] args) {
		File src = new File("C:\\Windows\\Web\\Wallpaper\\Theme1\\img2.jpg");
		
		File dest = new File("C:\\Temp\\desert.jpg");  //복사파일
		try {
			FileInputStream fi = new FileInputStream(src);  //파일 입력 바이트 스트림
			FileOutputStream fo = new FileOutputStream(dest);  //파일 출력 바이트 스트림
			byte[] buf = new byte[1024*10];  //여기부터 fi.close() 위까지 많이 씀!!!!!! 일정 사이즈 잡고 파일 
			while(true) {
				int n = fi.read(buf);  //버퍼 크기만큼 읽기. n은 실제 읽은 바이트
				fo.write(buf, 0, n);  //buf[0]부터 n 바이트 쓰기
				if(n < buf.length) {  // 같다면 while 계속 돈다
					break;  //버퍼 크기보다 작게 읽었기 때문에 파일 끝에 도달. 복사 종료
				}
			}
			fi.close();
			fo.close();
			System.out.println(src.getPath() + "를 " + dest.getPath() + "로 복사했습니다.");
		}catch(IOException e){
			System.out.println("파일 복사 오류");
		}
	}

}
```

---

### 최종 정리

**바이트스트림** 은 ~stream, 바이너리. 이진화데이터, 읽기는 ~InputStream, 저장은 ~OutputStream     
**문자스트림** 은 ~reader, 문자만, 읽기는 ~reader, 쓰기는 ~writer
