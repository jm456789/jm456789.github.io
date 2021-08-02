---
layout: post

title: "JAVA Chapter05 상속 - 슈퍼클래스에 대한 접근 지정 / 상속(extends)과 생성자 / super() / 업캐스팅, 다운캐스팅 / instanceof 연산자 / 메소드 오버라이딩 / 추상 메소드(abstract) / 인터페이스"
excerpt: "슈퍼클래스에 대한 접근 지정 / 상속(extends)과 생성자 / super() / 업캐스팅, 다운캐스팅 / instanceof 연산자 / 메소드 오버라이딩 / 추상 메소드(abstract) / 인터페이스"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 5. 상속

반복적인 일을 줄인다.
부모클래스를 슈퍼클래스, 자식클래스를 서브클래스라고 부르며, 상속을 선언 할 때 extends 키워드 사용한다.

* 다중상속을 지원하지 않는다.
* 상속의 횟수에 제한을 두지 않는다.
* 최상위에 java.lang.object 클래스가 있다!!!

---

### 슈퍼클래스에 대한 접근 지정

##### 슈퍼클래스의 private 멤버

##### 슈퍼클래스의 디폴트 멤버

##### 슈퍼클래스의 public 멤버

##### 슈퍼클래스의 protected 멤버

---

### 상속과 생성자

##### 서브 클래스와 슈퍼 클래스의 생성자 호출 및 실행

질문 1. 서브클래스 객체가 생성될 때 서브클래스의 생성자와 슈퍼 클래스의 생성자가 모두 실행되는가?
답변 ) 둘 다 실행된다.

질문 2. 서브클래스의 생성자와 슈퍼클래스의 생성자 중 누가 먼저 실행되는가?
답변 ) 슈포클래스의 생성자가 먼저 실행된다. 호출은 서브클래스 먼저!

> 개발자의 <u>명시적 지시가 없으면</u> 서브클래스의 생성자가 기본이든 매개변수를 가지든 슈퍼 클래스에 만들어진 <u>기본생성자가 선택</u>된다.

```java
class A{
    public A(int x){
        System.out.println("생성자 A");
    }
}

class B extends A{
    public B(){    //오류발생.  2. 얘는 public A(int x)에 대한 짝을 찾을 수 없음.
        System.out.println("생성자 B");
    }
}

public class ConstructorEx2{
    public static void main(String[] args){
        B b;
        b = new B();  //1. 얘는 public B() 타고올라간다.
    }
}
```

매개변수가 있는 생성자가 있기 때문에,    
컴파일러가 기본 생성자를 안만들어준다.    
그렇기 때문에 매개변수가 없는 생성자 선택이 안돼서 오류발생한다.

---

### super()를 이용하여 명시적으로 슈퍼 클래스의 생성자 선택

```java
class A{
    public A(){
        System.out.println("생성자 A");
    }
    public A(int x){
        System.out.println("매개변수 생성자 A" + x);  //1번으로  출력
    }
}

class B extends A{
    public B(){    
        System.out.println("생성자 B");
    }
    public B(int x){
        super(x);   //여기가 키포인트~!, 첫줄에 와야함   //2. 얘는 public A(int x)얘 찾음.
        System.out.println("매개변수 생성자 B" + x);  //2번으로 출력
    }
}

public class ConstructorEx2{
    public static void main(String[] args){
        B b;
        b = new B(5);  //1. 얘는 public B(int x)얘를 찾고 
    }
}

//결과
//매개변수생성자A5
//매개변수생성자B5
```

super는 부모 자체를 의미함.     
super 생략 시 기본생성자 자동 호출

---

### 업캐스팅

부모타입의 변수로 자식 클래스의 인스턴스를 가리킨다.

```java
Person p;
Student s =new Student();
p = s; //업캐스팅
```

---

### 다운캐스팅

완전한 구조가 아님. 쓰면 안되는 구조. 여기서 말하는 다운캐스팅은 조금 다른 얘기. 
원래 다운캐스팅은 말이 안된다. ex) 자식의 공부영역을 부모에게 못참음
인스턴스 형태가 부모냐 자식이냐에 따라 다름.
인스턴스 형태가 중요!

```java
Person p = new Student("이재문"); //업캐스팅

Student s = (Student)p;  //다운캐스팅. 시작주소값을 넘겨줘서 student 타입으로 형변환 해라
```

---

### instanceof 연산자

instanceof 연산자의 결과 값은 <u>boolean</u>값으로, '레퍼런스'가 가리키는 객체가 해당 '클래스' 타입의 객체이면 <u>true</u>이고 아니면 <u>false</u>로 계산한다.

```java
        person
student     researcher
            professor


Person jee = new Student();
Person kim = new Professor();
Person lee = new Researcher();

if(jee instanceof Person) //jee는 Person 타입이므로 true
if(jee instanceof Student) //jee는 Student 타입이므로 true
if(kim instanceof Student) //kim는 Student 타입이 아니므로 false
if(kim instanceof Professor) //kim는 Professor 타입므로 true
if(kim instanceof Researcher) //Professor 객체는 Researcher 타입이기도 하므로 true
if(lee instanceof Professor) //lee는 Professor 타입이 아니므로 false
```

---

### 업캐스팅과 instanceof 연산자

```java
class Person{}
class Student extends Person{}
class Researcher extends Person{}
class Professor extends Researcher{}

public class InstanceOfEx{
    static void print(Person p){
        if(p instanceof Person){
            System.out.print("Person ");
        }
        if(p instanceof Student){
            System.out.print("Student ");
        }
        if(p instanceof Researcher){
            System.out.print("Researcher ");
        }
        if(p instanceof Professor){
            System.out.print("Professor ");
        }
    }

    public static void main(String[] args){
        System.out.print("new Student() -> \t ");   print(new Student());
        System.out.print("new Researcher() -> \t ");   print(new Researcher());
        System.out.print("new StudenProfessort() -> \t ");   print(new Professor());
    }
}

//결과
//new Student() -> Person Student
//new Researcher() -> Person Researcher
//new StudenProfessort() -> Person Researcher Professor
```

