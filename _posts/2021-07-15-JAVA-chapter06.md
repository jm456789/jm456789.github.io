---
layout: post

title: "JAVA Chapter06 모듈과 패키지 개념, 자바 기본 패키지 - ==연산자 / boolean equals / Wrapper 클래스 / 문자열을 기본 타입으로 변환 / 기본 타입 값을 문자열로 변환 / 박싱(boxing)과 언박싱(unboxing) / String의 특징과 객체 생상 / 스트링 리터럴과 new String() / String 활용 / StringBuffer 클래스 / StringTokenizer 클래스 / Math 클래스 / Calendar 클래스"
excerpt: "==연산자 / boolean equals / Wrapper 클래스 / 문자열을 기본 타입으로 변환 / 기본 타입 값을 문자열로 변환 / 박싱(boxing)과 언박싱(unboxing) / String의 특징과 객체 생상 / 스트링 리터럴과 new String() / String 활용 / StringBuffer 클래스 / StringTokenizer 클래스 / Math 클래스 / Calendar 클래스"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 6. 모듈과 패키지, 자바 기본 패키지

다른 패키지에 있으면 각 패키지 안 클래스 이름 같아도 상관 없음.
다른 패키지에 있는 클래스를 쓰고싶으면 import해서 씀

---

##### Object 클래스

모든 클레스에 강제로 상속된다!!
최상위 클래스이다!!

---

### 객체를 문자열로 변환, toString() 메소드

쓰기 힘듬..

---

### 객체 비교와 equals() 메소드

### ==연산자

```java
Point a = new Pint(2,3);
Point b = new Pint(2,3);
Point c = a;

if(a == b){
	System.out.println("a==b");
}

if(a == c){
	System.out.println("a==c");
}

//이 코드의 실행 결과는
// a==c
```

실수 많은 부분. 조심해야 함.      
프리미티브타입(기본타입) 비교할 때 사용      
reference 타입은 이렇게 비교하면 안된다!!!!!!!!!!!!!!!!!!!       
reference가 같은 공간을 바라보냐라고 비교! ==         

### boolean equals

```java
String a = new String("Hello");
String b = new String("Hello");

if(a == b){
	System.out.println("a==b");
}
if(a.equals(b)){
	System.out.println("a와 b는 둘 다 Hello입니다.");
}

//실행결과
//a와 b는 둘 다 Hello입니다.
```

값을 비교할때는 equals를 사용해야 함        
reference 비교시          
equals는 hash 값을 비교함

---

> 일반 클래스에서 equal은 hash값을 가지고 비교한다
> 근데 string은 hash값이 아닌 값 비교

```java
public class GoodCalc{
	
	public static void main(String[] args) {
		String a = new String("this is a pencil");
		String b = new String("this is a pencil");
		String c = a;
		
		if(a == b) {
			System.out.println("a == b");
		}
		if(a == c) {
			System.out.println("a == c");
		}
		if(a.equals(b)) {
			System.out.println("a is equals to b");
		}
		if(a.equals(c)) {
			System.out.println("a is equals to c");
		}
		
		
	}
}

//결과
//a == c
//a is equals to b
//a is equals to c
```

---



### Wrapper 클래스

Byte, Short, Integerm Long, Character, Double, Float, Boolean 클래스가 기본 타입에 해당되는 값을 객체로 다룰 수 있게 하는 wrapper 클래스이다. <u>기본 타입의 값을 객체</u>로 만들어 사용할 수 있도록 Wrapper 클래스를 제공한다.     
(일반타입을 wrapper로 한번 감싸줌. 일반 타입을 레퍼런스 타입으로 쓸 때!)

| 기본타입  | Wrapper 클래스  |
|---|---|
| byte  | Byte  |
| short  | Short  |
| int  | Integer  |
| long  | Long  |
| char  | Character  |
| float  | Float  |
| double  | Double  |
| boolean  | Boolean  |

##### Wrapper 클래스의 객체 생성

Wrapper 객체는 기본 타입의 값을 인자로 하여 다음 예와 같이 정적 메소드인 valueOf()를 호출하여 생성한다.

```java
Interger i = Integer.valueOf(10);  //정수 10의 객체화
Character c = Character.valueOf('c');  //문자 'c'의 객체화
Double d = Double.valueOf(3.14);
Boolean b = Boolean.valueOf(true);

//-character를 제외한 나머지 wrapper 클래스의 경우 문자열로 wrapper 객체 생성 가능--------------------------------------------------

Integer i = Integer.valueOf("10");
Double d = Double.valueOf("3.14");
```

### Wrapper 클래스의 활용

wrapper클래스는 많은 메소드를 제공하나, 대부분은 기본 타입 값을 문자열로 변환하거나, 문자열을 기본 타입 값으로 변환하는 것들이 주를 이루고 있다. 가장 많이 사용되는 Integer 클래스의 주요 메소드는 아래의 표와 같으며, 많은 메소드가 <u>static 타입</u>이다.

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_1.jpg?raw=true)

value나 parseInt가 중요? 눈여겨봐야 할 것.

value는 레퍼런스를 하나 만듬. parseInt는 단순 변환만 해줌..

---

### Wrapper 객체에 들어 있는 기본 타입 값 알아내기

