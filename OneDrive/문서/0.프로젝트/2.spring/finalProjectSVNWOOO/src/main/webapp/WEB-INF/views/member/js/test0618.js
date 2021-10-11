/*javascript****************************************************************************************************** */
// var com = Math.floor(Math.random()*100 + 1);
// var state = 0;

// var i = 0;
// while(true){
//     if(i >= 5){
//         state = 0;
//         break;
//     }

//     var user = prompt("컴퓨터의 숫자를 맞춰주세요");

//     if( user > com ){
//         alert("값을 down ");
//     }else if(user < com){
//         alert("값을 up ");
//     }else{
//         state = 1;
//         break;
//     }
    
//     i++
// }

// if(state == 1){
//     document.write("정답입니다", com);
// }else{
//     document.write("입력횟수 초과", com);
// }

/*C****************************************************************************************************** */
// void main() {
//     int com = 10;
//     int state = 0;
//     int user = 0;

//     int i = 0;
//     while (1) {
//         if (i >= 5) {
//             state = 0;
//             break;
//         }

//         int user = scanf("%d", &user);

//         if (user > com) {
//             printf("값을 down ");
//         }
//         else if (user < com) {
//             printf("값을 up ");
//         }
//         else {
//             state = 1;
//             break;
//         }

//         i++;
//     }

//     if (state == 1) {
//         printf("정답입니다");
//     }
//     else {
//         printf("입력횟수 초과");
//     }
// }

/*JAVA****************************************************************************************************** */
// import java.util.Scanner;

// public class test {

// 	public static void main(String[] args) {
		
// 		Scanner scanner = new Scanner(System.in);
		
// 		int com = 10;
// 	    int state = 0;

// 	    int i = 0;
// 	    while (true) {
// 	        if (i >= 5) {
// 	            state = 0;
// 	            break;
// 	        }

// 	        int user = scanner.nextInt();

// 	        if (user > com) {
// 	            System.out.println("값을 down ");
// 	        }
// 	        else if (user < com) {
// 	        	System.out.println("값을 up ");
// 	        }
// 	        else {
// 	            state = 1;
// 	            break;
// 	        }

// 	        i++;
// 	    }

// 	    if (state == 1) {
// 	    	System.out.println("정답입니다");
// 	    }
// 	    else {
// 	    	System.out.println("입력횟수 초과");
// 	    }
	    
// 	}

// }

/******************************************************************************************************** */
/*tv 객체 생성하여 정보 출력하기 1*/
// var tv = new Object(); //클래스 선언 및 생성
// tv.color = "white"; //속성 선언
// tv.price = 300000; //속성 선언
// tv.info =  function(){ //메소드 생성
//     document.write("tv 색상 : " + this.color);
//     document.write("tv 가격 : " + this.price);
// }
// tv.info();

/*tv 객체 생성하여 정보 출력하기 2. json?*/
// var tv = {
//     color : "white", //속성 선언
//     price : 300000, //속성 선언
//     info : function(){ //메소드 생성
//         document.write("tv 색상 : " + this.color);
//         document.write("tv 가격 : " + this.price);
//     }
// }
// tv.info();

/*내장 객체****************************************************************************************************** */
// var max = Math.max(20, 5, 7, 68, 10);
// document.write(max + "<br />");
// var rd = Math.round(3.14);
// document.write(rd + "<br />");
// var pr = Math.pow(2, 3);
// document.write(pr + "<br />");

/*date 객체****************************************************************************************************** */
// var d1 = new Date(); //생성자 오버로딩
// var d2 = new Date("2021/06/18"); //생성자 오버로딩
// var d3 = new Date(2021,5,18); //생성자 오버로딩

/*93페이지 예제****************************************************************************************************** */
// var today = new Date();
// var nowMonth = today.getMonth(), nowDate = today.getDate(), nowDay = today.getDay();

// document.write("<h1>오늘 날짜 정보 </h1>");
// document.write("현재 월 : " + nowMonth + "<br />");
// document.write("현재 일 : " + nowDate + "<br />");
// document.write("현재 요일 : " + nowDay + "<br />");

// var worldcup = new Date(2002,4,31);
// var worldMonth = worldcup.getMonth(), worldDate = worldcup.getDate(), worldDay = worldcup.getDay();