---

### 나중에 보충 추가

부모 = 자식 : 업캐스팅    
자식 = 부모 : 다운캐스팅

다운캐스팅하려면 업캐스팅 먼저 선행되어야 함. -> 멤버 개수 때문에 차이가 나서.   

Object obj = s ~~ : 업캐스팅으로 주소 먼저 넘겨줘야
String s2 = (String)obj;  : 시작주소 넘겨줘서 다운캐스팅 가능하다.

---

### 나중에 보충 추가2

```java
Person p = new Student("이재문"); //업캐스팅
Student s = (Student)p;  //다운캐스팅, (Student)의 타입 변환을 반드시 표시
```

---

```java
class Person{
  String name;
  String id;

  public Person(String name){
	  this.name = name;
  }
}

class Student extends Person{
	String grade;
	String department;

	public Student(String name){
		super(name);
	}
}

//업캐스팅~~~~ 부모의 요소로 자식 접근은 못한다~~~ 오류 보기!
public class UpcastingEx{
	public static void main(String[] args){
		Person p;
		Student s = new Student("이재문");
		p = s;  //업캐스팅

		System.out.println(p.name);  //오류 없음

		p.grade = "A";  //컴파일 오류. 다운캐스팅?안해줘서 student에 있는 grade 요소에 접근 못함
		p.department = "Com";  //컴파일 오류
	}
	//실행결과 -> 이재문
}


//다운캐스팅~~~~
public class DowncastingEx{
	public static void main(String[] args){
		Person p = new Student("이재문");  //업캐스팅
		Student s;
		
		s = (student)p;  //다운캐스팅

		System.out.println(s.name);  //오류 없음

		s.grade = "A";  //오류 없음
	}
	//실행결과 -> 이재문
}
```

---



### 메소드 오버라이딩

사용용도 다양! 많이 쓰임.

##### 매소드 오버라이딩 제약사항

* 슈퍼클래스의 메소드와 동일한 원형으로 작성한다.
* 슈퍼 클래스 메소드의 접근 지정자보다 접근의 범위를 좁여 오버라이딩 할 수 없다.
* static이나 private 또는 final로 선언된 메소드는 서브 클래스에서 오버라이딩 할 수 없다.

---

##### 동적바인딩 : 오버라이딩된 메소드 호출

재정의 한 부분에서. 자식 인스턴스에서 재정의 하면 우선권 가진다

---

##### 오버라이딩과 super 키워드

우선권은 내거 먼저

코드 작성시 **@Override** 써주면 이 아래는 재정의다라고 암묵적으로..(표기부호)

---

##### 오버로딩과 오버라이딩 비교

|   | 메소드 오버로딩  | 메소드 오버라이딩  |
|---|---|---|
| 목적  | 이름이 같은 여러 개의 <u>메소드를 중복작성</u>하여 사용의 편리성 향상. 다형성 실현  |  슈퍼클래스에 구현된 메소드를 무시하고 서브 클래스에서 새로운 기능의 메소드를 <u>재정의</u>함. 다형성 실현 |
| 조건  | 메소드의 이름은 반드시 동일하고. <u>매개변수 타입</u>이나 <u>개수</u>가 달라야 성립  | 모두 동일해야 성립  |
| 바인딩  | 정적 바인딩. 호출될 메소드는 컴파일 시에 결정(컴파일 할 때)  | 동적 바인딩. 실행 시간에 오버라디이된 메소드 찾아 호출(실행될 때)  |

다형성은 껍데기는 같은데 (운다), 다른걸 실현?(고양이, 강아지 등)

---

### 추상 메소드

* 내용이 없는 메소드. 
* abstract 키워드와 함께 원형만 선언하고 코드는 작성하지 않는다.
* 오버라이딩하여 구현해야 함
* 중괄호 사용 안한다.

```java
public abstract String getName();  //중괄호 없음. 너가 재정의해서 써야 해!!!
```

추상 메소드가 하나라도 있으면 추상 클래스가 되어야 함!!!

```java
abstract class Shape{  //추상 클래스 선언. 추상 클래스가 되어야 한다!!!!!!!!!
    public Shape(){}
    public void paint(){draw();}
    abstract public void draw(); //추상 메소드 선언!
}
```

---

##### 추상 클래스는 객체를 생성할 수 없다.

추상으로 new 인스턴스 생성 불가능

---

##### 추상 클래스의 상속

재정의 안할거면 <u>클래스에라도</u> 추상 붙여줘야 함!

```java
abstract class Shape{  
    public Shape(){}
    public void paint(){draw();}
    abstract public void draw(); 
}

abstract class Line extends Shape{     //재정의 안할거면 클래스에라도 추상 붙여줘야 함!
    public String toString(){
        return "Line";
    }
}
```

재정의를 했다 = 구현 상속이다?

---

### 상속과 추상클래스 키워드

* **상속** : extends
* **추상** : abstract

---

### 인터페이스

현업에서 자바버전 1.8 많이 씀.     
필드(멤버 변수)를 만들 수 없다. 기능만!!     
추상 = 인스턴스 만들기x      
인터페이스는 규격같은것. 약속. 코드를 가지지 않는다.     

* 인터페이스는 객체를 생성할 수 없다. (new Phone(); 같은거 생성 못함)
* 인터페이스 타입의 레퍼런스 변수 선언은 가능하다
* 인터페이스끼리 상속된다
* 인터페이스를 상속받아 클래스를 작성하면 인터페이스의 모든 추상 메소드를 구현하여야한다.

---

##### 인터페이스 구현
implements 키워드를 사용하여 인터페이스의 모든 추상 메소드르 구현한 클래스를 작성하는 것을 말한다.

---

##### 인터페이스 상속
인터페이스가 상속 받으려면 뒤에 받을 애도 인터페이스여야함.

---