```java
Integer i = Integer.valueOf(10);
int ii = i.intValue(); // ii = 10

Double d = Double.valueOf(3.14);
double dd = d.doubleValue(); //dd = 3.14

Boolean b = Boolean.valueOf(true);
boolean bb = b.booleanValue(); // bb = true
```

---

### 문자열을 기본 타입으로 변환

```java
int i = Intefer.parseInt("123"); // i = 123
boolean b = Boolean.parseBoolean("true");  // b = true
double d = Double.parseDouble("3.14");  //d = 3.14
```

parseInt(), parseBoolean(), parseDouble() 메소드는 모두 <u>static 타입</u>이므로 <u>Wrapper 클래스의 이름으로 바로 메소드를 호출</u>한다.   
Wrapper 클래스는 해당 타입으로 변환하는 메소드만을 제공한다. 예를들어 Integer 클래스는 parseBoolean()이나 parseDouble()은 제공하지 않는다.

---

### 기본 타입 값을 문자열로 변환

```java
String s1 = Intefer.toString(123); // 정수 123을 문자열 "123"으로 변환
String s2 = Intefer.toHexString(123); // 정수 123을 16진수의 문자열 "7b"로 변환
String s3 = Double.toString(3.14); // 실수 3.14를 문자열 "3.14"로 변환
String s4 = Character.toString('a'); // 문자 'a'를 문자열 "a"로 변환
String s5 = Boolean.toString(true); // 불린 값 true를 문자열 "true"로 변환
```

---

예제 6-5)
다음은 Wrapper 클래스를 활용하는 예이다. 다음 프로그램의 결과는 무엇인가?

```java
public class WrapperEx {

	public static void main(String[] args) {
		System.out.println(Character.toLowerCase('A'));  //'A'를 소문자로 변환
		
		char c1 = '4', c2 = 'F';
		if(Character.isDigit(c1)) { //문자 c1이 숫자이면 true
			System.out.println(c1 + "는 숫자");
		}
		if(Character.isAlphabetic(c2)) { //문자 c2가 영문자이면 true
			System.out.println(c2 + "는 영문자");
		}
		
		System.out.println(Integer.parseInt("-123")); //"-123"을 10진수로 변환
		System.out.println(Integer.toHexString(28)); //정수 28을 2진수 문자열로 변환
		System.out.println(Integer.toBinaryString(28)); //28을 16진수 문자열로 변환
		System.out.println(Integer.bitCount(28)); //28에 대한 2진수의 1의 개수
		
		Double d = Double.valueOf(3.14);
		System.out.println(d.toString()); //Double을 문자열 "3.14"로 변환
		System.out.println(Double.parseDouble("3.14")); //문자열을 실수 3.14로 변환
		
		boolean b = (4>3);
		System.out.println(Boolean.toString(b)); //true를 문자열 "true"로 변환
		System.out.println(Boolean.parseBoolean("false")); //문자열을 false로 변환

	}
}

// a
// 4는 숫자
// F는 영문자
// -123
// 1c
// 11100
// 3
// 3.14
// 3.14
// true
// false

```

<u>parse는 wrapper변환이 아니라 일반 데이터 타입으로 변환!!!</u>

---

### 박싱(boxing)과 언박싱(unboxing)

<u>기본 타입의 값을 Wrapper 객체로 변환</u>하는 것을 **박싱**이라하고,     
<u>반대의 경우(wrapper 객체에 들어있는 기본 타입의 값을 빼내는 것)</u>을 **언박싱**이라고 한다.

> 박싱은
> Integer ten = Integer.valueOf(10);
> 
> 언박싱은
> int n = ten.intValue();

박싱과 언박싱은 JDK 1.5부터 자동으로 이루어지며, 이를 자동박싱과 자동 언박싱이라고 부른다.

```java
Integer ten = 10; //자동박싱. Integer ten = Integer.valueOf(10);로 자동 처리됨
int n = ten; // 자동 언박싱. int n = ten.intValue();
```

---

### String의 특징과 객체 생상

java.lang 패키지에 포함된 클래스로서 String 클래스는 <u>문자열</u>을 나타낸다. 스트링 리터럴은 자바 컴파일러에 의해 모두 String 객체로 처리된다. 
(string 클래스는 하나의 문자열 표현)

```java
//스트링 리터럴로 string 객체 생성
String str1 = "abcd";

//string 클래스의 생성자를 이용하여 string 객체 생성
char data[] = {'a','b','c','d'};
String str2 = new String(data);
String str3 = new String("abcd"); //str2와 str3은 모두 "abcd" 문자열
```

참고로 아래 표는 오버로딩

| 생성자  |  설명 |
|---|---|
| String  |  빈 스트링 객체 생성 |
| String(char[] value)  | char 배열에 있는 문자들을 스트링 객체로 생성  |
| String(String original)  | 매개변수로 주어진 문자열과 동일한 스트링 객체 생성  |
| String(StringBuffer buffer)  | 매개변수로 주어진 스트링 버퍼의 문자열을 스트링 객체로 생성  |

---

### 스트링 리터럴과 new String()

