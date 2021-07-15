---
layout: post

title: "JAVA Chapter2 자바 기본 프로그래밍 - 클래스 만들기 / main() 메소드 / 메소드 / 변수 선언 / 자바의 데이터 타입(기본, 레퍼런스 타입) / 자바의 기본 타입 / 리터럴 / 타입 변환 / Scanner 객체 생성 / 연산 / "
excerpt: "클래스 만들기 / main() 메소드 / 메소드 / 변수 선언 / 자바의 데이터 타입(기본, 레퍼런스 타입) / 자바의 기본 타입 / 리터럴 / 타입 변환 / Scanner 객체 생성 / 연산 / "

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 02. 자바 기본 프로그래밍

### 클래스 만들기

자바 프로그램의 작성에 있어 가장 기본적이면서 중요한것은 <u>클래스</u>를 만들고, <u>그 안에 변수, 상수, 함수(메소드)</u> 등 모든 프로그램 요소를 작성한다는 점이다. 클래스 바깥에 어떤 것도 작성해서는 안된다.

```java
public class Hello{
  ...
}
```

---

### main() 메소드
main()은 반드시 public, static, void 타입으로 선언되어야하며, 한 클래스에 2개 이상의 main()을 작성하면 안된다.

```java
public static void main(String[] args){
  ...
}

```

---

### 메소드

클래스의 멤버 함수를 자바에서는 메소드(method)라고 부른다. 메소드의 이름은 개발자가 지정하며, 메소드 개수에는 제한이 없다.

다음은 메소드 sum()을 작성한 사례이다.

```java
public static int sum(int n, int m){
  return n + m;
}
```

---

### 변수 선언

변수(variable)란 프로그램 실행 동안 데이터를 저장하는 공간으로 개발자가 이름을 붙이고 다음과 같이 선언한다. 

```java
int i;
char a;
```

메소드 내에 선언되어 사용되는 변수를 <u>지역변수</u>(loacal variable)라고 한다. 지역변수는 메소드 내에서만 사용되며, 메소드의 실행이 끝나면 소멸된다.

---

### 식별자

### 클래스 이름

클래스 이름의 첫 번째 문자는 대문자로 시작하고, 여러 단어가 복합되면 각 단어의 첫 번째 문자만 대문자료 표시한다.

```java
public class HelloWorld{}
class AutoVendingMachine{}
```

---

### 변수, 메소드 이름

변수와 메소드 이름은 첫 단어는 소문자로 표기하고 이후 각 단어의 첫 번째 문자만 대문자료 표기한다. 이렇게 함으로써 변수와 클래스 이름을 쉽게 구분할 수 있다.

```java
int myAge;
boolean isSingle;
public int getAge(){return 20;}
```

---

### 상수 이름

상수는 이름 전체를 대문자로 표가하도록 권장한다. 상수 선언시 앞에 final 명시.
(상수는 종단변수라고도 불린다.)

```java
final double PI = 3.141592;
```

---

### 자바의 데이터 타입

### 기본 타입(basic type) : 8개 (=프리미티브 타입)

* boolean
* char
* byte
* short
* int
* long
* float
* double

---

### 레퍼런스 타입(reference type) : 1개

레퍼런스 타입은 한 가지이지만 용도는 다음과 같이 3가지 이다.

* 배열에 대한 레퍼런스
* 클래스(class)에 대한 레퍼런스
* 인터페이스(interface)에 대한 레퍼런스

레퍼런스란 c의 <u>포인터와 비슷한 개념</u>이다. <u>주소값</u>정도로 생각해라.

---

### 자바의 기본 타입

자바에서 영어든 한글이든 문자 하나는 <u>2바이트의 유니코드</u>로 저장된다. (c는 아스키코드) c는 영어는 1바이트 한글은 2바이트로 표현되므로 한글과 영어가 섞인 문자열이나 파일을 다루는 프로그램 작성은 까다롭다. 한편 <u>문자열</u>은 자바의 기본타입에 속하지 않기 때문에, 다음과 같이 자바 라이브러리에서 제공하는 <u>String 클래스</u>를 이용한다.

