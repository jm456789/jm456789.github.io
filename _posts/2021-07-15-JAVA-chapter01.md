---
layout: post

title: "JAVA Chapter01 자바 시작 - WORA / 바이트코드 / 실행환경 / JDK와 JRE / 자바 API / 자바 IDE / 자바의 특징"
excerpt: "WORA / 바이트코드 / 실행환경 / JDK와 JRE / 자바 API / 자바 IDE / 자바의 특징"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 01. 자바 시작

1991년에 <u>선마이크로시스템즈</u>는 <u>제임스고슬링</u>이란 엔지니어를 중심으로 <u>가전제품</u>에 사용할 소프트웨어를 개발하기 시작했다. 기존에 작성된 프로그램은 플랫폼간에 호환성이 없었다. 특히 매우 다양한 플랫폼을 갖는 가전제품을 위해 플랫폼에 독립적인 언어의 필요성이 대두되었다. 이에 선마이크로시스템스는 <u>플랫폼 독립적</u>이며 <u>메모리사용량이 적은</u> 새로은 언어와 실행체계를 개발하였고, 처음에는 오크라고 지었다. 이 새로운 언어는 초기에는 별로 알려지지 않았으나 인터넷과 웹이 엄청난 속도로 발전하면서 급속도로 퍼지게 되었다. (C보다 자바가 이식성과 호환성이 높다.) 마침내 1995년 <u>자바</u>라는 이름으로 새로은 기술을 발표했다. 2009년에 오라클에서 선마이크로시스템스를 인수함으로써 현재는 <u>오라클</u>에서 자바를 제공하고 있다.

---

### WORA(Write Once Run Anywhere)

자바 프로그램은 어디서든 한 번 작성하면, 다시 컴파일하거나 수정하지 않고, 어떤 하드웨어에서나 운영체제에서도 실행시킬 수 있다. 이를 WORA라고 한다.(플랫폼 종속성 극복)

---

### 바이트코드

바이트코드는 자바 가상 기계에서만 실행되는 기계어로서, 어떤 CPU와도 관계 없는 바이너리 코드이다. 자바 컴파일러는 자바 소스 프로그램을 컴파일하여 바이트코드로 된 클래스 파일을 생성한다. 이 클래스파일은 컴퓨터의 CPU에 의해 직접 실행되지 않고, 자바 가상 기계가 인터프리터 방식으로 실행시킨다.

오라클에서 배포하는 JDK(Java Development Kit)에는 자바 클래스 파일을 디어셈블(disassemble)하여 바이트 코드를 볼 수 있는 도구를 제공한다.

---

### 실행환경

C에서 .exe 실행파일에는 실행에 필요한 모든 코드가 들어있어 .exe 파일만 있으면 실행에 문제가 없으나 .exe파일이 매우 큰 경우 적은 양의 메모리를 가진 컴퓨터에서는 실행을 할 수 없는 문제점이 있다.

자바는 링크과정이 없다. 자바 가상기계는 그 때 그 클래스파일을 로딩하고 실행한다.
(한 자바 안에 여러개의 클래스가 들어있음)

---

### JDK와 JRE

**JDK(Java Development Kit)**는 자바 개발자에게 무료로 배포하는 소프트웨어이다.(<u>만드는 도구들이 모인거</u>).   
**JRE(Java Runtime Environment)**는 <u>작동되는 도구들이 모인거</u>.

JDK가 설치되면 구성중에      <br />       
bin폴더가 있는데 이 파일은 실행파일이 모여있으며,      <br />       
include 폴더에는 네이티브 코드 프로그래밍에 필요하는 C언어 헤더 파일이 들어있고,      <br />       
jmodes 폴더에는 컴파일된 모듈 파일들이 있다.      <br />       


bin 폴더 안 javac는 자바 컴파일러로 자바 소스를 바이트코드로 변환시켜주며,      <br />       
java는 자바 프로그램 실행기이며 자바 가상 기계를 작동시켜 자바 프로그램을 실행시켜준다.(class 실행시켜줌)      <br />       

---

##### 자바의 배포판