스트링 리터럴과 new String()으로 생성된 스트링 객체는 서로 다르게 관리된다. **스트링 리터럴**은 자바 내부에서 <u>리터럴 테이블</u>로 특별히 관리하여 동일한 리터럴을 공유시킨다. 하지만 **new String**으로 생성된 스트링은 new를 이용하여 생성되는 다른 객체와 동일하게 <u>힙 메모리</u>에 생성된다.

> **스트링 객체는 메모리에 자리를 잡으면 변경 안된다!!!!!!!**
> 새로운 객체를 다시 생성.

```java
String a = "Hello";
String b = "java";
String c = "Hello";
String d = new String("Hello");
String e = new String("java");
String f = new String("Hello");
```

> 생성자를 안 쓴 경우 독립적인 객체 생성 후 사용하며(a, c),    
> 생성자를 쓴 경우 독립적인 객체 생성 후 사용한다.(d, f)

---

### 스트링 객체는 수정이 불가능하다.

```java
String s = new String("Hello");
String t = s.concat("java");
//위의 코드 결과로 t는 Hellojava, s는 "Hello"를 출력한다.(s는 변경 안된다.)

//한번 만들어진 스트링은 수정이 불가능하기 때문에 새로운 스트링 객체(Hellojava)를 가리킨다.

s = s.concat("java");
//위의 코드로 해야 s는 "Hellojava"를 가리킨다.
```

> **스트링은 비교시 반드시 equals()를 사용해야 한다!!!!!!!!!!!**

---

### ★★★★★ String 활용 ★★★★★

> 굉장히 많이 쓰임!!!!!!!!!!!!!!!!!!!
> 다들 리턴임. 값을 변경하고 싶으면 s = s.trim();해서 s에 다시 저장해야 함

| 메소드  |  설명 |
|---|---|
| char charAt(int index)  | index 인덱스에 있는 문자 값 리턴  |
| int codePointAt(int index)  | index 인덱스에 있는 유니코드 값 리턴  |
| int compareTo(String anotherString)  | 두 스트링을 <u>사전</u> 순으로 비교하여 두 스트링이 같으면 <u>0</u>, 현 스트링이 anotherString 보다 먼저 나오면 <u>음수</u>, 아니면 <u>양수</u> 리턴. <br /> (같다 다르다가 아니라 크기 비교. 그러나 문자열은 비교를 못하기때문에 사전순으로 비교)  |
|  String concat(String str) | 현재 스트링 뒤에 str 스트링을 <u>덧붙인</u> 새로운 스트링 리턴 <br /> (<u>스트링은 수정 안돼서 이렇게 사용</u>)  |
| boolean contains(charSequence s)  | s에 지정된 문자들을 <u>포함</u>하고 있으면 true 리턴. <br /> (있냐 없냐만 따짐.)  |
| int length()  | 스트링의 길이(<u>문자개수</u>) 리턴  |
| String replace(Charsequence target, Charsequence replacement)  | target이 지정하는 일련의 문자들을 replacement가 지정하는 문자들로 변경한 스트링 <u>리턴</u>. <br /> (<u>target은 원본값 리턴! 바꾸는게 아니라!!</u>)  |
| String[] split(String regex)  |  정규식 regex에 일치하는 부분을 중심으로 <u>스트링을 분리</u>하고, 분리된 스트링들을 <u>배열로 저장하여 리턴</u> <br /> (기준을 가지고 잘라낼때(ex 쉼표) 잘라내면 여러개의 값이 되니 메모리에 저장 후 인덱스(0,1,2)로 접근) |
| String subString(int beginIndex)  | beginIndex 인덱스부터 <u>시작</u>하는 서브 <u>스트링 리턴</u> <br /> (원하는 위치의 문자열 뽑기)  |
| String toLowerCase()  | <u>소문자</u>로 변경한 스트링 리턴  |
| String toUpperCase()  | <u>대문자</u>로 변경한 스트링 리턴  |
| String trim()  | 스트링 <u>앞뒤의 공백 문자들을 제거</u>한 스트링 리턴  |

```java
public class StringEx {

	public static void main(String[] args) {
		String a = new String(" C#");
		String b = new String(", C++");

		System.out.println(a + "의 길이는 " + a.length()); //문자열의 길이(문자개수)
		System.out.println(a.contains("#")); //문자열의 포함 관계
		
		a = a.concat(b); //문자열 연결
		System.out.println(a);
		
		a = a.trim(); //문자열 앞 뒤의 공백 제거
		System.out.println(a);
		
		a = a.replace("C#", "Java"); //문자열 대치
		System.out.println(a);
		
		String s[] = a.split(","); //문자열 분리
		for(int i=0; i<s.length; i++) {
			System.out.println("분리된 문자열" + i + ": " + s[i]);
		}
		
		a = a.substring(5); //인덱스 5부터 끝까지 서브 스트링 리턴
		System.out.println(a);
		
		char c = a.charAt(2); //인덱스 2의 문자 리턴
		System.out.println(c);
	}
}

//  C#의 길이는 3
// true
//  C#, C++
// C#, C++
// Java, C++
// 분리된 문자열0: Java
// 분리된 문자열1:  C++
//  C++
// +

```

---

### StringBuffer 클래스