// document.write("<h1>월드컵 날짜 정보 </h1>");
// document.write("월드컵 몇 월 : " + worldMonth + "<br />");
// document.write("월드컵 몇 일 : " + worldDate + "<br />");
// document.write("월드컵 무슨 요일 : " + worldDay + "<br />");

/*97페이지 예제****************************************************************************************************** */
// document.write("<h1>컴퓨터 가위바위보 게임</h1>");

// var user = prompt("가위, 바위, 보 입력 : ");
// var com = Math.floor((Math.random()*3) + 1);

// var user_num;
// switch(user){
//     case "가위" : 
//         user_num = 1;
//         break;
//     case "바위" :
//         user_num = 2;
//         break;
//     case "보" : 
//         user_num = 3;
//         break;
//     default : 
//         alert("잘못 입력했습니다.");
//         location.reload();
// }

// document.write("<img src=\"images/math_img_" + com + ".jpg\">");

// if(user_num == com){
//     document.write("<img src=\"images/game_1.jpg\">" + "<br /><br /><br /><br /><br /><br />");
// }else{
//     document.write("<img src=\"images/game_2.jpg\">" + "<br /><br /><br /><br /><br /><br />");
// }

// //가위바위보 게임
// var diff = user_num - com;
// if(diff == 0){
//     document.write("<h1>비김</h1>");
// }else if(diff == -2 || diff == 1){
//     document.write("<h1>사용자 승리</h1>");
// }else if(diff == 2 || diff == -1){
//     document.write("<h1>컴퓨터 승리</h1>");
// }

// document.write("<h2>com = " + com, " user_num = " + user_num + "</h2>");

/*배열객체****************************************************************************************************** */
// var arr = new Array();
// var arr1 = new Array(1,2,3,4,5,6,7);
// var arr2 = [1,2,3,4,5,6,7];
// var arr3 = [1,"따르릉",3.14]; //가능

// //document.write(arr1[0]);

// // for(var i = 0; i<arr2.length; i++){
// //     document.write(arr2[i]);
// // }

// for(var j in arr2){
//     document.write(arr2[j]);
// }

/*로또 숫자 생성****************************************************************************************************** */
// var arr = new Array();

// for(var i = 0; i < 6; i++ ){
//     var num = Math.floor((Math.random()*45) + 1);
//     arr += num;
// }

// document.write(arr + "<br />");

// var lotto = new Array();

// for(var i = 0; i < 6; i++ ){    
//     lotto[i] = Math.floor((Math.random()*45) + 1);
//     document.write("<h1>" + lotto[i] + "</h1>");
// }

//todo 1 : 중복제거 알고리즘 추가
//todo 2 : 로또 이미지 추가 등으로 화면을 좀 더 다채롭게 꾸며주세요.

// var lotto=new Array();

// for(var i=1; i<=6; i++)
// {
//     lotto[i]=Math.floor((Math.random()*45)+1);
//     for(j=1 ; j<=i-1; j++)
//     {
//         if(lotto[i]==lotto[j])
//         {
//             i--;
//         }
//     }
// }
// for(i in lotto)
// {
//         document.write("<img src=\"lotto/ball_" +(lotto[i])+ ".png\">");
// }

// var arr=new Array(180,165,175,170,160,171,150,162);
// var size=num.length;
// var size=8;
/*오름차순*/
// for(var i=0; i<size; i++)
// {
//     var min=i;
//     for(var j=i+1; j<size; j++)
//     if(arr[min]>arr[j])
//     min=j;

//     var temp=arr[min];
//     arr[min]=arr[i];
//     arr[i]=temp;
// }
// for(i in arr)
// {
//     document.write(arr[i]);
//     document.write("<br>");
// }



/*내림차순*/
// for(var i=0; i<size; i++)
// {
//     var max=i;
//     for(var j=i+1; j<size; j++)
//     if(arr[max]<arr[j])
//     max=j;

//     var temp=arr[max];
//     arr[max]=arr[i]
//     arr[i]=temp;
// }
// for(i in arr)
// {
//     document.write(arr[i]);
//     document.write("<br>");
// }


/*로또 번호 오름차순*/
// var lotto=new Array();

