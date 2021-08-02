---
layout: post

title: "JAVA Chapter03 반복문과 배열 그리고 예외 처리 - 배열의 크기 구하기 / 배열과 for-each 문 / 다차원 배열 / 비정방형 배열 / main() 메소드 / 자바의 예외 처리 / 예외처리 try-catch-finally문 / "
excerpt: "배열의 크기 구하기 / 배열과 for-each 문 / 다차원 배열 / 비정방형 배열 / main() 메소드 / 자바의 예외 처리 / 예외처리 try-catch-finally문 / "

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 반복문과 배열 그리고 예외 처리

### 반복문 (for문, while문, do-while문)

### continue문과 break문

---

### 배열



### legnth 필드를 이용하여 배열의 크기 구하기

length가 c에서는 말록. 훨씬 단순화 됐다!

예제 3-8)
배열 원소의 평균 구하기

```java
import java.util.Scanner;

public class ArrayLength{
  public statatic void main(String[] args){
    int intArray[] = new int[5];
    int sum = 0;

    Scanner scanner = new Scanner(System.in);
    System.out.print(intArray.legnth + "개의 정수를 입력하세요 >>");
    for(int i = 0; i < intArray.legnth; i++){
      intArray[i] = scanner.nextInt();
    }

    for(int i = 0; i < intArray.length; i++){
      sum += intArray[i];
    }

    System.out.print("평균은 " +(double)sum/intArray.length);
    scanner.close();
  }
}
```

---

### 배열과 for-each 문

```java
for(변수 : 배열레퍼런스){
  ...반복작업문...
}
```

```java
int [] n = {1,2,3,4,5};
int sum = 0;
for (int k : n) {     //변수와 위에 선언한 n의 타입은 동일해야한다(int)
  sum += k;
}

//위아래 같음-------------------------------------------

for(int i = 0; i < n.length; i++){
  int k = n[i];
  sum += k;
}
```

예제 3-9)
for-each문 활용

```java
public class foreachEx{
  enum Week {월, 화, 수, 목, 금, 토, 일}

  public static void main(String[] args){
    int [] n = {1,2,3,4,5};
    String names[] = {"사과","배","바나나","체리","딸기","포도"};

    int sum = 0;

    for(int k : n){
      System.out.print(k + " ");
      sum += k;
    }
    System.out.println("합은" + sum);

    for(String s : name){
      System.out.print(s + " ");
    }
    System.out.println();

    for(Week day : Week.values()){
      System.out.print(day + "요일 ");
    }
    System.out.println();
  }
}

//결과
//1 2 3 4 5 합은 15
//사과 배 바나나 체리 딸기 포도
//월요일 화요일 수요일 목요일 금요일 토요일 일요일
```

---

### 다차원 배열

배열은 무조건 참조!
c는 배열 선언 시 시작 주소값 가짐.
자바는 실행시 크기 잡음?(c는 컴파일시)

예제 3-10)
2차원 배열에 학년별로 1, 2학기 성적으로 저장하고, 4년간 전체 평점 평균을 출력하라.

```java
public class ScoreAverage{
  public static void main(String[] args){
    double score[][] = { {3.3, 3.4}, {3.5, 3.6}, {3.7, 4.0}, {4.1, 4.2} };
    double sum = 0;

    for (int year = 0; year<score.length; year++){  //각 학년별로 번복
      for(int term=0; term<score[year].length; term++){  //학기별로 번복
        sum += score[year][term];
      }
    }

    int n = score.length; //배열의 행 개수, 4(4학년)
    int m = score[0].length; //배열의 열 개수, 2(2학기)
    System.out.println("4년 전체 평점 평균은 " + sum/(n*m));
  }
}

//결과
//4년 전체 평점 평균은 3.725
```

---

### 비정방형 배열

