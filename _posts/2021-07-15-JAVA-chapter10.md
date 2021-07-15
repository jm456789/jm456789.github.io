---
layout: post

title: "JAVA Chapter10 자바의 이벤트 처리 - 이벤트 관련 용어 / 리스너 인터페이스 / 이벤트 리스너 작성방법(독립, 내부, 익명 클래스) / 어댑터 클래스 / Key 이벤트와 포커스 / 입력된 키 판별 / Mouse 이벤트"
excerpt: "이벤트 관련 용어 / 리스너 인터페이스 / 이벤트 리스너 작성방법(독립, 내부, 익명 클래스) / 어댑터 클래스 / Key 이벤트와 포커스 / 입력된 키 판별 / Mouse 이벤트"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 10. 자바의 이벤트 처리

### 이벤트 기반 프로그래밍

이벤트 기반 프로그래밍은 <u>이벤트의 발생에 의해 프로그램 실행 흐름이 결정</u>되는 방식의 프로그래밍 패러다임이다. 이벤트 기반 프로그래밍과 대조되는 개념은 프로그램 작성자에 의해 프로그램 흐름이 결정되는 방식이다. 이벤트 기반 응용프로그램은 각 이벤트를 처리하는 <u>이벤트 리스너</u>들을 보유하며, 이벤트가 발생할 때마다 리스너가 실행된다.     
이벤트 리스너는 <u>이벤트를 처리하는 프로그램 코드</u>로서 컴포넌트에 연결되어 있어야 작동된다.

##### 이벤트를 처리하는 과정에서 등장하는 이벤트 관련 용어

* 이벤트 소스 : 이벤트를 발생시킨 GUI 컴포넌트
* 이벤트 객체 : 발생한 이벤트에 대한 정보(이벤트 종류, 이벤트 소스, 화면 좌표, 눌러진 키)를 담는 객체로서, 이벤트에 따라 서로 다른 정보가 저장된다.
* 이베트 리스너 : 이벤트를 처리하는 코드로서 컴포넌트에 등록되어야 작동 가능하다.
* 이벤트 분배 스레드 : 이벤트 기반 프로그래밍의 핵심 요소로서 무한 루프를 실행하는 스레드이다. 자바 가상 기계로부터 이벤트의 발생을 통지받아, 이벤트 소스와 이벤트 종류를 결정하고 이에 따라 적절한 이벤트 객체를 생성하고 이벤트 리스너를 찾아 호출한다.

이벤트는 이벤트 분배 스레드에 의해 순서대로 처리된다. 그러므로 이벤트 리스너는 가능하면 짧게 작성해야 한다. 길어지게 되는경우 따로 스레드를 만들어 해결해야 한다.

---

### 이벤트 객체

이벤트 객체는 현재 발생한 이벤트에 관한 정보를 가진 객체이며, 이벤트 리스너에게 전달된다. 응용프로그램은 이벤트를 처리하기 위해 반드시 다음 import를 포함해야 한다.

```java
import java.awt.event.*;  //이벤트 처리가 필요한 모든 소스에 포함
import javax.swing.event.*;  //스윙 이벤트를 다루는 경우 추가 포함
```

이벤트 객체는 메소드를 통해 이벤트 정보를 제공한다. MouseEvent 객체의 메소드 예는 getButton(), getCickCount(), getPoint(), getX(), getY() 등이 있다.

---

### Object getSource()

모든 이베트가 객체에 있고, 이벤트 리스너에서 가장 많이 사용되는 메소드이다. 현재 발생한 이벤트의 소스 컴포넌트의 레퍼런스를 리턴한다.

---

### 리스너 인터페이스

이벤트 리스너란 이벤트를 처리하는 자바 프로그램 코드로서 클래스로 만든다. JDK는 이벤트 리스너 인터페이스(implements 사용)를 제공하며, 개발자는 이 인터페이스를 상속받고 추상 메소드를 모두 구현하여 이벤트 리스너를 작성한다.

```java
interface ActionListener{
    public void actionPerformed(ActionEvent e);  //Action 이벤트 발생 처리
}
```

버튼을 누르는 Action 이벤트가 발생하면 actionPerformed(ActionEvent e) 메소드가 호출되고, 이때 ActionEvent 객체가 인자로 전달된다.    
또한 MouseListener 인터페이스는 다음과 같이 5개의 메소드를 가지고있으며, 각 메소드는 마우스의 조작에 따라 발생하는 이벤트를 처리한다. 메소드에는 MouseEvent 객체가 인자로 전달된다.

