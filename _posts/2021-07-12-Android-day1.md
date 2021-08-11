---
layout: post       

title: "Android "
excerpt: ""

categories:
  - Android
tags:
  - [Android, App]
  
toc: true
toc_sticky: true
 
date: 2021-07-12
last_modified_at: 2021-07-12
---

# 목차

- [목차](#목차)
- [첫째마당,](#첫째마당)
    - [버튼 누르면 토스트 메세지 띄우기, 네이버 접속 버튼, 전화걸기 버튼](#버튼-누르면-토스트-메세지-띄우기-네이버-접속-버튼-전화걸기-버튼)
- [둘째마당,](#둘째마당)
    - [프레임 레이아웃으로 버튼 누르면 이미지 전환](#프레임-레이아웃으로-버튼-누르면-이미지-전환)
        - [프레임 레이아웃과 뷰의 전환](#프레임-레이아웃과-뷰의-전환)
    - [드로어블 로 버튼 누르면 버튼 이미지 전환](#드로어블-로-버튼-누르면-버튼-이미지-전환)
    - [일정 영역 안에서 스크롤 생성 후, 마우스 좌표값 가져오기](#일정-영역-안에서-스크롤-생성-후-마우스-좌표값-가져오기)
    - [단말 방향을 전환](#단말-방향을-전환)
    - [토스트 모양과 위치 바꿔 보여주기, 스낵바 보여주기](#토스트-모양과-위치-바꿔-보여주기-스낵바-보여주기)
    - [알림 대화상자(알림창에 예, 아니오, 취소 버튼)](#알림-대화상자알림창에-예-아니오-취소-버튼)
    - [프로그레스바(막대, 원형, 무한로딩)](#프로그레스바막대-원형-무한로딩)
    - [레이아웃 인플레이션. 추가하기 버튼 누르면 하단에 다른 xml의 내용 표출](#레이아웃-인플레이션-추가하기-버튼-누르면-하단에-다른-xml의-내용-표출)
    - [여러 화면 만들고 화면 간 전환하기. 액티비티](#여러-화면-만들고-화면-간-전환하기-액티비티)
    - [인텐트. 버튼 누르면 전화걸기로 이동, 메뉴 화면 띄우기 누르면 다른 xml뜸](#인텐트-버튼-누르면-전화걸기로-이동-메뉴-화면-띄우기-누르면-다른-xml뜸)
    - [플래그 FLAG_ACTIVITY_SINGLE_TOP 연습. 다른 xml로 이동, 여러번 누르면 동일한 액티비티 사용](#플래그-flag_activity_single_top-연습-다른-xml로-이동-여러번-누르면-동일한-액티비티-사용)
    - [직렬화. 데이터 넘겨서 다른 xml이 데이터 받기.](#직렬화-데이터-넘겨서-다른-xml이-데이터-받기)
    - [액티비티의 수명주기와 SharedPreferences](#액티비티의-수명주기와-sharedpreferences)
    - [프래그먼트(부분화면) 만들어 화면에 추가하기](#프래그먼트부분화면-만들어-화면에-추가하기)
    - [한 화면에 두개의 프래그먼트 넣기](#한-화면에-두개의-프래그먼트-넣기)
    - [상단탭](#상단탭)
    - [하단탭](#하단탭)
    - [뷰페이저. 손가락으로 좌우 스크롤해서 넘겨볼 수 있음](#뷰페이저-손가락으로-좌우-스크롤해서-넘겨볼-수-있음)
    - [바로가기 메뉴 만들기(햄버거같이 옆으로 슬라이딩)](#바로가기-메뉴-만들기햄버거같이-옆으로-슬라이딩)
    - [앱 꺼져도 돌아가는거](#앱-꺼져도-돌아가는거)
    - [브로드캐스트 수신자(내가 필요한 정보 골라서 받음), 접속 권한 부여?](#브로드캐스트-수신자내가-필요한-정보-골라서-받음-접속-권한-부여)
    - [sms내용 액티비티에 나타내기](#sms내용-액티비티에-나타내기)
    - [리소스와 메니페스트의 사용, 그래들(빌드 자동화 도구) 이해하기](#리소스와-메니페스트의-사용-그래들빌드-자동화-도구-이해하기)
    - [나인패치(이미지 사이즈 늘리면 border 왜곡)](#나인패치이미지-사이즈-늘리면-border-왜곡)
    - [새로운 뷰 만들기?](#새로운-뷰-만들기)
    - [카드뷰, 버튼클릭시 리스트에서 사진이나 이름, 번호 바꾸기](#카드뷰-버튼클릭시-리스트에서-사진이나-이름-번호-바꾸기)
    - [리싸이클러뷰](#리싸이클러뷰)
    - [스피너(콤보박스, select)](#스피너콤보박스-select)
    - [애니메이션(확대축소, 이동, 회전, 투명도)](#애니메이션확대축소-이동-회전-투명도)
    - [페이지 슬라이딩](#페이지-슬라이딩)
    - [앱 화면에 웹브라우저 넣기(하이브리드앱)](#앱-화면에-웹브라우저-넣기하이브리드앱)
    - [시크바(유튜브에서 클릭시 점프 그거임)](#시크바유튜브에서-클릭시-점프-그거임)
    - [키패드 제어하기](#키패드-제어하기)
    - [앱 화면에 웹브라우저 넣기(하이브리드앱)](#앱-화면에-웹브라우저-넣기하이브리드앱-1)
    - [앱 화면에 웹브라우저 넣기(하이브리드앱)](#앱-화면에-웹브라우저-넣기하이브리드앱-2)
    - [앱 화면에 웹브라우저 넣기(하이브리드앱)](#앱-화면에-웹브라우저-넣기하이브리드앱-3)
    - [앱 화면에 웹브라우저 넣기(하이브리드앱)](#앱-화면에-웹브라우저-넣기하이브리드앱-4)

---

# 첫째마당, 

### 버튼 누르면 토스트 메세지 띄우기, 네이버 접속 버튼, 전화걸기 버튼

> 버튼 누르면 토스트 메세지 띄우기 (p.46), 네이버 접속 버튼, 전화걸기 버튼 (p.51)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button3"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="20dp"
        android:layout_marginLeft="20dp"
        android:onClick="onButton2Clicked"
        android:text="네이버 접속"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.0"
        app:layout_constraintStart_toEndOf="@+id/button2"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.868" />

    <Button
        android:id="@+id/button2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:onClick="onButton1Clicked"
        android:text="확인"
        android:textSize="20sp"
        android:textStyle="italic"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.167"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.868" />

    <Button
        android:id="@+id/button4"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:onClick="onButton3Clicked"
        android:text="전화걸기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.346"
        app:layout_constraintStart_toEndOf="@+id/button3"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.868" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code
package com.example.mytest01;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onButton1Clicked(View v){
        Toast.makeText(this, "토스트 메세지~", Toast.LENGTH_LONG).show();
    }

    public void onButton2Clicked(View v){
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://m.naver.com"));
        startActivity(intent);

    }

    public void onButton3Clicked(View v){
        Intent intent =new Intent(Intent.ACTION_VIEW, Uri.parse("tel:010-0001-0002"));
        startActivity(intent);
    }
}
```

---

# 둘째마당, 

### 프레임 레이아웃으로 버튼 누르면 이미지 전환

##### 프레임 레이아웃과 뷰의 전환

프레임 레이아웃은 가장 상위에 있는 하나의 뷰 또는 뷰그룹만 보여주는 방법.   
여러개의 뷰가 들어가면 중첩하여 쌓게 됨. 가장 단순하지만 여러 개의 뷰를 중첩한 후 각 뷰를 전환하여 보여주는 방식으로 자주 사용함.

> 버튼 누르면 이미지 전환 1 (p.143)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app2.jpg?raw=true)

```java
//xml code
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#FFFFFF"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button4"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_weight="0"
        android:onClick="onButton1Clicked"
        android:text="Button" />

    <FrameLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_weight="0">

        <ImageView
            android:id="@+id/imageView"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:visibility="invisible"
            app:srcCompat="@drawable/dream01" />

        <ImageView
            android:id="@+id/imageView2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:visibility="visible"
            app:srcCompat="@drawable/dream02" />
    </FrameLayout>

</LinearLayout>
```

```java
//java code
package com.example.mytest02_3;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    ImageView imageView;
    ImageView imageView2;
    int imageIndex = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imageView = findViewById(R.id.imageView);
        imageView2 = findViewById(R.id.imageView2);
    }

    public void onButton1Clicked(View v){
        changeImage();
    }

    private void changeImage(){
        if(imageIndex == 0){
            imageView.setVisibility(View.VISIBLE);
            imageView2.setVisibility(View.INVISIBLE);
            imageIndex = 1;
        }else if(imageIndex == 1){
            imageView.setVisibility(View.INVISIBLE);
            imageView2.setVisibility(View.VISIBLE);
            imageIndex = 0;
        }
    }
}
```

---

> 버튼 누르면 이미지 전환 2

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app3.jpg?raw=true)

```java
//xml code
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:onClick="onButton1Clicked"
        android:text="이미지 바꿔 보여주기" />

    <HorizontalScrollView
        android:id="@+id/hor_scrollView"
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <ScrollView
            android:id="@+id/scrollView"
            android:layout_width="match_parent"
            android:layout_height="match_parent">

            <ImageView
                android:id="@+id/imageView"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content" />
        </ScrollView>
    </HorizontalScrollView>

</LinearLayout>
```

```java
//java code
package com.example.mainactivity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.ScrollView;

public class MainActivity extends AppCompatActivity {
    ScrollView scrollView;
    ImageView imageView;
    BitmapDrawable bitmap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        scrollView = findViewById(R.id.scrollView);
        imageView = findViewById(R.id.imageView);
        scrollView.setHorizontalScrollBarEnabled(true);

        Resources res = getResources();
        bitmap = (BitmapDrawable) res.getDrawable(R.drawable.image01);
        int bitmapWidth = bitmap.getIntrinsicWidth();
        int bitmapHeight = bitmap.getIntrinsicHeight();

        imageView.setImageDrawable(bitmap);
         imageView.getLayoutParams().width = bitmapWidth;
         imageView.getLayoutParams().height = bitmapHeight;
    }

    public void onButton1Clicked(View v){
        changeImage();
    }

    private void changeImage(){
        Resources res = getResources();
        bitmap = (BitmapDrawable) res.getDrawable(R.drawable.image02);
        int bitmapWidth = bitmap.getIntrinsicWidth();
        int bitmapHeight = bitmap.getIntrinsicHeight();

        imageView.setImageDrawable(bitmap);
        imageView.getLayoutParams().width = bitmapWidth;
        imageView.getLayoutParams().height = bitmapHeight;
    }
}
```

---

### 드로어블 로 버튼 누르면 버튼 이미지 전환

드로어블은 뷰에 설정할 수 있는 객체이며 그 위에 그래픽을 그릴 수 있다. 

> 버튼이 눌렸을 때 눌린 이미지가 보이게 하고싶을 때 드로어블 사용 (p.167)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app4.jpg?raw=true)

```java
//xml code
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:background="@drawable/finger_drawable"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
//------------------------------------------------------------------------------------------
//drawable 폴더 오른쪽 버튼 -> new -> Drawable resource file
<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_pressed="true" android:drawable="@drawable/finger_pressed"/>
    <item android:drawable="@drawable/finger" />

</selector>
```

```java
//java code
package com.example.sampledrawable;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
```

---

### 일정 영역 안에서 스크롤 생성 후, 마우스 좌표값 가져오기

> 터치 이벤트 처리하기 (p.178)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app5.jpg?raw=true)

```java
//xml code
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <View
        android:id="@+id/view"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1"
        android:background="@android:color/holo_purple" />

    <View
        android:id="@+id/view2"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1"
        android:background="#CDDC39" />

    <ScrollView
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical">

            <TextView
                android:id="@+id/textView"
                android:layout_width="match_parent"
                android:layout_height="wrap_content" />
        </LinearLayout>
    </ScrollView>
</LinearLayout>
```

```java
//java code
package com.example.smapleevent;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView textView;

    GestureDetector detector; //1. 제스처 디텍터 객체 선언
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);

        View view = findViewById(R.id.view);
        view.setOnTouchListener(new View.OnTouchListener(){
           @Override
           public boolean onTouch(View view, MotionEvent motionEvent){
               int action = motionEvent.getAction();  //발생한 이벤트의 종류 가져오기

               float curX = motionEvent.getX();  //손가락이 눌린 위치값
               float curY = motionEvent.getY();

               if(action == MotionEvent.ACTION_DOWN){
                   println("손가락 눌림 : " + curX + ", " + curY);
               }else if(action == MotionEvent.ACTION_MOVE){
                   println("손가락 움직임 : " + curX + ", " + curY);
               }else if(action == MotionEvent.ACTION_UP){
                   println("손가락 뗌 : " + curX + ", " + curY);
               }

               return true;
           }
        });

        //제스처 디텍터 객체
        detector = new GestureDetector(this, new GestureDetector.OnGestureListener() {
            @Override
            public boolean onDown(MotionEvent e) {
                println("onDown() 호출됨.");
                return true;
            }

            @Override
            public void onShowPress(MotionEvent e) {
                println("onShowPress() 호출됨.");
            }

            @Override
            public boolean onSingleTapUp(MotionEvent e) {
                println("onSingleTapUp() 호출됨.");
                return true;
            }

            @Override
            public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent1, float v, float v1) {
                println("onScroll() 호출됨 : " + v + ", " + v1);
                return true;
            }

            @Override
            public void onLongPress(MotionEvent e) {
                println("onLongPress() 호출됨.");
            }

            @Override
            public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent1, float v, float v1) {
                println("onFling() 호출됨 : " + v + ", " + v1);
                return true;
            }
        });

        View view2 = findViewById(R.id.view2);
        view2.setOnTouchListener(new View.OnTouchListener(){  //2. 뷰를 터치했을 때 발생하는 터치 이벤트를 제스처 디텍터로 전달
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent){
                detector.onTouchEvent(motionEvent);
                return true;
            }
        });
    }

    public void println(String data){
        textView.append(data + "\n");
    }
}
```

---

### 단말 방향을 전환
  
* 세로방향에서 가로방향으로 전환되면 내용 다 지워지고 새로 그린다. 이때 입력한 값이 있으면 데이터 저장 후 가로화면 되고 데이터를 다시 불러와서 그려야 한다.
* layout 폴더를 복사 한 후 layout-land를 만들면 가로로 인식. (activity_main.xml 파일은 다 만든 후 그대로 복사해서 layout-land폴더에 붙여넣기 하면 자동으로 가로로 전환된다)

> 가로방향으로 틀면 맞춰서 나오게 하기. (p.187)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app6.jpg?raw=true)

```java
//xml code. activity_main.xml 세로
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="세로 방향"
        android:textSize="50sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="44dp"
        android:text="확인"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/editText" />

    <EditText
        android:id="@+id/editText"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="112dp"
        android:ems="10"
        android:inputType="textPersonName"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.497"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code
package com.example.layout_land;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    String name;
    EditText editText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {  //savedInstanceState는 name에 접근할 수 있는 변수. onCreate는 화면 전환되면 얘를 호출해서 다시 그리기!
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        showToast("onCreate 호출됨.");
        editText = findViewById(R.id.editText);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                name = editText.getText().toString();  //1.버튼을 클릭했을 때 사용자가 입력한 값을 name 변수에 할당
                showToast("입력된 값을 변수에 저장했습니다. : " + name);
            }
        });

        if(savedInstanceState != null){  //2. 이 화면이 초기화될 때 name 변수의 값 복원(해시테이블같이 key값과 value값). 비어있지 않으면 데이터 접근
            name = savedInstanceState.getString("name");  //키값이 name인 접근해서 값 뽑아와라. savedInstanceState은 name에 접근할 수 있는 변수
            showToast("값을 복원했습니다 : " + name);
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        showToast("onStart 호출됨.");
    }

    @Override
    protected void onStop() {
        super.onStop();
        showToast("onStop 호출됨.");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        showToast("onDestroy 호출됨.");
    }

    public void showToast(String data){
        Toast.makeText(this, data, Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onSaveInstanceState(Bundle outState){  //화면 바뀌기 전 자료 저장!
        super.onSaveInstanceState(outState);
        outState.putString("name", name);  //3. name 변수의 값 저장. 해시테이블같이 key값과 value값
    }

}
```

---

### 토스트 모양과 위치 바꿔 보여주기, 스낵바 보여주기

> 버튼 누르면 뜨는 토스트 메세지 디자인 변경, 스낵바 띄우기 (p.198)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app7.jpg?raw=true)

```java
//xml code
//activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:onClick="onButton1Clicked"
        android:text="모양 바꿔 듸우기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="1.0"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.023" />

    <Button
        android:id="@+id/button2"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_marginTop="8dp"
        android:onClick="onButton2Clicked"
        android:text="스낵바 띄우기"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.0"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/button" />
</androidx.constraintlayout.widget.ConstraintLayout>

//layout 폴더에 toastborder.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/toast_layout_root"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="horizontal"
    android:padding="10dp">

    <TextView
        android:id="@+id/text"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:background="@drawable/toast"
        android:padding="20dp"
        android:text="TextView"
        android:textColor="#673AB7"
        android:textSize="32sp" />
</LinearLayout>

//drawable 폴더에 toast.xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
    <stroke
        android:width="4dp"
        android:color="#ffffff00"
    />
    <solid
        android:color="#ff883300"
    />
    <padding
        android:left="20dp"
        android:top="20dp"
        android:right="20dp"
        android:bottom="20dp"
    />
    <corners
        android:radius="15dp"
    />

</shape>

```

```java
//java code
package com.example.sampletoast;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.snackbar.Snackbar;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onButton1Clicked(View v){
        LayoutInflater inflater = getLayoutInflater();

        View layout = inflater.inflate(
                R.layout.toastborder,
                (ViewGroup) findViewById(R.id.toast_layout_root));
        TextView text = layout.findViewById(R.id.text);

        Toast toast = new Toast(this);
        text.setText("모양 바꾼 토스트");
        toast.setGravity(Gravity.CENTER, 0, -100);
        toast.setDuration(Toast.LENGTH_SHORT);
        toast.setView(layout);
        toast.show();
    }

    public void onButton2Clicked(View v){
        Snackbar.make(v, "스낵바입니다.", Snackbar.LENGTH_LONG).show();
    }
}
```

---

### 알림 대화상자(알림창에 예, 아니오, 취소 버튼)

> 알림 대화상자 보여주기. (알림창에 예, 아니오, 취소 버튼있는거) (p.201)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app8.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app9.jpg?raw=true)

```java
//xml code
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="260dp"
        android:gravity="center"
        android:text="버튼을 누르면 대화상자가 뜹니다."
        android:textColor="#4D4E4C"
        android:textSize="25sp"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.491"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="116dp"
        android:background="#FFFFFF"
        android:gravity="center"
        android:text="띄우기"
        android:textSize="15dp"
        app:backgroundTint="#673AB7"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/textView" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code
package com.example.sampledialog;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                showMessage();
            }
        });
    }
    
    private void showMessage(){
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("안내");
        builder.setMessage("종료하시겠습니까?");
        builder.setIcon(android.R.drawable.ic_dialog_alert);  //android.R은 안드로이드 자체 제공

        builder.setPositiveButton("예", new DialogInterface.OnClickListener() {  //익명메소드 사용
            @Override
            public void onClick(DialogInterface dialog, int which) {
                String message = "예 버튼이 눌렸습니다.";
                textView.setText(message);
            }
        });
                
        builder.setNeutralButton("취소", new DialogInterface.OnClickListener() {  //DialogInterface은 interface 빈껍데기, 내용x
            @Override
            public void onClick(DialogInterface dialog, int which) {
                String message = "취소 버튼이 눌렸습니다.";
                textView.setText(message);
            }
        });

        builder.setNegativeButton("아니오", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                String message = "아니오 버튼이 눌렸습니다.";
                textView.setText(message);
            }
        });

        AlertDialog dialog = builder.create();  //실제로 만들어내기
        dialog.show();  //실제로 보여주기
    }
}
```

---

### 프로그레스바(막대, 원형, 무한로딩)

> 막대 프로그레스바, 원형(무한로딩) 프로그래스바 (p.205)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app15.jpg?raw=true)

```java
//xml code
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <ProgressBar
        android:id="@+id/progressBar"
        style="?android:attr/progressBarStyleHorizontal"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:max="100" />

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="horizontal">

        <Button
            android:id="@+id/button"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="보여주기" />

        <Button
            android:id="@+id/button2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="닫기" />
    </LinearLayout>
</LinearLayout>
```

```java
//java code
package org.techtown.sampleprogress;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    ProgressDialog dialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ProgressBar progressBar = findViewById(R.id.progressBar);
        progressBar.setIndeterminate(false);
        progressBar.setProgress(80);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dialog = new ProgressDialog(MainActivity.this);
                dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                dialog.setMessage("데이터를 확인하는 중입니다.");
                dialog.show();
            }
        });

        Button button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (dialog != null) {
                    dialog.dismiss();  //dismiss는 종료
                }
            }
        });

    }

}
```

### 레이아웃 인플레이션. 추가하기 버튼 누르면 하단에 다른 xml의 내용 표출

인플레이션이란 XML 레이아웃의 내용이 메모리에 객체화되는 과정.

---

> 레이아웃 인플레이션. 다른 xml파일의 레이아웃을 부분 보여주기(부분화면), activity_main.xml이 아닌 다른 xml로 시작하는 방법. 부분화면을 메모리에 객체화하려면 인플레이터를 사용해야한다!!!!!!!!!!!! (p.212)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app10.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app11.jpg?raw=true)

```java
//xml code. activity_main.xml
activity_main.xml은 아무것도 없음. 다른 액티비티로 시작하는 방법?을 알려주려고

//xml code. activity_menu.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <TextView
        android:id="@+id/textView"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="버튼을 눌러 부분 화면을 추가하세요"
        android:textSize="20sp" />

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="추가하기" />

    <LinearLayout
        android:id="@+id/container"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical"></LinearLayout>
</LinearLayout>

//xml code. sub1.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <TextView
        android:id="@+id/textView"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="부분 화면 1"
        android:textSize="30sp" />

    <CheckBox
        android:id="@+id/checkBox"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="동의합니다" />
</LinearLayout>

```

```java
//java code. MenuActivity.java
package com.example.samplelayoutinflater;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;

public class MenuActivity extends AppCompatActivity {
    LinearLayout container;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        container = findViewById(R.id.container);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                LayoutInflater inflater = (LayoutInflater)
                        getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                inflater.inflate(R.layout.sub1, container, true);
                CheckBox checkBox = container.findViewById(R.id.checkBox);
                checkBox.setText("로딩되었어요.");
            }
        });
    }
}
```

```java
//AndroidManifest.xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.samplelayoutinflater">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SampleLayoutInflater">
        <activity android:name=".MainActivity"></activity>  //여기랑
        <activity android:name=".MenuActivity">  //여기 수정해야함
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

---

### 여러 화면 만들고 화면 간 전환하기. 액티비티

* 액티비티. 띄웠던 액티비티로부터 다시 원래의 액티비티로 돌아오면서 응답(결과)을 받아 처리하는 코드 필요->startActivityForResult

>  메뉴 화면 띄우기 누르면 다른창 뜨고, 돌아가기 버튼 누르면 다시 메인으로 감(p.222)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app12.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app13.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app14.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="메뉴 화면 띄우기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>

//xml code. activity_menu.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MenuActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="돌아가기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//AndroidManifest.xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.sampleintent">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SampleIntent">
        <activity android:name=".MenuActivity"
            android:label="메뉴 액티비티"  //추가
            android:theme="@style/Theme.AppCompat.Dialog">  //추가
        </activity>
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

```java
//java code. MainActivity.java
package com.example.sampleintent;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    public static final int REQUEST_CODE_MENU = 101;  //코드값은 상수로 만드는게 좋다!

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), MenuActivity.class);
                startActivityForResult(intent, REQUEST_CODE_MENU);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data){  //requestCode->101, resultCode->Result_ok, Intent(key, value)
        super.onActivityResult(requestCode, resultCode, data);

        if(requestCode == REQUEST_CODE_MENU){
            Toast.makeText(getApplicationContext(),
                    "onActivityResult 메서드 호출됨. 요청 코드 : " + requestCode + ", 결과 코드 : " + resultCode, Toast.LENGTH_LONG).show();
            if(resultCode == RESULT_OK){
                String name = data.getStringExtra("name");  //key인 name의 value를 뽑아서 String name에 저장
                Toast.makeText(getApplicationContext(), "응답으로 전달된 name : " + name, Toast.LENGTH_LONG).show();
            }
        }
    }

    protected void print()
    {
        System.out.print("1111");
    }
}

//java code. MenuActivity.java
package com.example.sampleintent;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MenuActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();  //intent는 명령서
                intent.putExtra("name", "mike");  //key, value. 여러개의 데이터를 한군데에 저장하려면 해시맵구조가 가장 정합한 자료구조임.
                setResult(RESULT_OK, intent);  //RESULT_OK 결과코드, intent key와 value를 main에 넘겨줌.
                finish();  //끝냈으니 메인으로 가져온 intent에 있는 값을 뽑아다 쓰면 된다.
            }
        });
    }
}
```

---

### 인텐트. 버튼 누르면 전화걸기로 이동, 메뉴 화면 띄우기 누르면 다른 xml뜸

* 인텐트는 명령 또는 데이터를 전달하는데 사용. 명령서같은거   
* startActivity 메서드는 화면에 띄울 때,   
* startService 메서드는 서비스를 시작할 때(눈에 보이지 않는 프로그램. 예를들어 background),   
* broadcastIntent 메서드는 인텐트 객체를 브로드캐스팅 방식으로 전송(듣던 안듣던 방송함. 사방팔방 정보를 뿌리면 필요한 앱들만 정보를 가져감)
* MINE은 URI의 패턴에 따라서 뭘 실행할지 정의해 놓은것

> 전화걸기 버튼 누르면 전화걸기로 이동, 메뉴 화면 띄우기 누르면 다른 xml뜸 (p.232)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app16.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <EditText
        android:id="@+id/editText"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:ems="10"
        android:inputType="textPersonName"
        android:text="tel:010-1000-1000"
        android:textSize="24sp" />

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="전화걸기" />

    <Button
        android:id="@+id/button2"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="메뉴 화면 띄우기" />
</LinearLayout>

//xml code. activity_menu.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MenuActivity">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="이게맞나"
        tools:layout_editor_absoluteX="197dp"
        tools:layout_editor_absoluteY="225dp" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code. MainActivity.java
package com.example.samplecallintent;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    EditText editText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editText = findViewById(R.id.editText);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                String data = editText.getText().toString();

                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(data));  //Uri.parse 일반 문자열을 uri타입으로 변경
                startActivity(intent);
            }
        });

        Button button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                ComponentName name = new ComponentName("com.example.samplecallintent",
                        "com.example.samplecallintent.MenuActivity");
                intent.setComponent(name);
                startActivityForResult(intent, 101);
            }
        });
    }
}

```

### 플래그 FLAG_ACTIVITY_SINGLE_TOP 연습. 다른 xml로 이동, 여러번 누르면 동일한 액티비티 사용

플래그를 이해하려면 액티비티가 처리되는 방식을 이해해야 합니다. 스택은 액티비티를 차곡차곡 쌓아두었다가 가장 상위에 있던 액티비티가 없어지면 이전의 액티비티가 다시 화면에 보이게 합니다. 만약 동일한 액티비티를 여러 번실행한다면 동일한 액티비티가 여러 개 스택에 들어가게 되고 동시에 데이터를 여러 번 접근하거나 리소스를 여러 번 사용하는 문제가 발생할 수 있습니다. 이러한 문제를 해결할수 있도록 도와주는게 플래그.

* FLAG_ACTIVITY_SINGLE_TOP : 액티비티를 생성할 때 이미 생성된 액티비티가 있으면 그대로 사용해라. 기존에 만든 동일한 액티비티 그대로 사용
* FLAG_ACTIVITY_NO_HISTORY : 처음 이후에 실행된 액티비티는 액티비티 스택에 추가되지 않는다. 항상 맨 처음에 실행되었던 액티비티가 바로 보임. 알람 이벤트가 발생하여 한번 알림 화면을 보여주고 싶을 때 유용
* FLAG_ACTIVITY_CLEAR_TOP : 이 액티비티 위에 있는 다른 액티비티 모두 종료.홈같은거에 유용
* 부가데이터 : intent에 데이터를 담아서 넘긴다.
* 번들(Bundle) : 데이터를 저장 할 수 있는 맵과 동일한 구조. putExtra()->번들로 넘겨줌, getStringExtra()/getIntExtra()/getBooleanExtra->넘어와서 받은거 get써서 사용
* 직렬화 : 바이트 단위로 배열로 저장. 클래스 하나를 통째로 넘기고싶다 할 때 직렬화 사용

---

> FLAG_ACTIVITY_SINGLE_TOP -> 액티비티를 생성할 때 이미 생성된 액티비티가 있으면 그 액티비티를 그대로 사용하라는 플래그.
> 1번 버튼 누르면 다른 xml로 이동하고, 2번을 여러번 누르면 기존에 만든 동일한 액티비티를 그대로 사용, 홈으로 누르면 다시 1번으로 이동

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app17.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app18.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="1번?"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>

//xml code. activity_activity.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".ActivityActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="2번보기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.213" />

    <Button
        android:id="@+id/button3"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="홈으로"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/button" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code. MainActivity.java
package com.example.test_new20210713;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    Button btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn = findViewById(R.id.button);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ActivityActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                startActivity(intent);
            }
        });
    }
}

//java code. ActivityActivity.java
package com.example.test_new20210713;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class ActivityActivity extends AppCompatActivity {
    Button btn;
    Button btn3;
    String msg ="hello";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activity);

        btn = findViewById(R.id.button);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ActivityActivity.class);
                intent.putExtra("msg", msg);
                intent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
                startActivity(intent);
            }
        });

        btn3 = findViewById(R.id.button);
        btn3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ActivityActivity.class);
                startActivity(intent);
            }
        });
    }

    @Override
    protected void onNewIntent(Intent intent){
        super.onNewIntent(intent);
        if(intent != null){
            String msg = intent.getStringExtra("msg");
            Toast.makeText(getApplicationContext(), msg, Toast.LENGTH_LONG).show();
        }
    }
}
```

### 직렬화. 데이터 넘겨서 다른 xml이 데이터 받기.

* 부가데이터는 intent에 데이터를 담아서 넘긴다.   
* 인텐트 안에 번들(Bundle)이 있고 번들은 데이터를 저장할 수 있는 맵과 동일한 구조.   
* putExtra()로 번들에 문자열 넣고, getStringExtra()로 번들에 문자열 빼기.   
* intent putExtra -> 번들로 넘겨줌 / getString, getIntExtra, getBooleanExtra로 넘어와서 받은거 get 써서 사용

클래스 하나를 통째로 넘기고싶다 -> 직렬화 사용. 바이트 단위로 배열로 저장. 많이쓰인다고 했었나..?

---

> 서브화면으로 이동해서 데이터 전달받기. Parcelable 인터페이스를 사용해서 객체를 정의해 데이터를 전달 (p.240)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app19.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app20.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="메뉴 화면 띄우기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>

//xml code. activity_menu.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MenuActivity">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginBottom="140dp"
        android:text="전달 받은 데이터"
        app:layout_constraintBottom_toTopOf="@+id/button"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent" />

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="돌아가기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code. MainActivity.java
package com.example.sampleparcelable;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    public static final int REQUEST_CODE_MENU = 101;
    public static final String KEY_SIMPLE_DATA = "data";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), MenuActivity.class);
                SimpleData data = new SimpleData(100, "HELLO Android");  //1. SimpleData 객체 생성
                intent.putExtra(KEY_SIMPLE_DATA, data);  //인텐트에 부가 데이터로 넣기. //data는 SimpleData이자 Parcelable이기도 함
                startActivityForResult(intent, REQUEST_CODE_MENU);  //menu에 넘긴다. menu는 getIntent로 받음
            }
        });
    }
}

