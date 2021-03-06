---
layout: post

title: "JAVA Chapter04 클래스와 객체 - 객체 지향 언어의 특성 / new 연산자와 객체 생성, 레퍼런스 변수 / 생성자 / this 레퍼런스 / 메소드 형식 / 객체의 소멸 / 클래스, 멤버 접근 지정 / final 클래스"
excerpt: "객체 지향 언어의 특성 / new 연산자와 객체 생성, 레퍼런스 변수 / 생성자 / this 레퍼런스 / 메소드 형식 / 객체의 소멸 / 클래스, 멤버 접근 지정 / final 클래스"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 04. 클래스와 객체

실세계에서 객체들은 자신만의 고유한 특성과 행동을 가지며 다른 객체들에게 행동을 요청하거나 정보를 주고받는 등 상호 작용하면서 존재한다.

---

### 객체 지향 언어의 특성

> 객체지향 언어는 실세계의 객체를 프로그램 내에 표현하기 위해 클래스와 객체 개념을 도입하였다. 객체 지향 언어는 다음과 같은 특성을 가지다.

c는 절차지향 함수기반,    
자바는 객체지향 객체기반     
c++은 절차지향 + 객체지향

실세계와 달리 자바에서 객체는 <u>클래스(class)</u>라는 캡슐을 사용하며, <u>필드</u>(멤버변수)와 <u>메소드</u>(멤버함수)로 구성된다.     
멤버는 변수. 특성(시력, 팔길이 등)

> 클래스(class) : 객체 모양을 선언한 틀(캡슐화). ex)붕어빵 틀.      
> 객체 : 클래스의 모양대로 생성된 실체. ex)붕어빵. 객체=<u>인스턴스</u>=오브젝트. 객체들은 클래스의 모양대로 모두 동일한 속성을 가지고 탄생하지만, 자신만의 고유한 값을 가짐으로써 구분된다.

* **캡슐화** : 캡슐화란 객체를 캡슐로 싸서 <u>내부를 보호</u>하고 볼 수 없게 하는것으로 객체의 가장 본질적인 특징이다. (정보 은닉 뿐만 아니라 보호도 한다.)
* **상속** : 어류는 동물이다.부모클래스를 슈퍼클래스, 자식 클래스를 서브클래스(하위클래스)
* **다형성** : 다형성은 같은 이름의 메소드가 클래스 혹은 객체에 따라 다르게 동작하도록 구현되는것을 말한다. ex)크림붕어빵, 치즈붕어빵. 메소드 오버라이딩은 똑같은 speak지만 멍멍, 야옹. 메소드 오버로딩은 같은 이름의 메소드가 매개변수의 개수와 형태가 다름.

---

### 클래스 구성

p.180페이지 그림 참조!

> 생성자는 클래스의 이름과 완전 동일하게 해야 한다!!!    
> 클래스의 이름은 .java의 이름과 완전 동일하게 해야한다!!!!!!!

---

### new 연산자와 객체 생성, 그리고 레퍼런스 변수

> new는 실체(인스턴스)를 만들어내는 역할을 한다!!!!!!!!!!!!!!!    
> 참조이며 직접접근이 아니다!!!!!!!!!!!!!!!!

```java
public static void(String args[]){
  Circle pizza;   //Circle 객체에 대한 레퍼런스 변수 선언!!!
  pizza = new Circle();   // Circle 객체 생성!!!
}
```

---

##### 객체 멤버 접근

객체의 멤버에 접근할 때는 다음과 같이 레퍼런스 변수 뒤에 점(.) 연산자를 붙인다.

예를들어, 다음 코드는 pizza 객체의 radius 필드에 10을 대입한다.
```java
pizza.radius = 10;
```

pizza 객체의 radius 필드 값을 읽을 경우 다음과 같이 한다.
```java
int r = pizza.radius;
```

다음 코드는 pizza 객체의 getArea() 메소드를 호출하여 면적을 알아낸다.
```java
double area = pizza.getArea();
```

---

### 생성자

생성자는 매개변수를 다르게하여 여러개 작성 가능하다. 

##### 생성자는 여러 개 작성(오버로딩) 할 수 있다.

**매개변수**의 <u>개수</u>와 <u>타입(이름이 아니라 타입!)</u>만 다르다면, 생성자를 여러개 둘 수 있다.    
생성자는 리턴타입을 지정하지 않으며, 리턴값이 없다고해서 void를 리턴타입으로 지정하면 안된다.