```java
int i [][]; //2차원 배열의 레퍼런스 변수 i 선언. 공간만들기!!!!!
i = new int [4][];  //각 행을 가리키는 레퍼런스 배열 생성. 행만들기!!!!!
i[0] = new int[1];  //첫째 행에 1 크기의 배열 생성. 각 행에 크기 연결!!!!!
i[1] = new int[2];  //둘째 행에 2 크기의 배열 생성
i[2] = new int[3];  //셋째 행에 3 크기의 배열 생성
i[3] = new int[4];  //넷째 행에 4 크기의 배열 생성
```

여기서 length 필드의 의미는

* i.length -> 2차원 배열의 **행**의 개수, 4
* i[0].length -> 0번재 행의 **열**의 개수, 1

예제 3-11)
다음 그림과 같은 비정방형 배열을 만들어 값을 초기화하고 출력하라.

10   11   12      
20   21        
30   31   32      
40   41      

```java
public class SkewedArray{
  public static void main(String[] args){
    int intArray[][] = new int[4][];
    intArray[0] = new int[3];
    intArray[1] = new int[2];
    intArray[2] = new int[3];
    intArray[3] = new int[2];

    for(int i=0; i<intArray.length; i++){
      for(int j=0; j<intArray[i].length; j++){
        intArray[i][j] = (i+1)*10 + j;
      }
    }

    for(int i=0; i<intArray.length; i++){
      for(int j=0; j<intArray[i].length; j++){
        System.out.print(intArray[i][j] + " ");
      }
      System.out.println();
    }
  }
}
```

---

### 메소드에서 배열 리턴

---

### main() 메소드

* main() 메소드는 public 속성이다. : 접근제어. 메소드가 다른 클래스에서 호출 가능함을 나타낸다.
* main() 메소드는 static 속성이다. : 항시 사용가능한 메소드
* main() 메소드의 리턴 타입은 void이다. : 값 없음

---

### 자바의 예외 처리

간단하게 될게 아님. 잘쓰면 약, 잘못쓰면 독
자바에서 오동작이나 결과에 악영향을 미칠 수 있는 실행 중 발생한 오류를 예외라고 한다.

* 정수를 0으로 나누는 경우
* 배열의 크기보다 큰 인덱스로 배열의 원소를 접근하는 경우
* 존재하지 않는 파일을 읽으려고 하는 경우
* 정수 입력을 기다리는 코드가 실행되고 있을 때, 사용자가 문자를 입력한 경우

---

### 예외처리 try-catch-finally문

무분멸하게 사용시 죽지 않고 오류를 발생할 수도 있음. 에러코드를 같이 달아야 함.

```java
try{
  예외가 발생할 가능성이 있는 실행문(try 블록). (정수입력인데 문자 입력시)
}
catch(처리할 예외 타입 선언){
  예외 처리문(catch 블록). (후처리할거). 여러개 사용 가능하나 잘못타서 잘못들어갈 수 있음
}
finally{
  예외발생 여부와 상관 없이 무조건 실행되는 문장(finally 블록). 생략 가능. (접속 끊기)
}
```

|  예외타입(예외 클래스) | 예외 발생 경우  | 패키지  |
|---|---|---|
| ArithmeticException  | 정수를 0으로 나눌 때 발생  | java.lang  |
| NullPinterException  | null 레퍼런스를 참조할 때 발생(포인터는 있는데 참조 대상이 없을 때) | java.lang  |
| ClassCastException  |  변환할 수 없는 타입으로 객체를 변환할 때 발생 | java.lang  |
| OutOfMemoryError  | 메모리가 부족한 경우 발생  | java.lang  |
| ArrayIndexOutOfBoundsException  |  배열의 범위를 벗어난 접근 시 발생 |  java.lang |
| IllegalArgumentException  | 잘못된 인자 전달 시 발생  | java.lang  |
| IOException  |  입출력 동작 실패 또는 인터럽트 시 발생 |  java.io |
| NumberFormatException  | 문자열이 나타낸느 숫자와 일치하지 않는 타입의 숫자로 변환 시 발생  |  java.lang |
| InputMismatchException  |  Scanner 클래스의 nextInt()를 호출하여 정수로 입력받고자 하였지만, 사용자가 'a' 등과 같이 문자를 입력한 경우 | java.util  |