//java code. MenuActivity.java
package com.example.sampleparcelable;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MenuActivity extends AppCompatActivity {
    TextView textView;

    public static final String KEY_SIMPLE_DATA = "data";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        textView = findViewById(R.id.textView);
        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.putExtra("name", "mike");
                setResult(RESULT_OK, intent);

                finish();
            }
        });

        Intent intent = getIntent();  //MainActivity에서 넘긴걸 getIntent로 받는다
        processIntent(intent);
    }

    private void processIntent(Intent intent){
        if(intent != null){
            Bundle bundle = intent.getExtras();
            SimpleData data = bundle.getParcelable(KEY_SIMPLE_DATA);
            if(intent != null){
                textView.setText("전달 받은 데이터\n Number : " + data.number + "\nMessage : " + data.message);
            }
        }
    }
}

//java code. SimpleData.java
//p.241
package com.example.sampleparcelable;

import android.os.Parcel;
import android.os.Parcelable;

public class SimpleData implements Parcelable {  //가.implements Parcelable 인터페이스 구현!!
    int number;
    String message;

    public SimpleData(int num, String msg){
        number = num;  //순서 중요함!
        message = msg;  //순서 중요함!
    }

    //이 아래는 그냥 규칙!!!!!!
    public SimpleData(Parcel src){  //1. Parcel 객체에서 읽기
        number = src.readInt();  //순서 중요함!
        message = src.readString();   //순서 중요함!
    }