// for(var i=1; i<=6; i++)
// {
//     lotto[i]=Math.floor((Math.random()*45)+1);
//     for(j=1 ; j<=i-1; j++)
//     {
//         if(lotto[i]==lotto[j])
//         {
//             i--;
//         }
//     }
// }

// for(var i=1; i<=6; i++)
// {
//     var min=i;
//     for(var j=i+1; j<=6; j++)
//     if(lotto[min]>lotto[j])
//     min=j;

//     var temp=lotto[min];
//     lotto[min]=lotto[i];
//     lotto[i]=temp;
// }
// for(i in lotto)
// {
//         document.write("<img src=\"lotto/ball_" +(lotto[i])+ ".png\">");
// }
// var arr=new Array(180, 165, 175, 160, 170, 171, 150, 162);
// var size=8;
// var low=0;
// var high=7;
// var key=prompt("탐색할 값은 ? ");
// var state=0;

// for(var i=0; i<size; i++)
// {
//     var min=i;
//     for(var j=i+1; j<size; j++)
//     if(arr[min]>arr[j])
//     min=j;

//     var temp=arr[min];
//     arr[min]=arr[i];
//     arr[i]=temp;
// }

// while(low<=high)
// {
//     var middle=Math.floor((low+high)/2);
//     if(key==arr[middle])
//     {
//         state=1;
//         break;
//     }
//     else if(key>arr[middle])
//     {
//         low=middle+1;
//     }
//     else if(key<arr[middle])
//     {
//         high=middle-1;
//     }
// }

// if(state==1)
// {
//     document.write("성공");
// }
// else
// {
//     document.write("실패");
// }

// var arr_1=["사탕","교대","방배","강남"];
// var arr_2=["신사","압구정","옥수"];

// var result=arr_1.join("-");
// console.log(result);

// result=arr_1.concat(arr_2);
// console.log(result);

// result=arr_1.slice(1,3);
// console.log(result);

// arr_1.sort();
// console.log(arr_1);

// arr_2.reverse();
// console.log(arr_2);

// var greenArr=["교대","방배","강남"];
// var yellowArr=["미금","정자","수서"];

// greenArr.splice(2,1, "서초","역삼");
// console.log(greenArr);

// var data1=yellowArr.pop();
// var data2=yellowArr.shift();

// yellowArr.push(data2);
// console.log(yellowArr)

// yellowArr.unshift(data1);
// console.log(yellowArr);


// var num_1=["043","276","9999"];

// var result=num_1.join("-");
// console.log(result);

// result=num_1.slice(0,1)
// console.log(result);


// var tel=prompt("전화번호를 입력하세요"," (000-000-0000)");
// var telArr=tel0.split("-");
// for(var i in telArr)
// {
// console.log(telArr[i]);
// }

// var userEmail=prompt("이메일을 입력해주세요.","");
// var arrUrl=[".co.kr",".com",".net",".or.kr",".go.kr"];

// var check1=false, check2=false;

// if(userEmail.indexOf("@")>0) 
// {
//     check1=true;
// }
// for(var i=0; i<arrUrl.length; i++)
// {
//     if(userEmail.indexOf(arrUrl[i])>0)
//     {
//     check2=true;
//     }
// }
// if(check1 && check2)
// {
//     document.write(userEmail);
// }
//  else
// {
//      alert("이메일 형식이 잘못 되었습니다.");
// }


// var userEmail=prompt("이메일을 입력해주세요.","");
// var arrUrl=[".co.kr",".com",".net",".or.kr",".go.kr"];

// var check1=false, check2=false;

// if(userEmail.indexOf("@")>0) 
// {
//     check1=true;
// }
// for(var i=0; i<arrUrl.length; i++)
// {
//     if(userEmail.indexOf(arrUrl[i])>0)
//     {
//     check2=true;
//     }
// }
// if(check1 == true && check2==true)
// {
//     console.log("이메일 형식 OK!");
// }
//  else
// {
//      console.log("이메일 형식 오류!");
// }




// var addNum=0;
// var subNum=1000;
// var auto_1=setinterval(function()
// {
//     addNum++;
//     console.log("addNum:"+addNum);
// },3000);

// var auto_2=setinterval(function()
// {
//     subNum--;
//     console.log("subNum:"+subNum);
// },3000);