```java
interpace AIInterfave{
	void recognizeSpeach();
	void sysnthesizeSpeach();
}

class AIPhone implements MobilePhoneInterface, AIInterface{ //인터페이스 구현
	//MobilePhoneInterface의 모든 메소드를 구현한다.
	public void sendCall(){...}
	public void reseiveCall(){...}
	public void sendSMS(){...}
	public void receiveSMS(){...}
	
	//AIInterface의 모든 메소드를 구현한다.
	public void recognizeSpeach(){...}
	public void synthesizeSpeach(){...}
	
	//추가적으로 다른 메소드를 작성할 수 있다.
	public int touch(){...}
}
```

---

### 추상클래스와 인터페이스의 차이점

* 인터페이스는 다중 상속 가능
* 추상 클래스는 다중상속 x
* 클래스는 단일 상속

| 비교  | 추상클래스  | 인터페이스  |
|---|---|---|
| 목적  | 추상클래스는 서브 클래스에서 필요로 하는 대부분의 기능을 구현하고 두고 서브클래스가 상속받아 활용할 수 있도록 하되, 서브클래스에서 구현할 수 밖에 없는 기능만을 추상메소드로 선언하여 서브클래스에서 구현하도록 하는 목적(다형성)  | 인터페이스는 객체의 기능을 모두 공개한 표준화같은 문서와 같은 것으로, 개발자에게 인터페이스를 상속받는 클래스의 목적에 따라 인터페이스의 모든 추상 메소드를 만들도록 하는 목적(다형성)  |
| 구성  | 추상 메소드와 일반 메소드 모두 포함, <br /> 상수와 변수 필드 모두 포함  |  변수 필드(멤버 변수)는 포함하지 않음, <br /> 상수, 추상 메소드, 일반메소드, default메소드, static 메소드 모두 포함 <br /> protected 접근 지정 선언 불가 <br /> 다중 상속 지원 |

---

instanceof로 interface 안에 interface가 포함되어있느냐 따져볼 수 있음.

---

### p.314~322 실습문제

[1~2]다음 TV 클래스가 있다.

```java
class TV {
	private int size;
	public TV(int size) { this.size=size; }
	protected int getSize() { return size; }
}
```

**1**
다음 main( ) 메소드와 실행 결과를 참고하여 TV를 상속받은 ColorTV 클래스를 작성하라.

```java
public static void main(String[] args) {
	ColorTV myTV=new ColorTV(32, 1024);
	myTV.printProperty();
}

--출력--
32인치 1024컬러
```

```java
class TV {
	private int size;
	public TV(int size) { this.size=size; }
	protected int getSize() { return size; }
}

public class ColorTV extends TV {
	private int color;
	public ColorTV(int size, int color) {
		super(size);
		this.color=color;
	}
	void printProperty() {
		System.out.println(getSize()+"인치 "+color+"컬러");
	}
	
	public static void main(String[] args) {
		ColorTV myTV=new ColorTV(32, 1024);
		myTV.printProperty();
	}
}
```

**2**
다음 main( ) 메소드와 실행 결과를 참고하여 문제 1의 ColorTV를 상속받는 IPTV 클래스를 작성하라.

```java
public static void main(String[] args) {
	IPTV iptv=new IPTV("192.1.1.2",32,2048); //"192.1.1.2" 주소에 32인치, 2048컬러
	iptv.printProperty();
}

--출력--
나의 IPTV는 192.1.1.2 주소의 32인치 2048컬러
```

```java
class TV {
	private int size;
	public TV(int size) { this.size=size; }
	protected int getSize() { return size; }
}

class ColorTV extends TV {
	private int color;
	public ColorTV(int size, int color) {
		super(size);
		this.color=color;
	}
	void printProperty() {
		System.out.println(getSize()+"인치 "+color+"컬러");
	}
}

public class IPTV extends ColorTV {
	private String address;
	
	public IPTV(String address, int size, int color) {
		super(size, color);
		this.address = address;
	}
	
	void printProperty() {
		System.out.print("나의 IPTV는 " + address + "주소의 ");
		super.printProperty();
	}
	
	public static void main(String[] args) {
		IPTV iptv=new IPTV("192.1.1.2",32,2048); //"192.1.1.2" 주소에 32인치, 2048컬러
		iptv.printProperty();
	}
}
```

[3~4] 다음은 단위를 변환하는 추상 클래스 Converter이다.

```java
import java.util.Scanner;
abstract class Converter {
	abstract protected double convert(double src); // 추상 메소드
	abstract protected String getSrcString(); // 추상 메소드
	abstract protected String getDestString(); // 추상 메소드
	protected double ratio; // 비율
	
	public void run() {
		Scanner scanner=new Scanner(System.in);
		System.out.println(getSrcString()+"을 "+getDestString()+" 로 바꿉니다.");
		System.out.print(getSrcString()+"을 입력하세요>> ");
		double val=scanner.nextDouble();
		double res=convert(val);
		System.out.println("변환 결과: "+res+getDestString()+"입니다");
		scanner.close();
	}
}
```

**3**
Converter 클래스를 상속받아 원화를 달러로 변환하는 Won2Dollar 클래스를 작성하라. main( ) 메소드와 실행 결과는 다음과 같다.

```java
public static void main(String[] args) {
	Won2Dollar toDollar=new Won2Dollar(1200); // 1달러는 1200원
	toDollar.run();
}

--출력--
원을 달러 로 바꿉니다.
원을 입력하세요>> 24000
변환 결과: 20.0달러입니다
```

```java
import java.util.Scanner;

abstract class Converter {
	abstract protected double convert(double src); // 추상 메소드
	abstract protected String getSrcString(); // 추상 메소드
	abstract protected String getDestString(); // 추상 메소드
	protected double ratio; // 비율
	
	public void run() {
		Scanner scanner=new Scanner(System.in);
		System.out.println(getSrcString()+"을 "+getDestString()+" 로 바꿉니다.");
		System.out.print(getSrcString()+"을 입력하세요>> ");
		double val=scanner.nextDouble();
		double res=convert(val);
		System.out.println("변환 결과: "+res+getDestString()+"입니다");
		scanner.close();
	}
}

public class Won2Dollar extends Converter {
	protected double convert(double src) {
		return src/ratio;
	}
	protected String getSrcString() {		
		return "원";
	}
	protected String getDestString() {
		return "달러";
	}	
	Won2Dollar(double ratio){
		this.ratio = ratio;
	}

	public static void main(String[] args) {
		Won2Dollar toDollar=new Won2Dollar(1200); // 1달러는 1200원
		toDollar.run();
	}
}
```