String 클래스와 같이 문자열을 다룬다. String 객체의 경우 내부의 문자열을 수정할 수 없지만, StringBuffer 객체는 문자열을 저장하는 가변 버퍼를 가지고 있기 때문에 저장된 <u>문자열의 수정이 가능</u>하다. 문자열의 크기가 늘어나면 내부 버퍼 크기를 자동 조절한다.(내용 변경 가능. 배열구조와 흡사, 스트링버퍼가 무조건 스트링보다 낫다고 할 수 없음. 계속해서 바꾸는거면 스트링을 쓰나 스트링버퍼를 쓰나 차이가 없기 때문)

```java
StringBuffer sb = new StringBuffer("java");
```

StringBuffer() -> 초기 버퍼의 크기가 16인 스트링 버퍼 객체 생성

---

### Stringbuffer의 활용. (얘도 자주쓴다고 했던거같음)

| 메소드  | 설명  |
|---|---|
| StringBuffer append(String str)  | str 스트링을 스트링 버퍼에 덧붙인다. <br /> (이어붙이기)  |
| StringBuffer append(StringBuffer sb)  | sb 스트링 버퍼를 현재의 스트링 버퍼에 덧붙인다. 이 결과 현재 스트링 버퍼의 내용이 변한다.  |
| int capacity()  | 스트링 버퍼의 현재 크기 리턴  |
| StringBuffer delete(int start, int end)  | start 위치에서 end 위치 앞까지 부분 문자열 삭제  |
| StringBuffer insert(int offset, String str)  | str 스트링을 스트링 버퍼의 offset 위치에 삽입 <br /> (중간에 값 삽입)  |
| StringBuffer replace(int start, int end, String str)  | 스트링 버퍼 내의 start 위치의 문자부터 end가 지정하는 문자 앞의 서브 스트링을 str로 대치  |
| StringBuffer reverse()  | 스트링 버퍼 내의 문자들을 반대 순서로 변경 <br /> 뒤집음  |
| void set Length(int newLength)  | 스트링 버퍼 내 문자열 길이를 newlength로 재설정, 현재 길이보다 큰 경우 널 문자('')로 채우며 작은 경우는 기존 문자열이 잘린다.  |

*표에서 start, offset, end는 스트링 버퍼 내 위치를 나타내는 정수로, 위치는 0부터 시작한다.

```java
public class StringBufferEx {

	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer("This");
		
		sb.append(" is pencil");
		System.out.println(sb);
		
		sb.insert(7, " my");
		System.out.println(sb);
		
		sb.replace(8, 10, "your");
		System.out.println(sb);
		
		sb.delete(8, 13);
		System.out.println(sb);
		
		sb.setLength(4);
		System.out.println(sb);  //알아서 toString()해줌. 참고로 반드시 toString해야 글자 꺼낼 수 있음.
	}
}

// This is pencil
// This is my pencil
// This is your pencil
// This is pencil
// This

```

---

### StringTokenizer 클래스

하나의 문자열을 <u>여러개의 문자열로 분리</u>하기 위해 사용된다. 문자열을 분리할 때 사용되는 기준 문자를 <u>구분문자</u>라고 하고, 구분 문자로 분리된 문자열을 <u>토큰</u>이라고 한다.
<u>(splite와 유사. 구분기호를 이용해서 끊어준다. 둘중에 편한거 쓰면 된다.)</u>

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_6_2.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_6_3.jpg?raw=true)

아래 이미지(StringTokenizer 클래스 주요 메소드) 세개의 조합이 필요함?

```java
public class StringTokenTokenizer {

	public static void main(String[] args) {
		StringTokenizer st = new StringTokenizer("홍길동/장화/홍련/콩쥐/팥쥐", "/");
		
		while(st.hasMoreTokens()) { //토큰이 있는 동안
			System.out.println(st.nextToken()); //다음으로 이동
		}
	}
}

// 홍길동
// 장화
// 홍련
// 콩쥐
// 팥쥐

```

---

### Math 클래스

java.lang 패키지에 포함되어 있으며 기본적인 산술 연산을 제공한다. 모든 멤버 메소드는 <u>static 타입</u>이므로 다음과 같이 클래스 이름으로 바로 사용하면 된다.

```java
double d = Math.random();
double pi = Math.PI; // 3.141592 원주율
```

Math 클래스의 주요 메소드

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_6_4.jpg?raw=true)

---

### Math 클래스를 활용한 난수 발생

Math클래스에서 가장 많이 사용하는 메소드는 난수를 발생하는 random()이다. 이 메소드는 0.0보다 크거나 같고 1.0보다 작은 임의의 double값을 리턴한다.

```java
public class MathEx {
	public static void main(String[] args) {		
		System.out.println(Math.PI);
		System.out.println(Math.ceil(3.14)); //올림
		System.out.println(Math.floor(3.14)); //내림
		System.out.println(Math.sqrt(9)); //제곱근
		System.out.println(Math.exp(2)); //e의 2승
		System.out.println(Math.round(3.14)); //반올림
		
		System.out.print("이번주 행운의 번호는 ");
		for(int i = 0; i < 5; i++) {
			System.out.print((int)(Math.random()*45 + 1) + " "); //1~45까지의 수를 int타입으로 강제변환해서 난수 발생시키기
		}
	}
}

// 3.141592653589793
// 4.0
// 3.0
// 3.0
// 7.38905609893065
// 3
// 이번주 행운의 번호는 27 33 8 25 29 
```

