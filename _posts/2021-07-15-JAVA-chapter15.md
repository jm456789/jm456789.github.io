---
layout: post

title: "JAVA Chapter15 네트워크 - TCP/IP 프로토콜 / IP 주소 / 포트 / 소켓 / Soket 클래스 / ServerSoket 클래스 / 서버-클라이언트 채팅 프로그램 만들기"
excerpt: "TCP/IP 프로토콜 / IP 주소 / 포트 / 소켓 / Soket 클래스 / ServerSoket 클래스 / 서버-클라이언트 채팅 프로그램 만들기"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 15. 네트워크

### TCP/IP 프로토콜 소개

TCP 프로토콜은 다른 <u>두 시스템 간에 신뢰성 있는 데이터의 전송</u>을 관장하는 통신 프로토콜로서 IP 프로토콜 위에서 동작한다. TCP 프로토콜을 사용하는 응용프로그램으로는 e-mail, FTP, 웹(HTTP) 등이 있다.    
IP는 패킷 교환 네트워크에서 <u>송신 호스트와 수신 호스트가 데이터를 주고받는 것</u>을 관장하는 프로토콜로서 TCP의 하위 레벨 프로토콜이다.

(TCP는 데이터 전송 목적, IP는 누가 누군지 분류하는게 목적)

---

### IP 주소

IP 주소는 <u>네트워크상에서 유일하게 식별</u>될 수 있는 네트워크 장치의 주소로서, 예를들면 192.156.11.15와 같이 4개의 숫자가 .으로 연결된다. <u>하나의 숫자 범위는 0~255</u>로서 한 바이트로 표현이 가능하다. 도메인 이름으로 바꿔 사용할 수도 있다. 128비트의 <u>IPv6</u> 버전을 사용하는 추세이다.
(ex 집주소, 192.168.~~~랑 ~10.~는 사설 ip!)

---

### 포트

<u>IP주소는 네트워크상에 있는 한 컴퓨터를 유일하게 식별</u>한다. 하지만 한 컴퓨터에는 여러 응용프로그램이 네트워크를 사용하고 있기 때문에 IP주소만으로는 통신하고자 하는 응용프로그램을 식별할 수 없다. 이를 위해 한 컴퓨터 내의 각 응용프로그램은 통신을 위해 가상의 연결단인 <u>포트(port)</u>를 생성하고, 이 포트번호로 상대방이 자신을 식별하게 한다.   

<br />
예를 들면 IP주소는 은행 지점의 주소이고, 포트번호는 은행 내의 고객 창구 번호와 같다.

<br />
따라서 통신을 수행하는 모든 응용프로그램은 IP주소와 포트를 이용하여 상대편 통신 프로그램을 인지하며 데이터를 교환한다. 물론 이 때 상대편 응용프로그램은 자신의 IP 주소와 포트 번호를 알고 통신 접속이나 데이터가 오기를 기다리고 있어야 한다.

<br />
포트 번호는 개발자가 이의로 선택하여 사용할 수 있으나, 기존 응용프로그램에서 사용하는 포트 번호는 피하는 것이 좋다. 시스템이나 기존에 알려진 응용프로그램에서 사용하는 포트 번호를 <u>잘 알려진 포트</u>라고 한다. 예를 들어 <u>SSH는 22번 포트, HTTP는 80번 포트, FTP는 21번 포트</u> 등이며, 이들은 주로 <u>0~1023</u> 사이의 번호를 가지므로 사용자가 작성하는 응용프로그램에서는 <u>이 범위의 포트번호는 피해서 선택</u>하도록 한다.
(한 포트 번호를 두 개 이상의 프로그램에서 쓸 수 없다)

---

### 소켓

소켓 통신은 개발자가 TCP/IP 네트워크를 이용하여 쉽게 통신 프로그램을 작성하도록 지원하는 기반 기술이다. 여기서 소켓은 통신하는 <u>두 응용프로그램 간의 통신 링크의 각 끝단</u>으로서, TCP/IP의 네트워크 기능을 활용하여 다른 컴퓨터의 소켓과 데이터를 주고 받는다. <u>소켓은 특정 포트에 연결되어 데이터를 보내거나 받을 때 해당 응용 프로그램을 식별</u>한다.      
(TCP/IP와 포트를 가지고 통신하는게 소켓. 각 통신의 제일 끝 단계가 소켓이다.)

<br />
응용프로그램은 소켓과 연결한 후 소켓에 데이터를 주기만 하면, 소켓이 상대방 응용프로그램에 연결된 소켓에 데이터를 보낸다. 또는 응용프로그램은 연결된 소켓으로부터 도착한 데이터를 단순히 받기만 하면 된다. <u>인터넷을 경유하여 데이터를 주고받는 기능은 순전히 소켓의 몫</u>이다.

---

### 소켓과 서버 클라이언트 통신

소켓을 이용하는 통신에서는 반드시 서버 응용프로그램과 클라이언트 응용프로그램으로 구분된다. 정보를 제공하는쪽을 서버라고 부르며, 정보를 이용하는 쪽을 클라이언트라고 부른다.

##### 서버 소켓과 클라이언트 소켓

소켓에는 서버 소켓과 클라이언트 소켓의 2가지 종류가 있다.