**4**
Converter 클래스를 상속받아 Km를 mile(마일)로 변환하는 Km2Mile 클래스를 작성하라. main( ) 메소드와 실행 결과는 다음과 같다.

```java
public static void main(String[] args) {
	Km2Mile toMile=new Km2Mile(1.6); // 1마일은 1.6Km
	toMile.run();
}

--출력--
Km을 mile 로 바꿉니다.
Km을 입력하세요>> 30
변환 결과: 18.75mile입니다
```

```java
import java.util.Scanner;

abstract class Converter {
	abstract protected double convert(double src); // 추상 메소드
	abstract protected String getSrcString(); // 추상 메소드
	abstract protected String getDestString(); // 추상 메소드
	protected double ratio; // 비율
	
	public void run() {
		Scanner scanner=new Scanner(System.in);
		System.out.println(getSrcString()+"을 "+getDestString()+" 로 바꿉니다.");
		System.out.print(getSrcString()+"을 입력하세요>> ");
		double val=scanner.nextDouble();
		double res=convert(val);
		System.out.println("변환 결과: "+res+getDestString()+"입니다");
		scanner.close();
	}
}

public class Km2Mile extends Converter {
	protected double convert(double src) {
		return src/ratio;
	}
	protected String getSrcString() {
		return "Km";
	}
	protected String getDestString() {
		return "mile";
	}
	Km2Mile(double ratio){
		this.ratio = ratio;
	}
	
	public static void main(String[] args) {
		Km2Mile toMile=new Km2Mile(1.6); // 1마일은 1.6Km
		toMile.run();
	}
}
```

[5~8] 다음은 2차원 상의 한 점을 표현하는 Point 클래스이다.

```java
class Point {
	private int x,y;
	public Point(int x, int y) {this.x=x; this.y=y;}
	public int getX() {return x;}
	public int getY() {return y;}
	protected void move(int x, int y) { this.x=x; this.y=y;}
}
```

**5**
Point를 상속받아 색을 가진 점을 나타내는 ColorPoint 클래스를 작성하라. 다음 main( ) 메소드를 포함하고 실행 결과와 같이 출력되게 하라.

```java
public static void main(String[] args) {
	ColorPoint cp=new ColorPoint(5,5,"YELLOW");
	cp.setXY(10,20);
	cp.setColor("RED");
	String str=cp.toString();
	System.out.println(str+"입니다.");
}

--출력--
RED색의 (10,20)의 점입니다.
```

```java
class Point {
	private int x,y;
	public Point(int x, int y) {this.x=x; this.y=y;}
	public int getX() {return x;}
	public int getY() {return y;}
	protected void move(int x, int y) { this.x=x; this.y=y;}
}

public class ColorPoint extends Point{
	private String color;
	ColorPoint(int x, int y, String color){
		super(x, y);
		this.color = color;
	}
	
	void setXY(int x, int y){
		move(x, y);
	}
	
	void setColor(String color) {
		this.color = color;
	}
	
	public String toString() {
		String temp = color + "색의 (" + getX() + "," + getY() + ")의 점";
		return temp;
	}
	
	public static void main(String[] args) {
		ColorPoint cp=new ColorPoint(5,5,"YELLOW");
		cp.setXY(10,20);
		cp.setColor("RED");
		String str=cp.toString();
		System.out.println(str+"입니다.");
	}
}
```

**6**
Point를 상속받아 색을 가진 점을 나타내는 ColorPoint 클래스를 작성하라. 다음 main( ) 메소드를 포함하고 실행 결과와 같이 출력되게 하라.

```java
public static void main(String[] args) {
	ColorPoint zeroPoint=new ColorPoint(); // (0,0) 위치의 BLACK 색 점
	System.out.println(zeroPoint.toString()+"입니다.");
		
	ColorPoint cp=new ColorPoint(10,10); // (10,10) 위치의 BLACK 색 점
	cp.setXY(5,5);
	cp.setColor("RED");
	System.out.println(cp.toString()+"입니다.");
}

--출력--
BLACK색의 (0,0)의 점입니다.
RED색의 (5,5)의 점입니다.
```

```java
class Point {
	private int x,y;
	public Point(int x, int y) {this.x=x; this.y=y;}
	public int getX() {return x;}
	public int getY() {return y;}
	protected void move(int x, int y) { this.x=x; this.y=y;}
}

public class ColorPoint extends Point{
	
	private String color;
	
	ColorPoint(){
		super(0, 0);
		this.color = "BLACK";
	}
	
	ColorPoint(int x, int y){
		super(x, y);
		this.color = "BLACK";
	}
	
	public String toString() {
		String temp = color + "색의 (" + getX() + "," + getY() + ")의 점";
		return temp;
	}
	
	void setXY(int x, int y) {
		move(x, y);
	}	
	
	void setColor(String color) {
		this.color = color;
	}
	
	public static void main(String[] args) {
		ColorPoint zeroPoint=new ColorPoint(); // (0,0) 위치의 BLACK 색 점
		System.out.println(zeroPoint.toString()+"입니다.");
			
		ColorPoint cp=new ColorPoint(10,10); // (10,10) 위치의 BLACK 색 점
		cp.setXY(5,5);
		cp.setColor("RED");
		System.out.println(cp.toString()+"입니다.");
	}
}
```

**7**
Point를 상속받아 3차원의 점을 나타내는 Point3D 클래스를 작성하라. 다음 main( ) 메소드를 포함하고 실행 결과와 같이 출력되게 하라.