```java
interface MouseListener{
    public void mousePressed(MouseEvent e);  //마우스 버튼이 눌러지는 순간
    public void mouseReleased(MouseEvent e);  //눌러진 마우스 버튼이 떼어지는 순간
    public void mouseClicked(MouseEvent e);  //마우스가 클릭되는 순간
    public void mouseEntered(MouseEvent e);  //마우스가 컴포넌트 위에 올라가는 순간
    public void mouseExited(MouseEvent e);  //마우스가 컴포넌트 위에서 내려오는 순간
}
```

---

### 이벤트 리스너 작성방법

##### 독립 클래스로 이벤트 리스너 작성(공통적으로 써야하는 이벤트의 경우에 사용)

```java
public class IndepClassListener extends JFrame {
	public IndepClassListener() {
		setTitle("Action 이벤트 리스너 예제");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		c.setLayout(new FlowLayout());
		JButton btn = new JButton("Action");
		btn.addActionListener(new MyActionListener());  //독립 클래스
		c.add(btn);		
		
		setSize(350,150);
		setVisible(true);
	}

	public static void main(String[] args) {
		new IndepClassListener();
	}

}

//01. 독립 클래스로 이벤트 리스너 작성
class MyActionListener implements ActionListener{
	public void actionPerformed(ActionEvent e) {
		JButton b = (JButton)e.getSource();  //이벤트 소스 버튼 알아내기. getsource는 이벤트가 발생된 객체. 리턴타입은 object. 지금은 jbutton으로 고정(object가 아닌). 어디서 발생했는지 알아내려면 getsource 사용. btn인지 text인지 모르니 object로 넘김.  //오브젝트에 넘겨줘서 바로 그냥 버튼으로 다운캐스팅
		if(b.getText().equals("Action")) {  //버튼의 문자열이 action인지 비교
			b.setText("액션");  //버튼의 문자열을 액션으로 변경set은 add가 아니라서 기존거를 바꿔라.
		}else {
			b.setText("Action");버튼의 문자열을 action으로 변경
		}
	}
}
```

##### 내부 클래스로 이벤트 리스너 작성(한 화면?에서 쓸 때 유리)

```java
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class IndepClassListener extends JFrame {   //여기 IndepClassListener랑
	public IndepClassListener() {
		setTitle("Action 이벤트 리스너 예제");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		c.setLayout(new FlowLayout());
		JButton btn = new JButton("Action");
		//02. 내부 클래스
		btn.addActionListener(new MyActionListener());
		c.add(btn);		
		
		setSize(350,150);
		setVisible(true);
	}
	
//	02. 내부 클래스. 이 클래스는 내부 클래스이므로 자신을 둘러싼 외부 클래스인 IndepClassListener나 상속받은 JFrame의 모든 멤버에 접근할 수 있다.
	class MyActionListener implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			JButton b = (JButton)e.getSource();
			if(b.getText().equals("Action")) {
				b.setText("액션");
			}else {
				b.setText("Action");
			}
			
      //IndepClassListener의 멤버나 JFrame의 멤버를 호출할 수 있음
			IndepClassListener.this.setTitle(b.getText());  //여기랑 동일해야함.  프레임의 타이틀에 버튼 문자열 출력. IndepClassListener.this에 유의하라
		}
	}

	public static void main(String[] args) {
		new IndepClassListener();
	}

}
```

##### 익명 클래스로 이벤트 리스너 작성(재활용 불가능)

```java
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class IndepClassListener extends JFrame {
	public IndepClassListener() {
		setTitle("Action 이벤트 리스너 예제");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		c.setLayout(new FlowLayout());
		JButton btn = new JButton("Action");
		c.add(btn);
		
		//03. 익명클래스
		btn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JButton b = (JButton)e.getSource();
				if(b.getText().equals("Action")) {
					b.setText("액션");
				}else {
					b.setText("Action");
				}
				
        //IndepClassListener의 멤버나 JFrame의 멤버를 호출할 수 있음
				setTitle(b.getText());
			}
		});
		
		setSize(350,150);
		setVisible(true);
	}	

	public static void main(String[] args) {
		new IndepClassListener();
	}

}
```