> 논리타입 boolean (1비트, true 또는 false)
>    
> 문자타입 char    (<u>2바이트</u>)
>      
> 정수타입 byte    (1바이트)
> 정수타입 short   (2바이트)
> 정수타입 int     (4바이트)
> 정수타입 long    (8바이트)
>      
> 실수타입 float   (4바이트)
> 실수타입 double  (8바이트)

---

### 문자열

자바에서 문자열은 기본타입에 속하지 않으며 JDK에서 제공하는 String 클래스를 이용한다.
(문자열은 "", 문자는 '')

---

### 변수와 선언

변수는 <u>데이터를 저장</u>하는 공간이다.

---

### 리터럴(literal)

리터럴이란 <u>프로그램에 직접 표현한 값</u>을 말한다. 정수, 실수, 문자, 논리, 문자열 타입 모두 리터럴이 있다.

---

##### 정수 리터럴

정수 리터럴은 int 타입(기본)으로 자동 컴파일된다. 만일 long 타입으로 지정하려면 숫자 뒤에 l을 붙이면 된다.

```java
int n = 15;     //십진수 15
int m = 015;    //8진수 13
int k = 0x15;   //16진수 21
int b = 0b0101; //2진수 5
```

---

##### 실수 리터럴

실수 리터럴은 double 타입으로 자동 처리된다. 숫자 뒤에 f를 붙이면 float, d를 붙이면 double 타입으로 강제 변환할 수 있다.

---

##### 문자 리터럴

문자 리터럴은 단일 인용부호('')로 문자를 표현하거나 \u다음에 문자의 유니코드 값을 사용하여 표현한다.

---

##### 특수문자 리터럴

백슬래시 다음에 특수 기호를 붙여서 표현한다.
\b, \t 등...

---

##### 논리 리터럴과 boolean 타입

논리 리터럴은 true, false 두 개 밖에 없으며, boolean 타입의 변수에 직접 치환하거나 조건문에 사용한다.

```java
boolean a = true;
boolean b = 10 > 0;   //참이므로 b 값은 true
boolean c = 1;        //오류!!! C와 달리 자바에서 숫자를 참, 거짓으로 사용 불가
while(true){...}      //자바에서 무한루프. while(1)로 하면 안된다!!!!!
```

---

### null 리터럴

null은 기본타입에 사용될 수 없고 객체 <u>레퍼런스에 대입</u>된다.

```java
int n = null;         //오류. 기본타입에는 null값을 저장할 수 없다
String str = null;    //정상
```

---

### 문자열 리터럴

자바에서 문자열 리터럴을 포함하여 모든 문자열은 String 객체이다. 그러므로 문자열 리터럴은 다음과 같이 String 객체에 저장한다.

```java
String str = "Good";
```

---

### var 키워드

java 10부터 변수 타입 대신 var 키워드를 사용 할 수 있다. 또한 var의 사용은 지역변수에만 한정된다. (어떤 형태의 값이 정해지지 않았을 때 사용. 교수님은 잘 안쓰심. 명시하는게 나음)

```java
var price = 200;  //price는 int타입으로 결정
var name = "kitae"; //name은 String 타입으로 결정
var point = new Point; //point는 Point 타입으로 결정(4장 참조)

var name; //컴파일 오류. 변수 name의 타입을 추론할 수 없음.
```

---

**class는 <u>객체</u>를 만들기 위한 하나의 틀!!!!**

---

### 타입 변환

타입변환이란 변수나 상수 혹은 리터럴의 타입을 다른 타입으로 바꾸는 것을 말한다.

##### 자동 타입 변환

수식 내에 타입이 일치하지 않을 때 컴파일러는 오류대신 <u>작은 타입을 큰 타입으로 자동 변환</u>한다.

---

##### 강제 타입 변환

```java
int n = 300;
//-----------------------------------------------------------
byte b = n;   //컴파일 오류. byte는 최대 255라서 오류 발생.
byte b = (byte)n;   //n을 byte타입으로 강제 변환.
```

큰 타입의 값을 작은 타입으로 변환해야 할 때 컴파일러는 오류를 발생시킨다. 개발자가 이 사실을 알고도 타입 변환을 원한다면 <u>강제 타입 변환</u>을 지시해야 한다. 하지만 강제 변환을 하면 오류가 발생하지 않을 뿐 <u>데이터 손실</u>이 발생한다.
강제 타입 변환을 <u>캐스팅(casting)</u>이라고도 부른다.