예제 3-16)
배열의 인덱스가 범위를 벗어날 때 발생하는 ArrayIndexOutOfBoundsException을 처리하는 프로그램을 작성하라.

```java
public class ArrayException{
  public static void main(String[] args){
    int[] intArray = new int[5];
    intArray[0] = 0;

    try{
      for(int i=0; i<5; i++){
        intArray[i+1] = i+1 + intArray[i];
        System.out.println("intArray [" + i + "]" + "=" +intArray[i]);
      }
    }
    catch(ArrayIndexOutOfBoundsException e){
      System.out.println("배열의 인덱스가 범위를 벗어났습니다.");
    }
  }
}
```

---

### p.164~170 실습문제

**1** 
다음 프로그램에 대해 물음에 답하라?

```java
int sum=0, i=0;
while(i < 100){
  sum = sum + i;
  i += 2;
}
System.out.println(sum);
```

1) 무엇을 계산하는 코드이며 실행 결과 출력되는 내용은? -> 1~100까지 짝수의 합. 
2450

2) 위의 코드를 main()메소드로 만들고 WhileTest 클래스로 완성하라.

```java
public class WhileTest {
	public static void main(String[] args) {
		
		int sum=0, i=0;
		while(i < 100){
		  sum = sum + i;
		  i += 2;
		}
		System.out.println(sum);
	}
}
```

3) for 문을 이용하여 동일하게 실행되는 ForTest 클래스를 작성하라.

```java
public class ForTest {
	public static void main(String[] args) {
		int sum=0;
		
		for(int i = 0; i < 100; i += 2) {
			sum = sum + i;
		}
		System.out.println(sum);
	}
}
```

4) do-while 문을 이용하여 동일하게 실행되는 DoWhileTest 클래스를 작성하라.

```java
public class DoWhileTest {
	public static void main(String[] args) {
		int sum=0, i=0;
		
		do{
			sum = sum + i;
			i += 2;
		}while(i<100);
		
		System.out.println(sum);
	}
}
```

**2**
다음 2차원 배열 n을 출력하는 프로그램을 작성하라

```java
int n[][] = { {1}, {1,2,3}, {1}, {1,2,3,4}, {1,2} };
```
1       
1  2  3      
1      
1  2  3  4       
1  2

```java
public class DoWhileTest {
	public static void main(String[] args) {
		int n[][] = { {1}, {1,2,3}, {1}, {1,2,3,4}, {1,2} };
		
		int sum;
		for(int i = 0; i < n.length; i++) {
			for(int k = 0; k < n[i].length; k++ ) {
				sum = n[i][k];
				System.out.print(sum + " ");
			}
			System.out.println();
		}
	}
}
```

**3**
Scanner를 이용하여 정수를 입력받고 다음과 같이 *를 출력하는 프로그램을 작성하라. 다음은 5를 입력받았을 경우이다.

정수를 입력하시오>>>5
\*****
\****
\***
\**
\*

```java
import java.util.Scanner;

public class DoWhileTest {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 >> ");
		int star = scanner.nextInt(); 
		
		for(int i = star; i >= 0; i--) {	
			for(int k = 1; k <= i; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		scanner.close();
	}
}

```

**4**
Scanner를 이용하여 소문자 알파벳을 하나 입력받고 다음과 같이 출력하는 프로그램을 작성하라. 다음은 e를 입력받았을 경우이다.

소문자 알파벳 하나를 입력하시오>>e
abcde
abcd
abc
ab
a

```java
import java.util.Scanner;

public class DoWhileTest {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("소문자 알파벳 하나를 입력하세요 >> ");
		String apb = scanner.next(); 
		char c = apb.charAt(0);
		
		for(char i = c; i >= 'a'; i--) {	
			for(char k = 'a'; k <= i; k++) {
				System.out.print(k);
			}
			System.out.println();
		}
		
		scanner.close();
	}
}
```