---

예제 10-4) 마우스로 문자열 이동시키기 - 마우스 이벤트 연습

```java
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MouseListenerEx extends JFrame {
	private JLabel la = new JLabel("Hello"); //Hello 출력하기 위한 레이블
	
	public MouseListenerEx() {
		setTitle("Mouse 이벤트 예제");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		c.addMouseListener(new MyMouseListener());  //컨텐트팬에 이벤트 리스너 달기
		
		c.setLayout(null);  //컨텐트팬의 배치관리자 삭제
		la.setSize(50, 20);  //레이블의 크기 설정
		la.setLocation(30, 30);  //레이블의 위치 설정
		c.add(la);  //레이블 컴포넌트 삽입
		
		setSize(250, 250);
		setVisible(true);
	}
	
  //Mouse 리스너 구현
	class MyMouseListener implements MouseListener{  //클래스안에 클래스
		public void mousePressed(MouseEvent e) {  //누르기. 마우스 버튼이 눌려진 위치(x, y)를 알아내어 hello 레이블의 위치를 (x, y)로 
			int x = e.getX();
			int y = e.getY();
			la.setLocation(x, y);
		}
		public void mouseReleased(MouseEvent e) {}
		public void mouseClicked(MouseEvent e) {}
		public void mouseEntered(MouseEvent e) {}
		public void mouseExited(MouseEvent e) {}
	}
	
	public static void main(String[] args) {		
		new MouseListenerEx();
	}

}

```

---

### 어댑터 클래스

리스너 인터페이스를 상속받아 이벤트 리스너를 구현할 때 리스너 인터페이스의 메소드를 모두 구현해야하는 부담이 있다. 이런 부담을 줄이기 위해 리스너 인터페이스를 미리 구현해 놓은 클래스가 <u>어댑터 클래스</u>다.
(어댑터클래스는 이미 인터페이스 상속 받아서 재정의해 놓은것, 인터페이스는 추상메소드? 다 재정의 해줘야함. 상속은 다 안써도 됨)

---

### Key 이벤트와 포커스

포커스란 키 입력의 독점권을 뜻한다.

어떤 컴포넌트에ㅔ 키를 입력하고자 하면 탭키나 마우스 클릭으로 포커스를 그 컴포넌트에게 이동시켜야 한다. 스윙 프로그램에서는 강제로 임의의 컴포넌트에 포커스를 주기 위해 다음 두 코드가 필요하다.
(두개 같이 쓰는것을 권장! 원래 아래거 하나있어도 된다)

```java
component.setFocusable(true);  //component가 포커스를 받을 수 있도록 설정한다.
component.requestFocus();  //component가 포커스를 주어 키 입력을 받을 수 있게 함
```

---

### Key 이벤트와 KeyListener

keyPressed()는 키를 누르는 순간에, keyReleased()는 누른 키를 떼는 순간에 호출되며, 문자 키(유니코드)인 경우에는 누른 키가 떼어지는 순간에 keyTyped()가 추가적으로 호출된다.
(home, function, up 키 등은 유니코드 값을 정의하지 않는다. 눌러도 실행 안됨. 뭐 상수값만 알면 된다?)

---

### 입력된 키 판별

##### char KeyEvent.getKeyChar()

입력된 키의 문자코드(유니코드 값)를 리턴한다.

##### int KeyEvent.getKeyCode();

유니코드 키를 포함한 모든 키에 대해 정수형 키 코드 값을 리턴한다. 키코드는 운영체제나 하드웨어에 따라 다를 수 있기 때문에 입력된 키를 판별하기 위해서는 반드시 <u>getKeyCode()</u>가 리턴한 키 코드와 <u>가상키 값</u>을 비교해야 한다. 가상키는 keyEvent 클래스에 VK_로 시작하는 static 상수로 선언되어 있다

예제 10-6)

