---
layout: post

title: "JAVA Chapter07 제네릭과 컬렉션 - 제네릭 타입 매개변수 / Vector / 컬렉션과 자동 박싱/언박싱 / 컬렉션을 매개변수로 받는 메소드 만들기 / ArrayList / 컬렉션의 순차 검색을 위한 Iterator / HashMap<K, V> / LinkedList / Collections 클래스 활용"
excerpt: "제네릭 타입 매개변수 / Vector / 컬렉션과 자동 박싱/언박싱 / 컬렉션을 매개변수로 받는 메소드 만들기 / ArrayList / 컬렉션의 순차 검색을 위한 Iterator / HashMap<K, V> / LinkedList / Collections 클래스 활용"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 07. 제네릭과 컬렉션 (컬렉션이 중요!!!)

### 컬렉션의 개념

컬렉션은 안드로이드를 비롯한 자바 프로그램을 작성하는데 빼놓을 수 없는 중요한 도구이다. 또한 컬렉션은 제네릭이라는 기법으로 구현되어 있다.

> 컬렉션은 배열이 가진 고정 크기의 단점을 극복하기 위해 객체들을 쉽게 삽입, 삭제, 검색할 수 있는 <u>가변 크기의 컨테이너</u>이다.

컬렉션 클래스는 개발자가 바로 사용할 수 있는 것들로서, Vector<E>와 ArrayList<E>는 가변 크기의 배열을 구현하며, LinkedList<E>는 노드들이 링크로 연결되는 리스트를 구현한다. Stack<E>는 스택을 구현하며, HashSet<E>은 집합을 구현한다. 이들은 모두 Collection<E>를 상속받고, 단일 클래스의 객체만을 요소로 다루는 공통점이 있다. 
이와 달리 HashMap<K, V>는 키와 값의 쌍으로 이루어지는 데이터를 저장하고, 키로 쉽게 검색하도록 만든 컬렉션이다.

---

### 제네릭의 기본 개념

> 제네릭은 모든 종류의 타입을 다룰 수 있도록, 클래스나 메소드를 타입 매개변수를 이용하여 선언하는 기법이다. (제네릭은 생산성 향상을 위한 도구)

자바의 제네릭은 C++의 템플릿과 동일하다. 템플릿이란 형판이다. 즉 본 떠 찍어내기 위해 만들어진 틀이다. 자바의 제네릭은 클래스 코드를 찍어내듯이 생산할 수 있도록 <u>일반화</u>시키는 도구이다.

<u>Stack<E>에서 E에 구체적인 타입을 지정하면, 지정된 타입만 다룰 수 있는 구체화된 스택이 된다.</u> 예를들어, Stack<Integer>는 Integer 타입만 다루는 스택이 되고, Stack<Point>는 Point 타입의 객체만 푸시하고 팝 할수 있는 스택이 된다.

---

### 제네릭 타입 매개변수

컬렉션 클래스에서 타입 매개변수로 사용하는 문자는 다른 변수와 혼동을 피하기 위해 일반적으로 <u>하나의 대문자</u>를 사용한다.

* E : Element를 의미하며 컬렉션에서 요소임을 나타냄
* T : type
* V : Value
* K : Key

---

### Vector<E>

<u>배열을 가변 크기로 다룰 수 있게</u> 하고, 객체의 삽입, 삭제, 이동이 쉽도록 구성한 컬렉션 클래스이다. 벡터는 삽입되는 요소의 개수에 따라 자동으로 크기를 조절하고, 요소의 삽입과 삭제에 따라 자동으로 요소들의 자리를 이동한다. (데이터타입이 들어가면 된다. 벡터는 배열과 흡사한 구조)
(매개변수. 클래스 이름이 들어가야 함. 일반클래스 못들어감. 일반변수 쓰려면 wrapper 감싸서 써야함. )

##### 벡터 생성

벡터를 생성할 때 E에 요소로 사용할 타입을 지정해야 한다.

```java
Vector<Integer> v = new Vector<Integer>();

//-분리하여 사용 가능-----------------------------------------------

Vector<String> StringVector;
StringVector = new Vector<String>();
```

<u>int, char, double 등의 기본 타입은 E에 사용할 수 없다.</u> (기본타입은 wrapper에 감싸줘야 함!!)

```java
Vector<int> v = new Vector<int>();  //오류!!!
```