* 서버 소켓은 서버 응용프로그램이 사용자의 접속을 <u>기다리는 목적</u>으로만 사용된다.
* 클라이언트 응용프로그램에서는 클라이언트 소켓을 이용하여 <u>서버에 접속</u>한다.
* 서버 소켓은 클라이언트가 접속해오면, 클라이언트 소켓을 추가로 만들어 상대 클라이언트와 통신하게 한다.

이 내용을 정리하면 **서버소켓**은 <u>클라이언트의 접속을 기다리는 소켓</u>이며, **클라이언트 소켓**은 <u>데이터 통신을 실시하는 소켓</u>이다.

(소켓은 사용 후에 닫아줘야한다!!!!!!!!!!!!!!!!!!! **close()**)

---

### Soket 클래스, 클라이언트 소켓

##### 클라이언트 소켓 생성 및 서버 접속

```java
Socket clientSoket = new Soket("128.12.1.1", 5550);  //IP주소가 128.12.1.1이고 포트번호가 5550인 서버에 접속. 이때 클라이언트의 포트는 사용되지 않는 포트 중에서 자동으로 선택된다.
```

##### 네트워크 입출력 스트림 생성

```java
BufferedReader in = new BufferedReader(new InputStreamReader(clientSoket.getIputStream()));
BufferedWriter out = new BufferedWriter(new OutputStreamReader(clientSoket.getOutputStream()));
```

##### 서버로 데이터 전송

```java
out.write("hello" + "\n");
out.flush();
```

##### 서버로부터 데이터 수신

```java
int x = in.read();  //클라이언트로부터 한 개의 문자 수신
String line = in.readLine();  //클라이언트로부터 한 행의 문자 수신
```

##### 데이터 송수신 종료

```java
socket.close();
```

---

### ServerSoket 클래스, 서버 소켓 (접속을 받아들이는 용도)

##### 서버 소켓 생성

```java
ServerSocket listener = new ServerSocket(5550);  //자신의 포트 번호
```

##### 클라이언트로부터 접속 대기

```java
Socket socket = listener.accept(); //연결 요청을 기다림. accept() 메소드가 연결을 수락하면 다음과 같이 Socket 객체를 하나 별도로 생성하여 리턴한다.
```

##### 네트워크 입출력 스트림 생성

```java
BufferedReader in = new BufferedReader(new InputStreamReader(clientSoket.getIputStream()));
BufferedWriter out = new BufferedWriter(new OutputStreamReader(clientSoket.getOutputStream()));
```

##### 클라이언트로부터 데이터 수신

```java
int x = in.read();  //클라이언트로부터 한 개의 문자 수신
String line = in.readLine();  //클라이언트로부터 한 행의 문자 수신
```

##### 클라이언트로 데이터 전송

```java
out.write("hello" + "\n");
out.flush();
```

##### 데이터 송수신 종료

```java
socket.close();
```

##### 서버 응용프로그램 종료

```java
ServerSocket.close();
```

---

### 서버-클라이언트 채팅 프로그램 만들기

서버 프로그램

```java
package chapter15;

import java.io.*;
import java.net.*;
import java.util.*;

public class ServerEx {

	public static void main(String[] args) {
		BufferedReader in = null;
		BufferedWriter out = null;
		ServerSocket listener = null;
		Socket socket = null;
		Scanner scanner = new Scanner(System.in);
		try {
			listener = new ServerSocket(9999);  //서버 소켓 생성
			System.out.println("연결을 기다리고 있습니다...");
			socket = listener.accept();  //클라이언트로부터 연결 요청 대기
			System.out.println("연결되었습니다.");
			in = new BufferedReader(new InputStreamReader(socket.getInputStream()));  //소켓 입력 스트림
			out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));  //소켓 출력 스트림
			while(true) {
				String inputMessage = in.readLine();  //클라이언트로부터 한 행 읽기
				if(inputMessage.equalsIgnoreCase("bye")) {
					System.out.println("클라이언트에서 bye로 연결을 종료했음");
					break;
				}
				System.out.println("클라이언트 : " + inputMessage);
				System.out.print("보내기 >> ");  
				String outputMessage = scanner.nextLine();  //키보드에서 한 행 읽기
				out.write(outputMessage + "\n");  //키보드에서 읽은 문자열 전송
				out.flush();  //out의 스트림 버퍼에 있는 모든 문자열 전송
			}		
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}finally{
			try {
				scanner.close();
				socket.close();
				listener.close();
			}catch(IOException e) {
				System.out.println("클라이언트와 채팅 중 오류 발생");
			}
		}
	}
}
```

클라이언트 프로그램

```java
package chapter15;

import java.io.*;
import java.net.*;
import java.util.*;

public class ClientEx {

	public static void main(String[] args) {
		BufferedReader in = null;
		BufferedWriter out = null;
		Socket socket = null;
		Scanner scanner = new Scanner(System.in);
		try {
			socket = new Socket("localhost", 9999);
			in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
			while(true) {
				System.out.print("보내기 >> ");
				String outputMessage = scanner.nextLine();
				if(outputMessage.equalsIgnoreCase("bye")) {
					out.write(outputMessage + "\n");
					out.flush();
					break;
				}
				out.write(outputMessage + "\n");
				out.flush();
				String inputMessage = in.readLine();
				System.out.println("서버 : " + inputMessage);
			}		
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}finally{
			try {
				scanner.close();
				if(socket != null) {
					socket.close();
				}
			}catch(IOException e) {
				System.out.println("서버와 채팅 중 오류 발생");
			}
		}
	}
}
```