---

### 자바에서 키 입력

##### System.in 

키보드 장치를 직접 제어하고 키 입력을 받는 <u>표준 입력 스트림</u> 객체이다. System.in 을 통해 사용자로부터 키를 입력받을 수 있다. 하지만 응용프로그램은 받은 바이트 정보를 문자나 숫자로 변환해야하는 번거로움이 있다. 그러므로 키보드에서 입력된 키를 문자나 정수, 실수, 문자열 등 사용자가 원하는 타입으로 변환해주는 Scanner 클래스를 사용하는 것이 효과적이다.

---

### Scanner 객체 생성

우선 다음과 같이 Scanner 객체를 생성한다. 
그리고 Scanner를 사용하기 위해선 맨 앞 줄에 import문이 필요하다.

```java
import java.util.Scanner;   //맨앞 import는 C에서 include

Scanner scanner = new Scanner(System.in);
```

Scanner 클래스는 사용자가 입력하는 키 값을 공백문자를 기준으로 분리하여 토큰 단위로 읽는다.

```java
Scanner scanner = new Scanner(System.in);

String name = scanner.next();
String city = scanner.next();

int age = scanner.nextInt();            //정수로 입력받겠다
double weight = scanner.nextDouble();   //실수값을 입력받겠다
boolean isSingle - scanner.nextBoolean();
```

##### nextLine()과 next()

공백이 낀 문자열을 입력받기 위해서는 nextLine()을 사용한다.
다른 입력 없이 enter만 입력될 때 nextLine()은 빈 문자열("")을 리턴하면서 바로 돌아오지만, next()는 문자열이나 숫자 등 다른 키가 입력될 때까지 기다린다. next()는 결고 빈 문자열("")을 리턴하지 않는다.

---

##### Scanner 객체 닫기

```java
scanner.close();
```

scanner 객체가 닫히면, System.in도 함께 닫히므로 더이상 키 입력을 받을 수 없다.

응용프로그램에 scanner닫는 코드가 없으면 컴파일시 경고가 발생하지만 실행하는데는 특별히 문제가 없다. 프로그램이 종료되면 자동으로 닫힌다.

개발자는 응용프로그램 전체에 Scanner 객체를 하나만 생성하고 공유하는것이 바람직하다. Scanner 객체를 여러개 생성해도 모두 하나뿐인 System.in을 공유하므로 한군데서 닫아버리면 System.in도 닫혀버려 응용프로그램 내 다른 Scanner 객체에서 키 입력을 받을 수 없게 된다.

---

### 연산

###### 연산자 우선순위

---

### 산술 연산

더하기, 빼기, 곱하기, 나누기, 나머지 5개.

% 연산자는 다음과 같이 정수 n이 홀수인지 짝수인지 구분할 때 유용하게 활용되며, n 값이 3의 배수인지 확인하기 위해서도 활용된다.

```java
int r = n % 2;  //n이 홀수이면 r은 1, 짝수이면 r은 0

int s = n % 3;  //n이 3의 배수이면 s는 0
```

---

### 증감 연산

```java
int a = 1;
a++;   //a값 1 증가. a는 2. 후위연산자
++a;   //다시 a 값 1 증가. a는 3. 전위 연산자
```

a++은 a를 1 증가하고 전의 값 반환
++a는 a를 1 증가하고 증가된 값 반환

---

### 대입 연산(a=b)

### 비교연산(true, false)

### 논리연산(AND, OR, XOR, NOT)

### 조건연산(삼항 연산자)

### 비트 연산(비트논리연산(AND, OR, XOR, NOT), 비트 시프트 연산)

### 조건문(if문, if-else문, switch문). 

p.94~103. 예제문제

---

### p.110~112 실습문제

**1** 
Scanner 클래스를 이용하여 원화를 입력받아 달러로 바꾸어 다음 예시와 같이 출력하는 프로그램을 작성하라. $1=1100원으로 가정하고 계산하라.