개발자는 생성된 벡터의 용량을 굳이 알 필요가 없다. 컬렉션은 자신의 용량을 스스로 조절하기 때문. 만일 용량을 초기에 설정하고자 한다면 다음과 같이 지정.

```java
Vector<Integer> v = new Vector<Integer>(5);
```

---

> add()를 이용하여 요소를 삽입하고 get()을 이용하여 요소를 검색한다.

(표) Vector<E> 클래스의 주요 메소드

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_7-1.jpg?raw=true)

---

벡터에는 null도 삽입할 수 있다. 

```java
v.add(Integer.valueOf(null));  //맨 뒤에 값 삽입

//---------------------------------

v.add(null);  //맨 뒤에 값 삽입

//---------------------------------

v.add(2, 100);  //중간에 객체 삽입. 그 뒤에 있는 요소들은 모두 한자리씩 뒤로 이동
```

---

##### 벡터 내의 요소 알아내기

get()이나 elementAt() 메소드를 이용한다. 이 메소드들은 인자로 주어진 인덱스에 있는 Integer 객체를 리턴한다.

```java
Vector<Integer> v = new Vector<Integer>();
v.add(5);
v.add(4);
v.add(-1);

Integer obj = v.get(1);  //벡터의 1번째 Integer 객체를 얻어낸다.
int i = obj.intValue();  //obj에 있는 정수를 알아냄. 이 값은 4

//위의 두 문장을 한문장으로 압축
int i = v.get(1);  //자동 언박싱
```

---

##### 벡터의 크기와 용량 알아내기

```java
int len = v.size(); //벡터의 크기. 벡터에 존재하는 요소 객체의 수

int cap = v.capacity();  //벡터의 용량. 수용할 수 있는 크기
```

---

##### 벡터에서 요소 삭제

```java
v.remove(1);  //인덱스 1의 위치에 잇는 요소 삭제. 실행 후 요소들이 한자리씩 앞으로 이동.

v.removeAllElements();  //벡터의 모든 요소 삭제
```

---

(그림) Vector<Integer> 생성 및 삽입 삭제 사례

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_7-2.jpg?raw=true)
![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_7-3.jpg?raw=true)

---

### 컬렉션과 자동 박싱/언박싱

컬렉션은 객체들만 요소로 다룸. 그러므로 기본 타입의 값은 Wrapper 클래스로 객체화하여 삽입한다.

```java
Vector<Integer> v = new Vector<Integer>();
v.add(Integer.valueOf(4));
v.add(Integer.valueOf(-1));

//-자동박싱-------------------------------------------------
v.add(4);
v.add(-1);
```

컬렉션으로부터 값을 얻어내는 과정에서는 자동 언박싱이 일어난다.

```java
int k = v.get(0); //k = 4
```

---

### 컬렉션을 매개변수로 받는 메소드 만들기

```java
//컬렉션을 매개변수로 전달받는 메소드 선언
public void printVector(Vector<Integer> v){
	for(int i = 0; i<v.size(); i++){
		int n = v.get(i); //벡터의 i번째 정수
		System.out.println(n);
	}
}

//메소드 호출
Vector<Integer> v = new Vector<Integer>(); //Integer 벡터 생성
printVector(v);  //메소드 호출
```

---

### ArrayList<E>

<u>가변 크기의 배열을 구현한 컬렉션 클래스로써 Vector 클래스와 거의 동일</u>하다. 크게 다른점은 ArrayList는 <u>스레드 간에 동기화를 지원하지 않기</u> 때문에, 다수의 스레드가 동시에 ArrayList에 요소를 삽입하거나 삭제할 때 데이터가 훼손될 우려가 있다. 하지만 멀티스레드 동기화를 위한 시간 소모가 없기때문에 벡터보다 속도가 빨라, 단일 스레드 응용에는 더 효과적이다.
(삽입 가능한건 객체, null 앞과 같음. 벡터와 차이점은 스레드 동기화 없음. 스레드는 동시에 작업하는거)

> add() 를 이용하여 요소를 삽입하고 get() 을 이용하여 요소를 검색한다.

주요 메소드는 Vector와 거의 비슷하다

---

##### ArrayList의 생성

문자열만 다루는 ArrayList
ArrayList는 스스로 용량을 조절하기때문에 용량에 대해 신경 쓸 필요가 없다.

