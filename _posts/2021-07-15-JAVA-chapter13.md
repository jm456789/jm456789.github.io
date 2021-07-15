---
layout: post

title: "JAVA Chapter13 스레드와 멀티태스킹 - 멀티스레드와 자바 가상 기계(JVM) / 스레드 만들기 / Runnable 인터페이스로 스레드 만들기 / 스레드 상태 / 스레드 우선순위와 스케줄링 / main 스레드 / 스레드 종료 / flag를 이용한 종료 / 스레드 동기화의 필요성 / synchronized 키워드 / wait()-notify()를 이용한 스레드 동기화가 필요한 경우"
excerpt: "멀티스레드와 자바 가상 기계(JVM) / 스레드 만들기 / Runnable 인터페이스로 스레드 만들기 / 스레드 상태 / 스레드 우선순위와 스케줄링 / main 스레드 / 스레드 종료 / flag를 이용한 종료 / 스레드 동기화의 필요성 / synchronized 키워드 / wait()-notify()를 이용한 스레드 동기화가 필요한 경우"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 13. 스레드와 멀티태스킹

멀티태스킹은 응용프로그램의 여러 작업(태스크)이 동시에 진행되게 하는 기법으로, 응용프로그램의 목적을 효율적으로 달성하게 한다.

<u>스레드는 멀티태스크 응용프로그램을 작성</u>한다. 프로그램 코드를 실행하는 하나의 실 혹은 제어의 개념이다. 하나의 스레드로 하나의 작업밖에 처리할 수 없다. 스레드 a와 스레드 b는 한 객체의 메소드에서 다른 메소드로의 호출에 따라 이동하면서 코드를 실행하고 있다. 2개의 스레드는 상호독립적이다. 그러므로 이 응용프로그램은 2가지 작업을 동시에 하고 있는 셈이다(거의 동시에 진행, 완전동시x). ex) 테트리스 게임에서 1. 오디오 재생코드를 움직이는 스레드?, 2. 블록을 아래로 움직이는 코드를 하는 스레드, 3. 키 입력을 받아 블록의 방향을 바꾸는 코드의 스레드

---

### 멀티스레딩

멀티태스킹의 문제점(독립적으로 실행되어 변수공유 불가능, 오버헤드가 크다, 문맥교환에 따른 과도한 작업량과 시간소모)을 개선.   
멀티스레딩은 하나의 응용프로그램을 동시처리가 가능한 여러 작업(코드)로 분할하고 작업의 개수만큼 스레드를 생성하여 각 스레드로 하여금 하나의 작업을 처리하도록 하는 기법이다.

멀티스레딩은 응용프로그램이 다수의 스레드를 가지고 다수의 작업을 동시에 처리함으로써, <u>한 스레드가 대기하는 동안 다른 스레드를 실행하</u>여 시간 지연을 줄이고 자원의 비효율적 사용을 개선한다.
EX) 네이버 여러 유저가 접속, 프린터와 다른 작업 동시

---

### 멀티스레드와 자바 가상 기계(JVM)

자바에는 프로세스가 존재하지 않고 스레드 개념만 존재하며, JVM은 멀티 스레딩만 지원한다. <u>자바 스레드</u>는 <u>JVM</u>에 의해 스케줄되는 <u>실행 단위 코드 블록</u>이다.   
하나의 JVM은 하나의 자바 응용프로그램만 실행한다. 사용자가 자바 응용프로그램을 실행시키면, JVM이 먼저 실행되고 JVM이 자바 응용프로그램을 로딩하여 실행시킨다. 자바 응용프로그램이 종료되면 JVM도 함께 종료된다. 만일 한 컴퓨터에서 n개의 자바 응용프로그램이 실행된다고 하면 n개의 JVM이 실행되고 있는 것이다.   

-> JVM은 한개의 응용 프로그램만 실행 가능, 하나의 응용프로그램이 여러 개의 스레드를 가질 수 있음

2개 이상의 자바 응용프로그램을 실행하고자 하는 경우 각각 JVM에 의해 실행되며, 서로 정보를 주고받고자 하는 경우 소켓통신과 같은 통신 방법을 이용한다. (그림 참조하려면 p.690)

---

### 자바스레드와 JVM

개발자의 임무는 자바 스레드로 작동할 스레드 코드를 작성하고, 스레드 코드가 생명을 가지고 실행을 시작하도록 JVM에게 요청하는 일뿐이다.

---