```java
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class KeyListenerEx extends JFrame {
	private JLabel[] keyMessage;  //3개의 메시지를 출력할 레이블 컴포넌트 배열
	
	public KeyListenerEx() {
		setTitle("KeyListener 예제");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		Container c = getContentPane();
		c.setLayout(new FlowLayout());
		c.addKeyListener(new MyKeyListener());
		
    //레이블 배열을 3개 생성하고 각 레이블 컴포넌트 생성
		keyMessage = new JLabel[3];  //레이블 배열 생성
		keyMessage[0] = new JLabel("getKeyCode()");
		keyMessage[1] = new JLabel("getKeyCode()");
		keyMessage[2] = new JLabel("getKeyText()");
		
    //3개의 레이블 컴포넌트를 컨텐츠팬에 부착
		for(int i = 0; i <keyMessage.length; i++) {
			c.add(keyMessage[i]);
			keyMessage[i].setOpaque(true);  //스윙 컴포넌트의 배경색을 설정하기 위해 미리 setOpaque(true) 호출 배경색이 보이도록 불투명 속성 설정
			keyMessage[i].setBackground(Color.YELLOW);
		}
		
		setSize(300, 150);
		setVisible(true);
		
    //컨텐트팬이 키 입력을 받을 수 있도록 포커스 강제 지정
		c.setFocusable(true);
		c.requestFocus();
	}
	
	class MyKeyListener extends KeyAdapter{
		public void keyPressed(KeyEvent e) {
			int keyCode = e.getKeyCode();  //키 코드 알아내기
			char keyChar = e.getKeyChar();  // 키 문자 값 알아내기
			keyMessage[0].setText(Integer.toString(keyCode));  //키 코드 출력
			keyMessage[1].setText(Character.toString(keyChar));  //키 문자 출력
			keyMessage[2].setText(KeyEvent.getKeyText(keyCode));  //키 이름 문자 열 출력. 키 코드 값으로부터 키 이름 문자열을 알아내어 레이블에 출력
			
			System.out.println("KeyPressed");  //콘솔창에 메소드 이름 출력
		}
		public void keyReleased(KeyEvent e) {
			System.out.println("KeyReleased");
		}
		public void keyTyped(KeyEvent e) {
			System.out.println("KeyTyped");
		}
	}
	public static void main(String[] args) {
		new KeyListenerEx();
	}

}
```

---

### Mouse 이벤트

예제 10-9)

```java
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class MouseListenerAllEx extends JFrame{
	private JLabel la =new JLabel("No Mouse Event");  //메시지 출력 레이블 컴포넌트
	public MouseListenerAllEx() {
		setTitle("MouseListener와 MouseMotionListener 예제");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		Container c =getContentPane();
		c.setLayout(new FlowLayout());
		
		MyMouseListener listener = new MyMouseListener();  //리스너 객체 생성
		c.addMouseListener(listener);  //MouseListener 리스너 등록
		c.addMouseMotionListener(listener);  //MouseMotionListener 리스너 등록
		
		c.add(la);
		setSize(300, 200);
		setVisible(true);
	}
	
  //Mouse 리스너와 MouseMotion 리스너를 모두 가진 리스너 작성  
	class MyMouseListener implements MouseListener, MouseMotionListener{
		//MouseListener의 5개 구현
		public void mousePressed(MouseEvent e) {
			la.setText("mousePressed( " + e.getX() + ", " + e.getY() + ")");			
		}
		public void mouseReleased(MouseEvent e) {
			la.setText("MouseReleased(" + e.getX() + ", " + e.getY() + ")");
		}
		public void mouseClicked(MouseEvent e) {}
		public void mouseEntered(MouseEvent e) {
			Component c = (Component)e.getSource();  //마우스가 올라간 컴포넌트를 알아낸다
			c.setBackground(Color.CYAN);
		}
		public void mouseExited(MouseEvent e) {
			Component c = (Component)e.getSource();  //마우스가 내려간 컴포넌트를 알아낸다
			c.setBackground(Color.YELLOW);
		}
		
		//MouseMotionListener의 2개 메소드 구현
		public void mouseDragged(MouseEvent e) {  //마우스가 드래깅되는 동안 계속 호출
			la.setText("MouseDragged (" + e.getX() + ", " + e.getY() + ")");
		}
		public void mouseMoved(MouseEvent e) {  //마우스가 움직이는 동안 계속 
			la.setText("MouseMoved (" + e.getX() + "," + e.getY() + ")");
		}
	}
	public static void main(String[] args) {
		new MouseListenerAllEx();

	}

}
```

---

# 11. 기본적인 스윙 컴포넌트와 활용, 12. 그래픽은 앞에서 배운걸로 사용 가능하니 읽어보기?? skip~