    public static final Parcelable.Creator CREATOR = new Parcelable.Creator(){  //나. CREATOR!!해서 직렬화 하기!! //CREATOR 상수 정의

        @Override
        public SimpleData createFromParcel(Parcel in) {
            return new SimpleData(in);  //3. SimpleDats 생성자를 호출해 Parcel 객체에서 읽기
        }

        public SimpleData[] newArray(int size){
            return new SimpleData[size];
        }
    };

    public int describeContents(){
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags){ //Parcel 객체로 쓰기
        dest.writeInt(number);  //순서 중요함!
        dest.writeString(message);  //순서 중요함!
    }
}
```

---

### 액티비티의 수명주기와 SharedPreferences

> App 프로세스 알고, input에 텍스트 썼던거 앱 껐다 켜도 저장되어있게. SharedPreferences를 저장소라고 생각. 자기만 접근 가능. 앱이 꺼져도 저장됨 ex)자동로그인 (p.252)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app21.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="188dp"
        android:text="메뉴 화면 띄우기"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="TextView"
        app:layout_constraintBottom_toTopOf="@+id/nameInput"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/button" />

    <EditText
        android:id="@+id/nameInput"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginBottom="204dp"
        android:ems="10"
        android:inputType="textPersonName"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.497"
        app:layout_constraintStart_toStartOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>

//xml code. activity_menu.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MenuActivity">

    <Button
        android:id="@+id/button2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="돌아가기"
        tools:layout_editor_absoluteX="183dp"
        tools:layout_editor_absoluteY="195dp" />
</androidx.constraintlayout.widget.ConstraintLayout>

```