### 스레드 만들기

개발자는 두가지 작업을 해야 한다.

1. 스레드 코드 작성
2. JVM에게 스레드를 생성하고 스레드 코드를 실행하도록 요청

스레드 코드를 작성하는 방법

1. Thread 클래스 이용
2. Runnable 인터페이스 이용

---

##### 스레드 클래스 작성 : Thread 클래스 상속

```java
class TimerThread extends Thread{
    ...
}
```

##### 스레드 코드 작성 : ru()메소드 오버라이딩

run() 메소드에 작성된 코드를 스레드 코드라고 한다. 스레드는 run()에서부터 실행을 시작하고 run()이 종료하면 스레드도 종료된다.   
만일 run()을 오버라이딩 하지 않으면 Thread(부모)에 작성된 run이 실행되며, 이 run()은 아무 일도 하지 않고 단순 리턴하도록 작성되어있어 스레드가 바로 종료된다.

```java
class TimerThread extends Thread{
    @Override
    public void run(){
        ...
    }
}
```

##### 스레드 객체 생성

스레드 객체 생성만으로 스레드가 작동하는것은 아니다.

```java
TimerThread th = new TimerThread();
```

##### 스레드 시작 : start() 메소드 호출

start()해야 스레드 작동된다.(병렬처리)

```java
th.start();
```

예제 13-1) 1초 단위로 출력하는 타이머 스레드 만들기

```java
import java.awt.*;
import javax.swing.*;

class TimerThread extends Thread {
	private JLabel timerLabel;  //타이머 값이 출력되는 레이블
	
	public TimerThread(JLabel timerLabel) {
		this.timerLabel = timerLabel;  //타이머 카운트를 출력할 레이블
	}
	
  //스레드 코드. run()이 종료하면 스레드 종료
	@Override  //재정의
	public void run() {  //run()은 스레드 코드로서 start() 메소드가 호출된 후 스레드가 실행을 시작하는 메소드이다.  //try-catch 블록이 없으면 컴파일 오류가 발생한다. sleep()에 의해 잠을 자는 경우 예외 발생에 대비하기 위해서이다.
		int n=0;  //타이머 카운트 값
		while(true){  //무한 루프
			timerLabel.setText(Integer.toString(n));  //레이블에 카운트 값 출력
			n++;  //카운트 증가
			try {
				Thread.sleep(1000);  //1초 동안 잠을 잔다.
			}catch(InterruptedException e) {
				return;  //예외가 발생하면 스레드 종료
			}
		}
	}
}

public class ThreadTimerEx extends JFrame{
	public ThreadTimerEx() {
		setTitle("Thread를 상속받은 타이머 스레드 예제");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		c.setLayout(new FlowLayout());
		
    //타이머 값을 출력할 레이블 생성
		JLabel timerLabel = new JLabel();
		timerLabel.setFont(new Font("Gothic", Font.ITALIC, 80));
		c.add(timerLabel);  //레이블을 컨텐츠팬에 부착
		
    //타이머 스레드 객체 생성. 타이머 값을 출력할 레이블을 생성자에 전달
		TimerThread th = new TimerThread(timerLabel);  //스레드 객체를 만든다
		
		setSize(300, 170);
		setVisible(true);
		
		th.start();  //타이머 스레드의 실행을 시작하게 한다. 스레드를 동작시킨다. 이 호출의 결과 TimerThread의 run() 메소드가 실행을 시작한다.
	}
	
	public static void main(String[] args) {		
		new ThreadTimerEx();
	}
}
```

---

### Runnable 인터페이스로 스레드 만들기

추상메소드 run() 하나만 가지고 있다.
차이점은 예제 보기. 별거 없음

---

p.702 예제~~~~~~~~~~~~~~~~~~~~~~~

---

### 스레드 상태

스레드는 JVM에 있어 생명체와 같다. 생명주기를 가진다.     
threadA = new Thread() -> NEW(탄생) 이전까지, TIMED_WATING(시간대기) 까지가 우리가 할 수 있는 정도. 나머지는 JVM이