```java
ArrayList<String> a = new ArrayList<String>();  //a는 문자열만 삽입하고 검색 가능. 
a.add("Hello");
a.add("Hi");
a.add("Java");

a.add(null);  //ArrayList에도 Vector와 마찬가지로 null을 삽입할 수 있다.

a.add(2, "Sahni");  //인덱스 2의 위치에 문자 삽입

String str = a.get(1);  //요소 알아내기. "Hi" 리턴

int len = a.size();  //크기 알아내기. 들어있는 요소의 개수
//ArrayList는 벡터와 달리 현재 용량을 리턴하는 메소드가 없다.

a.remove(1);  //요소 삭제

a.clear(); //모든 요소 삭제

```

ArrayList는 벡터와 달리 현재 용량을 리턴하는 메소드가 없다.

```java
import java.util.*;

public class ArrayListEx {

	public static void main(String[] args) {
		ArrayList<String> a = new ArrayList<String>();  //문자열만 삽입 가능한 ArrayList 생성
		
		//키보드로부터 4개의 이름 입력받아 ArrayList에 삽입
		Scanner scanner = new Scanner(System.in);
		for(int i = 0; i <4; i++) {
			System.out.print("이름을 입력하세요 >> ");
			String s = scanner.next();
			a.add(s);  //ArrayList 컬렉션에 삽입
		}
		
		//ArrayList에 들어 있는 모든 이름 출력
		for(int i = 0; i <a.size(); i++) {
			String name = a.get(i);
			System.out.println(name + " ");
		}
		
		//가장 긴 이름 출력
		int lingestIndex = 0;  //현재 가장 긴 이름이 있는 ArrayList 내의 인덱스
		for(int i=1; i<a.size(); i++) {
			if(a.get(lingestIndex).length() < a.get(i).length()) {
				lingestIndex = i;  //i번째 이름이 더 긴 이름임
			}
		}
		System.out.println("\n 가장 긴 이름은 : " + a.get(lingestIndex));
		scanner.close();
	}

}
```

---

### 컬렉션의 순차 검색을 위한 Iterator

Vector, ArrayList, LinkedList, Set과 같이 요소가 순서대로 저장된 컬렉션에서 요소를 순차적으로 검색할 때 사용한다. 여기서 <E>는 컬렉션의 매개변수와 동일한 타입을 지정해야 한다.
(<u>데이터가 저장된 공간을 가리키는 화살표라고 생각해라</u>)

```java
Vector<Integer> v = new vector<Integer>();  //요소가 Integer 타입인 벡터

Iterator<Integer> it = v.Iterator();  //벡터의 v요소를 순차 검색할 Iterator 객체 리턴

while(it.hasNext()){  //it로 벡터의 끝까지 반복
	int n = it.next();  //it가 가리키는 요소 리턴. 가리킴과 동시에 값을 뽑아서 저장!!!!!!!!
}
```

Iterator<E> 인터페이스의 메소드)

| 메소드  |  설명 |
|---|---|
| boolean hasNext()  | 방문할 요소가 남아있으면 true 리턴  |
| E next()  | 다음 요소 리턴  |
| void remove()  |  마지막으로 리턴된 요소 제거 |

```java
import java.util.*;

public class IteratorEx {

	public static void main(String[] args) {
		//정수 값만 다루는 제네렉 벡터 생성
		Vector<Integer> v = new Vector<Integer>();
		
		v.add(5);
		v.add(4);
		v.add(-1);
		v.add(2, 100);
		
		//Iterator를 이용한 모든 정수 출력하기
		Iterator<Integer> it = v.iterator();  //Iterator 객체 얻기
		while(it.hasNext()) {  //while 문은 벡터 v의 모든 정수 출력
			int n = it.next();
			System.out.println(n);
		}
		
		//Iterator를 이용하여 모든 정수 더하기
		int sum = 0;
		it = v.iterator();  //it 다시 설정
		while(it.hasNext()) {  //while 문은 벡터 v의 모든 정수합 계산
			int n = it.next();
			sum += n;
		}
		
		System.out.println("벡터에 있는 정수 합 : " + sum);
	}

}

```

---

### HashMap<K, V>

키(key)와 값(value)의 쌍으로 구성되는 요소를 다룬다. k는 키로 사용할 데이터 타입을, v는 값으로 사용할 데이터 타입의 매개변수이다. put(), get() 메소드를 이용하여 요소를 삽입하거나 검색한다.
(key는 중복 x, value는 중복 o)

