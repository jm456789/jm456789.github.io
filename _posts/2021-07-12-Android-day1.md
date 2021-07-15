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
- [첫째마당](#첫째마당)
- [첫번째 앱 만들기](#첫번째-앱-만들기)
- [둘째마당](#둘째마당)
- [프레임 레이아웃과 뷰의 전환](#프레임-레이아웃과-뷰의-전환)
- [드로어블 만들기](#드로어블-만들기)
- [터치 이벤트 처리하기](#터치-이벤트-처리하기)
- [단말 방향을 전환했을 때 이벤트 처리하기](#단말-방향을-전환했을-때-이벤트-처리하기)
- [토스트 모양과 위치 바꿔 보여주기, 스낵바 보여주기](#토스트-모양과-위치-바꿔-보여주기,-스낵바-보여주기)
- [알림 대화상자 보여주기](#알림-대화상자-보여주기)
- [프로그레스바 사용하기](#프로그레스바-사용하기)
- [레이아웃 인플레이션](#레이아웃-인플레이션)
- [여러 화면 만들고 화면 간 전환하기](#여러-화면-만들고-화면-간-전환하기)
- [인텐트 살펴보기](#인텐트-살펴보기)
- [플래그](#플래그)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)

---

# 첫째마당, 

### 첫번째 앱 만들기

> 버튼 누르면 토스트 메세지 띄우기, 네이버 접속 버튼, 전화걸기 버튼

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

### 프레임 레이아웃과 뷰의 전환

> 버튼 누르면 이미지 전환 1

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

### 드로어블 만들기

드로어블은 뷰에 설정할 수 있는 객체이며 그 위에 그래픽을 그릴 수 있다. 

> 버튼 누르면 누른 버튼 이미지 전환

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

### 터치 이벤트 처리하기

> 일정 영역 안에서 스크롤 생성 후 마우스 좌표값 가져오기

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

### 단말 방향을 전환했을 때 이벤트 처리하기

> 가로방향으로 틀면 맞춰서 나오게 하기.    
> (세로방향에서 가로방향으로 전환되면 내용 다 지워지고 새로 그린다. 이때 입력한 값이 있으면 데이터 저장 후 가로화면 되고 데이터를 다시 불러와서 그려야 한다.)     
> layout 폴더를 복사 한 후 layout-land를 만들면 가로로 인식. (activity_main.xml 파일은 다 만든 후 그대로 복사해서 layout-land폴더에 붙여넣기 하면 자동으로 가로로 전환된다)

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app6.jpg?raw=true)

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

> 버튼 누르면 뜨는 토스트 메세지 디자인 변경, 스낵바 띄우기

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

### 알림 대화상자 보여주기

> 알림 대화상자 보여주기. (알림창에 예, 아니오, 취소 버튼있는거)

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

### 프로그레스바 사용하기

> 막대 프로그레스바, 원형(무한로딩) 프로그래스바

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
                    dialog.dismiss();
                }
            }
        });

    }

}
```

### 레이아웃 인플레이션

인플레이션이란 XML 레이아웃의 내용이 메모리에 객체화되는 과정.

---

> 레이아웃 인플레이션. 다른 xml파일의 레이아웃을 부분 보여주기(부분화면), activity_main.xml이 아닌 다른 xml로 시작하는 방법. 부분화면을 메모리에 객체화하려면 인플레이터를 사용해야한다!!!!!!!!!!!!.
> 추가하기 버튼 누르면 하단에 다른 xml의 내용 표출한다.

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

### 여러 화면 만들고 화면 간 전환하기

> 액티비티. 띄웠던 액티비티로부터 다시 원래의 액티비티로 돌아오면서 응답(결과)을 받아 처리하는 코드 필요->startActivityForResult
> 메뉴 화면 띄우기 누르면 다른창 뜨고, 돌아가기 버튼 누르면 다시 메인으로 감

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

### 인텐트 살펴보기

인텐트는 명령 또는 데이터를 전달하는데 사용. 명령서같은거   
startActivity 메서드는 화면에 띄울 때,   
startService 메서드는 서비스를 시작할 때(눈에 보이지 않는 프로그램. 예를들어 background),   
broadcastIntent 메서드는 인텐트 객체를 브로드캐스팅 방식으로 전송(듣던 안듣던 방송함. 사방팔방 정보를 뿌리면 필요한 앱들만 정보를 가져감)

> 전화걸기 버튼 누르면 전화걸기로 이동, 메뉴 화면 띄우기 누르면 다른 xml뜸

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

                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(data));
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

### 플래그

플래그를 이해하려면 액티비티가 처리되는 방식을 이해해야 합니다. 스택은 액티비티를 차곡차곡 쌓아두었다가 가장 상위에 있던 액티비티가 없어지면 이전의 액티비티가 다시 화면에 보이게 합니다. 만약 동일한 액티비티를 여러 번실행한다면 동일한 액티비티가 여러 개 스택에 들어가게 되고 동시에 데이터를 여러 번 접근하거나 리소스를 여러 번 사용하는 문제가 발생할 수 있습니다. 이러한 문제를 해결할수 있도록 도와주는게 플래그.

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

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

> 버튼 누르면 이미지 전환

![](https://github.com/jm456789/jm456789.github.io/blob/main/_images/app1.jpg?raw=true)

```java
//xml code

```

```java
//java code

```

---