```java
import java.util.Scanner;

public class Hello {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("원화를 입력하세여(단위 원) >> ");
		int change = scanner.nextInt();
		double account = change / 1100;
		
		System.out.printf(change + "원은 $" + account + "입니다.");

    scanner.close();
	}

}
```

**2** 
Scanner 클래스를 이용하여 2자리의 정수(10~99사이)를 입력받고, 십의 자리와 1의 자리가 같은지 판별하여 출력하는 프로그램을 작성하라.

```java
import java.util.Scanner;

public class Hello {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("2자리수 정수 입력(10~99) >> ");
		int value = scanner.nextInt();
		
		int a = value / 10;
		int b = value % 10;
		
		if(a == b) {
			System.out.printf("같다");
		}else {
			System.out.printf("다르다");
		}
		
		scanner.close();
	}

}
```

**3**
Scanner 클래스를 이용하여 정수로 된 돈의 액수를 입력받아 오만 원권, 만 원군, 천 원권, 500원짜리 동전, 100원짜리 동전, 50원짜리 동전, 10원짜리 동전, 1원짜리 동전 각 몇 개로 변환되는지 출력하라.

```java
import java.util.Scanner;

public class Hello {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("금액을 입력하시오 >> ");		
		int won = s.nextInt();
		
		int num50000 = won / 50000;
		won = won - (num50000*50000);
		
		int num10000 = won / 10000;
		won = won - (num10000*10000);
		
		int num1000 = won / 1000;
		won = won - (num1000*1000);
		
		int num500 = won / 500;
		won = won - (num500*500);
		
		int num100 = won / 100;
		won = won - (num100*100);		
		
		int num50 = won / 50;
		won = won - (num50*50);		
		
		int num10 = won / 10;
		won = won - (num10*10);
		
		int num1 = won / 1;
		won = won - num1;
		
		System.out.println("오만원권 " + num50000 + "매");
		System.out.println("만원권 " + num10000 + "매");
		System.out.println("천원권 " + num1000 + "매");
		System.out.println("오백원 " + num500 + "개");
		System.out.println("백원 " + num100 + "개");
		System.out.println("오십원 " + num50 + "개");
		System.out.println("십원 " + num10 + "개");
		System.out.println("일원 " + num1 + "개");
		
		s.close();
	}
}
```

**4**
Scanner 클래스로 정수 3개를 입력받고 3개의 숫자 중 중간 크기의 수를 출력하라. 평균값을 구하는 것이 아님에 주의하라.

```java
import java.util.Scanner;

public class Hello {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("정수 3개 입력 >> ");
		int num1 = s.nextInt();
		int num2 = s.nextInt();
		int num3 = s.nextInt();
		
		int value = 0;
		if(num1 > num2 && num1 < num3) {
			value = num1;
		}else if(num2 > num3 && num2 < num1) {
			value = num2;
		}else if(num3 > num1 && num3 < num2) {
			value = num3;
		}
		
		System.out.print("중간 값은 " + value);
		
		s.close();
	}
}
```

**5**
Scanner를 이용하여 삼각형의 변의 길이를 나타내는 정수 3개를 입력받고 이 3개의 수로 삼각형을 만들 수 있는지 판별하라. 삼각형이 되려면 두 변의 합이 다른 한 변의 합보다 커야 한다.

```java
import java.util.Scanner;

public class Hello {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("정수 3개를 입력하세요 >> ");
		int num1 = s.nextInt();
		int num2 = s.nextInt();
		int num3 = s.nextInt();
		
		
		
		if( (num1 + num2 < num3) || (num1 + num3 < num2) || (num2 + num3 < num1) ) {
			System.out.println("삼각형이 안됩니다.");
		}else {
			System.out.println("삼각형이 됩니다.");
		}
		
		s.close();
	}
}
```

**6**
369게임을 간단히 작성해보자. 1~99까지의 정수를 입력받고 정수에 3, 6, 9 중 하나가 있는 경우는 "박수짝"을 출력하고 두 개 있는 경우는 "박수짝짝"을 출력하는 프로그램을 작성하라. 예를 들면, 키보드로 입력된 수가 13인 경우 "박수짝"을, 36인 경우 "박수짝짝"을 출력하면 된다.