```java
//java code. MainActivity.java
package com.example.samplelifecycle;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    EditText nameInput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {  //처음에 만들어졌을 때 호출. 시간이 많이 걸리는 작업은 여기에 적지 않는다! 변수나 레이아웃 초기화를 여기에 적음~
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        nameInput = findViewById(R.id.nameInput);
        Toast.makeText(this, "OnCreate 호출됨", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onStart() {  //화면에 보이기 바로 전에 호출
        super.onStart();

        Toast.makeText(this, "onStart 호출됨", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onResume() {  //사용자와 상호작용하기 바로 전에 호출. 데이터 처리는 대부분 여기!!! ex) 포인트 사용 바코드같은거
        super.onResume();

        Toast.makeText(this, "onResume 호출됨", Toast.LENGTH_LONG).show();
        restoreState();
    }

    @Override
    protected void onPause() {  //또다른 액티비티를 시작하려고 할 때 호출. 실행->일시정지할 때. ex) 포인트 메인화면에서 바코드 화면 킬 때, 다이얼로그 화면 켰을 때
        super.onPause();

        Toast.makeText(this, "onPause 호출됨", Toast.LENGTH_LONG).show();
        saveState();
    }
    
    @Override
    protected void onStop() {  //액티비티가 사용자에게 더이상 보이지 않을 때 호출. 소멸되거나 또다른 액티비티가 화면을 가릴 때 호출. 액티비티가 이 상태에 들어가면 시스템은 액티비티를 강제종료 가능. 일시정지->중지
        super.onStop();

        Toast.makeText(this, "onStop 호출됨", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onDestroy() {  //소멸되어 없어지기 전에 호출. 중지->소멸
        super.onDestroy();

        Toast.makeText(this, "onDestroy 호출됨", Toast.LENGTH_LONG).show();
    }

    //onRestart : 중지된 이후에 호출. 이 메서드 다음에는 항상 onStart 메서드가 호출.
    //위에 수명주기(Life Cycle) 메서드 호출 순서는 onCreate -> onStart -> onResume -> onPause -> onStop -> onDestroy    
    //아래는 SharedPreferences. input에 텍스트 써 넣을 시 데이터 불러오고 저장하고 삭제하는거
    
    protected void restoreState(){  //SharedPreferences 데이터 불러옴
        SharedPreferences pref = getSharedPreferences("pref", Activity.MODE_PRIVATE);
        if((pref != null) && (pref.contains("name"))){
            String name = pref.getString("name", "");
            nameInput.setText(name);
        }
    }

    protected void saveState(){  //SharedPreferences 데이터 저장
        SharedPreferences pref = getSharedPreferences("pref", Activity.MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("name", nameInput.getText().toString());
        editor.commit();
    }

    protected void clearState(){  //SharedPreferences 데이터 삭제
        SharedPreferences pref = getSharedPreferences("pref", Activity.MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.clear();
        editor.commit();
    }
}

//java code. MenuActivity.java
없음
```

---

### 프래그먼트(부분화면) 만들어 화면에 추가하기

* 하나의 화면을 여러 부분으로 나눠서 보여주거나 각각의 부분 화면 단위로 바꿔서 보여주고 싶을 때 사용하는 것이 프래그먼트이다.(분리되어있는 독립적인 조각화면 )
* 프래그먼트가 제대로 <u>동작</u>하는 시점은 프래그먼트가 메모리에 만들어진 시점이 아니라 <u>액티비티에 올라가는 시점.</u>
* 프래그먼트 매니저가 관리해준다?
* 프래그먼트도 부분화면이므로 화면에 뷰들을 배치할 때는 XML 레이아웃으로 만든다. 그다음 프래그먼를 위한 자바 소스는 Fragment 클래스를 <u>상속</u>하여 만든다
  
트랜잭션 : ABC인데 AB만 진행되다가 오류 발생하면 AB도 다 지워버리는게 완전히 되어야 함.

> 부분화면 불러와서 보여주기. (p.268)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app22.jpg?raw=true)
![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app23.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/container"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity" >

    <fragment
        android:id="@+id/mainFragment"
        android:name="com.example.samplefragment.MainFragment"
        android:layout_width="match_parent"
        android:layout_height="match_parent">
    </fragment>

</FrameLayout>

//xml code. fragment_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainFragment" >

    <TextView
        android:id="@+id/textView"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="메인 프래그먼트"
        android:textSize="30sp" />

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="메뉴 화면으로" />
</LinearLayout>

//xml code. fragment_menu.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@android:color/holo_orange_light"
    android:orientation="vertical"
    tools:context=".MainFragment" >

    <TextView
        android:id="@+id/textView"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="메뉴 프래그먼트"
        android:textSize="30sp" />

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="메뉴 화면으로" />
</LinearLayout>

```

```java
//java code. MainActivity.java
package com.example.samplefragment;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {
    MainFragment mainFragment;
    MenuFragment menuFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mainFragment = (MainFragment)getSupportFragmentManager().findFragmentById(R.id.mainFragment);
        menuFragment = new MenuFragment();
    }

    public void onFragmentChange(int index){
        if(index == 0){
            getSupportFragmentManager().beginTransaction().replace(R.id.container, menuFragment). commit();
        }else if(index == 1){
            getSupportFragmentManager().beginTransaction().replace(R.id.container, mainFragment). commit();
        }
    }
}

//java code. MainFragment.java
package com.example.samplefragment;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

public class MainFragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup)inflater.inflate(R.layout.fragment_main, container, false);

        Button button = rootView.findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity activity = (MainActivity)getActivity();
                activity.onFragmentChange(0);
            }
        });

        return rootView;
    }
}

//java code. MenuFragment.java
package com.example.samplefragment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.fragment.app.Fragment;

public class MenuFragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup)inflater.inflate(R.layout.fragment_menu, container, false);

        Button button = rootView.findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity activity = (MainActivity)getActivity();
                activity.onFragmentChange(1);
            }
        });

        return rootView;
    }
}
```

---

### 한 화면에 두개의 프래그먼트 넣기

drawable 폴더에 이미지 세개 넣어야 함

> 화면의 위쪽과 아래쪽을 나눈 후 위쪽에는 이미지 선택이 가능한 리스트가 보이는 프래그먼트를 만들어 넣고 아래쪽에는 선택된 이미지가 보이는 프래그먼트 (p.279)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app24.jpg?raw=true)
![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app25.jpg?raw=true)

```java
//xml code. 1. fragment_list.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".fragment_list" >

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="첫 번째 이미지" />

    <Button
        android:id="@+id/button2"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="두 번째 이미지" />

    <Button
        android:id="@+id/button3"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="세 번째 이미지" />
</LinearLayout>

//xml code. 4. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <fragment
        android:id="@+id/listFragment"
        android:name="com.example.samplefragment2.ListFragment"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1" />

    <fragment
        android:id="@+id/viewerFragment"
        android:name="com.example.samplefragment2.ViewerFragment"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1" />

</LinearLayout>

```

```java
//java code. 2. ListFragment.java
package com.example.samplefragment2;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.example.samplefragment2.R;

public class ListFragment extends Fragment {

    public static interface ImageSelectionCallback {
        public void onImageSelected(int position);
    }

    public ImageSelectionCallback callback;

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);

        if (context instanceof ImageSelectionCallback) {
            callback = (ImageSelectionCallback) context;
        }
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.fragment_list, container, false);

        Button button = rootView.findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (callback != null) {
                    callback.onImageSelected(0);
                }
            }
        });

        Button button2 = rootView.findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (callback != null) {
                    callback.onImageSelected(1);
                }
            }
        });

        Button button3 = rootView.findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (callback != null) {
                    callback.onImageSelected(2);
                }
            }
        });

        return rootView;
    }

}

//java code. 3. ViewerFragment.java
package com.example.samplefragment2;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.example.samplefragment2.R;

public class ViewerFragment extends Fragment {
    ImageView imageView;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.fragment_viewer, container, false);
        imageView = rootView.findViewById(R.id.imageView);

        return rootView;
    }

    public void setImage(int resId) {
        imageView.setImageResource(resId);
    }

}

//java code. 5. MainActivity.java
package com.example.samplefragment2;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;

import com.example.samplefragment2.R;

public class MainActivity extends AppCompatActivity implements com.example.samplefragment2.ListFragment.ImageSelectionCallback {
    ListFragment listFragment;
    com.example.samplefragment2.ViewerFragment viewerFragment;
    int[] images = {R.drawable.dream01, R.drawable.dream02, R.drawable.dream03};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        FragmentManager manager = getSupportFragmentManager();
        listFragment = (ListFragment) manager.findFragmentById(R.id.listFragment);
        viewerFragment = (com.example.samplefragment2.ViewerFragment) manager.findFragmentById(R.id.viewerFragment);
    }

    @Override
    public void onImageSelected(int position) {
        viewerFragment.setImage(images[position]);
    }
}


```

---

### 상단탭

> 상단탭 (p.297)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)
![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app27.jpg?raw=true)

```java
//xml code. 1. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <androidx.coordinatorlayout.widget.CoordinatorLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <com.google.android.material.appbar.AppBarLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:theme="@style/ThemeOverlay.AppCompat.Dark.ActionBar">

            <androidx.appcompat.widget.Toolbar
                android:id="@+id/toolbar"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:background="?colorPrimaryDark"
                android:elevation="1dp"
                android:theme="@style/ThemeOverlay.AppCompat.Dark">

                <TextView
                    android:id="@+id/titleText"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:text="타이틀"
                    android:textAppearance="@style/Base.TextAppearance.Widget.AppCompat.Toolbar.Title" />

            </androidx.appcompat.widget.Toolbar>

            <com.google.android.material.tabs.TabLayout
                android:id="@+id/tabs"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:background="@android:color/background_light"
                android:elevation="1dp"
                app:tabGravity="fill"
                app:tabMode="fixed"
                app:tabSelectedTextColor="?colorAccent"
                app:tabTextColor="?colorPrimary" />
        </com.google.android.material.appbar.AppBarLayout>

        <FrameLayout
            android:id="@+id/container"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            app:layout_behavior="@string/appbar_scrolling_view_behavior">

        </FrameLayout>

    </androidx.coordinatorlayout.widget.CoordinatorLayout>

</RelativeLayout>

//xml code. 2. fragment1.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@android:color/holo_blue_bright"
    android:orientation="vertical"
    tools:context=".Fragment1">

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="첫 번째" />
</LinearLayout>

//xml code. 3. fragment2.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@android:color/holo_orange_light"
    android:orientation="vertical"
    tools:context=".Fragment1">

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="두 번째" />
</LinearLayout>

//xml code. 4. fragment3.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@android:color/holo_purple"
    android:orientation="vertical"
    tools:context=".Fragment1">

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="세 번째" />
</LinearLayout>

