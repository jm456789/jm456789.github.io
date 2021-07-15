---
layout: post

title: "JAVA Chapter09 자바 GUI 기초, AWT와 스윙(Swing) - GUI 패키지 계층 구조 / 스윙 패키지 사용을 위한 import문 / 스윙 응용프로그램에서 main() 메소드의 기능과 위치 / 스윙 프로그램의 종료 / 컨테이너와 배치"
excerpt: "GUI 패키지 계층 구조 / 스윙 패키지 사용을 위한 import문 / 스윙 응용프로그램에서 main() 메소드의 기능과 위치 / 스윙 프로그램의 종료 / 컨테이너와 배치"

categories:
  - JAVA
tags:
  - [JAVA]
  
toc: true
toc_sticky: true
 
date: 2021-07-15
last_modified_at: 2021-07-15
---

# 09. 자바 GUI 기초, AWT와 스윙(Swing)

기본적인거만. 디테일은 안드로이드에서 다시

GUI란 Graphical User interfaca의 약자로 이미지 혹은 그래픽을 이용하여 메뉴 등을 포함하는 화면을 구성하고, 키보드 외 마우스등의 편리한 입력도구를 이용하여 사용자가 입력하기 편하도록 만들어진 사용자 인터페이스이다.     
자바는 AWT와 Swing 패키지 등 어떤 언어보다 강력한 GUI 라이브러리를 제공한다.  

자바 언어는 GUI 응용프로그램을 쉽게 작성할 수 있도록 다양한 GUI 컴포넌트를 제공한다. 자바의 GUI 컴포넌트는 AWT 컴포넌트와 Swing 컴포넌트로 구분된다.

스윙(Swing) 컴포넌트의 이름은 AWT 컴포넌트와 구분하기 위해 모두 대문자 J로 시작한다.

AWT보다 스윙 사용을 권장한다. 최근에는 거의 모든 GUI응용플그램이 스윙기반으로 작성되고 있다.

---

### GUI 패키지 계층 구조

모든 GUI 컴포넌트들은 Component 클래스를 반드시 상속받으며, JApplet, JFrame, JDialog를 제외한 모든 스윙 컴포넌트들은 JComponent를 상속받는다.

##### 컨테이너

다른 GUI 컴포넌트를 포함할 수 있는 컴포넌트이다. 그러므로 컨테이너는 컴포넌트이면서 동시에 컨테이너다.

##### 컴포넌트

다른 컴포넌트를 포함할 수 없다.

##### 최상위 컨테이너

다른 컨테이너에 속하지 않고도 독립적으로 화면에 출력될 수 있는 컨테이너이다. JFrame, JDialog, JApplet이다. 그러나 이들을 제외한 나머지 컨테이너나 컴포넌트들은 다른 컨테이너에 부착되어야하고, 종국에는 최상위 컨테이너에 부착되어야만 화면에 출력된다.

---

### 스윙 패키지 사용을 위한 import문

```java
import javax.swing.*;   //스윙 패키지 사용
import java.awt.*;   //폰트 등 그래픽 처리를 위한 클래스들의 경로명
import java.awt.event.*;   //이벤트 처리에 필요한 기본 클래스들의
import javax.swing.*;   //스윙 컴포넌트 클래스들의 경로명
import javax.swing.event.*;   //스윙 이베트 처리에 필요한 클래스들의 
```
---

### 스윙 프레임과 컨텐트팬

스윙 프레임은 최상위 컨테이너이다. JFrame. JFrame 객체는 Frame, 메뉴바, 컨텐츠팬의 3공가으로 구성된다.

---

### 스윙 응용프로그램에서 main() 메소드의 기능과 위치

스윙 응용프로그램에서 main()의 기능은 최소화하는것이 좋다. 응용프로그램이 실행되는 시작점으로서 프레임을 생성하는 코드정도만 만들기

예제 9-2) 