```java
public class Book{
  String title;
  String author;

  public Book(String t){   //생성자
    title = t;
    author = "작자미상";
  }

  public Book(String t, string a){   //생성자
    title = t;
    author = a;
  }

  public static void main(String[] args){
    Book littlePrince = new Book("어린왕자", "생텍쥐페리");   //생성자 Book(String t, string a) 호출

    Book loveStory = new Book("춘향전");   //생성자 Book(String t) 호출

    System.out.println(littlePrice.title + " " + littlePrince.author);
    System.out.println(loveStory.title + " " + loveStory.author);
  }
}

//결과
//어린왕자 생텍쥐페리
//춘향전 작자미상
```

##### 기본 생성자
디폴트 생성자라고도 부르며 생성자가 하나도 없는 경우 컴파일러는 기본 생성자를 자동으로 생성한다.

---

### this 레퍼런스

this는 현재 객체 자신에 대한 레퍼런스이다.

##### this()로 다른 생성자 호출

()는 무조건 생성자!!!!!!!     
this()는 클래스 내에 생성자가 <u>다른 생성자를 호출</u>할 때 사용하는 자바 코드이다.

```java
public class Book{
  String title;
  String author;

  void show(){
    System.out.println(title + " " + author);
  }

  public Book(){
    this("","");
    System.out.println("생성자 호출됨");
  }

  public Book(String title){
    this(title, "작자미상"); //2. this 생성자 호출하여 아래거 호출
  }

  public Book(String title, string author){ //3? 위에거가 이걸 호출한다
    this.title = title;
    this.author = author;
  }

  public static void main(String[] args){
    Book littlePrince = new Book("어린왕자", "생텍쥐페리");
    Book loveStory = new Book("춘향전");  //1. Book(String title) 호출.
    Book emptyBook = new Book();

    loveStory.show();
  }
}

//결과
//생성자 호출됨
//춘향전 작자미상
```

##### this 사용 시 주의할 점

* this()는 반드시 생성자 코드에서만 호출할 수 있다.
* this()는 반드시 같은 클래스 내 다른 생성자를 호출할 때 사용된다.
* this()는 반드시 생성자의 첫 번째 문장이 되어야 한다.

---


### 메소드 형식

아래를 메소드 코드라고 부름

**public**(접근지정자) **int**(리턴 타입) **getSum**(메소드이름)**(int i, int j)**(메소드 인자들){    
    int sum;    
    sum = i + j;     
    return sum;    
}

매개변수가 없으면 return타입 void

* 매개변수는 주소값을 넘겨주므로 바꿀경우 값이 바뀐다!(포인터처럼)
* value는 복사(기본타입)
* reference는 참조

```java
public class ArrayPassingExP{
    static void replaceScape(char a[]){
        for(int i = 0; i <a.length; i++){
            if(a[i] ==  ' '){
                a[i] = ',';
            }
        }
    }

    static void printCharArray(char a[]){
        for(int i = 0; i <a.length; i++){
            System.out.print(a[i]);
        }
        System.out.println();
    }

    public static void main(String argsp[]){
        char c[] = {'T','h','i','s','','i','s','','a','','p','e','n','c','i','l','.'};
        printCharArray(c);
        replaceSpace(c);
        printCharArray(c);
    }
}

//결과
//This is a pencil.
//This,is,a,pencil.
```

> 배열을 메인에서 만들었는데,
> replaceSpace 함수를 만나고 매개변수가 레퍼런스타입이라(배열),
> 메인함수의 값에 영향이 미친다!!!

---

### 메소드 오버로딩

매개변수의 개수가 달라야 한다.
반환형은 큰 의미 없음. <u>이름과 매개변수만 중요!!!</u>

---

### 객체의 소멸

malloc은 free로 내가 해제 가능.
자바는 내가 해제 x

##### 가비지

참조하는 레퍼런스가 하나도 없는 객체나 배열을 가비지로 판단한다.

##### 가비지 컬렉션

어떤 컨디션에서 작동하는지는 모르니 너무 신뢰하지마라. 항시작동x

##### 가비지 컬렉션 강제요청

```java
System.gc(); //가비지 컬렉션 강제 요청
```

너무 믿지는 말고.. 조건이 안맞으면 안돈다. 적절한 구석에 넣기는 하지만 맹신x

---

### 패키지

폴더와 같은 개념.

---

### 클래스 접근 지정

##### public 클래스

패키지에 상관 없이 다른 어떤 클래스에게도 사용이 허용된다.

##### 디폴트 클래스(접근 지정자 생략)

같은 패키지 내의 클래스에만 사용이 허용된다.

---

### 멤버 접근 지정

##### public 멤버

모든 클래스들이 접근 가능하다.

##### private 멤버
 
클래스 내의 멤버들에게만 접근 허용된다.   
멤버 자체는 private로 막아서 쓰는걸 권장!!   
오입력 방지하기 위해..(한글 입력인데 영문 입력 할 때라던지..)   
get, set으로 받아서 쓴다