//\app\src\main\res\values 에서 themes.xml
<resources xmlns:tools="http://schemas.android.com/tools">
    <!-- Base application theme. -->
    <style name="Theme.SampleTab" parent="Theme.MaterialComponents.DayNight.NoActionBar">  //이부분 변경
        <!-- Primary brand color. -->
        <item name="colorPrimary">@color/purple_500</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/white</item>
        <!-- Secondary brand color. -->
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
        <!-- Status bar color. -->
        <item name="android:statusBarColor" tools:targetApi="l">?attr/colorPrimaryVariant</item>
        <!-- Customize your theme here. -->
    </style>
</resources>

```

```java
//java code. 5. Fragment1.java
package org.techtown.tab;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;

public class Fragment1 extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment1, container, false);
    }

}

//java code. 5. Fragment2.java
package org.techtown.tab;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;

public class Fragment1 extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment2, container, false);
    }

}

//java code. 5. Fragment3.java
package org.techtown.tab;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;

public class Fragment1 extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment3, container, false);
    }

}

//java code. 6. MainActivity.java
package org.techtown.tab;

import android.os.Bundle;
import android.util.Log;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;

import com.google.android.material.tabs.TabLayout;

public class MainActivity extends AppCompatActivity {

    Toolbar toolbar;

    Fragment1 fragment1;
    Fragment2 fragment2;
    Fragment3 fragment3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        ActionBar actionBar = getSupportActionBar();
        actionBar.setDisplayShowTitleEnabled(false);

        fragment1 = new Fragment1();
        fragment2 = new Fragment2();
        fragment3 = new Fragment3();

        getSupportFragmentManager().beginTransaction().replace(R.id.container, fragment1).commit();

        TabLayout tabs = findViewById(R.id.tabs);
        tabs.addTab(tabs.newTab().setText("통화기록"));
        tabs.addTab(tabs.newTab().setText("스팸기록"));
        tabs.addTab(tabs.newTab().setText("연락처"));
        tabs.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                int position = tab.getPosition();
                Log.d("MainActivity", "선택된 탭 : " + position);

                Fragment selected = null;
                if (position == 0) {
                    selected = fragment1;
                } else if (position == 1) {
                    selected = fragment2;
                } else if (position == 2) {
                    selected = fragment3;
                }
                getSupportFragmentManager().beginTransaction()
                        .replace(R.id.container, selected).commit();
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {
            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {
            }
        });

    }

}
```

---

### 하단탭

> 하단탭 (p.304)

```java
//xml code. /app/res폴더에 menu폴더 만든 후 그 안에 생성. 1. menu_bottom.xml
<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">

    <item
        android:id="@+id/tab1"
        app:showAsAction="ifRoom"
        android:enabled="true"
        android:icon="@android:drawable/ic_dialog_email"
        android:title="이메일" />
    <item
        android:id="@+id/tab2"
        app:showAsAction="ifRoom"
        android:icon="@android:drawable/ic_dialog_info"
        android:title="정보" />
    <item
        android:id="@+id/tab3"
        app:showAsAction="ifRoom"
        android:enabled="true"
        android:icon="@android:drawable/ic_dialog_map"
        android:title="위치" />

</menu>

//xml code. 2. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <FrameLayout
        android:id="@+id/container"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        app:layout_behavior="@string/appbar_scrolling_view_behavior" />

    <com.google.android.material.bottomnavigation.BottomNavigationView
        android:id="@+id/bottom_navigation"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginEnd="0dp"
        android:layout_marginStart="0dp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:itemBackground="?colorPrimary"
        app:itemIconTint="@drawable/item_color"
        app:itemTextColor="@drawable/item_color"
        app:menu="@menu/menu_bottom" />

</androidx.constraintlayout.widget.ConstraintLayout>

// 3. fragment1.xml, fragment2.xml, fragment3.xml 코드 복사해서 붙여넣기
```

```java
// 4. Fragment1.java, Fragment2.java, Fragment3.java 도 복사해서 붙여넣기

//java code. 5. MainActivity.java
package org.techtown.tab;

import android.os.Bundle;
import android.view.MenuItem;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.bottomnavigation.BottomNavigationView;

public class MainActivity extends AppCompatActivity {

    Fragment1 fragment1;
    Fragment2 fragment2;
    Fragment3 fragment3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        fragment1 = new Fragment1();
        fragment2 = new Fragment2();
        fragment3 = new Fragment3();

        getSupportFragmentManager().beginTransaction().replace(R.id.container, fragment1).commit();

        BottomNavigationView bottomNavigation = findViewById(R.id.bottom_navigation);
        bottomNavigation.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                switch (item.getItemId()) {
                    case R.id.tab1:
                        Toast.makeText(getApplicationContext(), "첫 번째 탭 선택됨", Toast.LENGTH_LONG).show();
                        getSupportFragmentManager().beginTransaction()
                                .replace(R.id.container, fragment1).commit();

                        return true;
                    case R.id.tab2:
                        Toast.makeText(getApplicationContext(), "두 번째 탭 선택됨", Toast.LENGTH_LONG).show();
                        getSupportFragmentManager().beginTransaction()
                                .replace(R.id.container, fragment2).commit();

                        return true;
                    case R.id.tab3:
                        Toast.makeText(getApplicationContext(), "세 번째 탭 선택됨", Toast.LENGTH_LONG).show();
                        getSupportFragmentManager().beginTransaction()
                                .replace(R.id.container, fragment3).commit();

                        return true;
                }

                return false;
            }
        });
    }
}

```

---

### 뷰페이저. 손가락으로 좌우 스크롤해서 넘겨볼 수 있음

어댑터는 인터페이스같은 약속.

> 뷰페이저는 손가락으로 좌우 스크롤해서 넘겨볼 수 있는 기능 제공. 만약 화면 전체를 뷰페이저로 채운다면 좌우 스크롤을 통해 화면을 넘겨볼 수 있다.   
> 뷰페이저는 내부에서 <u>어댑터</u>라는 것과 상호작용하게 되어잇는데 이것은 뷰페이저가 여러 개의 아이템 중에 하나를 보여주는 방식으로 동작하기 때문. (p.308)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app28.jpg?raw=true)
![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app29.jpg?raw=true)

```java
//xml code. 1. fragment1.xml, fragment2.xml, fragment3.xml과 Fragment1.java, Fragment2.java, Fragment3.java 이전거에서 복사해서 붙여넣기

//xml code.3.  activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="두번째 화면 보여주기" />

    <androidx.viewpager.widget.ViewPager
        android:id="@+id/pager"
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <androidx.viewpager.widget.PagerTitleStrip
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_gravity="top"
            android:background="#55cedf"
            android:textColor="#FFFFFF"
            android:paddingTop="5dp"
            android:paddingBottom="5dp">
        </androidx.viewpager.widget.PagerTitleStrip>

    </androidx.viewpager.widget.ViewPager>
</LinearLayout>

```

```java
//java code. 2. MainActivity.java
package org.techtown.pager;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    ViewPager pager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        pager = findViewById(R.id.pager);
        pager.setOffscreenPageLimit(3);  //setOffscreenPageLimit는 한번에 로딩할 개수. 여기선 3개 로딩하겠다

        MyPagerAdapter adapter = new MyPagerAdapter(getSupportFragmentManager());

        Fragment1 fragment1 = new Fragment1();
        adapter.addItem(fragment1);

        Fragment2 fragment2 = new Fragment2();
        adapter.addItem(fragment2);

        Fragment3 fragment3 = new Fragment3();
        adapter.addItem(fragment3);

        pager.setAdapter(adapter);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                pager.setCurrentItem(1);  //손가락으로 움직이지 않아도 버튼 누르면 해당 페이지로 이동할 수 있도록
            }
        });
    }

    class MyPagerAdapter extends FragmentStatePagerAdapter {
        ArrayList<Fragment> items = new ArrayList<Fragment>();  //ArrayList->동적배열. <Fragment>는 Fragment타입만 담을 수 있다

        public MyPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        public void addItem(Fragment item) {
            items.add(item);
        }

        @Override
        public Fragment getItem(int position) {
            return items.get(position);
        }

        @Override
        public int getCount() {  //프래그먼트 몇개 있는지
            return items.size();
        }

        @Override
        public CharSequence getPageTitle(int position) {  //현재 페이지 출력
            return "페이지 " + position;
        }
    }
}
```

---

### 바로가기 메뉴 만들기(햄버거같이 옆으로 슬라이딩)

> 걍 넘어갔으니 책이랑 소스 볼것~ (p.315)

---

### 앱 꺼져도 돌아가는거

서비스 -> 백그라운드에서 돌아가는 화면이 없는 기능. ex) 카톡 메세지오면 알람

> input에 입력하고 껐다 켜도 그대로 불러오는거? 그대로 남아있는거? (p.326)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app30.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 브로드캐스트 수신자(내가 필요한 정보 골라서 받음), 접속 권한 부여?

> 브로드캐스팅은 메시지를 여러개 객체에 전달하는 것. 받든지 말든지 모든 방송 출력   
> 브로드캐스트 수신자는 내가 필요한 정보 골라서 받음 (p.334)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### sms내용 액티비티에 나타내기

> sms내용 액티비티에 나타내기 (p.341)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 리소스와 메니페스트의 사용, 그래들(빌드 자동화 도구) 이해하기

> 리소스와 메니페스트의 사용, 그래들(빌드 자동화 도구) 이해하기 (p.356)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 나인패치(이미지 사이즈 늘리면 border 왜곡)

> 이미지 파일 이름을 ooo.9.png로 저장하면 자동으로 나인패치 적용된다 (p.365)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 새로운 뷰 만들기?

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 카드뷰, 버튼클릭시 리스트에서 사진이나 이름, 번호 바꾸기

> 카드뷰 레이아웃 (p.382)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 리싸이클러뷰

어댑터는

* 두개의 서로 다른 객체를 연결
* 확장성때문에 어댑터 사용
* 인터페이스(규약)이랑 비슷

뷰홀더는 뷰를 여러개 담은거

> 리싸이클러뷰는 반복적으로 출력. 끝
> 어댑터가 거의 바꿔줌? (p.386)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 스피너(콤보박스, select)

> 스피너(콤보박스, select) (p.401)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 애니메이션(확대축소, 이동, 회전, 투명도)

> 애니메이션은 자바가 아닌 xml로 한다 (p.408)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 페이지 슬라이딩

> 페이지 슬라이딩 (p.417)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 하이브리드앱은 필요한 부분만 넣기! 전체 이거면 구글 앱스토어에서 반려함 (p.421)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 시크바(유튜브에서 클릭시 점프 그거임)

>  (p.425)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 키패드 제어하기

>  (p.429)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### Thread와 핸들러(1초 지날때마다 숫자 1씩 증가)

> 서로 다른 Thread는(별도의 Thread) textView같은거 갖다 쓰려면 오류 발생.
> 서로 다른 Thread는 접근(공유)할 수 없음. 이 문제를 해결하려면 핸들러를 사용해야 한다.(p.439 필기 그림 참고)
> 
> 한쪽 Thread는 명령만 계속 집어넣고, 다른 Thread는 명령 처리한다.
> 두개는 자료 공유를 해야 하는데 그게 messagequeue와(선입선출. stack은 후입선출) handler. (p.435 필기 그림 참고)

> bgThread는 핸들러한테 비어있는 메세지 달라고 요청(obtain)하고, bgthread는 bundle로 메세지를 담아 messagequeue에 보낸다(send)
> handler는 handlemessage로 ui처리하게 보내고 이걸 다시 mainactivity에 보내서 화면에 표출한다? (p. 441 그림 필기 참조)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app31.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app32.jpg?raw=true)

```jsp
<!--xml code. activity_main.xml-->
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello World!"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.247" />

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="152dp"
        android:text="Button"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/textView"
        app:layout_constraintVertical_bias="0.074" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code. MainActivity.java
