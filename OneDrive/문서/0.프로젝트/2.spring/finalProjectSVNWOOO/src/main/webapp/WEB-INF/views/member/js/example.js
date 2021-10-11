
/******************************************************************************************************* */
//맛보기 예제 1번
// var age = prompt("당신의 나이는?", "0");
// if(age >= 20){
//     document.write("<p class='blue'>당신은 성인입니다.</p>");
// }else{
//     document.write("<p class='red'>당신은 미성년자입니다.</p>");
// }
/******************************************************************************************************* */
//증감 연산자 실습
// var a, b, c;
// a = prompt("a 값 입력 : ");
// b = prompt("b 값 입력 : ");
// c = a-- - ++b; //증감 연산자를 활용한 연산

// document.write("c= ", c);
// document.write("a= ", a);
// document.write("b= ", b);
/******************************************************************************************************* */
// var year = prompt("월을 입력 해주세요", "");
// var month = (year%4 == 0 && year%100 !== 0) || year%400 == 0 ? true : false;

// if(month == true){
//     document.write("<p class='blue'>윤년</p>");
// }else{
//     document.write("<p class='red'>평년</p>");
// }
/******************************************************************************************************* */
//1~n(prompt)까지의 수에서 3의 배수만 골라서 합산한 결과를 화면에 출력해주세요.
// var n = prompt("수를 입력해주세요", "");
// var sum = 0;

// for(var i=1; i<=n; i++){
//     if(i % 3 == 0){
//         sum += i;
//     }    
// }

// document.write(sum);
/******************************************************************************************************* */
//  var height = prompt("신장 입력 : ", "");
//  var weight = prompt("체중 입력 : ", "");

//  var result = (height - 100)*0.9;

//  var overWeight = result - weight;

//  if(weight == result){
//     document.write("신장 : " + height + "<br />체중 : " + weight + "<br />적정체중은" + result + "이며, 현재 적정체중입니다.");
//  }else if(weight > result){
//     document.write("신장 : " + height + "<br />체중 : " + weight + "<br />적정체중은" + result + "이며, 현재 적정체중에서" + overWeight + "kg 초과 입니다.");
//  }else{
//     document.write("신장 : " + height + "<br />체중 : " + weight + "<br />적정체중은" + result + "이며, 현재 적정체중에서" + overWeight + "kg 미만 입니다.");
//  }
/******************************************************************************************************* */
// var time = prompt("시간 입력 : ", "");
// var age = prompt("나이 입력 : ", "");

// var over_age = (age>=5 && age <=13) || age >= 65;

// var day_time = (time >= 9 && time <= 18);
// var night_time = (time >= 18 && time <= 22);

// var d_adult_price = 20000;
// var d_over_price = 10000;
// var n_adult_price = 12000;
// var n_over_price = 5000;

// if(age = over_age){
//     if(time = day_time){
//         document.write("해당 사람의 요금은 " + d_over_price);
//     }else if(time = night_time){
//         document.write("해당 사람의 요금은 " + n_over_price);
//     }
// }else{
//     if(time = day_time){
//         document.write("해당 사람의 요금은 " + d_adult_price);
//     }else if(time = night_time){
//         document.write("해당 사람의 요금은 " + n_adult_price);
//     }
// }
/******************************************************************************************************* */
// var month = prompt("몇 월? ");
// switch(month){
//     case "2":
//         days = 28;
//         break;
//     case "4":
//     case "6":
//     case "9":
//     case "11":
//         days = 30;
//         break;
//     default:
//         days = 31;
// }
// document.write(month + "월에는 전체 날수가 " + days);

// var url = "http://www.navaer.com"
// location.href = url;
/*work0617******************************************************************************************************************************************* */
// var price3 = 3000;
// var calc = (price1 + price2 + price3) - 10000; 

// var total = 10000 < price1 + price2 + price3 ? calc + "원 초과" : "돈관리 잘했어요!";

// document.write(total);

//*************************************************************************************** */
// var num4 = prompt("4분기 판매량 입력 : ");
// var num1 = 1200;
// var num2 = 1300;
// var num3 = 1000;
// var avg_num = num1 + num2 + num3 / 3;

// var output;
// if( num4 >= num3 ){
//     output = "4분기 판매량이 평균 이상입니다.";    
// }else{
//     output = "4분기 판매량이 평균 미달입니다.";    
// }

// document.write("1, 2, 3분기 평균 판매량은 " + avg_num + "입니다<br />" + output);
//*************************************************************************************** */
//var i = 1;
// while(i <= 9){
//     document.write("5 X " + i + "= " + i*5 + "<br />");
//     i++
// }
//*************************************************************************************** */
var num = 1;
var t = "<table border=1>";
for(var i = 1; i <= 5; i++){
    t += "<tr>";

    for(var k = 1; k <=5 ; k++){
        t += "<td>" + num + "</td>";
        num++;
    }

    t += "</tr>";
}

t += "</table>";
document.write(t);