**5**
양의 정수를 10개 입력받아 배열에 저장하고, 배열에 있는 정수 중에서 3의 배수만 출력하는 프로그램을 작성하라.

```java
import java.util.Scanner;

public class DoWhileTest {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("양의 정수 10개를 입력하시오 >> ");
		int num1 = scanner.nextInt();
		int num2 = scanner.nextInt();
		int num3 = scanner.nextInt();
		int num4 = scanner.nextInt();
		int num5 = scanner.nextInt();
		int num6 = scanner.nextInt();
		int num7 = scanner.nextInt();
		int num8 = scanner.nextInt();
		int num9 = scanner.nextInt();
		int num10 = scanner.nextInt();
		
		int arr[] = {num1,num2,num3,num4,num5,num6,num7,num8,num9,num10};
		
		System.out.print("3의 배수는 ");
		for(int i=0; i<arr.length; i++) {
			if(arr[i]%3 == 0) {
				System.out.print(arr[i] + " ");
			}
		}
		
		scanner.close();
	}
	
	//------------------------------------------------------------------------
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		int arr[] = new int[10];
		System.out.print("양의 정수 10개를 입력하시오 >> ");
		
		for(int i=0; i<arr.length; i++) {
			arr[i] = scanner.nextInt();
		}		
		
		System.out.print("3의 배수는 ");
		for(int i=0; i<arr.length; i++) {
			if(arr[i]%3 == 0) {
				System.out.print(arr[i] + " ");
			}
		}
		
		scanner.close();
	}
}
```

**6**
배열과 반복문을 이용하여 프로그램을 작성해보자. 키보드에서 정수로 된 돈의 액수를 입력받아 오만 원권, 만 원권, 천 원권, 500원짜리 동전, 100원짜리 동전, 50원짜리 동전, 10원짜리 동전, 1원짜리 동전이 각 몇 개로 변환되는지 예시와 같이 출력하라. 이 때 반드시 다음 배열을 이용하고 반복문으로 작성하라.

```java
int [] unit = {50000, 10000, 1000, 500, 100, 50, 10, 1};  //환산할 돈의 종류
```

```java
import java.util.Scanner;

public class DoWhileTest {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("금액을 입력하시오 >> ");
		int [] unit = {50000, 10000, 1000, 500, 100, 50, 10, 1};  //환산할 돈의 종류
		
		int won = scanner.nextInt();
		
		for(int i=0; i<unit.length; i++) {
			int value = won / unit[i];
			System.out.println(unit[i] + "원 짜리 : " + value + "개");
			won = won - (value*unit[i]);
		}
		
		scanner.close();	
	}
}
```

**7**
 정수를 10개 저장하는 배열을 만들고 1에서 10까지 범위의 정수를 랜덤하게 생성하여 배열에 저장하라. 그리고 배열에 든 숫자들과 평균을 출력하라.

 ```java
public class DoWhileTest {
	public static void main(String[] args) {
		int arr[] = new int [10];
		
		System.out.print("랜덤한 정수들 : ");
		
		int sum=0;		
		for(int i=0; i<arr.length; i++) {
			arr[i] = (int)(Math.random()*10 + 1);
			System.out.print(arr[i] + " ");
			
			sum = sum + arr[i];
		}
		System.out.println();
		
		double avg = sum / arr.length;
		
		System.out.print("평균은 " + avg);
	}
}
 ```

 **8**
 정수를 몇 개 저장할지 키보드로부터 개수를 입력받아(100보다 작은 개수) 정수 배열을 생성하고, 이곳에 1에서 100까지 범위의 정수를 랜덤하게 삽입하라. 배열에는 같은 수가 없도록 하고 배열을 출력하라.

 ```java
import java.util.Scanner;

public class DoWhileTest {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("정수 몇개?(100보다 작은 개수) >> ");
		int num = scanner.nextInt();
		
		int arr[] = new int[num];
		
		for(int i=0; i<num; i++) {
			arr[i] = (int)(Math.random()*num + 1);
			
			for(int k=0; k<i; k++) {
				if(arr[i] == arr[k]) {
					i--;
				}
			}
		}
		
		for(int j=0; j<num; j++) {
			System.out.print(arr[j] + " ");
		}		
		
		scanner.close();
	}
}
 ```

 **9**
 4x4의 2차원 배열을 만들고 이곳에 1에서 10까지 범위의 정수를 랜덤하게 생성하여 정수 16개를 배열에 저장하고, 2차원 배열을 화면에 출력하라.

 ```java
public class DoWhileTest {
	public static void main(String[] args) {
		int arr[][] = new int [4][4];
		
		for(int i=0; i<arr.length; i++) {
			for(int k=0; k<arr[i].length; k++) {
				arr[i][k] = (int)(Math.random()*10 + 1);
				System.out.print(arr[i][k] + " ");
			}
			System.out.println();
		}
	}
}
 ```