* NEW : 스레드가 생성되었지만 아직 실행할 준비가 되지 않은 상태이다. start() 메소드가 호출되면 RUNNABLE 상태가 된다.
* RUNNABLE : 스레드가 현재 실행되고 있거나, 실행 준비되어 스케줄링을 기다리는 상태이다.
* TIME_WATING : 스레드가 sleep(long n)을 호출하여 n미리초 동안 잠을 자는 상태이다.
* BLOCK : 스레드가 I/O 작업을 실행하여 I/O 작업의 완료를 기다리면서 멈춘(blocked) 상태이다. 스레드가 I/O 작업을 실행하면 JVM이 자동으로 현재 스레드를 BLOCK 상태로 만들고 다른 스레드를 스케줄링한다.
* WATING : 스레드가 어떤 객체 a에 대해 a.watie()를 호출하여, 다른 스레드가 a.notify(). a.notifyAll()을 불러줄 때까지 무한정 기다리는 상태이다.
* TERMINATED : 스레드가 종료한 상태이다. 더이상 다른 상태로 변이할 수 없다.

---

### 스레드의 일생

p.705 그림...

---

### 스레드 우선순위와 스케줄링

JVM은 철저히 우선순위(priority)를 기반으로 스레드를 스케줄링한다. (값이 클수록 우선순위 높다.)   

자바 프로그램이 실행될 떄 처음으로 생성되는 main스레드는 보통 값 5의 우선순위로 태어난다.    
main 스레드의 모든 자식 스레드는 보통 값(5)의 우선순위를 가지고 태어난다.    

다음은 우선순위 값 변경 메소드

```java
void setPriority(int newPriority)  //newPriority로 스레드의 우선순위 값 변경
      getPriority                                         //우선순위 확인                  
```

---

### main() 을 실행하는 main 스레드

(main 스레드 실행하기 위해 기본적으로)
아래 문제에서.. 스레드 여러개 가능. 5개 있을 시 첫번째 currentThread값 가져옴

```java
long id = Thread.currentThread().getId(); //Thread.currentThread()는 현재 작동중인 스레드!!!!!!!!!!!!!!!!!!!!!!11. 스레드 id 얻기.
String name = Thread.currentThread().getName(); //스레드 이름 얻기
int priority = Thread.currentThread().getPriority();  //스레드 우선순위 값 얻기
Thread.state s = Thread.currentThread().getState(); //스레드 상태 값 얻기

System.out.println("현재 스레드 이름 = " + name );
System.out.println("현재 스레드 ID = " + id );
System.out.println("현재 스레드 우선순위 값 = " + priority );
System.out.println("현재 스레드 상태 = " + s );

//출력
//현재 스레드 이름 = main
//현재 스레드 ID = 1
//현재 스레드 우선순위 값 = 5
//현재 스레드 상태 = RUNNABLE
```

---

### 스레드 종료

run() 메소드가 실행 도중 return하거나 run()을 완전히 실행하고 리턴하면 종료된다.

---

### 강제종료

스레드 A가 스레드 B를 강제 종료시킥자 하는 경우 스레드 B의 interrupt()를 호출해야 한다.    
타 스레드에서 <u>interrupt</u>하여 강제종료 하고, run의 catch문에서 <u>InterrupteException return</u> 한다.

---

### flag를 이용한 종료

인터럽트랑 비슷. flag는 여기저기 많이 사용됨. flag = 상태의 변화를 담는 변수. 마우스 누를때, 뗄 때 등...

---

### 스레드 동기화의 필요성

스레드 동기화 -> 한줄 세워서 문제 해결

* 공유프린터에 동시 접근하는 경우 : 공유 프린터에 대한 멀티스레드의 <u>동시 접근</u>을 <u>순차화</u>하여 섞여 출력되는 문제를 해결했다.
* 공유 집계판에 동시 접근 하는 경우  : 방이라는 임계영역을 만들고 기다리게한다(교착상태). 문을 동기화 가정으로 정의했다.

멀티스레드 프로그램을 작성할 때 주의할 점은 다수의 스레드가 공유 데이터에 동시 접근하는 경우에 대한 처리이다. 이에 대한 해결책이 바로 스레드 동기화이다.(스레드 동기화 -> 한줄 세워서 문제 해결)     
스레드 동기화란 <u>공유 데이터를 배타적으로 접근하기 위해 상호협력하는 것을 말한다. 공유데이터에 대한 접근은 배타적이고 독점적으로 이루어져야한다.</u>    
자바에서 스레드 동기화에는 다음 2가지 방법을 사용한다.

* synchronized로 동기화 블록 지정
* wate()-notity()메소드로 스레드 실행 순서 제어

---

### 자바 스레드 동기화를 위한 synchronized 키워드