```java
public static void main(String[] args) {
	Point3D p=new Point3D(1,2,3); // 1, 2, 3은 각각 x, y, z축의 값.
	System.out.println(p.toString()+"입니다.");
		
	p.moveUp(); // z 축으로 위쪽 이동
	System.out.println(p.toString()+"입니다.");
		
	p.moveDown(); // z 축으로 아래쪽 이동
	p.move(10, 10); // x, y 축으로 이동
	System.out.println(p.toString()+"입니다.");
		
	p.move(100, 200, 300); // x, y, z 축으로 이동
	System.out.println(p.toString()+"입니다.");
}

--출력--
(1,2,3)의 점입니다.
(1,2,4)의 점입니다.
(10,10,3)의 점입니다.
(100,200,300)의 점입니다.
```

```java
public class Point3D extends Point{

	private int z;
	
	Point3D(int x, int y, int z) {
		super(x,y);
		this.z=z;
	}
	
	public String toString() {
		return ("("+getX()+","+getY()+","+this.z+")의 점");
	}
	
	public void moveUp() {
		this.z++;
	}
	
	public void moveDown() {
		this.z--;
	}
	
	protected void move(int x, int y, int z) { 
		super.move(x,y);
		this.z=z;
	}
	
	public static void main(String[] args) {

		Point3D p=new Point3D(1,2,3);
		System.out.println(p.toString()+"입니다.");
		
		p.moveUp();
		System.out.println(p.toString()+"입니다.");
		
		p.moveDown();
		p.move(10, 10);
		System.out.println(p.toString()+"입니다.");
		
		p.move(100, 200, 300);
		System.out.println(p.toString()+"입니다.");
	}
}
```

**8**
Point를 상속받아 양수의 공간에서만 점을 나타내는 PositivePoint 클래스를 작성하라. 다음 main( ) 메소드를 포함하고 실행 결과와 같이 출력되게 하라.

```java
public static void main(String[] args) {
	PositivePoint p= new PositivePoint();
	p.move(10,10);
	System.out.println(p.toString()+"입니다.");
		
	p.move(-5, 5); // 객체 p는 음수 공간으로 이동되지 않음
	System.out.println(p.toString()+"입니다.");
		
	PositivePoint p2=new PositivePoint(-10, -10);
	System.out.println(p2.toString()+"입니다.");
}

--출력--
(10,10)의 점입니다.
(10,10)의 점입니다.
(0,0)의 점입니다.

힌트 :
Point 클래스의 move( )를 PositivePoint 클래스에서 오버라이딩하여 재작성하고 적절히 super.move( )를 호출해야 한다. PositivePoint의 2 개의 생성자에서도 적절히 super( ) 생성자와 super.move( )를 호출해야 한다.
```

```java
public class PositivePoint extends Point {

	PositivePoint () {
		super(0,0);
	}
	
	PositivePoint(int x, int y) {
		super(0,0);
		move(x, y);
	}
	
	public String toString() {
		int x=getX();
		int y=getY();
		String str="("+x+","+y+")의 점";
		return str;
	}
	
	@Override
	protected void move(int x, int y) {
		if ((x>0)&&(y>0))
			super.move(x, y);
	}
	
	public static void main(String[] args) {

		PositivePoint p= new PositivePoint();
		p.move(10,10);
		System.out.println(p.toString()+"입니다.");
		
		p.move(-5, 5);
		System.out.println(p.toString()+"입니다.");
		
		PositivePoint p2=new PositivePoint(-10, -10);
		System.out.println(p2.toString()+"입니다.");
	}

}
```
**9**
다음 Stack 인터페이스를 상속받아 실수를 저장하는 StringStack 클래스를 구현하라.

```java
public interface Stack {
	int length(); //현재 스택에 저장된 개수 리턴
	int capacity(); //스택의 전체 저장 가능한 개수 리턴
	String pop(); //스택의 톱(top)에 저장된 문자열 리턴
	boolean push (String val); //스택의 톱(top)에 문자열 저장
}
```

그리고 다음 실행 사례와 같이 작동하도록 StackApp 클래스에 main( ) 메소드를 작성하라.

```java
--출력--
총 스택 저장 공간의 크기 입력 >>3
문자열 입력 >> hello
문자열 입력 >> sunny
문자열 입력 >> smile
문자열 입력 >> happy
스택이 꽉 차서 푸시 불가!
문자열 입력 >> 그만
스택에 저장된 모든 문자열 팝 :smile sunny hello 
```

```java
import java.util.Scanner;

public class StackApp implements Stack{
	private int top=0;
	private String arr[];
	
	StackApp(int size) {arr=new String[size];}
	
	@Override
	public int length() {return top;}
	
	@Override
	public int capacity() {return arr.length;}
	
	@Override
	public String pop() {
		String val;
		if (top==0)
			val="0";
		else {
			top--;
			val=arr[top];
		}
		return val;
	}
	
	@Override
	public boolean push (String val) {
		if (top==arr.length)
			return false;
		else {
			arr[top]=val;
			top++;
			return true;
		}
	}
	
	void run() {
		Scanner scan=new Scanner(System.in);
		
		while(true) {
			System.out.print("문자열 입력 >> ");
			String val=scan.next();
			if (val.equals("그만"))
				break;
			else {
				boolean bool=push(val);
				if (bool==false)
					System.out.println("스택이 꽉 차서 푸시 불가!");
			}
		}
		
		System.out.print("스택에 저장된 모든 문자열 팝 :");
		while (true) {
			String val=pop();
			if (val.equals("0")) {
				System.out.println();
				break;
			}
			else
				System.out.print(val+" ");
		}
	}
		
	public static void main(String[] args) {
		
		Scanner scan=new Scanner(System.in);
		
		System.out.print("총 스택 저장 공간의 크기 입력 >>");
		int size=scan.nextInt();
		StackApp sa=new StackApp(size);
		sa.run();
	}

}
```

**10**
다음은 키와 값을 하나의 아이템으로 저장하고 검색 수정이 가능한 추상 클래스가 있다.

```java
abstract class PairMap {
	protected String keyArray []; //key 들을 저장하는 배열
	protected String valueArray []; //value 들을 저장하는 배열
	abstract String get(String key); //key 값을 가진 value를 리턴, 없으면 null 리턴
	abstract void put(String key, String value); //key와 value를 쌍으로 저장. 기존에 key가 있으면, 값을 value로 수정
	abstract String delete(String key); //key 값을 가진 아이템(value와 함께) 삭제. 삭제된 value 값 리턴
	abstract int length(); //현재 저장된 아이템 개수 리턴
}
```