package com.example.samplethread2;

import android.os.Handler;
import android.os.Message;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    TextView textView;  //멤버변수

    MainHandler handler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                BackgroundThread thread = new BackgroundThread();
                thread.start();
            }
        });

        handler = new MainHandler();
    }

    class BackgroundThread extends Thread {
        int value = 0;

        public void run() {
            for (int i = 0; i < 100; i++) {
                try {
                    Thread.sleep(1000);
                } catch(Exception e) {}

                value += 1;
                Log.d("Thread", "value : " + value);

                Message message = handler.obtainMessage();  //obtainMessage은 비어있는 메세지 달라
                Bundle bundle = new Bundle();
                bundle.putInt("value", value);  //bundle에 키와 값 저장
                message.setData(bundle);  //키와 값이 들어있는 bundle을 메세지에 저장

                handler.sendMessage(message);  //핸들러로 메시지 객체 보내기
            }
        }
    }

    class MainHandler extends Handler {
        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);

            Bundle bundle = msg.getData();
            int value = bundle.getInt("value");
            textView.setText("value 값 : " + value);
        }
    }

}


//또는 아래거. 위에 obtain을 없애고 handler.post로 넘기는 방법. 더 간결화. 편한거 쓰면 된다
package org.techtown.thread;

import android.os.Handler;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    TextView textView;

    Handler handler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                BackgroundThread thread = new BackgroundThread();
                thread.start();
            }
        });

    }

    class BackgroundThread extends Thread {
        int value = 0;

        public void run() {
            for (int i = 0; i < 100; i++) {
                try {
                    Thread.sleep(1000);
                } catch(Exception e) {}

                value += 1;
                Log.d("Thread", "value : " + value);

                handler.post(new Runnable() {
                    public void run() {
                        textView.setText("value 값 : " + value);
                    }
                });
            }
        }
    }

}

```

---

### 웹(http)으로 요청해서 정보 받기. Volley방식. 

네트워크(p.455)   
2-tier, 3-tier방식이 있음.    
2-tier는 돈이 없지 않은 이상 잘 안씀. 서버 고장나거나 해킹때문에 보안에 취약.

소켓방식은 거의 안씀. 절차가 복잡하고 Thread도 필요하기 때문에 volley 쓴다. (p.463)   

> 웹(http)으로 요청해서 정보 받기. Volley방식. (p.469)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//build.gradle(Module)
plugins {
    id 'com.android.application'
}

android {
    compileSdk 30

    defaultConfig {
        applicationId "com.example.samplerequest"
        minSdk 21
        targetSdk 30
        versionCode 1
        versionName "1.0"

        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}

dependencies {

    implementation 'androidx.appcompat:appcompat:1.3.1'
    implementation 'com.google.android.material:material:1.4.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.0'
    testImplementation 'junit:junit:4.+'
    androidTestImplementation 'androidx.test.ext:junit:1.1.3'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.4.0'
    
    //이 부분 추가
    implementation 'com.android.volley:volley:1.2.0'
}
```

```jsp
<!--AdndroidManifest.xml-->
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.samplerequest">

    <uses-permission android:name="android.permission.INTERNET"/>   <!--이 부분 추가, 아래 usesCleartextTraffic도 추가. 이건 접속시 HTTP 프로토콜 허용-->

    <application
        android:usesCleartextTraffic="true"
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SampleRequest">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

```jsp
<!--xml code. activity_main.xml-->
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <EditText
        android:id="@+id/editText"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:ems="10"
        android:hint="사이트 주소 입력"
        android:inputType="textPersonName" />

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="요청하기" />

    <ScrollView
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical" >

            <TextView
                android:id="@+id/textView"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:textSize="20sp" />
        </LinearLayout>
    </ScrollView>

</LinearLayout>
```

```java
//java code. MainActivity.java
package com.example.samplerequest;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    EditText editText;
    TextView textView;

    static RequestQueue requestQueue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        editText = findViewById(R.id.editText);
        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                makeRequest();
            }
        });

        if (requestQueue == null) {
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }

    }

    public void makeRequest() {
        String url = editText.getText().toString();

        StringRequest request = new StringRequest(
                Request.Method.GET,
                url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        println("응답 -> " + response);

                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        println("에러 -> " + error.getMessage());
                    }
                }
        ) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<String,String>();

                return params;
            }
        };

        request.setShouldCache(false);
        requestQueue.add(request);
        println("요청 보냄.");
    }

    public void println(String data) {
        textView.append(data + "\n");
    }

}
```

---

### 웹(http)으로 요청해서 정보 받기. Volley방식. json 사용

> 웹(http)으로 요청해서 정보 받기. Volley방식. json 사용. (p.474)
> 위에거에서 json 추가해서 맨 아래 영화 정보의수 추가

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//build.gradle(Module)
plugins {
    id 'com.android.application'
}

android {
    compileSdk 30

    defaultConfig {
        applicationId "com.example.samplerequest"
        minSdk 21
        targetSdk 30
        versionCode 1
        versionName "1.0"

        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}

dependencies {

    implementation 'androidx.appcompat:appcompat:1.3.1'
    implementation 'com.google.android.material:material:1.4.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.0'
    testImplementation 'junit:junit:4.+'
    androidTestImplementation 'androidx.test.ext:junit:1.1.3'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.4.0'
    
    //이 부분 추가. 추가후 코끼리 버튼 눌러주기
    implementation 'com.android.volley:volley:1.2.0'
    implementation 'com.google.code.gson:gson:2.8.6'
}
```

```jsp
<!--AdndroidManifest.xml-->
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.samplerequest">

    <uses-permission android:name="android.permission.INTERNET"/>   <!--이 부분 추가, 아래 usesCleartextTraffic도 추가. 이건 접속시 HTTP 프로토콜 허용-->

    <application
        android:usesCleartextTraffic="true"
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SampleRequest">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

```jsp
<!--xml code. activity_main.xml-->
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <EditText
        android:id="@+id/editText"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:ems="10"
        android:hint="사이트 주소 입력"
        android:inputType="textPersonName" />

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="요청하기" />

    <ScrollView
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical" >

            <TextView
                android:id="@+id/textView"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:textSize="20sp" />
        </LinearLayout>
    </ScrollView>

</LinearLayout>
```

```java
//java code. MovieList.java
package com.example.samplerequest;

public class MovieList {
    MovieListResult boxOfficeResult;
}

//java code. MovieListResult.java
package com.example.samplerequest;

import android.graphics.Movie;

import java.util.ArrayList;

public class MovieListResult {

    String boxofficeType;
    String showRange;

    ArrayList<Movie> dailyBoxOfficeList = new ArrayList<Movie>();

}

//java code. Movie.java
package com.example.samplerequest;

public class Movie {

    String rnum;
    String rank;
    String rankInten;
    String rankOldAndNew;
    String movieCd;
    String movieNm;
    String openDt;
    String salesAmt;
    String salesShare;
    String salesInten;
    String salesChange;
    String salesAcc;
    String audiCnt;
    String audiInten;
    String audiChange;
    String audiAcc;
    String scrnCnt;
    String showCnt;

}

//java code. MainActivity.java
package com.example.samplerequest;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    EditText editText;
    TextView textView;

    static RequestQueue requestQueue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        editText = findViewById(R.id.editText);
        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                makeRequest();
            }
        });

        if (requestQueue == null) {
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }

    }

    public void makeRequest() {
        String url = editText.getText().toString();

        StringRequest request = new StringRequest(
                Request.Method.GET,
                url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        println("응답 -> " + response);

                        processResponse(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        println("에러 -> " + error.getMessage());
                    }
                }
        ) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<String,String>();

                return params;
            }
        };

        request.setShouldCache(false);
        requestQueue.add(request);
        println("요청 보냄.");
    }

    public void println(String data) {
        textView.append(data + "\n");
    }

    public void processResponse(String response) {
        Gson gson = new Gson();
        MovieList movieList = gson.fromJson(response, MovieList.class);  //response(웹에서받아온내용을)  MovieList.class에 넣어라

        println("영화정보의 수 : " + movieList.boxOfficeResult.dailyBoxOfficeList.size());
    }

}
```

---

### 웹(http)으로 요청해서 정보 받기, 리싸이클러뷰 같이 사용

> 웹(http)으로 요청해서 정보 받기, 리싸이클러뷰 같이 사용 (p.477)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app34.jpg?raw=true)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app35.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <EditText
        android:id="@+id/editText"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:ems="10"
        android:inputType="textPersonName" />

    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Button" />

    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/recyclerView"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
</LinearLayout>
```

```java
//java code. MovieList.java. 위에거임
package com.example.samplemovie;

public class MovieList {
    MovieListResult boxOfficeResult;
}

//java code. MovieListResult.java. 위에거임
package com.example.samplemovie;

import java.util.ArrayList;

public class MovieListResult {

    String boxofficeType;
    String showRange;

    ArrayList<Movie> dailyBoxOfficeList = new ArrayList<Movie>();

}

//java code. Movie.java. 위에거임
package com.example.samplemovie;

public class Movie {

    String rnum;
    String rank;
    String rankInten;
    String rankOldAndNew;
    String movieCd;
    String movieNm;
    String openDt;
    String salesAmt;
    String salesShare;
    String salesInten;
    String salesChange;
    String salesAcc;
    String audiCnt;
    String audiInten;
    String audiChange;
    String audiAcc;
    String scrnCnt;
    String showCnt;

}
```

```jsp
<!-- xml code. movie_item.xml -->
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical">

    <androidx.cardview.widget.CardView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginBottom="20dp">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="horizontal">

            <ImageView
                android:id="@+id/imageView"
                android:layout_width="152dp"
                android:layout_height="52dp"
                android:layout_marginRight="10dp"
                android:layout_weight="1"
                app:srcCompat="@android:drawable/presence_video_busy" />

            <LinearLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:layout_weight="1"
                android:orientation="vertical"
                android:paddingTop="10dp"
                android:paddingRight="10dp"
                android:paddingBottom="10dp">

                <TextView
                    android:id="@+id/textView"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:text="제목"
                    android:textSize="18sp" />

                <TextView
                    android:id="@+id/textView2"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:gravity="right"
                    android:text="관객수"
                    android:textColor="#3F51B5" />
            </LinearLayout>
        </LinearLayout>
    </androidx.cardview.widget.CardView>
</LinearLayout>

```

```java
//java code. MovieAdapter.java
package com.example.samplemovie;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class MovieAdapter extends RecyclerView.Adapter<MovieAdapter.ViewHolder>  {
    ArrayList<Movie> items = new ArrayList<Movie>();

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(viewGroup.getContext());
        View itemView = inflater.inflate(R.layout.movie_item, viewGroup, false);

        return new ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder viewHolder, int position) {  //현재 인덱스에 맞는 Movie 객체를 찾아 뷰홀더에 객체 설정
        Movie item = items.get(position);
        viewHolder.setItem(item);
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    public void addItem(Movie item) {
        items.add(item);
    }

    public void setItems(ArrayList<Movie> items) {
        this.items = items;
    }

    public Movie getItem(int position) {
        return items.get(position);
    }

    static class ViewHolder extends RecyclerView.ViewHolder {  //view홀더! 리스트 형태로 보일 때 각각의 아이템은 뷰홀더에 담는다.
        TextView textView;
        TextView textView2;

        public ViewHolder(View itemView) {
            super(itemView);

            textView = itemView.findViewById(R.id.textView);
            textView2 = itemView.findViewById(R.id.textView2);
        }

        public void setItem(Movie item) {  //Movie.java에 있는거 정의?
            textView.setText(item.movieNm);
            textView2.setText(item.audiCnt + " 명");
        }

    }

}

```