---

### Calendar 클래스

프로그램이 실행되는 동안 개발자가 기억하고자 하는 <u>시간과 날짜정보를 저장</u>하고, 아래의 이미지와 같은 필드를 인자로 하여 <u>set(), get()메소드</u>를 이용하여 날짜나 시간을 알아내거나 설정한다.

Calendar 클래스의 get(), set()에 사용되는 static 상수)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_6_5.jpg?raw=true)

---

##### Calendar 객체 생성 - 현재 날짜와 시간

calendar 클래스는 추상 클래스이므로, new Calendar()를 사용하지 않고 getInstance() 메소드를 통해 다음과 같이 객체를 생성한다.

```java
Calendar now = Calendar.getInstance();
```

get(Calendar,MONTH)는 1월달이면 0을 리턴하기 때문에 month에 1을 더한다.

---

##### 날짜와 시간 설정하기

set() 메소드는 calendar 객체에 날짜와 시간을 설정하는 메소드이다.

---
예제 6-11)
calendar를 이용하여 현재 날짜와 시간을 알아내는 방법과 개발자가 저장하고자 하는 날짜와 시간을 기억하는 방법을 알아본다.

```java
import java.util.Calendar;

public class CalendarEx {
	public static void printCalendar(String msg, Calendar cal){
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;  //get()은 0~30까지의 정수 리턴
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int hour = cal.get(Calendar.HOUR);
		int hourOfDay = cal.get(Calendar.HOUR_OF_DAY);
		int ampm = cal.get(Calendar.AM_PM);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		int millisecond = cal.get(Calendar.MILLISECOND);
		System.out.println(msg + year + "/" + month + "/" + day + "/");
		
		switch(dayOfWeek) {
			case Calendar.SUNDAY : 
				System.out.println("일요일");
				break;
			case Calendar.MONDAY : 
				System.out.println("월요일");
				break;
			case Calendar.TUESDAY :
				System.out.println("화요일");
				break;
			case Calendar.WEDNESDAY : 
				System.out.println("수요일");
				break;
			case Calendar.THURSDAY :
				System.out.println("목요일");
				break;
			case Calendar.FRIDAY : 
				System.out.println("금요일");
				break;
			case Calendar.SATURDAY : 
				System.out.println("토요일");
				break;
		}
		
		System.out.println("(" + hourOfDay + "시");
		if(ampm == Calendar.AM) {
			System.out.print("오전");
		}else{
			System.out.print("오후");
		}
		
		System.out.println(hour + "시" + minute + "분" + second + "초" + millisecond + "밀리초");
				
	}

	public static void main(String[] args) {
		Calendar now = Calendar.getInstance();
		printCalendar("현재 ", now);
		
		Calendar firstDate = Calendar.getInstance();
		firstDate.clear();
		firstDate.set(2016, 11, 25); //2016년 12월 25일. 12월을 표현하기 위해 month에 11로 설정
		
		firstDate.set(Calendar.HOUR_OF_DAY, 20); //저녁 8시
		firstDate.set(Calendar.MINUTE, 30); //30분
		printCalendar("처음 데이트 한 날은 ", firstDate);
		
	}
}

// 현재 2021/6/28/
// 월요일
// (20시
// 오후8시51분54초94밀리초
// 처음 데이트 한 날은 2016/12/25/
// 일요일
// (20시
// 오후8시30분0초0밀리초
```

---

### p.383~388 실습문제

**1**
다음 main( )이 실행되면 아래 예시와 같이 출력되도록 MyPoint 클래스를 작성하라.

```java
public static void main(String[] args) {
	MyPoint p = new MyPoint(3, 50);
	MyPoint q = new MyPoint(4, 50);
	System.out.println(p);
	if (p.equals(q))
		System.out.println("같은 점");
	else
		System.out.println("다른 점");
}

--출력--
Point(3,50)
다른 점
```

```java
public class MyPoint {
	private int a;
	private int b;
	
	MyPoint(int a, int b){
		this.a=a;
		this.b=b;
	}
	
	public String toString() {
		return "Point("+a+","+b+")";
	}
	
	public boolean equals(Object obj) {
		MyPoint mp=(MyPoint)obj;
		if ((a==mp.a)&&(b==mp.b))
			return true;
		else
			return false;
	}

	public static void main(String[] args) {
		MyPoint p = new MyPoint(3, 50);
		MyPoint q = new MyPoint(4, 50);
		System.out.println(p);
		if (p.equals(q))
			System.out.println("같은 점");
		else
			System.out.println("다른 점");
	}

}
```

**2**
중심을 나타내는 정수 x, y와 반지름 radius 필드를 가지는 Circle 클래스를 작성하고자 한다. 생성자는 3개의 인자(x, y, radius)를 받아 해당 필드를 초기화하고, equals( ) 메소드는 두 개의 Circle 객체의 중심이 같으면 같은 것으로 판별하도록 한다.