PairMap을 상속받는 Dictionary 클래스를 구현하고, 이를 다음과 같이 활용하는 main( ) 메소드를 가진 클래스 DictionaryApp도 작성하라.

```java
public static void main(String[] args) {
	Dictionary dic=new Dictionary(10);
	dic.put("황기태", "자바");
	dic.put("이재문", "파이선");
	dic.put("이재문", "C++"); //이재문의 값을 C++로 수정
	System.out.println("이재문의 값은 "+dic.get("이재문"));
	System.out.println("황기태의 값은 "+dic.get("황기태"));
	dic.delete("황기태"); //황기태 아이템 삭제
	System.out.println("황기태의 값은 "+dic.get("황기태")); //삭제된 아이템 접근
}

--출력--
이재문의 값은 C++
황기태의 값은 자바
황기태의 값은 null
```

```java
package sec03.exam01;

abstract class PairMap {
	protected String keyArray[]; // key 들을 저장하는 배열
	protected String valueArray[]; // value 들을 저장하는 배열
	abstract String get(String key); // key 값을 가진 value 리턴, 없으면 null 리턴
	abstract void put(String key, String value); // key와 value를 쌍으로 저장. 기존에 key가 있으면, 값을 value로 수정
	abstract String delete(String key); // key 값을 가진 아이템 (value와 함꼐) 삭제, 삭제된 value 값 리턴
	abstract int length(); // 현재 저장된 아이템의 개수 리턴
}

class Dictionary extends PairMap {
	private int top;
	public Dictionary(int num) {
		keyArray = new String[num];
		valueArray = new String[num];
		this.top = 0;
	}
	
	public String get(String key) {
		for(int i=0; i<keyArray.length; i++) {
			if(key.equals(keyArray[i])) {
			return valueArray[i];
			}
		}
		return null; // 원하는 key가 없다면 null 리턴
	}
	public void put(String key, String value) {
		for(int i=0; i<keyArray.length; i++) {
			if(key.equals(keyArray[i])) {
			keyArray[i] = key;
			valueArray[i] = value;
			return; // 중복된 key가 있다면 저장하고 함수 종료
			}
		}
		keyArray[top] = key;
		valueArray[top] = value;
		top++;
	}
	public String delete(String key) {
		for(int i=0; i<keyArray.length; i++) {
			if(key.equals(keyArray[i])) {
			String s = valueArray[i];
			keyArray[i] = null;
			valueArray[i] = null;
			return s;  // 삭제된 value 값 리턴
			}
		}
		return null; // 삭제된 것이 없다면 null 리턴
	}
	public int length() {
		return top;
	}
}

public class DictionaryApp {

	public static void main(String[] args) {
		Dictionary dic = new Dictionary(10);
		dic.put("황기태", "자바");
		dic.put("이재문", "파이선");
		dic.put("이재문", "C++"); // 이재문의 값을 C++로 수정
		System.out.println("이재문의 값은 "+dic.get("이재문"));
		System.out.println("황기태의 값은 "+dic.get("황기태"));
		dic.delete("황기태"); // 황기태 아이템 삭제
		System.out.println("황기태의 값은 "+dic.get("황기태")); //삭제된 아이템 접근
	}

}

```

**11**
철수 학생은 다음 3개의 필드와 메소드를 가진 4개의 클래스 Add, Sub, Mul, Div를 작성하려고 한다(4장 실습문제 11 참고)

* int 타입의 a, b 필드: 2개의 피연산자
* void setValue(int a, int b): 피연산자 값을 객체 내에 저장한다.
* int calculate( ): 클래스의 목적에 맞는 연산을 실행하고 결과를 리턴한다.

곰곰 생각해보니, Add, Sub, Mul, Div 클래스에 공통된 필드와 메소드가 존재하므로 새로운 추상 클래스 Calc를 작성하고 Calc를 상속받아 만들면 되겠다고 생각했다. 그리고 main( ) 메소드에서 다음 실행 사례와 같이 2개의 정수와 연산자를 입력받은 후, Add, Sub, Mul, Div 중에서 이 연산을 처리할 수 있는 객체를 생성하고 setValue( )와 calculate( )를 호출하여 그 결과 값을 화면에 출력하면 된다고 생각하였다. 철수처럼 프로그램을 작성하라.

--출력--
두 정수와 연산자를 입력하시오>>5 7 +
12

```java
package sec03.exam01;

import java.util.Scanner;

abstract class Calc{
	protected int a;
	protected int b;
	abstract void setValue(int a, int b);
	abstract int calculate();
}

class Add extends Calc {
	Add(int a, int b){
		setValue(a, b);
	}
	
	public void setValue(int a, int b) {
		this.a=a;
		this.b=b;
	}
	
	public int calculate() {
		return a+b;
	}
}

class Sub extends Calc {
	Sub(int a, int b){
		setValue(a, b);
	}
	
	public void setValue(int a, int b) {
		this.a=a;
		this.b=b;
	}
	
	public int calculate() {
		return a-b;
	}
}

class Mul extends Calc {
	Mul(int a, int b){
		setValue(a, b);
	}
	
	public void setValue(int a, int b) {
		this.a=a;
		this.b=b;
	}
	
	public int calculate() {
		return a*b;
	}
}

class Div extends Calc {
	Div(int a, int b){
		setValue(a, b);
	}
	
	public void setValue(int a, int b) {
		this.a=a;
		this.b=b;
	}
	
	public int calculate() {
		return a/b;
	}
}


public class Calculate_ver2 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("두 정수와 연산자를 입력하시오 >>");
		int a = scanner.nextInt();
		int b = scanner.nextInt();
		String cal = scanner.next();
		
		switch (cal) {
		case "+":
			Add add=new Add(a,b);
			System.out.println(add.calculate());
			break;
		case "-":
			Sub sub=new Sub(a,b);
			System.out.println(sub.calculate());
			break;
		case "*":
			Mul mul=new Mul(a,b);
			System.out.println(mul.calculate());
			break;
		case "/":
			Div div=new Div(a,b);
			System.out.println(div.calculate());
			break;
		}
		
		scanner.close();

	}
}
```