```java
import java.util.Scanner;

public class Hello {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("1~99사이의 정수를 입력하시오 >> ");
		int num = s.nextInt();
		
		int unit = num % 10;
		int ten = num / 10;
		
		if( unit == 3 || unit == 6 || unit == 9 ) {
			System.out.print("박수짝");
			if(ten == 3 || ten == 6 || ten == 9) {
				System.out.println("짝");
			}
		}else if( ten == 3 || ten == 6 || ten == 9 ){
			System.out.print("박수짝");
		}else {
			System.out.print("박수 없어");
		}
		
		s.close();
	}
}
```

**7**
2차원 평면에서 직사각형은 왼쪽 상단 모서리와 오른쪽 하단 모서리의 두 점으로 표현한다. (100, 100)과 (200, 200)의 두 점으로 이루어진 사각형이 있을 때, Scanner를 이용하여 정수 x와 y값을 입력받고 점 (x, y)가 이 직사각형 안에 있는지를 판별하는 프로그램을 작성하라.

```java
import java.util.Scanner;

public class Hello {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("점 x,y의 좌표를 입력하시오 >> ");
		int x = s.nextInt();
		int y = s.nextInt();
		
		if( (x >= 100 && x <= 200) && (y >= 100 && y <= 200) ) {
			System.out.println("(" + x + "," + y + ") 는 사각형 안에 있습니다.");
		}else {
			System.out.println("범위를 벗어났습니다.");
		}
		
		s.close();
	}
}
```

**8**
2차원 평면에서 직사각형은 문제 7번처럼 두 점으로 표현된다. 키보드로부터 직사각형을 구성하는 두 점 (x1, y1), (x2, y2)를 입력받아 (100, 100), (200, 200)의 두 점으로 이루어진 직사각형과 충돌하는지 판별하는 프로그램을 작성하라.

```java
import java.util.Scanner;

public class Hello {
	public static boolean inRect(int x, int y) {
		if(x >= 100 && x <=200 || y >=100 && y <= 200) {
			return true;
		}else {
			return false;
		}
	}
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("두 점 (x1, y1), (y1, y2)의 값을 입력 >> ");
		int x1 = s.nextInt();
		int y1 = s.nextInt();
		int x2 = s.nextInt();
		int y2 = s.nextInt();
		
		boolean num1 = inRect(x1, y1);
		boolean num2 = inRect(x2, y2);
		
		if(num1 == true || num2 == true) {
			System.out.println("충돌합니다");
		}else {
			System.out.println("충돌하지 않습니다");
		}
		
		s.close();
	}
}
```

**9**
원의 중심을 나타내는 한 점과 반지름을 실수 값으로 입력받아라. 그리고 실수 값으로 다른 점 (x, y)를 입력받아 이 점이 원의 내부에 있는지 판별하여 출력하라.

```java
import java.util.Scanner;

public class Hello {
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("원의 중심과 반지름 입력 >> ");
		int circle_x = s.nextInt();
		int circle_y = s.nextInt();
		double r = s.nextDouble();
		System.out.print("점 입력");
		int x = s.nextInt();
		int y = s.nextInt();
		
		double distance = Math.sqrt(((x - circle_x) * (x - circle_x)) + ((y - circle_y) * (y - circle_y)));
		
		if(distance < r) {
			System.out.println("점 " + x + "," + y + "는 원 안에 있다.");
		}else {
			System.out.println("없다");
		}
		
		s.close();
	}
}
```

**10**
원의 정보를 받기 위해 키보드로부터 원의 중심을 나타내는 한 점과 반지름을 입력받는다. 두 개의 원을 입력받고 두 원이 서로 겹치는지 판단하여 출력하라.

```java
import java.util.Scanner;

public class Hello {
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("첫번째 원의 중심과 반지름 입력 >> ");
		int x1 = s.nextInt();
		int y1 = s.nextInt();
		double r1 = s.nextDouble();		
		
		System.out.print("두번째 원의 중심과 반지름 입력 >> ");
		int x2 = s.nextInt();
		int y2 = s.nextInt();
		double r2 = s.nextDouble();
		
		double distance1 = Math.sqrt(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)));
		
		if(distance1 <= r1+r2) {
			System.out.println("원이 겹침");
		}else {
			System.out.println("원이 안겹침");
		}
		
		s.close();
	}
}
```