```java
public static void main(String[] args) {
	Circle a = new Circle(2,3,5); //중심 (2,3)에 반지름 5인 원
	Circle b = new Circle(2,3,30); //중심 (2,3)에 반지름 30인 원
	System.out.println("원 a : " + a);
	System.out.println("원 b : " + b);
	if(a.equals(b))
		System.out.println("같은 원");
	else
		System.out.println("서로 다른 원");
}

--출력--
원 a : Circle(2,3)반지름5
원 b : Circle(2,3)반지름30
같은 원
```

```java
public class Circle {
	private int x, y, radius;
	
	Circle(int x, int y, int radius){
		this.x=x;
		this.y=y;
		this.radius=radius;
	}
	
	public String toString() {
		return "Circle(" + x + "," + y + ") 반지름" + radius;
	}
	
	public boolean equals(Object obj) {
		Circle circle = (Circle)obj;
		if( (x==circle.x) && (y==circle.y) ) {
			return true;
		}else {
			return false;
		}
	}

	public static void main(String[] args) {
		Circle a = new Circle(2,3,5); //중심 (2,3)에 반지름 5인 원
		Circle b = new Circle(2,3,30); //중심 (2,3)에 반지름 30인 원
		System.out.println("원 a : " + a);
		System.out.println("원 b : " + b);
		if(a.equals(b))
			System.out.println("같은 원");
		else
			System.out.println("서로 다른 원");
	}

}
```

**3**
다음 코드를 수정하여, Calc 클래스는 etc 패기지에, MainApp 클래스는 main 패키지로 분리 작성하라.

```java
class Calc {
	private int x, y;
	public Calc(int x, int y) {this.x = x; this.y = y; }
	public int sum() { return x+y; }
}

public class MainApp {
	public static void main(String[] args) {
		Calc c = new Calc(10, 20);
		System.out.println(c.sum());
	}
}
```

```java
package etc;

public class Calc {
	private int x, y;
	public Calc(int x, int y) {this.x = x; this.y = y; }
	public int sum() { return x+y; }
}
```

```java
package main;
import etc.Calc;

public class MainApp {

	public static void main(String[] args) {
		Calc c = new Calc(10, 20);
		System.out.println(c.sum());
	}

}
```

**4**
다음 코드를 수정하여 Shape 클래스는 base 패키지에, Circle 클래스는 derived 패키지에, GraphicEditor 클래스는 app 패키지에 분리 작성하라.

```java
class Shape {
	public void draw() { System.out.println("Shape"); }
}
class Circle extends Shape {
	public void draw() { System.out.println("Circle"); }
}
public class GraphicEditor {
	public static void main(String[] args) {
		Shape shape = new Circle();
		shape.draw();
	}
}
```

```java
package base;

public class Shape {
	public void draw() { System.out.println("Shape"); }
}

```

```java
package derived;

import base.Shape;

public class Circle extends Shape {
	public void draw() { System.out.println("Circle"); }
}

```

```java
package app;

import base.Shape;
import derived.Circle;

public class GraphicEditor {

	public static void main(String[] args) {
		Shape shape = new Circle();
		shape.draw();
	}

}

```

**5**
Calendar 객체를 생성하면 현재 시간을 알 수 있다. 프로그램을 실행한 현재 시간이 새벽 4시에서 낮 12시 이전이면 "Good Morning"을, 오후 6시 이전이면 "Good Afternoon"을, 밤 10시 이전이면 "Good Evening"을, 그 이후는 "Good Night"을 출력하는 프로그램을 작성하라.

```java
--출력--
현재 시간은 10시 22분입니다.
Good Morning
```

```java

```

**6**
경과시간을 맞추는 게임을 작성하라. 다음 예시를 참고하면, <Enter> 키를 입력하면 현재 초 시간을 보여주고 여기서 10초에 더 근접하도록 다음 <Enter> 키를 입력한 사람이 이기는 게임이다. 

```java
--출력--
10초에 가까운 사람이 이기는 게임입니다.
황기태 시작 <Enter>키>>
	현재 초 시간 = 42
10초 예상 후 <Enter>키>>
	현재 초 시간 = 50
이재문 시작 <Enter>키>>
	현재 초 시간 = 51
10초 예상 후 <Enter>키>>
	현재 초 시간 = 4
황기태의 결과 8, 이재문의 결과 13, 승자는 황기태


힌트 :
<Enter> 키를 입력받기 위해서는 Scanner.nextLine( )을 호출하면 된다.
```

```java
import java.util.Scanner;
import java.util.Calendar;
class Person {
	Calendar now = Calendar.getInstance();
	Scanner sc = new Scanner(System.in);
	private String name, buffer;
	private int sec1, sec2;
	
	public Person(String name) {
		this.name = name;
	}
	
	public int game() {
		System.out.print(name+" 시작 <Enter>키  >>");
		sec1 = enter();
		System.out.print("10초 예상 후 <Enter>키  >>");
		sec2 = enter();
		if(sec1 < sec2)
			return sec2-sec1;
		else 
			return (60-sec1) + sec2;
	}
	
	public int enter() {
		buffer = sc.nextLine();
		now = Calendar.getInstance();		
		System.out.println("\t현재 초 시간 = "+ now.get(Calendar.SECOND));
		return now.get(Calendar.SECOND);
	}
}
public class chap06_prac06 {
	public static void main(String[] args) {
		Person person1 = new Person("황기태");
		Person person2 = new Person("이재문");
		
		System.out.println("10초에 가까운 사람이 이기는 게임입니다.");
		int result1 = person1.game();
		int result2 = person2.game();
		
		if(Math.abs(result1 - 10) < Math.abs(result2 - 10))
			System.out.println("황기태의 결과 "+result1+", 이재문의 결과 "+result2+", 승자는 황기태");
		else
			System.out.println("황기태의 결과 "+result1+", 이재문의 결과 "+result2+", 승자는 이재문");
	}
}

```