```java
import javax.swing.*;
import java.awt.*;

public class ContentPaneEx extends JFrame{
	public ContentPaneEx() { //생성자
		setTitle("contenPane과 JFream");  //프레임 타이틀 달기
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);  //프레임 윈도우를 닫으면 프로그램을 종료하도록 설정
		
		Container contentPane = getContentPane();  //컨텐트 팬을 알아낸다.
		contentPane.setBackground(Color.BLUE);  //컨텐트팬의 색 블루
		contentPane.setLayout(new FlowLayout());  //컨텐트팬에 flowlayout 배치 관리자 
		
		contentPane.add(new JButton("OK"));
		contentPane.add(new JButton("Cancel"));
		contentPane.add(new JButton("Ignore"));
		
		setSize(300, 150);
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new ContentPaneEx();
	}

}
```

---

### 스윙 프로그램의 종료

자바에서 프로그램을 종료하려면 System.exite(0);을 한다.    
스윙 프레임의 윈도우 오른쪽 상단에 있는 x버튼은 프레임 윈도우를 닫는 버튼이지 프로그램을 종료시키는 버튼은 아니다.

##### main() 메소드가 종료한 뒤에도 프레임이 살아 있는 이유는 무엇인가?

자바 응용프로그램이 시작되면 자바 가상 기계는 main 스레드를 만들고 main()을 실행시킨다. 응용프로그램이 스레드를 만들지 않는 경우 main()이 종료하면 main스레드도 종료되며 더이상 살아있는 스레드가 없기 때문에 응용프로그램은 종료된다.    
그러나 스윙에서 JFrame 객체가 생성되면 main 스레드 외에 입력되는 키와 마우스의 움직임을 컴포넌트에게 이벤트로 전달하는 <u>이벤트 처리(분배) 스레드</u>가 자동으로 추가 생성된다. 그러므로 main 스레드가 종료하더라도 이벤트 처리 스레드는 살아있기 때문에 자바 응용프로그램은 종료되지 않고 사용자로부터 키와 마우스 입력을 계속 처리하게 되는 것이다.

---

### 컨테이너와 배치

컨테이너에 부착되는 컴포넌트들의 위치와 크기는 컨테이너 내부에 있는 <u>배치관리자</u>에 의해 결정된다. 

* 컨테이너마다 배치관리자가 하나씩 있다.
* 배치관리자는 컨테이너에 컴포넌트가 부착되는 시점에 컴포넌트의 위치와 크기를 결정한다.

##### 배치관리자의 종류

import java.awt.*;문이 필요하다.

* FloawLayout : 왼쪽에서 오른쪽으로 배치
* BorderLayout : 동(EAST), 서(WEST), 남(SOUTH), 북(NORTH), 중앙(CENTER)의 5개 영역으로 나누어 배치한다. 5개의 영역 중 하나를 반드시 지정해야하며 지정하지 않으면 중앙에 배치한다.
* GridLayout : 동일한 크기의 2차원 격자로 나누고 컴포넌트가 삽입되는 순서대로 좌에서 우로, 다시 위에서 아래로 배치
* CardLayout : 컴포넌트를 포개어 배치한다.

##### 디폴트 배치 관리자 

Window, JWindow / Frame, JFrame / Dialog, JDailog 는 BorderLayout
Pannel, JPannel / Applet, JApplet 은 FlowLayout

---

##### FlowLayout 배치 관리자


---

##### BorderLayout 배치 관리자

```java
import javax.swing.*;
import java.awt.*;

public class BorderLayoutEx extends JFrame{
	public BorderLayoutEx() {
		setTitle("BorderLayout Sample");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container c = getContentPane();
		
		c.setLayout(new BorderLayout(30, 20));
		c.add(new JButton("Calculate"), BorderLayout.CENTER);
		c.add(new JButton("add"), BorderLayout.NORTH);
		c.add(new JButton("sub"), BorderLayout.SOUTH);
		c.add(new JButton("mul"), BorderLayout.EAST);
		c.add(new JButton("div"), BorderLayout.WEST);
		
		setSize(300, 200);
		setVisible(true);
	}
	public static void main(String[] args) {
		new BorderLayoutEx();
	}

}
```

---

### 배치관리자가 없는 컨테이너

* 컴포넌트의 크기나 위치를 개발자가 결정하고자 하는 경우
* 마우스/키보드의 입력에 따라 컴포넌트들의 위치와 크기가 수시로 변하는 경우
* 여러 컴포넌트들이 겹치는 효과를 연출하고자 하는 경우

```java
container.setLayout(null);
```