**12**
텍스트로 입출력하는 간단한 그래픽 편집기를 만들어보자. 본문 5.6절과 5.7절에서 사례로 든 추상 클래스 Shape과 Line, Rect, Circle 클래스 코드를 잘 완성하고 이를 활용하여 아래 시행 예시처럼 "삽입", "삭제", "모두 보기", "종료"의 4가지 그래픽 편집 기능을 가진 클래스 GraphicEditor을 작성하라.

```java
--출력--
그래픽 에디터 beauty을 실행합니다.
삽입(1), 삭제(2), 모두 보기(3), 종료(4)>>1
Line(1), Rect(2), Circle(3)>>2
삽입(1), 삭제(2), 모두 보기(3), 종료(4)>>1
Line(1), Rect(2), Circle(3)>>3
삽입(1), 삭제(2), 모두 보기(3), 종료(4)>>3
Rect
Circle
삽입(1), 삭제(2), 모두 보기(3), 종료(4)>>2
삭제할 도형의 위치>>3
삭제할 수 없습니다.
삽입(1), 삭제(2), 모두 보기(3), 종료(4)>>4
beauty을 종료합니다.
```

힌트 : Shape을 추상 클래스로 작성한 사례는 다음과 같다. 

```java
public abstract class Shape {
	private Shape next;
	public Shape() {next=null;}
	public void setNext(Shape obj) {next=obj;} // 링크 연결
	public Shape getNext() {return next;}
	public abstract void draw(); // 추상 메소드
}
```

```java
import java.util.Scanner;

abstract class Shape {
   private Shape next;
   public Shape() { next = null; }
   public void setNext(Shape obj) { next = obj; } // 링크 연결
   public Shape getNext() { return next; }
   public abstract void draw();
}

class Line extends Shape {
   String name ="line";
   public void draw() {
      System.out.println("Line");
   }
}
class Rect extends Shape {
   String name ="Rect";
   public void draw() {
      System.out.println("Rect");
   }
}
class Circle extends Shape {
   String name ="circle";
   public void draw() {
      System.out.println("Circle");
   }
}

public class GraphicEditor{
   private Shape head, tail;
   private Scanner sc; 
   public GraphicEditor() {
      head = null;  // 시작 노드
      tail = null; // 끝 노드
      sc = new Scanner(System.in);
   }
   public void run() {
      System.out.println("그래픽 에디터 beauty를 실행합니다.");
      while(true) {
         System.out.print("삽입(1), 삭제(2), 모두 보기(3), 종료(4) >> ");
         int num = sc.nextInt();
         switch(num) {
         case 1:
            System.out.print("Line(1), Rect(2), Circle(3) >> ");
            num = sc. nextInt();
            insert(num);
            break;
         case 2:
            System.out.print("삭제할 도형의 위치 >> ");
            num = sc.nextInt();
            delete(num);
            break;
         case 3:
            print();
            break;
         case 4:
            System.out.println("beauty을 종료합니다.");
            sc.close();
            return;
         }
      }
   }
   public void insert(int draw) { // 노드 삽입
      Shape grapic;
      switch(draw) {
      case 1:
         grapic = new Line();
         break;
      case 2:
         grapic = new Rect();
         break;
      case 3:
         grapic = new Circle();
         break;
      default:
         System.out.println("다시 입력해 주세요.");
         return;
      }
      if(head == null) { // head가 아무것도 가리키지 않으면
         head = grapic; // head랑 tail이 새로운 노드를가리킴
         tail = grapic;
      }
      else {
         tail.setNext(grapic); // 끝 노드에 새로운 노드를 연결하고,
         tail = grapic; // 끝 노드는 새로 만들어진 노드를 가리키게 함
      }
   }
   public void print() { // 전체 노드 출력
      Shape s = head;
      while(s != null) {
         s.draw();
         s = s.getNext();
      }
   }
   public void delete(int num) { // num은 몇번째 노드인지
      Shape cur = head; // 현재 노드
      Shape tmp = head;
      int i;
      if( num == 1) { // 첫번째 노드를 삭제하는 경우 
         if(head == tail) { // 노드가 한개 일경우 
            head = null;
            tail = null;
            return;
         }
         else { // 노드가 두개 이상
            head = head.getNext();
            return;
         }
      }
      for(i=1; i<num; i++) {
         tmp = cur; // 현재 노드를 저장 후  (즉, 이전 노드)
         cur = cur.getNext(); // 다음 노드로 이동
         if(cur == null) { // 노드 수가 입력 값보다 적을때
            System.out.println("삭제할 수 없습니다.");
            return;
         }
      }
      if(i==num) { // 끝 노드를 가리킬때
         tmp.setNext(cur.getNext());
         tail = tmp;
      }
      else // 끝노드가 아니라면 이전노드가 다음 노드를 가리킴 (즉, 현재 노드 삭제)
         tmp.setNext(cur.getNext());
   }
   public static void main(String[] args) {
         GraphicEditor editor = new GraphicEditor();
         editor.run();
   }
}
```

**13**
다음은 도형의 구성을 묘사하는 인터페이스이다.

```java
interface Shape {
	final double PI = 3.14; //상수
	void draw(); //도형을 그리는 추상 메소드
	double getArea(); //도형의 면적을 리턴하는 추상 메소드
	default public void redraw() { //디폴트 메소드
		System.out.print("--- 다시 그립니다. ");
		draw();
	}
}
```

다음 main( ) 메소드와 실행 결과를 참고하여, 인터페이스 Shape을 구현한 클래스 Circle를 작성하고 전체 프로그램을 완성하라.

```java
public static void main(String[] args) {
	Shape donut=new Circle(10); // 반지름이 10인 원 객체
	donut.redraw();
	System.out.println("면적은 "+donut.getArea());
}

--출력--
--- 다시 그립니다. 반지름이 10인 원입니다.
면적은 314.0
```