```java
HashMap<String, String> h = new HashMap<Sring, String>();  //해시맵 생성
h.put("apple", "사과");  //키(apple)와 값(사과) 삽입
String kor = h.get("apple"); //키로 값 검색. 검색된 값은 사과
```

**put(key, value)** 메소든는 키와 값을 받아, 키를 이용하여 해시 함수를 실행하고 해시 함수가 리턴하는 위치에 키와 값을 저장한다.    
**get(key)** 는 다시 키를 이용하여 동일한 해시 함수를 실행하여 값이 저장된 위치를 알아내어 값을 리턴한다.

---

##### 해시맵의 장단점

해시맵은 List<E> 인터페이스를 상속받은 Vector<E>나 ArrayList<E>와는 다른점이 있다.

1. <u>요소의 삽입, 삭제 시간이 매우 빠르다.</u> 요소의 위치를 결정하는 해시 함수가 간단한 코드로 이루어지며, Vector<E>나 ArrayList<E>와 달리 요소의 삽입삭제시 다른 요소들의 위치 이동이 필요 없기 때문이다.
2. <u>요소 검색은 더욱 빠르다.</u> 해시맵의 get(key) 메소드가 호출되면 해시 함수가 key가 저장된 위치를 단번에 찾아내므로 Vector<E>나 ArrayList<E>에서처럼 모든 요소들을 하나씩 비교하는 시간 낭비가 전혀 없기 때문이다.
3. 하지만 해시맵은 인덱스를 이용하여 요소에 접근할 수 없고 <u>오직 키로만 검색</u>해야한다. 그러므로 해시맵은 빠른 삽입과 검색이 필요한 응용에 적합하다.

HashMap<K, V> 클래스의 주요 메소드)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_7-4.jpg?raw=true)

---

##### 해시맵 생성

해시맵은 HashMap<K, V>에서 K에는 키로, V에는 값으로 사용할 구체적인 타입을 지정하여 생성한다.

```java
HashMap<String, String> h = new HashMap<String, String>();

h.put("baby", "아기");  //해시맵 요소 삽입
h.put("love", "사랑");
h.put("apple", "사과");

String kor1 = h.get("love"); //kor1 = "사랑". 키로 값 읽기
String kor3 = h.get("babo"); //kor3 = null. 없는 키로 호출하면 null 리턴

h.remove("apple"); //키로 요소 삭제

int n = h.size();  //요소 개수 알아내기
```

만일 해시맵에 없는 키로 get()을 호출하면 null을 리턴한다.

---

### 해시맵의 전체 검색

모든 키를 알아낸 후, 각 키에 하나씩 값을 알아내는 방식으로 작성하면 된다.
keySet() 메소드는 모든 '키'를 Set 컬렉션으로 만들어 리턴한다.

```java
Set<String> keys = h.keySet();  //해시맵 h에 있는 모든 키를 Set 컬렉션으로 리턴
Iterator<String> it = keys.iterator();
while(it.hasNext()){
	String key = it.next();  // 키
	String value = h.get(key); //값
	System.out.println(key, value);
}
```

HashMap<String, String> 컬렉션의 생성 및 삽입 삭제 사례)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/java_7-5.jpg?raw=true)

---

```java
import java.util.*;

public class HashMapScoreEx {

	public static void main(String[] args) {
		//이름과 점수를 저장할 HashMap 컬렉션 생성
		HashMap<String, Integer> scoreMap = new HashMap<String, Integer>();
		
		//5개의 점수 저장
		scoreMap.put("김성동", 97);
		scoreMap.put("황기태", 88);
		scoreMap.put("김남윤", 98);
		scoreMap.put("이재문", 70);
		scoreMap.put("한원선", 99);
		
		System.out.println("HashMap의 요소 개수 : " + scoreMap.size());
		
		//모든 사람의 점수 출력. scoreMap에 들어있는 모든 (key, value) 쌍 출력
		Set<String> keys = scoreMap.keySet();  //모든 key를 가진 Set 컬렉션 리턴
		Iterator<String> it = keys.iterator();  //set에 있는 모든 key를 순서대로 검색하는 Iterator 리턴
		
		while(it.hasNext()) { //모든 점수 출력
			String name = it.next();  //다음 키. 학생이름
			int score = scoreMap.get(name);  //점수 알아내기
			System.out.println(name + " : " + score);
		}
	}
}
//출력된 결과는 삽입된 순서와 다르다.
```