**10**
4x4의 2차원 배열을 만들고 이곳에 1에서 10까지 범위의 정수를 10개만 랜덤하게 생성하여 임의의 위치에 삽입하라. 동일한 정수가 있어도 상관없다. 나머지 6개의 숫자는 모두 0이다. 만들어진 2차원 배열을 화면에 출력하라.

```java
public class DoWhileTest {
	public static void main(String[] args) {
		int arr[][] = new int[4][4];  //처음에 배열을 만들면 이미 0으로 초기화되어있음. 랜덤으로 10곳에 숫자 넣어주면 나머지 자동으로 0
		
		for(int j=0; j<10; j++) {
			int n = (int)(Math.random()*4);  //배열 위치
			int m = (int)(Math.random()*4);  //배열 위치
			
			if(arr[n][m] == 0) {  //랜덤입력이 안 된 곳이어야 숫자 넣을 수 있음.
				int x = (int)(Math.random()*10 + 1);
				arr[n][m] = x;
			}else {
				j--;
			}
		}
		
		for(int i=0; i<arr.length; i++) {
			for(int k=0; k<arr[i].length; k++) {				
				System.out.print(arr[i][k] + " ");
			}
			System.out.println();
		}
	}
}
```

**11**
다음과 같이 작동하는 Average.java를 작성하라. 명령행 인자는 모두 정수만 사용되며 정수들의 평균을 출력한다. 다음 화면은 컴파일된 Average.class 파일을 c:\Temp 디렉터리에 복사한 뒤 실행한 경우이다. 원본 Average.class 파일은 이클립스의 프로젝트 폴더 밑에 bin 폴더에 있다.

??????????????????????????????????????????????????????????????????????

```java
public class Chap03_11 {

	public static void main(String args[]) {
		
		int sum=0;
		double averg=0;
		for(int i=0;i<args.length;i++)
			sum+=Integer.parseInt(args[i]);
		averg=(double)sum/args.length;
		System.out.println(averg);
	}
}
```

**12**
다음과 같이 작동하는 Add.java를 작성하라. 명령행 인자 중에서 정수 만을 골라 합을 구하라. 다음 화면은 Add.class 파일을 c:\Temp 디렉터리에 복사한 뒤 실행한 경우이다. 원본 Add.class 파일은 이클립스 프로젝트 폴더 밑에 bin 폴더에 있다. 

????????????????????????????????????????????????????????????????????

```java
public class Chap03_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int num=0;
		int sum=0;

		for(int i=0;i<args.length;i++) {
			try {
					num=Integer.parseInt(args[i]);
					sum+=num;
			}
			catch (NumberFormatException e) {
			}
		}
		System.out.println(sum);
	}

}
```

**13**
반복문을 이용하여 369게임에서 박수를 쳐야 하는 경우를 순서대로 화면에 출력해보자. 1부터 시작하며 99까지만 한다. 실행 사례는 다음과 같다.
(3,6,9 박수짝 / 두번씩은 박수짝짝)