**11**
숫자를 입력받아 3~5는 "봄", 6~8은 "여름", 9~11은 "가을", 12,1,2의 경우 "겨울"을, 그 외 숫자를 입력한 경우 "잘못입력"을 출력하는 프로그램을 작성하라.

1) if-else 문을 이용해라.

```java
import java.util.Scanner;

public class Hello {
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("달을 입력하세요(1~12) >> ");
		int season = s.nextInt();		
		
		if( (season == 3) || (season == 4) || (season == 5) ) {
			System.out.println("봄");
		}else if((season == 6) || (season == 7) || (season == 8)) {
			System.out.println("여름");
		}else if((season == 9) || (season == 10) || (season == 11)) {
			System.out.println("가을");
		}else if((season == 12) || (season == 1) || (season == 2)) {
			System.out.println("겨울");
		}else {
			System.out.println("잘못 입력");
		}
		
		s.close();
	}
}
```

2) switch 문을 이용해라.

```java
import java.util.Scanner;

public class Hello {
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		System.out.print("달을 입력하세요(1~12) >> ");
		int season = s.nextInt();		
		
		switch(season) {
			case 3 :
			case 4 :
			case 5 :
				System.out.print("봄");
				break;
			case 6 :
			case 7 :
			case 8 :
				System.out.print("여름");
				break;
			case 9 :
			case 10 :
			case 11 :
				System.out.print("가을");
				break;
			case 12 :
			case 1 :
			case 2 :
				System.out.print("겨울");
				break;
			default : 
				System.out.print("잘못입력");
		}
		
		s.close();
	}
}
```

**12**
사칙 연산을 입력받아 계산하는 프로그램을 작성하고자 한다. 연산자는 +, -, *, / 의 네 가지로 하고 피연산자는 모두 실수로 한다. 피연산자와 연산자는 실행 사례와 같이 빈 칸으로 분리하여 입력한다. 0으로 나누기 시 "0으로 나눌 수 없습니다."를 출력하고 종료한다.

1) if-else 문

```java
import java.util.Scanner;

public class Hello {
	public static void main(String[] args) {
		
		System.out.print("사칙연산 입력 >> ");
		Scanner scanner = new Scanner(System.in);
		int num1 = scanner.nextInt();
		String value = scanner.next();
		int num2 = scanner.nextInt();
		
		int result = 0;
		if(value.equals("+")) {
			result = num1+num2;
		}else if(value.equals("-")) {
			result = num1-num2;
		}else if(value.equals("*")) {
			result = num1*num2;
		}else if(value.equals("/")){
			if(num2 == 0) {
				System.out.println("0으로 나눌 수 없습니다.");
				
				scanner.close();  // return(끝내기) 하기전에 닫아줌
				return;  //안끝내주면 아래의 ~의 계산 결과 뜸
				
			}else {
				result = num1/num2;
			}
		}else {
			System.out.println("사칙연산이 아닙니다.");
			
			scanner.close();  // return(끝내기) 하기전에 닫아줌
			return;  //안끝내주면 아래의 ~의 계산 결과 뜸
		}
		
		System.out.println(num1 + value + num2 + "의 계산 결과는 " + result);
		
		scanner.close();
	}
}

```

2) switch문

```java
import java.util.Scanner;

public class Hello {
	public static void main(String[] args) {
		
		System.out.print("사칙연산 입력 >> ");
		Scanner scanner = new Scanner(System.in);
		int num1 = scanner.nextInt();
		String value = scanner.next();
		int num2 = scanner.nextInt();
		
		int result = 0;
		switch(value) {
			case "+" :
				result = num1 + num2;
				break;
			case "-" :
				result = num1 - num2;
				break;
			case "*" :
				result = num1 * num2;
				break;
			case "/" : 
				if(num2 == 0) {
					System.out.println("0으로 나눌 수 없습니다.");
					scanner.close();
					return;
				}
				result = num1 / num2;
				break;
			default:
				System.out.println("사칙연산이 아닙니다");
				scanner.close();
				return;
		}
		
		System.out.println(num1 + value + num2 +"의 계산 결과는 " + result);
		
		scanner.close();
	}
}
```