##### protected 멤버

1. 같은 패키지의 모든 클래스에 접근이 허용된다.   
2. 자식 클래스의 경우 접근이 허용된다.   

##### 디폴트 멤버

동일한 패키지내에 있는 클래스들만 접근 가능하다.  

---

##### static 멤버

c에서는 static 함수가 종료되도 값이 살아있음.

##### static 멤버의 선언

인스턴스 생성 안해주고 클래스(.)으로 바로 사용 가능하다   
공유자원된다.

* static 메소드는 static 멤버만 접근할 수 있다.
* 일반 메소드는 static 접근에 대해 자유롭다.
* static 메소드는 this(자기 자신. 즉 인스턴스)를 사용할 수 없다.

|   | non-static 멤버  | static 멤버  |
|---|---|---|
| 선언  | class Smaple{ <br /> int n; <br /> void g(){...}<br />}  |  class Sample{ <br /> static int m; //멤버<br /> static void g(){...} //메소드<br />} |
| 시간적 특성  | 인스턴스 선언 전에는 사용x  | 프로그램이 시작될 때 생성.  |
|   | 소유주가 인스턴스 <br />  (person p = new person(); 이게 인스턴스 생성) | 소유주 자체가 클래스  |
|   | 인스턴스 생성하고 인스턴스 공간에 저장된다  | 클래스가 저장되는 공간에 저장된다  |

static 사용하는 이유는!
같은 작업인데 매번 인스턴스를 만들면 낭비. 
내정보를 불러오는 경우도(로그인, 마이페이지 등) static을 적절하게 사용.

---

### final 클래스

* final 메소드를 선언하면 오버라이딩 할 수 없다. 무조건 상속받아 사용할 수 있음.
* final 필드(=멤버)를 선언하면 필드는 상수가 된다.

---

### p.241~247 실습문제

**1** 
자바 클래스를 작성하는 연습을 해보자. 다음 main() 메소드를 실행하였을 때 예시와 같이 출력되도록 TV 클래스를 작성하라.

```java
public static void main(String[] args){
    Tv myTV = new TV("LG", 2017, 32);
    myTV().show();
}

//LG에서 만든 2017년형 32인치 TV
```

```java
public class TV{
	private String i;
	private int j;
	private int k;
	
	TV(String i, int j, int k) {
		this.i = i;
		this.j = j;
		this.k = k;
	}
	
	void show() {
		System.out.println(i + "에서 만든 " + j + "년형 " + k + "인치 TV");
	}
	
	public static void main(String[] args){
	    TV myTV = new TV("LG", 2017, 32);
	    myTV.show();
	}
}
```

**2**
Grade 클래스를 작성해보자. 3과목의 점수를 입력받아 Grade 객체를 생성하고 성적 평균을 출력하는 main( )과 실행 예시는 다음과 같다.

```java
public static void main(String[] args) {
    Scanner scaner = new Scanner(System.in);
    
    System.out.print("수학, 과학, 영어 순으로 3개의 점수 입력>>");
    int math=scan.nextInt();
    int science=scan.nextInt();
    int english=scan.nextInt();
    Grade me = new Grade(math,science,english);
    System.out.println("평균은 "+me.average()); //average()는 평균을 계산하여 리턴
    
    scanner.close();
}
```

```java
import java.util.Scanner;

public class Grade {
	private int math;
	private int science;
	private int english;
	
	Grade(int math, int science, int english){
		this.math = math;
		this.science = science;
		this.english = english;
	}
	
	int average() {
		int avg = (this.math + this.science + this.english) / 3;
		return avg;
	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("수학, 과학, 영어 순으로 3개의 점수 입력 >> ");
		int math = scanner.nextInt();
		int science = scanner.nextInt();
		int english = scanner.nextInt();
		
		Grade me = new Grade(math, science, english);
		System.out.println("평균은 " + me.average());
		
		scanner.close();
	}
}
```

**3**
노래 한 곡을 나타내는 Song 클래스를 작성하라. Song은 다음 필드로 구성된다.

* 노래의 제목을 나타내는 title
* 가수를 나타내는 artist
* 노래가 발표된 연도를 나타내는 year
* 국적을 나타내는 country

또한 Song 클래스에 다음 생성자와 메소드를 작성하라.

* 성자 2개: 기본 생성자와 매개변수로 모든 필드를 초기화하는 생성자
* 노래 정보를 출력하는 show( ) 메소드
* main( ) 메소드에서는 1978년, 스웨덴 국적의 ABBA가 부른 "Dancing Queen"을 Song 객체로 생성하고 show()를 이용하여 노래의 정보를 다음과 같이 출력하라.

출력 -> 1978년 스웨덴 국적의 ABBa가 부른 Dancing Queen

```java
public class Song {

	private String title;
	private String artist;
	private int year;
	private String country;
	
	Song(int year, String country, String artist, String title){
		this.title = title;
		this.artist = artist;
		this.year = year;
		this.country = country;
	}
	
	void show() {
		System.out.println(year + "년 " + country + "국적의 " + artist + "가 부른 " + title);
	}
	
	public static void main(String[] args) {
		
		Song song = new Song(1987, "스웨덴", "ABBA", "Dancing Queen");
		song.show();
	}
}
```

**4**
다음 멤버를 가지고 직사각형을 표현하는 Rectangle 클래스를 작성하라.

* int 타입의 x, y, width, height 필드: 사각형을 구성하는 점과 크기 정보
* x, y, width, height 값을 매개변수로 받아 필드를 초기화하는 생성자
* int square( ): 사각형 넓이 리턴
* void show( ): 사각형의 좌표와 넓이를 화면에 출력
* boolean contains(Rectangle r): 매개변수로 받은 r이 현 사각형 안에 있으면 true 리턴
* main( ) 메소드의 코드와 실행 결과는 다음과 같다.

```java
public static void main(String[] args) {
    Rectangle r=new Rectangle(2,2,8,7);
    Rectangle s=new Rectangle(5,5,6,6);
    Rectangle t=new Rectangle(1,1,10,10);
    
    r.show();
    System.out.println("s의 면적은 "+s.square());
    if(t.contains(r))
        System.out.println("t는 r을 포함합니다.");
    if(t.contains(s))
        System.out.println("t는 s를 포함합니다.");
}
```

출력 -> (2,2)에서 크기가 8x7인 사각형    
s의 면적은 36    
t는 r을 포함합니다.    

```java
public class Rectangle {
	private int x;
	private int y;
	private int width;
	private int height;
	
	Rectangle(int x, int y, int width, int height){
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	
	int square() {
		int value = this.width * this.height;
		return value;
	}
	
	void show() {
		System.out.println("(" + x + "," + y + ") 에서 크기가 " + width + "x" + height + "인 사각형");
	}
	
	boolean contains(Rectangle r) {
		if( (this.x+this.width > r.x+r.width) && (this.y+this.height > r.y+r.height) ) {
			return true;
		}else {
			return false;
		}
	}
	
	public static void main(String[] args) {
		Rectangle r=new Rectangle(2,2,8,7);
		Rectangle s=new Rectangle(5,5,6,6);
		Rectangle t=new Rectangle(1,1,10,10);
		
		r.show();
		System.out.println("s의 면적은 "+s.square());
		if(t.contains(r))
			System.out.println("t는 r을 포함합니다.");
		if(t.contains(s))
			System.out.println("t는 s를 포함합니다.");
	}
}
```

**5**
다음 설명대로 Circle 클래스와 CircleManager 클래스를 완성하라.

```java
import java.util.Scanner;

class Circle {
	private double x,y;
	private int radius;
	public Circle (double x,double y,int radius) {
		___________________________________; // x, y, radius 초기화
	}
	public void show() {
    	___________________________________; 
	}
}
public class CircleManager {
	public static void main(String[] args) {
		Scanner scanner = ____________________;
		Circle c [] = _______________; // 3개의 Circle 배열 선언
		for(int i=0;i<__________;i++) {
			System.out.print("x, y radius >>");
			_____________________________; // x 값이 읽기
			_____________________________; // y 값이 읽기
			_________________________; // 반지름 읽기
			c[i] = __________________________; // Circle 객체 생성
		}
		for(int i=0;i<c.length;i++) _______________________; // 모든 Circle 객체 출력
		scanner.close();
	}
}
```

출력 -> x, y radius >>3.0 3.0 5    
x, y radius >>2.5 2.7 6    
x, y radius >>5.0 2.0 4    
(3.0,3.0)5    
(2.5,2.7)6    
(5.0,2.0)4    

```java
import java.util.Scanner;

class Circle {
	private double x,y;
	private int radius;
	public Circle (double x,double y,int radius) {
		this.x=x;
		this.y=y;
		this.radius=radius;
	}
	public void show() {
		System.out.println("("+x+","+y+")"+radius);
	}
}

public class CircleManager {

	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		Circle c[]=new Circle[3];
		for(int i=0;i<c.length;i++) {
			System.out.print("x, y radius >>");
			double x=scanner.nextDouble();
			double y=scanner.nextDouble();
			int radius=scanner.nextInt();
			c[i]=new Circle(x,y,radius);
		}
		for(int i=0;i<c.length;i++)
			c[i].show();
		scanner.close();
	}

}
```

**6**
앞의 5번 문제는 정답이 공개되어 있다. 이 정답을 참고하여 Circle 클래스와 CircleManager 클래스를 수정하여 다음 실행 결과처럼 되게 하라.

출력 -> x, y radius >>3.0 3.0 5    
x, y radius >>2.5 2.7 6    
x, y radius >>5.0 2.0 4    
가장 면적이 큰 원은 (2.5,2.7)6   

```java
import java.util.Scanner;

class Circle {
	private double x,y;
	private int radius;
	public Circle (double x,double y,int radius) {
		this.x = x; // x, y, radius 초기화
		this.y = y;
		this.radius = radius;
	}
	public void show() {
		System.out.println("가장 면적이 큰 원은 (" + x + "," + y + ")" + radius);
	}
	public int getRadius() {
		return radius;
	}
}
public class CircleManager {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Circle c [] = new Circle[3]; // 3개의 Circle 배열 선언
		int max = 0;
		for(int i=0;i<c.length;i++) {
			System.out.print("x, y radius >>");
			double x = scanner.nextDouble(); // x 값이 읽기
			double y = scanner.nextDouble(); // y 값이 읽기
			int radius = scanner.nextInt(); // 반지름 읽기
			c[i] = new Circle(x, y, radius); // Circle 객체 생성
		}
		
		for(int i=0; i<c.length; i++) {
			if(max < c[i].getRadius()) {
				max = c[i].getRadius();
			}
		}
		for(int i=0; i<c.length; i++) {
			if(max == c[i].getRadius()) {
				c[i].show();
			}
		}
		
		scanner.close();
	}
}
```

**7**
하루의 할 일을 표현하는 클래스 Day는 다음과 같다. 한 달의 할 일을 표현하는 MonthSchedule 클래스를 작성하라.

```java
class Day {
	private String work; // 하루의 할 일을 나타내는 문자열
	public void set(String work) { this.work=work; }
	public String get() { return work; }
	public void show() {
		if (work==null) System.out.println("없습니다.");
		else System.out.println(work+"입니다.");
	}
}
```

MonthSchedule 클래스에는 Day 객체 배열과 적절한 필드, 메소드를 작성하고 실행 예시처럼 입력, 보기, 끝내기 등의 3개의 기능을 작성하라. 

--출력--    
이번달 스케쥴 관리 프로그램.    
할일(입력:1, 보기:2, 끝내기:3) >>1    
날짜(1~30)?1    
할일(빈칸없이입력)?자바공부    
    
할일(입력:1, 보기:2, 끝내기:3) >>2    
날짜(1~30)?1    
1일의 할 일은 자바공부입니다.    
    
할일(입력:1, 보기:2, 끝내기:3) >>3    
프로그램을 종료합니다.    

```java
import java.util.Scanner;

class Day {
	private String work; // 하루의 할 일을 나타내는 문자열
	public void set(String work) { 
		this.work=work; 
	}
	public String get() { 
		return work; 
	}
	public void show() {
		if (work==null) {
			System.out.println("없습니다.");
		}else {
			System.out.println(work+"입니다.");	
		}
	}
}

public class MonthSchedule {
	
	Scanner scanner = new Scanner(System.in);
	Day d[];
	
	public MonthSchedule(int day) {
		d = new Day[day];
		for(int i=0; i<day; i++) {
			d[i] = new Day();
		}
	}
	
	void input (Day d[], int day, String work) {
		d[day].set(work);
	}
	
	void view (Day d[], int day) {
		System.out.println(day + "의 할 일은 ");
		d[day].show();
	}
	
	int finish() {
		System.out.println("프로그램을 종료합니다.");
		return 0;	
	}
	
	void run() {
		int t=1;
		int option;
		int day;
		String work;
		System.out.println("이번달 스케줄 관리 프로그램");
		
		while(t==1) {
			System.out.println("할일(입력:1, 보기:2, 끝내기:3)");
			option = scanner.nextInt();
			switch(option) {
				case 1 :
					System.out.println("날짜(1~30)?");
					day = scanner.nextInt();
					System.out.println("할일(빈칸없이 입력)?");
					work = scanner.next();
					this.input(this.d, day, work);
					System.out.println();
					break;
				case 2 :
					System.out.println("날짜?(1~30)?");
					day = scanner.nextInt();
					this.view(this.d, day);
					System.out.println();
					break;
				case 3 :
					t=this.finish();
					break;
			}
		}
	}
	
	public static void main(String[] args) {
		MonthSchedule april = new MonthSchedule(30);
		april.run();
		
	}
}
```

**8**
이름(name), 전화번호(tel) 필드와 생성자 등을 가진 Phone 클래스를 작성하고, 실행 예시와 같이 작동하는 PhoneBook 클래스를 작성하라.

```java
--출력--
인원수>>3
이름과 전화번호(이름과 번호는 빈 칸없이 입력)>>황기태 777-7777
이름과 전화번호(이름과 번호는 빈 칸없이 입력)>>나명품 999-9999
이름과 전화번호(이름과 번호는 빈 칸없이 입력)>>최자바 333-1234
저장되었습니다...
검색할 이름>>황기순
황기순 이 없습니다.
검색할 이름>>최자바
최자바의 번호는 333-1234 입니다.
검색할 이름>>그만
```

```java
import java.util.Scanner;

class Phone {
   private String name;
   private String tel;
   Phone(String name, String tel) {
      this.name = name;
      this.tel = tel;
   }
   public String getName() {
      return name;
   }
   public String getTel() {
      return tel;
   }
}

public class PhoneBook {
   
   public static void main(String[] args) {
      Scanner sc = new Scanner(System.in);
      Phone phone[];
      int i;
      System.out.print("인원수 >> ");
      int num = sc.nextInt();
      phone = new Phone[num];
      for(i=0; i<phone.length; i++) {
         System.out.print("이름과 전화번호(이름과 번호는 빈 칸없이 입력)>>");
         String name = sc.next();
         String tel = sc.next();
         phone[i] = new Phone(name, tel);
      }
      System.out.println("저장되었습니다...");
      while(true) {
         System.out.print("검색할 이름 >>");
         String name = sc.next();
         for(i=0; i<num; i++) {
            if(name.equals(phone[i].getName())) {
               System.out.println(name+"의 번호는 "+phone[i].getTel()+" 입니다.");
               i--;
               break;
            }
         }
         if(name.equals("그만")) break;
         if (i == num) System.out.println(name+"이 없습니다.");
      }
      
      sc.close();
   }

}
```

**9**
다음 2개의 static 가진 ArrayUtil 클래스를 만들어보자. 다음 코드의 실행 결과를 참고하여 concat( )와 print( )를 작성하여 ArrayUtil 클래스를 완성하라.

```java
class ArrayUtil {	
	public static int [] concat(int[] a, int[] b) {
		/* 배열 a와 b를 연결한 새로운 배열 리턴*/
	}
	public static void print(int[] a) { /* 배열 a 출력 */ }
}
public class StaticEx {
	public static void main(String[] args) {
		int [] array1 = { 1, 5, 7, 9 };
		int [] array2 = { 3, 6, -1, 100, 77 };
		int [] array3 = ArrayUtil.concat(array1,  array2);
		ArrayUtil.print(array3);
	}
}

--출력--
[ 1 5 7 9 3 6 -1 100 77 ]
```

```java
class ArrayUtil {	
	static int[] c;
	
	public static int [] concat(int[] a, int[] b) {
		c = new int[a.length+b.length];
		int i;
		for(i=0; i<a.length; i++) {
			c[i] = a[i];
		}
		for(i=0; i<b.length; i++) {
			c[i+a.length] = b[i];
		}
		return c;
	}
	public static void print(int[] a) { /* 배열 a 출력 */
		System.out.print("[");
		for(int i=0; i<a.length; i++) {
			System.out.print(a[i] + " ");
		}
		System.out.print("]");
	}
}
public class StaticEx {
	public static void main(String[] args) {
		int [] array1 = { 1, 5, 7, 9 };
		int [] array2 = { 3, 6, -1, 100, 77 };
		int [] array3 = ArrayUtil.concat(array1,  array2);
		ArrayUtil.print(array3);
	}
}
```

**10**
다음과 같은 Dictionary 클래스가 있다. 실행 결과와 같이 작동하도록 Dictionary 클래스의 kor2Eng( ) 메소드와 DicApp 클래스를 작성하라.

```java
class Dictionary {
	private static String [] kor = { "사랑", "아기", "돈", "미래", "희망" };
	private static String [] eng = { "love", "baby", "money", "future", "hope" };
	public static String kor2Eng(String word) { /* 검색 코드 작성 */
}

--출력--
한영 단어 검색 프로그램입니다.
한글 단어?희망
희망은 hope
한글 단어?아가
아가는 저의 사전에 없습니다.
한글 단어?아기
아기은 baby
한글 단어?그만
```

```java
import java.util.Scanner;

public class Dictionary {
	private static String[] kor = {"사랑","아기","돈","미래","희망"};
	private static String[] eng = {"love","baby","money","future","hope"};
	
	public static String kor2Eng(String word) { /* 검색 코드 작성 */
		int i;
		
		for(i=0; i<kor.length; i++) {
			if(kor[i].equals(word)) {
				System.out.println(word + "은 " + eng[i]);
				break;
			}
		}
		
		if (i == kor.length) {
			System.out.println(word + "는 저의 사전에 없습니다.");
		}
		
		return word;
		
	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("한영 단어 검색 프로그램입니다.");
		while(true) {
			System.out.print("한글 단어? ");
			String han = scanner.next();
			if(han.equals("그만")) {
				break;
			}
			kor2Eng(han); 
		}
		
		scanner.close();
	}

}
```

**11**
다수의 클래스를 만들고 활용하는 연습을 해보자. 더하기(+), 빼기(-), 곱하기(*), 나누기(/)를 수행하는 각 클래스 Add, Sub, Mul, Div를 만들어라. 이들은 모두 다음 필드와 메소드를 가진다.

* int 타입의 a, b 필드: 2개의 피연산자
* void setValue(int a, int b): 피연산자 값을 객체 내에 저장한다.
* int calculate( ): 클래스의 목적에 맞는 연산을 실행하고 결과를 리턴한다.

main( ) 메소드에서는 다음 실행 사례와 같이 두 정수와 연산자를 입력받고 Add, Sub, Mul, Div 중에서 이 연산을 실행할 수 있는 객체를 생성하고 setValue( )와 calculate( )를 호출하여 결과를 출력하도록 작성하라. (참고: 이 문제는 상속을 이용하여 다시 작성하도록 5장의 실습 문제로 이어진다.)

```java
--출력--
두 정수와 연산자를 입력하시오>>5 7 *
35
```

```java
import java.util.Scanner;

class Add {
	private int a;
	private int b;
	void setValue(int a, int b) {
		this.a = a;
		this.b = b;
	}
	int calculate() {
		int cal = this.a + this.b;
		return cal;
	}
}

class Sub {
	private int a;
	private int b;
	void setValue(int a, int b) {
		this.a = a;
		this.b = b;
	}
	int calculate() {
		int cal = this.a - this.b;
		return cal;
	}
}

class Mul {
	private int a;
	private int b;
	void setValue(int a, int b) {
		this.a = a;
		this.b = b;
	}
	int calculate() {
		int cal = this.a * this.b;
		return cal;
	}
}

class Div {
	private int a;
	private int b;
	void setValue(int a, int b) {
		this.a = a;
		this.b = b;
	}
	int calculate() {
		int cal = this.a / this.b;
		return cal;
	}
}

public class Calculate {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("두 정수와 연산자를 입력하시오 >> ");
		int a = scanner.nextInt();
		int b = scanner.nextInt();
		String value = scanner.next();
		
		switch(value) {
			case "+" : 
				Add add = new Add();
				add.setValue(a, b);
				System.out.println(add.calculate());
				break;
			case "-" : 
				Sub sub = new Sub();
				sub.setValue(a, b);
				System.out.println(sub.calculate());
				break;
			case "*" : 
				Mul mul = new Mul();
				mul.setValue(a, b);
				System.out.println(mul.calculate());
				break;
			case "/" : 
				Div div = new Div();
				div.setValue(a, b);
				System.out.println(div.calculate());
				break;
		}

        scanner.close();
	}
}
```

**12**
간단한 콘서트 예약 시스템을 만들어보자. 다수의 클래스를 다루고 객체의 배열을 다루기에는 아직 자바 프로그램 개발이 익숙하지 않은 초보자에게 다소 무리가 있을 것이다. 그러나 반드시 넘어야 할 산이다. 이 도전을 통해 산을 넘어갈 수 있는 체력을 키워보자. 예약 시스템의 기능은 다음과 같다.

* 공연은 하루에 한 번 있다.
* 좌석은 S석, A석, B석으로 나뉘며, 각각 10개의 좌석이 있다.
* 예약 시스템의 메뉴는 "예약", "조회", "취소", "끝내기"가 있다.
* 예약은 한 자리만 가능하고, 좌석 타입, 예약자 이름, 좌석 번호를 순서대로 입력받아 예약한다.
* 조회는 모든 좌석을 출력한다.
* 취소는 예약자의 이름을 입력받아 취소한다.
* 없는 이름, 없는 번호, 없는 메뉴, 잘못된 취소 등에 대해서 오류 메시지를 출력하고 사용자가 다시 시도하도록 한다.

```java
--출력--
명품콘서트홀 예약 시스템입니다.
예약:1. 조회:2, 취소:3, 끝내기:4>>1
좌석구분 S(1), A(2), B(3)>>1
S>> --- --- --- --- --- --- --- --- --- ---
이름>>황기태
번호>>1
예약:1. 조회:2, 취소:3, 끝내기:4>>1
좌석구분 S(1), A(2), B(3)>>2
A>> --- --- --- --- --- --- --- --- --- ---
이름>>김효수
번호>>5
예약:1. 조회:2, 취소:3, 끝내기:4>>2
S>> --- 황기태 --- --- --- --- --- --- --- ---
A>> --- --- --- --- --- 김효수 --- --- --- ---
B>> --- --- --- --- --- --- --- --- --- ---
<<조회를 완료하였습니다>>
예약:1. 조회:2, 취소:3, 끝내기:4>>3
좌석 S:1, A:2, B:3>>2
A>> --- --- --- --- --- 김효수 --- --- --- ---
이름>>김효수
예약:1. 조회:2, 취소:3, 끝내기:4>>2
S>> --- 황기태 --- --- --- --- --- --- --- ---
A>> --- --- --- --- --- --- --- --- --- ---
B>> --- --- --- --- --- --- --- --- --- ---
<<조회를 완료하였습니다>>
예약:1. 조회:2, 취소:3, 끝내기:4>>4
```

```java
import java.util.Scanner;

class Concert{
	private String S[];
	private String A[];
	private String B[];
	private Scanner scanner;
	
	Concert(){
		scanner = new Scanner(System.in);
		S = new String[10];
		A = new String[10];
		B = new String[10];
		for(int i=0; i<S.length; i++) {
			S[i] = "---";
			A[i] = "---";
			B[i] = "---";
		}
	}
	
	public static void printSeat(String seat[]) { //좌석 한줄 출력 메소드
		for(int i=0; i<seat.length; i++) {
			System.out.print(" " + seat[i] + " ");
		}
		System.out.println();
	}
	
	public void allPrint() { //모든 좌석 출력 메소드
		System.out.print("S >> ");
		Concert.printSeat(S);
		System.out.print("A >> ");
		Concert.printSeat(A);
		System.out.print("B >> ");
		Concert.printSeat(B);
		System.out.println("<<조회를 완료하였습니다.>>");
	}
	
	public void choiceSeat() { //좌석 선택(S, A, B) 메소드
		while(true) {
			System.out.print("좌석 구분 S(1), A(2), B(3) >> ");
			int select = scanner.nextInt();
			switch(select) {
				case 1 :
					System.out.print("S >> ");
					printSeat(S);
					inputSeat(S);
					return;
				case 2 :
					System.out.print("A >> ");
					printSeat(A);
					inputSeat(A);
					return;
				case 3 :
					System.out.print("B >> ");
					printSeat(B);
					inputSeat(B);
					return;
				default : 
					System.out.println("다시 입력 해주세요.");
			}
		}
	}
	
	public void inputSeat(String seat[]) { //좌석에 이름값 넣는 메소드
		System.out.print("이름 >> ");
		String name = scanner.next();
		while(true) {
			System.out.print("번호 >> ");
			int num = scanner.nextInt();
			num--;
			if(seat[num].equals("---")) {
				seat[num] = name;
				break;
			}else {
				System.out.println("다른 좌석을 선택해 주세요");
			}
		}
	}
	
	public void d_chiceSeat() {
		while(true) {
			System.out.print("좌석 S:1, A:2, B:3 >>");
			int select = scanner.nextInt();
			switch(select) {
				case 1 :
					System.out.print("S >> ");
					printSeat(S);
					delete(S);
					return;
				case 2 :
					System.out.print("A >> ");
					printSeat(A);
					delete(A);
					return;
				case 3 :
					System.out.print("B >> ");
					printSeat(B);
					delete(B);
					return;
				default : 
					System.out.println("다시 입력해 주세요");
			}
		}
	}
	
	public void delete(String seat[]) {
		System.out.print("이름 >> ");
		String name = scanner.next();
		for(int i=0; i<seat.length; i++) {
			if(name.equals(seat[i])) {
				seat[i] = "---";
				break;
			}
		}
	}
}

public class JavaEx {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("명품콘서트홀 예약 시스템입니다.");
		Concert concert = new Concert();
		
		while(true) {
			System.out.print("예약:1, 조회:2, 취소:3, 끝내기:4 >> ");
			int select = scanner.nextInt();
			switch(select) {
				case 1 :
					concert.choiceSeat();
					break;
				case 2 :
					concert.allPrint();
					break;
				case 3 :
					concert.d_chiceSeat();
					break;
				case 4 : 
					scanner.close();
					return;
				default :
					System.out.println("다시 입력해 주세요.");
			}
		}
	}
}

```