```java
public class DoWhileTest {
	public static void main(String[] args) {
		for(int i=1; i<100; i++) {
			if(i == 3 || i == 6 || i == 9) {
				System.out.println(i + "박수짝");				
			}else if(i/10 == 3 || i/10 == 6 || i/10 == 9) {
				System.out.print(i + "박수짝");
				if(i%10 == 3 || i%10 == 6 || i%10 == 9) {
					System.out.print("짝");
				}
				System.out.println();
			}else if(i%10 == 3 || i%10 == 6 || i%10 == 9) {
				System.out.println(i + "박수짝");
			}
		}
	}
}
```

**14**
다음 코드와 같이 과목과 점수가 짝을 이루도록 2개의 배열을 작성하라.

```java
String course [] = { "Java", "C++", "HTML5", "컴퓨터구조", "안드로이드" };
int score[] = {95, 88, 76, 62, 55};
```

그리고 다음 예시와 같이 과목 이름을 입력받아 점수를 출력하는 프로그램을 작성하라. "그만"을 입력받으면 종료한다.

```java
import java.util.Scanner;

public class DoWhileTest {
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		String course [] = { "Java", "C++", "HTML5", "컴퓨터구조", "안드로이드" };
		int score[] = {95, 88, 76, 62, 55};
		
		
		while(true) {
			System.out.print("과목 이름 >> ");
			String name = scanner.next();
			
			if(name.equals("그만")) {
				break;
			}
			
			for(int i=0; i<5; i++) {
				if(course[i].equals(name)) {
					System.out.println(course[i] + "의 점수는 " + score[i]);
					break;
				}else if(i == 4) {
					System.out.println("없는 과목입니다.");
				}
			}
		}
		
		scanner.close();
	}
}
```

**15**
다음은 2개의 정수를 입력 받아 곱을 구하는 Multiply 클래스이다.

```java
import java.util.Scanner;
public class Multiply{
  public static void main(String[] args){
    Scanner scanner = new Scanner(System.in);
    System.out.print("곱하고자 하는 두 수 입력 >> ");
    int n = scanner.nextInt();
    int m = scanner.nextInt();
    System.out.print(n + "x" + m + "=" n*m);
    scanner.close();
  }
}
```

다음과 같이 실행할 때 프로그램은 10과 5를 곱해 50을 잘 출력한다.(10, 5)      
하지만, 다음과 같이 실수를 입력하였을 때, 예외가 발생한다.(2.4, 4)
다음과 같이 실수가 입력되면 정수를 다시 입력하도록 예외 없이 정상적으로 처리되도록 예외 처리 코드를 삽입하여 Multiply 클래스를 수정하라.

```java
import java.util.Scanner;
import java.util.InputMismatchException;

public class Multiply{
  public static void main(String[] args){
    Scanner scanner = new Scanner(System.in);
    
    while(true) {
    	try {
        	System.out.print("곱하고자 하는 두 수 입력 >> ");
            int n = scanner.nextInt();
            int m = scanner.nextInt();
            
            System.out.print(n + "x" + m + "=" + n*m);
            break;
            
        }catch(InputMismatchException e){
        	System.out.println("실수는 입력하면 안됩니다.");
        	scanner.nextLine();
        }
    }
    
    scanner.close();
  }
}
```

**16**
컴퓨터와 독자 사이의 가위 바위 보 게임을 만들어보자. 예시는 다음 그림과 같다. 독자부터 먼저 시작한다. 독자가 가위 바위 보 중 하나를 입력하고 <Enter>키를 치면, 프로그램은 가위 바위 보 중에서 랜덤하게 하나를 선택하고 컴퓨터가 낸 것으로 한다. 독자가 입력한 값과 랜덤하게 선택한 값을 비교하여 누가 이겼는지 판단한다. 독자가 가위 바위 보 대신 "그만"을 입력하면 게임을 끝난다.