일정 영역을 잡아서 synchronized에 가둠   
메소드 전체를 임계영역으로 지정할 수 있고, 코드 블록을 임계영역으로 지정할 수도 있다.

```java
package chapter13;

public class SynchronizedEx {

	public static void main(String[] args) {
		SharedBoard board = new SharedBoard();  //집계판 공유 데이터 생성
		
		//두 스레드가 집계판에 동시 접근
		Thread th1 = new StudentThread("kitae", board);
		Thread th2 = new StudentThread("hyosoo", board);
		
		th1.start();
		th2.start();
	}
}

//두 스레드에 의해 동시 접근됨
class SharedBoard{
	private int sum = 0;
	synchronized public void add() {
		int n = sum;
		Thread.yield();  //현재 실행중인 스레드 양보. 테스트용. 여기선 synchronized있으니 안써도 됨
		n += 10;
		sum = n;
		System.out.println(Thread.currentThread().getName() + " : " + sum);
	}
	public int getSum() {
		return sum;
	}
}

class StudentThread extends Thread{
	private SharedBoard board;  //집계판의 주소
	public StudentThread(String name, SharedBoard board) {
		super(name);
		this.board = board;
	}
	
	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			board.add();
		}
	}
}
```

---

### wait()-notify()를 이용한 스레드 동기화가 필요한 경우

* wait() : 다른 스레드가 이 객체의 notify()를 불러줄 때까지 <u>대기</u>한다.
* notify() : 이 객체에 대기 중인 스레드를 <u>깨워</u> RUNNABLE 상태로 만든다. 2개 이상의 스레드가 대기 중이라도 오직 한 개의 스레드만 깨워 RUNNABLE 상태로 한다.
* notifyAll() : 이 객체에 대기 중인 모든 스레드를 깨우고 모두 RUNNABLE 상태로 한다.

```java
package chapter13;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

class MyLabel extends JLabel{
	private int barSize = 0;  //현재 그려져야 할 바의 크기
	private int maxBarSize;  //바의 최대 크기
	
	public MyLabel(int maxBarSize) {
		this.maxBarSize = maxBarSize;
	}
	
	@Override
	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		g.setColor(Color.MAGENTA);
		int width = (int) (((double)(this.getWidth()))/maxBarSize*barSize);
		if(width==0) {
			return;  //크기가 0이기때문에 바를 그릴 필요 없음
		}
		g.fillRect(0, 0, width, this.getHeight());
	}
	
	synchronized public void fill() {
		if(barSize == maxBarSize) {
			try {
				wait();  //바가 최대이면, ComsumerThread에 의해 바가 줄어들 때까지 대기
			}catch(InterruptedException e) {
				return;
			}
		}
		barSize++;
		repaint();
		notify();//기다리는 ComsumerThread 스레드 깨우기
	}
	synchronized public void consume() {
		if(barSize == 0) {
			try {
				wait();
			}catch(InterruptedException e) {
				return;
			}
		}
		barSize--;
		repaint();
		notify();  //기다리는 이벤트 스레드 깨우기
	}
}

class ConsumerThread extends Thread{
	private MyLabel bar;
	public ConsumerThread(MyLabel bar) {
		this.bar = bar;
	}
	@Override
	public void run() {
		while(true) {
			try {
				sleep(200);
				bar.consume();  //0.2초마다 바를 1씩 줄인다.
			}catch(InterruptedException e) {
				return;
			}
		}
	}
}
public class TabAndThreadEx extends JFrame {
	private MyLabel bar = new MyLabel(100);  //바의 최대 크기를 100으로 설정
	
	public TabAndThreadEx(String title) {
		super(title);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		c.setLayout(null);
		bar.setBackground(Color.ORANGE);
		bar.setOpaque(true);
		bar.setLocation(20, 50);
		bar.setSize(300, 20);
		c.add(bar);
		
		//컨텐트팬에 키 이벤트 핸들러 등록
		c.addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				bar.fill();  //키를 누를 때마다 바가 1씩 증가한다.
			}
		});
		setSize(350,200);
		setVisible(true);
		
		c.setFocusable(true);
		c.requestFocus();  //컨텐트팬에게 키 처리권 부여
		ConsumerThread th = new ConsumerThread(bar);
		th.start();
	}
	
	public static void main(String[] args) {
		new TabAndThreadEx("아무키나 빨리 눌러 바 채우기");

	}

}
```

---

# 14장 고급 스윙 컴포넌트

skip~~~~~~~~~~~~~