* Java SE(Standard Edition) - 자바 표준 배포판
* Java Me(Micro Edition) - 모바일용 배포판. 스마트폰이나 고해상도 tv등은 안드로이드에 자리를 내주고 있어 존폐가 위태롭다.
* Java EE(Enterprise Edition) - 기업용 배포판. 자바를 이용한 다중 사용자, 대규모 기업 응용프로그램 개발을 위한 JDK이다.

---

### 자바 API

c에서는 동적배열(malloc)을 만들어서 썼으면 여기에 와있음.

자바 API는 개발자들이 사용하도록 미리 만들어놓은 유용한 자바 클래스들의 집합이다.

---

### 자바 IDE

IDE(Intergrated Development Environment)란 단어가 뜻하는 그대로 소스 코드 편집, 컴파일, 디버깅을 한꺼번에 할 수 있는 <u>통합 개발 환경</u>(소프트웨어)이다. IDE하면 가장 먼저 떠오르는것은 비주얼 스튜디오일 것이다. 자바 응용프로그램 개발에 현재 많이 사용되고 있는 IDE로 이클립스가 있따. (비주얼 스튜디오는 편집기)

---

### 자바 소스 편집

자바에서는 <u>클래스이름과 소스파일의 이름이 일치해야한다!!!!</u>

이클립스에서
한 프로젝트 안에 main 하나 꼭!
.java에는 하나의 클래스 꼭!
public은 대표 대표 클래스 안에 main 메소드 존재해야 한다.
(이해 안가면 p.45 필기 봐라)

---

### 자바의 특징

* 플랫폼 독립성 : 자바는 플랫폼에 종속되지 않는 독립적인 바이트코드로 컴파일되며 자바 가상 기계만 있으면 하드웨어/운영체제를 막론하고 자바 프로그램의 실행이 가능하다.
* 객체 지향 : 자바는 객체지향 언어로서 캡슐화, 상속, 다형성을 지원한다. 객체지향 프로그램은 해결할 과제를 객체 간의 상호 관계로 모델링하여 인간의 사고에 가깝게 표현한다.
* 클래스로 캡슐화 : 변수나 메소드는 반드시 클래스 내에 구현하도록 한다.
* 소스와 클래스 파일 : 클래스파일에는 반드시 하나의 자바 클래스만 들어있다. 
* 실행 코드 배포 : 자바 응용프로그램은 한 개의 클래스 파일 또는 다수의 클래스파일로 구성된다. 다수의 클래스 파일을 jar 파일 형태로 압축하여 배포하거나 실행할 수 있다.
* 패키지 : 서로 관련 있는 클래스는 패키지로 묶어 관리한다.
* 멀티스레드 : 하나의 자바 프로그램이 다수의 작업을 처리할 수 있도록 다수의 스레드가 동시에 실행할 수 있는 환경을 지원한다.
* 가비지 컬렉션 : 자바 언어는 메모리를 할당받는 기능은 있지만 메모리를 반환하는 기능은 없다. 이것은 프로그래밍의 부담을 대폭 줄여준다. 프로그램 내에 사용되지 않는 메모리는 자동으로 회수된다.
* 실시간 응용 시스템에 부적합 : 자바 응용프로그램은 실행 도중 예측할 수 없는 시점에 가비지 컬렉션이 실행되므로, 프로그램이 일시적으로 중단된다. 이런 문제로 인해 일정 시간내에 반드시 실행 결과를 내야하는 실시간 시스템에는 자바 언어가 적합하지 않다.
* 자바 프로그램은 안전하다 : 자바언어는 타입 체크가 매우 엄격하며, 포인터의 개념이 없기 때문에 잘못된 자바 프로그램으로 컴퓨터의 시스템이 중단되는 일은 없다.
* 프로그램 작성이 쉽다 : 포인터 개념이 없기 때문에 프로그램 작성에 부담이 적다. 또한 다양한 라이브러리와 GUI 라이브러리를 지원하므로 프로그램 작성이 빠르고 쉽다.
* 실행 속도를 개선하기 위해 JIT 컴파일러가 사용된다. : 자바는 바이트코드를 실행하므로 실행이 느리다고 알려져있지만, 최근에는 실행하는 도중 자바 프로그램을 해당 CPU의 기계어 코드로 컴파일하고 CPU가 바로 기계어를 실행하도록 하는 JIT(Just in Time) 컴파일링 기법을 이용하므로 실행성능이 C와 거의 비슷하도록 개선되었다.