```java
import java.util.Scanner;

public class Multiply{
  public static void main(String[] args){
    Scanner scanner = new Scanner(System.in);
    
    String str[] = {"가위", "바위", "보"};
    
    while(true) {
    	 int n = (int)(Math.random()*3);
    	 
    	System.out.print("가위 바위 보! >> ");
        String user = scanner.next();
    	
        if(user == "그만") {
        	System.out.println("게임을 종료합니다...");
        	break;
        }
        
        int diff = 0;
        switch(user) {
        	case "가위" :
        		if(str[n].equals("가위")) {
        			diff = 0;
        		}else if(str[n].equals("보")) {
        			diff = 1;
        		}else {
        			diff = 2;
        		}
        		break;
        	case "바위" : 
        		if(str[n].equals("바위")) {
        			diff = 0;
        		}else if(str[n].equals("가위")) {
        			diff = 1;
        		}else {
        			diff = 2;
        		}
        		break;
        	case "보" :
        		if(str[n].equals("보")) {
        			diff = 0;
        		}else if(str[n].equals("바위")) {
        			diff = 1;
        		}else {
        			diff = 2;
        		}
        		break;
        	default :
        		System.out.println("잘못입력");
        		break;
        }
        
        if(diff == 0) {
        	System.out.println("유저 : " + user + " 컴퓨터 : " + str[n] + " 결과는 비김");
        }else if(diff == 1) {
        	System.out.println("유저 : " + user + " 컴퓨터 : " + str[n] + " 결과는 이김");
        }else {
        	System.out.println("유저 : " + user + " 컴퓨터 : " + str[n] + " 결과는 짐");
        }        
    }
    scanner.close();
  }
}
```

---

**번외**
6개의 정수형 데이터가 저장될 수 있는 정수형 1차원 배열을 선언하여, 1~45사이의 임의의 난수를 발생하여 저장하도록 하고, 오름차순방식으로 정렬하여 그 결과를 출력하시오.(미완성)
	
```java
import java.util.Scanner;

public class LottoExam {
	
	static void prn() {
		System.out.println("1. 로또 번호 자동생성");
		System.out.println("2. 로또 번호 입력");
		System.out.println("3. 당첨 확인");
		System.out.println("4. 종료");
	}
	
	static void numAuto(int[] arrAuto) {
		
		for(int i=0; i<arrAuto.length; i++) {
			arrAuto[i] = (int)(Math.random() * 10 + 1);
			for(int t=0; t<i; t++) {
				if(arrAuto[i] == arrAuto[t]) {
					i--;
				}
			}
		}
	}
	
	static void numInsert(int[] arr) {
		Scanner scanner = new Scanner(System.in);		
		
		for(int i=0; i<6; i++) {
			System.out.print(i+1 + "번째 값 : ");
					
			int num = scanner.nextInt();
			arr[i] = num;
			
			if(num > 46) {
				System.out.println("1~45 사이의 값을 입력하세요");
				i--;
			}
		}
		
	}
	
	static void winning(int[] arrAuto, int[] arr) {
		
		System.out.print("당첨 번호 : " );
		for(int i=0; i<6; i++) {
			System.out.print("\t" + arrAuto[i] + " ");
		}
		
		System.out.println();
		
		System.out.print("선택 번호 : " );
		for(int i=0; i<6; i++) {
			System.out.print("\t" + arr[i] + " ");
		}
		
		System.out.println();

	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		int arrAuto[] = new int[6];
		int arr[] = new int [6];
		
		while(true) {
			prn();
			int choice = scanner.nextInt();
			
			System.out.println("메뉴 선택 : [" + choice + "]");
			
			switch(choice) {
				case 1 :					
					numAuto(arrAuto);
					break;
				case 2 :
					numInsert(arr);
					break;
				case 3 :
					winning(arrAuto, arr);
					break;
				case 4 :
					System.out.println("종료..");
					return;
				default :
					System.out.println("범위 오류. 다시 입력");
					break;
			}
		}
	}
}
```