**7**
Scanner를 이용하여 한 라인을 읽고, 공백으로 분리된 어절이 몇 개 들어 있는지 "그만"을 입력할 때까지 반복하는 프로그램을 작성하라.

```java
--출력--
>>I love Java.
어절 개수는 3
>>자바는 객체 지향 언어로서 매우 좋은 언어이다.
어절 개수는 7
>>그만
종료합니다...


힌트 :
Scanner.nextLine( )을 이용하면 빈칸을 포함하여 한 번에 한 줄을 읽을 수 있다.
```

(1) StringTokenizer 클래스를 이용하여 작성하라.

```java
import java.util.Scanner;
import java.util.StringTokenizer;

public class ch06_07 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		String str ="";
		
		while(true) {
			
			System.out.print(">> ");
			str = scanner.nextLine();
			
			if(str.equals("그만")) {
				break;
			}
			
			StringTokenizer st = new StringTokenizer(str, " ");
			System.out.println("어절 개수는 : " + st.countTokens());
		}
		
		System.out.println("종료합니다...");
		scanner.close();

	}

}
```

(2) String 클래스의 split( ) 메소드를 이용하여 작성하라.

```java
import java.util.Scanner;
import java.util.StringTokenizer;

public class ch06_07 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		String str ="";
		
		while(true) {
			
			System.out.print(">> ");
			str = scanner.nextLine();
			
			if(str.equals("그만")) {
				break;
			}
			
			String arr[] = str.split(" ");
			System.out.println("어절 개수는 : " + arr.length);
		}
		
		System.out.println("종료합니다...");
		scanner.close();

	}

}
```

**8**
문자열을 입력받아한 글자씩 회전시켜 모두 출력하는 프로그램을 작성하라.

```java
--출력--
문자열을 입력하세요. 빈칸이나 있어도 되고 영어 한글 모두 됩니다.
I Love you
 Love youI
Love youI 
ove youI L
ve youI Lo
e youI Lov
 youI Love
youI Love 
ouI Love y
uI Love yo
I Love you


힌트 :
Scanner.nextLine( )을 이용하면 빈칸을 포함하여 한 번에 한 줄을 읽을 수 있다.
```

```java
import java.util.Scanner;

public class Rotation {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("문자열을 입력하세요. 빈칸이나 있어도 되고 영어 한글 모두 됩니다.");
		String str = scanner.nextLine();
		
		for(int i=1; i<str.length(); i++) {
			System.out.print(str.substring(i));			
			System.out.println(str.substring(0, i));
		}
		
		System.out.println(str);
		
		scanner.close();
		
	}

}

```

**9**
철수와 컴퓨터의 가위바위보 게임을 만들어보자. 가위, 바위, 보는 각각 1, 2, 3 키이다. 철수가 키를 입력하면, 동시에 프로그램도 Math.Random( )을 이용하여 1, 2, 3 중에 한 수를 발생시키고 이것을 컴퓨터가 낸 것으로 한다. 그런 다음 철수와 컴퓨터 중 누가 이겼는지 판별하여 승자를 출력하라.

```java
--출력--
철수[가위(1), 바위(2), 보(3), 끝내기(4)]>>1
철수(가위) : 컴퓨터(바위)
컴퓨터가 이겼습니다.
철수[가위(1), 바위(2), 보(3), 끝내기(4)]>>3
철수(보) : 컴퓨터(바위)
철수가 이겼습니다.
철수[가위(1), 바위(2), 보(3), 끝내기(4)]>>4
```

```java
import java.util.Scanner;

public class Random {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		while(true){
			System.out.print("철수[가위(1), 바위(2), 보(3), 끝내기(4)]>>");
			int user = scanner.nextInt();
			
			if(user == 4) {break;}
			
			int com = (int)(Math.random() * 3 + 1);
			
			switch(user) {
				case 1 :
					System.out.print("철수(가위) : ");
					break;
				case 2 :
					System.out.print("철수(바위) : ");
					break;
				case 3 :
					System.out.print("철수(보) : ");
					break;
			}
			switch(com) {
				case 1 :
					System.out.println("컴퓨터(가위)");
					break;
				case 2 :
					System.out.println("컴퓨터(바위)");
					break;
				case 3 :
					System.out.println("컴퓨터(보)");
					break;
			}
			
			if( (user==1 && com==2) || (user==2 && com==3) || (user==3 && com==1) ) {
				System.out.println("컴퓨터가 이겼습니다");
			}else if( (com==1 && user==2) || (com==2 && user==3) || (com==3 && user==1) ) {
				System.out.println("철수가 이겼습니다");
			}else {
				System.out.println("비겼습니다.");
			}
		}
		
		scanner.close();		

	}

}
```