key.Set();은 키 목록만 분리? 추출하기!!!
iterator는 화살표를 만듬
hash는 Iterator 못만듬.(컬렉션을 상속받지 못해서)
while로 화살표 옮기면서 키값에 저장된 값 뽑아옴.

---

### LinkedList<E>

<u>요소들을 양방향으로 연결하여 관리한다는 점을 제외하고 Vector, ArrayList와 거의 같다.</u>    
add()메소드와 get()메소드를 가진다.    
맨 앞과 맨 뒤를 가리키는 head, tail 레퍼런스를 가지고있오, 맨앞이나 맨 뒤, 중간에 요소의 삽입이 가능하며 인덱스를 이용하여 요소에 접근할 수도 있다.
(이전까지는 다 컬렉션을 가지고 구현했음.)   
(꼬리를 물고 다음을 계속 만듬)

LinkedList는 중간에 값을 삽입할 때 효율적이다.(기록시 유리, 대량의 데이터 입력시 유리)
ArrayList는 추가하다가 공간 다 차면 이사가야 한다. 연속된 공간이 할당되어 있음.(읽는거 유리)

---

### Collections 클래스 활용

다음과 같이 컬렉션을 다루는 유용한 여러 메소드를 지원한다.

* sort() - 컬렉션에 포함된 요소들의 정렬
* reverse() - 요소를 반대 순으로 정렬
* max(), min() - 요소들의 최댓값과 최솟값 찾아내기
* binarySearch() - 이진검색

<u>Collections 클래스의 메소드는 모드 static 타입이므로 객체를 생성할 필요가 없다.</u>

---

```java
import java.util.*;

public class CollectionsEx {
	static void printList(LinkedList<String> l) {  //리스트의 요소를 모두 출력하는 메소드
		Iterator<String> iterator = l.iterator();
		while (iterator.hasNext()) {
			String e = iterator.next();
			String separator;
			if(iterator.hasNext()) {
				separator = "->";  //마지막 요소가 아니면 -> 출력
			}else {
				separator = "\n";  //마지막 요소이면 줄바꿈
			}
			System.out.print(e+separator);		
		}
	} 
	
	public static void main(String[] args) {
		LinkedList<String> myList = new LinkedList<String>();  //빈 리스트 생성
		myList.add("트랜스포머");
		myList.add("스타워즈");
		myList.add("매트릭스");
		myList.add(0, "터미네이터");
		myList.add(2, "아바타");
		
		Collections.sort(myList);  //요소 정렬. sort()는 static 메소드이므로 클래스 이름으로 바로 호출한다.
		printList(myList);  //정렬된 요소 출력
		
		Collections.reverse(myList);  //요소의 순서 반대로 구성
		printList(myList);
		
		int index = Collections.binarySearch(myList, "아바타") + 1;  //이분법?이진법? 중간 찾아서 양옆으로 이동
		System.out.println("아바타는" + index + "번째 요소입니다.");
	}
}
// 매트릭스->스타워즈->아바타->터미네이터->트랜스포머
// 트랜스포머->터미네이터->아바타->스타워즈->매트릭스
// 아바타는3번째 요소입니다.
```

---

ArrayList
add()** 를 이용하여 요소를 삽입
get()** 을 이용하여 요소를 검색

Vector
add()를 이용하여 요소를 삽입
get()을 이용하여 요소를 검색

Iterator
hasNext
next

HashMap
put(key, value)** 메소든는 키와 값을 받아, 키를 이용하여 해시 함수를 실행하고 해시 함수가 리턴하는 위치에 키와 값을 저장
get(key)** 는 다시 키를 이용하여 동일한 해시 함수를 실행하여 값이 저장된 위치를 알아내어 값을 리턴

LinkedList
add()메소드와 
get()메소드를 가진다.

---

### 제네릭 만들기, 제네릭 클래스

제네릭은 빈도수가 높지 않다. 교수님도 사용한적 별로 없음. 개념만 알고 나중에 필요할 때 보고 만들기.    
컬렉션 자체가 제네릭으로 구성되어있어서 묶여있음. 제네릭은 빈도수 x, 단 컬렉션은 반드시! 해시 사용법은 반드시 익히기. 컬렉션은 뭐 쓸때 뭐가 더 좋은지 익히기


> 제네릭은 모든 종류의 타입을 다룰 수 있도록, 클래스나 메소드를 타입 매개변수를 이용하여 선언하는 기법이다. (제네릭은 생산성 향상을 위한 도구)