```java
//java code. MainActivity.java
package com.example.samplemovie;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    EditText editText;
    TextView textView;

    static RequestQueue requestQueue;  //요청 큐는 한 번만 만들어 계속 사용할 수 있기 때문에 static

    RecyclerView recyclerView;
    MovieAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editText = findViewById(R.id.editText);
        textView = findViewById(R.id.textView);

        editText.setText("https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=d99a06c9812d36bff405995c0eea8b32&targetDt=20210330");

        //여기는 사이트로 접속? Volley와 관련된거 설정
        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                makeRequest();
            }
        });

        if (requestQueue == null) {
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        //여기 아래는 리싸이클러뷰에 리스트 출력하는거 관련
        recyclerView = findViewById(R.id.recyclerView);

        LinearLayoutManager layoutManager = new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false);  //리싸이클러뷰 세로방향으로 리스트 볼 수 있도록 레이아웃 매니저 설정
        recyclerView.setLayoutManager(layoutManager);

        adapter = new MovieAdapter();  //이것과 아래(바로다음줄). MovieAdapter객체 만들고 setAdapter 메서드를 호출하여 설정했다. 이렇게 하면 리싸이클러뷰가 어댑터와 상호작용하면서 리스트로 보여줌
        recyclerView.setAdapter(adapter);

    }

    //여기부터 아래는 사이트로 접속? Volley와 관련된거 설정
    public void makeRequest() {
        String url = editText.getText().toString();

        StringRequest request = new StringRequest(  //요청객체. 요청객체를 만든 후 요청 큐에 넣어 요청 진행.
                Request.Method.GET,
                url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        println("응답 -> " + response);

                        processResponse(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        println("에러 -> " + error.getMessage());
                    }
                }
        ) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<String,String>();

                return params;
            }
        };

        request.setShouldCache(false);
        requestQueue.add(request);
        println("요청 보냄.");
    }

    public void println(String data) {
        Log.d("MainActivity", data);
    }

    public void processResponse(String response) {  //이 안에는 Gson을 이용해 JSON 문자열을 MovieList 객체로 변환하며 그 안에 들어있는 Movie 객체들을 하나씩 꺼내어 어댑터에 추가.
        Gson gson = new Gson();
        MovieList movieList = gson.fromJson(response, MovieList.class);

        println("영화정보의 수 : " + movieList.boxOfficeResult.dailyBoxOfficeList.size());

        for (int i = 0; i < movieList.boxOfficeResult.dailyBoxOfficeList.size(); i++) {
            Movie movie = movieList.boxOfficeResult.dailyBoxOfficeList.get(i);

            adapter.addItem(movie);
        }

        adapter.notifyDataSetChanged();  //어댑터에 모두 추가했을 떄 notifyDataSetChanged이걸 호출해야 변경사항 반영된다.
    }
}
```

```jsp
<!-- build.graddle. Module -->
plugins {
    id 'com.android.application'
}

android {
    compileSdk 30

    defaultConfig {
        applicationId "com.example.samplemovie"
        minSdk 21
        targetSdk 30
        versionCode 1
        versionName "1.0"

        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}

dependencies {

    implementation 'androidx.appcompat:appcompat:1.3.1'
    implementation 'com.google.android.material:material:1.4.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.0'
    implementation 'com.android.volley:volley:1.2.0'
    testImplementation 'junit:junit:4.+'
    androidTestImplementation 'androidx.test.ext:junit:1.1.3'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.4.0'

    //이 부분 추가 / 웹으로 요청하고 응답을 받아. 리싸이클러뷰에 보여줄 것 / Volley는 웹으로 요청하고 응답을 받는 역할 / Gson은 JSON 문자열을 자바 객체로 바꾸어 주는 역할
    implementation 'com.android.volley:volley:1.2.0'
    implementation 'com.google.code.gson:gson:2.8.6'
}

<!--AndroidManifest -->
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.samplemovie">

    <uses-permission android:name="android.permission.INTERNET"/>  <!-- 인터넷을 사용하기 위해 INTERNET권한 추가, 아래 usesCleartextTraffic 이것도 추가 -->

    <application
        android:usesCleartextTraffic="true"
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SampleMovie">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>

```

---

### 데이터베이스와 table 만들기(로컬 데이터베이스)

모든 폰은 데이터베이스인 SQLite를 기본적으로 가지고 있다.   

> 입력, 수정, 삭제 같은 결과가 필요 없을때는 execSQL 사용하고   
> -> public void execSQL(String Sql) throws SQLException ...   
> select와 같이 조회에 따른 결과가 있는 SQL은 Cursor를 쓴다.   
> -> public Cursor rawQuery(String Sql) throws SQLException... (p.491)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app33.jpg?raw=true)

```jsp
<!--xml code. activity_main.xml-->
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">

        <EditText
            android:id="@+id/editText"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1" />

        <Button
            android:id="@+id/button"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="데이터베이스만들기" />

    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">

        <EditText
            android:id="@+id/editText2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1" />

        <Button
            android:id="@+id/button2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="테이블 만들기" />
    </LinearLayout>

    <ScrollView
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical">

            <TextView
                android:id="@+id/textView"
                android:layout_width="match_parent"
                android:layout_height="wrap_content" />
        </LinearLayout>
    </ScrollView>

</LinearLayout>
```

```java
//java code. MainActivity.java
package com.example.sampledatabase;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    EditText editText;
    EditText editText2;
    TextView textView;

    SQLiteDatabase database;

    String tableName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editText = findViewById(R.id.editText);
        editText2 = findViewById(R.id.editText2);
        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String databaseName = editText.getText().toString();
                createDatabase(databaseName);
            }
        });

        Button button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                tableName = editText2.getText().toString();
                createTable(tableName);

                insertRecord();
            }
        });
    }


    private void createDatabase(String name) {
        println("createDatabase 호출됨.");

        database = openOrCreateDatabase(name, MODE_PRIVATE, null);  //1. 데이터베이스를 만들기 위한 메서드 실행하기

        println("데이터베이스 생성함 : " + name);
    }

    private void createTable(String name) {
        println("createTable 호출됨.");

        if (database == null) {
            println("데이터베이스를 먼저 생성하세요.");
            return;
        }

        database.execSQL("create table if not exists " + name + "("  //2. 테이블을 만들기 위한 SQL문 실행하기
                + " _id integer PRIMARY KEY autoincrement, "  //autoincrement는 자동으로 줄번호 부여. 결과적으로 내가 값을 넣을 필요 없음?
                + " name text, "
                + " age integer, "
                + " mobile text)");

        println("테이블 생성함 : " + name);
    }

    private void insertRecord() {
        println("insertRecord 호출됨.");

        if (database == null) {
            println("데이터베이스를 먼저 생성하세요.");
            return;
        }

        if (tableName == null) {
            println("테이블을 먼저 생성하세요.");
            return;
        }

        database.execSQL("insert into " + tableName
                + "(name, age, mobile) "
                + " values "
                + "('John', 20, '010-1000-1000')");

        println("레코드 추가함.");
    }

    public void println(String data) {
        textView.append(data + "\n");
    }

}
```

---

### 데이터베이스와 table 만들기, 조회하기(로컬 데이터베이스)

> 데이터베이스와 table 만들기, 조회하기(로컬 데이터베이스) (p.500)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app33.jpg?raw=true)

```jsp
<!--xml code. activity_main.xml-->
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity" >

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">

        <EditText
            android:id="@+id/editText"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1" />

        <Button
            android:id="@+id/button"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="데이터베이스만들기" />

    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">

        <EditText
            android:id="@+id/editText2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1" />

        <Button
            android:id="@+id/button2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="테이블 만들기" />
    </LinearLayout>

    <Button
        android:id="@+id/button3"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="데이터 조회하기" />

    <ScrollView
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical">

            <TextView
                android:id="@+id/textView"
                android:layout_width="match_parent"
                android:layout_height="wrap_content" />
        </LinearLayout>
    </ScrollView>

</LinearLayout>
```

```java
//java code. MainActivity.java
package com.example.sampledatabase;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    EditText editText;
    EditText editText2;
    TextView textView;

    SQLiteDatabase database;

    String tableName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editText = findViewById(R.id.editText);
        editText2 = findViewById(R.id.editText2);
        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String databaseName = editText.getText().toString();
                createDatabase(databaseName);
            }
        });

        Button button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                tableName = editText2.getText().toString();
                createTable(tableName);

                insertRecord();
            }
        });

        //조회하기 버튼 추가, 테이블 이름 emp로 고정했기때문에 조회할 때 두번째 input에 emp로 넣어야함!!!!!
        Button button3 = findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                executeQuery();
            }
        });
    }


    private void createDatabase(String name) {
        println("createDatabase 호출됨.");

        database = openOrCreateDatabase(name, MODE_PRIVATE, null);  //1. 데이터베이스를 만들기 위한 메서드 실행하기

        println("데이터베이스 생성함 : " + name);
    }

    private void createTable(String name) {
        println("createTable 호출됨.");

        if (database == null) {
            println("데이터베이스를 먼저 생성하세요.");
            return;
        }

        database.execSQL("create table if not exists " + name + "("  //2. 테이블을 만들기 위한 SQL문 실행하기
                + " _id integer PRIMARY KEY autoincrement, "  //autoincrement는 자동으로 줄번호 부여. 결과적으로 내가 값을 넣을 필요 없음?
                + " name text, "
                + " age integer, "
                + " mobile text)");

        println("테이블 생성함 : " + name);
    }

    private void insertRecord() {
        println("insertRecord 호출됨.");

        if (database == null) {
            println("데이터베이스를 먼저 생성하세요.");
            return;
        }

        if (tableName == null) {
            println("테이블을 먼저 생성하세요.");
            return;
        }

        database.execSQL("insert into " + tableName
                + "(name, age, mobile) "
                + " values "
                + "('John', 20, '010-1000-1000')");

        println("레코드 추가함.");
    }

    public void println(String data) {
        textView.append(data + "\n");
    }

    public void executeQuery() {
        println("executeQuery 호출됨.");

        Cursor cursor = database.rawQuery("select _id, name, age, mobile from emp", null);   //테이블 이름 emp로 고정!!!!!!!!! 조회시 테이블 이름 emp로 안하면 오류
        int recordCount = cursor.getCount();
        println("레코드 개수 : " + recordCount);

        for (int i = 0; i < recordCount; i++) {
            cursor.moveToNext();

            int id = cursor.getInt(0);
            String name = cursor.getString(1);
            int age = cursor.getInt(2);
            String mobile = cursor.getString(3);

            println("레코드 #" + i + " : " + id + ", " + name + ", " + age + ", " + mobile);
        }

        cursor.close();
    }

}
```

---

### GPS로 위치 확인하기

> (p.617)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app36.jpg?raw=true)