or

```java
import java.util.Scanner;

class Player {
	private String name;
	private Scanner scanner = new Scanner(System.in);
	
	public Player(String name) {
		this.name = name;
	}
	public String getName() { return name; }
	public int turn() {
		System.out.print(name + "[가위(1), 바위(2), 보(3), 끝내기(4)]>>");
		return  scanner.nextInt();
	}
}
class Computer extends Player {
	public Computer(String name) {
		super(name);
	}
	public int turn() {
		return (int)(Math.random() * 3 + 1); // 1부터 3까지의 수
	}	
}
public class Random {
	private final String s[] = {"가위", "바위", "보"};
	private Player [] players = new Player[2];
	public Random() {
		players[0] = new Player("철수");
		players[1] = new Computer("컴퓨터");
	}
	
	public void run() {
		int userChoice, computerChoice;
		while (true) {
			userChoice = players[0].turn(); // 철수 차례
			if (userChoice == 4) 
				break; // 게임 끝내기
			
			computerChoice = players[1].turn(); // 컴퓨터 차례
			
			if (userChoice < 1 || userChoice > 3) { 
				System.out.println("잘못 입력하셨습니다.");
			} 
			else {
				System.out.print(players[0].getName() + "(" + s[userChoice-1] + ")" + " : ");				
				System.out.println(players[1].getName() + "(" + s[computerChoice-1] + ")");
				int diff = userChoice - computerChoice; 
				switch (diff) {
				case 0: // 같은 것을 낸 경우
					System.out.println("비겼습니다.");
					break;
				case -1: // 사용자가 가위, 컴퓨터가 바위 또는 사용자가 바위, 컴퓨터가 보
				case 2:	// 사용자가 보, 컴퓨터가 가위
					System.out.println(players[1].getName()+"가 이겼습니다.");
					break;
				case 1: // 사용자가 바위, 컴퓨터가 가위 또는 사용자가 보, 컴퓨터가 바위
				case -2: // 사용자가 가위, 컴퓨터가 보
					System.out.println(players[0].getName()+"가 이겼습니다.");
				}
			}
		}	
	}
	
	public static void main (String[] args) {
		Random game = new Random();
		game.run();
	}
}
```

**10**
갬블링 게임을 만들어보자. 두 사람이 게임을 진행한다. 이들의 이름을 키보드로 입력받으며 각 사람은 Person 클래스로 작성하라. 그러므로 프로그램에는 2개의 Person 객체가 생성되어야 한다. 두 사람은 번갈아 가면서 게임을 진행하는데 각 사람이 자기 차례에서 <Enter> 키를 입력하면, 3개의 난수가 발생되고 이 숫자가 모두 같으면 승자가 되고 게임이 끝난다. 난수의 범위를 너무 크게 잡으면 3개의 숫자가 일치하게 나올 가능성이 적기 때문에 숫자의 범위는 1~3까지로 한다.

```java
--출력--
1번째 선수 이름>>수희
2번째 선수 이름>>연수
[수희]:<Enter>
	3	1	1	아쉽군요!
[연수]:<Enter>
	3	1	3	아쉽군요!
[수희]:<Enter>
	2	2	1	아쉽군요!
[연수]:<Enter>
	1	1	2	아쉽군요!
[수희]:<Enter>
	3	3	3	수희님이 이겼습니다!
```

```java
import java.util.Scanner;
class Person {
	private int num1, num2, num3;
	public String name;
	public Person(String name) {
		this.name = name;
	}
	public boolean game() {
		num1 = (int) ((Math.random()*3)+1);
		num2 = (int) ((Math.random()*3)+1);
		num3 = (int) ((Math.random()*3)+1);
		System.out.print("\t"+num1+"  "+num2+"  "+num3+"  ");
		if(num1 == num2 && num2 == num3)
			return true;
		else 
			return false;
	}
}
public class chap06_prac10 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("1번째 선수 이름>>");
		String name = sc.next();
		Person person1 = new Person(name);
		System.out.print("2번째 선수 이름>>");
		name =sc.next();
		Person person2 = new Person(name);
		String buffer = sc.nextLine();
		while(true) {
			System.out.print("["+person1.name+"]:<Enter>");
			buffer = sc.nextLine();
			if(person1.game()) {
				System.out.println(person1.name+"님이 이겼습니다!");
				break;
			}
			System.out.println("아쉽군요!");

			System.out.print("["+person2.name+"]:<Enter>");
			buffer = sc.nextLine();
			if(person2.game()) {
				System.out.println(person2.name+"님이 이겼습니다!");
				break;
			}
			System.out.println("아쉽군요!");
		}
		sc.close();
	}
}
```

**11**
StringBuffer 클래스를 활용하여 명령처럼 문자열을 수정하라. 아래 실행 예시에서 love!LOVE는 love를 찾아 LOVE로 수정하라는 명령이다. 첫 번째 만난 문자열만 수정한다.

```java
--출력--
>>우리는 love Java Programming.
명령: 우리는!We
We love Java Programming.
명령: LOV!사랑
찾을 수 없습니다!
명령: !Java
잘못된 명령입니다!
명령: love!LOVE
We LOVE Java Programming.
명령: 그만
종료합니다
```

```java

```