```java
package sec03.exam01;

interface Shape {
	final double PI = 3.14; //상수
	void draw(); //도형을 그리는 추상 메소드
	double getArea(); //도형의 면적을 리턴하는 추상 메소드
	default public void redraw() { //디폴트 메소드
		System.out.print("--- 다시 그립니다. ");
		draw();
	}
}

public class Circle implements Shape {	
	private int radius;
	private double area;
	
	Circle(int radius){
		this.radius = radius;
		area=this.radius*this.radius*PI;
	}
	
	public void draw() {
		System.out.println("반지름이 "+radius+"인 원입니다.");
	}
	
	public double getArea() {
		return area;
	}

	public static void main(String[] args) {
		Shape donut=new Circle(10); // 반지름이 10인 원 객체
		donut.redraw();
		System.out.println("면적은 "+donut.getArea());
	}

}

```

**14**  
다음 main( ) 메소드와 실행 결과를 참고하여, 문제 13의 Shape 인터페이스를 구현한 클래스 Oval, Rect를 추가 작성하고 전체 프로그램을 완성하라.

```java
public static void main(String[] args) {
	Shape [] list= new Shape[3]; // Shape을 상속받은 클래스 객체의 래퍼런스 배열
	list[0]= new Circle(10); // 반지름이 10인 원 객체
	list[1]= new Oval(20, 30); // 20x30 사각형에 내접하는 타원
	list[2]= new Rect(10, 40); // 10x40 크기의 사각형
		
	for (int i=0; i<list.length; i++) list[i].redraw();
	for (int i=0; i<list.length;i++) System.out.println("면적은 "+list[i].getArea());
}

//출력
--- 다시 그립니다. 반지름이 10인 원입니다.
--- 다시 그립니다. 20x30에 내접하는 타원입니다.
--- 다시 그립니다. 10x40크기의 사각형 입니다.
면적은 314.0
면적은 1884.0
면적은 400.0
```

```java
public class Oval implements Shape {
	private int radius1;
	private int radius2;
	private double area;
	
	Oval (int radius1, int radius2) {
		this.radius1=radius1;
		this.radius2=radius2;
		area=radius1*radius2*PI;
	}
	
	public void draw() {
		System.out.println(radius1+"x"+radius2+"에 내접하는 타원입니다.");
	}
	
	public double getArea() {return area;}
}
```

```java
public class Rect implements Shape {
	private int width;
	private int height;
	private double area;
	
	Rect (int width, int height) {
		this.width=width;
		this.height=height;
		area=this.width*this.height;
	}
	
	public void draw() {
		System.out.println(width+"x"+height+"크기의 사각형 입니다.");
	}
	
	public double getArea() {return area;}
	
	public static void main(String[] args) {
		Shape [] list= new Shape[3];
		list[0]= new Circle(10);
		list[1]= new Oval(20, 30);
		list[2]= new Rect(10, 40);
		
		for (int i=0; i<list.length; i++)
			list[i].redraw();
		for (int i=0; i<list.length;i++)
			System.out.println("면적은 "+list[i].getArea());
	}

}
```

---

**11번 번외**
더하기(+), 빼기(-), 곱하기(*), 나누기(/)를 수행하는 각 클래스 Add, Sub, Mul, Div를 만들어라. 이들은 모두 다음 필드와 메소드를 가진다. 

* int 타입의 a, b필드: 연산하고자 하는 피연산자
* void setValue(int a, int b): 피연산자를 객체 내에 설정한다.
* int calculate(): 해당 클래스의 목적에 맞는 연산을 실행하고 그 결과를 리턴한다.

Add, Sub, Mul, Div 클래스에 공통된 필드와 메소드가 존재하므로 새로운 추상클래스 Calc를 정의하고 이들이 Calc를 상속받게 하라. main() 메소드에서는 다음 실행 사례의 그림과 같이 키보드로부터 계산하고자 하는 연산자와 두 정수를 입력받은 후, Add, Sub, Mul, Div 중에서 이 연산을 시행할 수 있는 객체를 생성하고 setValue()와 calculate()를 호출하여 그 결과 값을 화면에 출력하라. 

Add   
int a
int b
setValue()
calculate()

Sub   
int a
int b
setValue()
calculate()

Mul, Div ...

```java
//Calc.java
public abstract class Calc{
	int a, b;
	
	void setValue(int a, int b){
		this.a=a;
		this.b=b;
	}
	
	abstract int calculate();
}
```

```java
//Add.java
public class Add extends Calc{
	
	@Override
	int calculate() {
		return a+b; 
	}
}
```

```java
//Sub.java
public class Sub extends Calc{
	
	@Override
	int calculate() {
		return a-b; 
	}
}

```

```java
//Mul.java
public class Mul extends Calc{
	
	@Override
	int calculate() {
		return a*b; 
	}
}
```

```java
//Div.java
public class Div extends Calc{
		
	@Override
	int calculate() {
		return a/b; 
	}
}
```

```java
//Calculate.java
import java.util.Scanner;

public class Calculate {
	
	static void prn() {
		System.out.println("1. ADD");
		System.out.println("2. SUBTRACT");
		System.out.println("3. MULTIPLY");
		System.out.println("4. DIVIDE");
		System.out.println("5. EXITE");
		System.out.print("메뉴 선택 >>");
	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		Calc cc = null;
		
		while(true) {
			prn();
			int choice = scanner.nextInt();
									
			switch(choice) {
				case 1 : 
					cc = new Add();
					break;
				case 2 : 
					cc = new Sub(); 
					break;
				case 3 : 
					cc = new Mul(); 
					break;
				case 4 : 
					cc = new Div(); 
					break;
				case 5 :
					System.out.println("종료합니다..");
					return;
				default :
					System.out.println("범위 밖 번호 입력. 다시 선택하세요");
					break;
			}
			
			System.out.println("두 정수 입력");
			cc.setValue(scanner.nextInt(), scanner.nextInt());
			
			System.out.println("결과 :" + cc.calculate());
		}
	}
}
```