```java
//xml code. build.gradle
dependencies {

    implementation 'androidx.appcompat:appcompat:1.3.1'
    implementation 'com.google.android.material:material:1.4.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.0'
    testImplementation 'junit:junit:4.+'
    androidTestImplementation 'androidx.test.ext:junit:1.1.3'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.4.0'

    implementation 'com.yanzhenjie:permission:2.0.3'  /*이 줄만 추가 */
}

//xml code. AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.samplelocation">

    /* 아래 두줄 추가. getLastKnownLocation메서드 권한 주기. 정교한위치와 대략적인 위치? */
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

    <application

//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="내 위치"
        android:textSize="30sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="8dp"
        android:layout_marginBottom="8dp"
        android:text="내 위치 확인하기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/textView" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code. MainActivity.java
package com.example.samplelocation;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.yanzhenjie.permission.Action;
import com.yanzhenjie.permission.AndPermission;
import com.yanzhenjie.permission.runtime.Permission;


import java.util.List;

public class MainActivity extends AppCompatActivity {

    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.textView);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startLocationService();
            }
        });

        //위험권한 자동으로 부여
        AndPermission.with(this)
                .runtime()
                .permission(
                        Permission.ACCESS_FINE_LOCATION,
                        Permission.ACCESS_COARSE_LOCATION)
                .onGranted(new Action<List<String>>() {
                    @Override
                    public void onAction(List<String> permissions) {
                        showToast("허용된 권한 갯수 : " + permissions.size());
                    }
                })
                .onDenied(new Action<List<String>>() {
                    @Override
                    public void onAction(List<String> permissions) {
                        showToast("거부된 권한 갯수 : " + permissions.size());
                    }
                })
                .start();

    }

    public void showToast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    //위치관리자 객체 참조
    public void startLocationService() {
        LocationManager manager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);

        try {
            //이부분은 안해도 됌?
            Location location = manager.getLastKnownLocation(LocationManager.GPS_PROVIDER);  //getLastKnownLocation -> 마지막 위치값
            if (location != null) {
                double latitude = location.getLatitude();
                double longitude = location.getLongitude();
                String message = "최근 위치 -> Latitude : " + latitude + "\nLongitude:" + longitude;

                textView.setText(message);
            }

            //위치 정보 업데이트 요청
            GPSListener gpsListener = new GPSListener();
            long minTime = 10000;
            float minDistance = 0;

            manager.requestLocationUpdates(  //위치 요청하기
                    LocationManager.GPS_PROVIDER,
                    minTime, minDistance, gpsListener);

            Toast.makeText(getApplicationContext(), "내 위치확인 요청함",
                    Toast.LENGTH_SHORT).show();

        } catch(SecurityException e) {
            e.printStackTrace();
        }
    }

    //위치 리스너 구현하기
    class GPSListener implements LocationListener {
        public void onLocationChanged(Location location) {  //위치가 확인되었을 때 자동으로 호출되는 메서드
            Double latitude = location.getLatitude();
            Double longitude = location.getLongitude();

            String message = "내 위치 -> Latitude : "+ latitude + "\nLongitude:"+ longitude;
            textView.setText(message);
        }

        public void onProviderDisabled(String provider) { }

        public void onProviderEnabled(String provider) { }

        public void onStatusChanged(String provider, int status, Bundle extras) { }
    }
}
```

---

### 구글 맵 연동하여 지도에 표시

> (p.626)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app37.jpg?raw=true)

```java
//xml code. build.gradle
dependencies {

    implementation 'androidx.appcompat:appcompat:1.3.1'
    implementation 'com.google.android.material:material:1.4.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.0'
    implementation 'com.google.android.gms:play-services-maps:17.0.1'
    testImplementation 'junit:junit:4.+'
    androidTestImplementation 'androidx.test.ext:junit:1.1.3'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.4.0'

    implementation 'com.yanzhenjie:permission:2.0.3'
}

//xml code. AndroidManifest.xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.samplelocation">

    <!--아래 세줄 추가. API_KEY도 추가 -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.SampleLocation">

        <meta-data android:name="com.google.android.geo.API_KEY" android:value="AIzaSyB5-ocmJ_sdEEzsF3mtp5S2ci0fKP6IlWM"/>

        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>

//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="8dp"
        android:layout_marginBottom="8dp"
        android:text="내 위치 확인하기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent" />

    <fragment
        android:id="@+id/map"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        class="com.google.android.gms.maps.SupportMapFragment" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code. MainActivity.java
package com.example.samplelocation;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.yanzhenjie.permission.Action;
import com.yanzhenjie.permission.AndPermission;
import com.yanzhenjie.permission.runtime.Permission;


import java.util.List;

public class MainActivity extends AppCompatActivity {

    //구글 맵 보여주기위해 추가
    SupportMapFragment mapFragment;
    GoogleMap map;
    MarkerOptions myLocationMarker;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //구글 맵 보여주기위해 추가
        mapFragment = (SupportMapFragment) getSupportFragmentManager().findFragmentById(R.id.map);
        mapFragment.getMapAsync(new OnMapReadyCallback() {
            @Override
            public void onMapReady(GoogleMap googleMap) {
                Log.d("Map", "지도 준비됨.");
                map = googleMap;

            }
        });
        //구글 맵 보여주기위해 추가
        try {
            MapsInitializer.initialize(this);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startLocationService();
            }
        });

        //위험권한 자동으로 부여
        AndPermission.with(this)
                .runtime()
                .permission(
                        Permission.ACCESS_FINE_LOCATION,
                        Permission.ACCESS_COARSE_LOCATION)
                .onGranted(new Action<List<String>>() {
                    @Override
                    public void onAction(List<String> permissions) {
                        showToast("허용된 권한 갯수 : " + permissions.size());
                    }
                })
                .onDenied(new Action<List<String>>() {
                    @Override
                    public void onAction(List<String> permissions) {
                        showToast("거부된 권한 갯수 : " + permissions.size());
                    }
                })
                .start();

    }

    public void showToast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    //위치관리자 객체 참조
    public void startLocationService() {
        LocationManager manager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);

        try {
            //이부분은 안해도 됌?
            Location location = manager.getLastKnownLocation(LocationManager.GPS_PROVIDER);  //getLastKnownLocation -> 마지막 위치값
            if (location != null) {
                double latitude = location.getLatitude();
                double longitude = location.getLongitude();
                String message = "최근 위치 -> Latitude : " + latitude + "\nLongitude:" + longitude;

                //구글 맵 보여주기위해 변경
                Log.d("Map", message);
            }

            //위치 정보 업데이트 요청
            GPSListener gpsListener = new GPSListener();
            long minTime = 10000;
            float minDistance = 0;

            manager.requestLocationUpdates(  //위치 요청하기
                    LocationManager.GPS_PROVIDER,
                    minTime, minDistance, gpsListener);

            Toast.makeText(getApplicationContext(), "내 위치확인 요청함",
                    Toast.LENGTH_SHORT).show();

        } catch(SecurityException e) {
            e.printStackTrace();
        }
    }

    //위치 리스너 구현하기
    class GPSListener implements LocationListener {
        public void onLocationChanged(Location location) {  //위치가 확인되었을 때 자동으로 호출되는 메서드
            Double latitude = location.getLatitude();
            Double longitude = location.getLongitude();

            String message = "내 위치 -> Latitude : "+ latitude + "\nLongitude:"+ longitude;
            //구글 맵 보여주기위해 변경
            Log.d("Map", message);
            showCurrentLocation(latitude, longitude);
        }

        public void onProviderDisabled(String provider) { }

        public void onProviderEnabled(String provider) { }

        public void onStatusChanged(String provider, int status, Bundle extras) { }
    }

    //구글 맵 보여주기위해 추가
    private void showCurrentLocation(Double latitude, Double longitude) {
        LatLng curPoint = new LatLng(latitude, longitude);
        map.animateCamera(CameraUpdateFactory.newLatLngZoom(curPoint, 15));

        showMyLocationMarker(curPoint);
    }
    //구글 맵 보여주기위해 추가
    private void showMyLocationMarker(LatLng curPoint) {
        if (myLocationMarker == null) {
            myLocationMarker = new MarkerOptions();
            myLocationMarker.position(curPoint);
            myLocationMarker.title("● 내 위치\n");
            myLocationMarker.snippet("● GPS로 확인한 위치");
            myLocationMarker.icon(BitmapDescriptorFactory.fromResource(R.drawable.mylocation));
            map.addMarker(myLocationMarker);
        } else {
            myLocationMarker.position(curPoint);
        }
    }
}
```

---

### 상단 알림으로 알려주기(Notification)

> (p.655)
> FLAG_ONE_SHOT : 생성된 PendingIntent를 한번만 사용
> FLAG_UPDATE_CURRENT :  이미 생성된 PendingIntent가 있다면, Extra Data만 전달한다.
> FLAG_CANCLE_CURRENT :  이미 생성된 PendingIntent를 취소한 후 새로 생성한다.
> FLAG_NO_CREATE :   이미 생성된 PendingIntent가 없다면 null, 있다면 재활용

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app38.jpg?raw=true)

```java
//xml code. activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="알림 띄우기"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <Button
        android:id="@+id/button2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="40dp"
        android:text="알림 띄우고 클릭하기"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/button" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

```java
//java code. MainActivity.java
package com.example.samplenoti;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NotificationCompat;

public class MainActivity extends AppCompatActivity {
    NotificationManager manager;

    private static String CHANNEL_ID = "channel1";
    private static String CHANNEL_NAME = "Channel1";

    private static String CHANNEL_ID2 = "channel2";
    private static String CHANNEL_NAME2 = "Channel2";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showNoti1();
            }
        });

        Button button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showNoti2();
            }
        });

    }

    public void showNoti1() {
        manager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);

        NotificationCompat.Builder builder = null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            manager.createNotificationChannel(new NotificationChannel(
                    CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_DEFAULT
            ));

            builder = new NotificationCompat.Builder(this, CHANNEL_ID);
        } else {
            builder = new NotificationCompat.Builder(this);
        }

        builder.setContentTitle("간단 알림");
        builder.setContentText("알림 메시지입니다.");
        builder.setSmallIcon(android.R.drawable.ic_menu_view);
        Notification noti = builder.build();

        manager.notify(1, noti);  //상단 알림 띄우기
    }

    public void showNoti2() {
        manager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);

        NotificationCompat.Builder builder = null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            manager.createNotificationChannel(new NotificationChannel(
                    CHANNEL_ID2, CHANNEL_NAME2, NotificationManager.IMPORTANCE_DEFAULT
            ));

            builder = new NotificationCompat.Builder(this, CHANNEL_ID2);
        } else {
            builder = new NotificationCompat.Builder(this);
        }

        Intent intent = new Intent(this, MainActivity.class);
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 101, intent, PendingIntent.FLAG_UPDATE_CURRENT);  //PadingIntent 객체 만들기

        builder.setContentTitle("간단 알림");
        builder.setContentText("알림 메시지입니다.");
        builder.setSmallIcon(android.R.drawable.ic_menu_view);
        builder.setAutoCancel(true);  //빌더에 PadingIntent 객체 설정하기
        builder.setContentIntent(pendingIntent);

        Notification noti = builder.build();

        manager.notify(2, noti);  //상단 알림 띄우기

        NotificationCompat.BigTextStyle style = new NotificationCompat.BigTextStyle();
        style.bigText("많은 글자들입니다");
        style.setBigContentTitle("제목입니다");
        style.setSummaryText("요약 글입니다");

        NotificationCompat.Builder builder2 = new NotificationCompat.Builder(this, "channel3")
                .setContentTitle("알림 제목")
                .setContentText("알림 내용")
                .setSmallIcon(android.R.drawable.ic_menu_send)
                .setStyle(style);

    }

}
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```

---

### 앱 화면에 웹브라우저 넣기(하이브리드앱)

> 새로운 뷰 만들기? (p.367)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app26.jpg?raw=true)

```java
//xml code. activity_main.xml

```

```java
//java code. MainActivity.java
```
