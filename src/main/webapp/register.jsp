<%--
  Created by IntelliJ IDEA.
  User: 王庆虎
  Date: 2019/6/5
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册用户</title>
    <script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <style>
        .error{
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body  >
<form action="#" method="post" onsubmit="return false">
    <table border="2px" style="width:500px ; height:200px; margin-left: 550px;margin-top: 200px">
        <tr>
            <td style="text-align:center "colspan="2"> <h1>用户注册</h1></td>
        </tr>
        <tr>
            <td style="text-align:center "colspan="2"> 请输入身份证号:<input type="text" name=IDnumber></td>
        </tr>
        <tr>
            <td style="text-align:center "colspan="2">请输入用户名:<input type="text" name=username></td>
        </tr>
        <tr >
            <td style="text-align:center "colspan="2">请输入密码:<input type="password" id="password" name=password></td>
        </tr>
        <tr>
            <td style="text-align:center "colspan="2">请确认密码:<input type="password" id="refill" name=refill></td>
        </tr>
        <tr>
            <td style="width: 220px;text-align: center"><button type="submit" style="border-radius: 10px;width: 80px;height: 25px;">注册</button></td>
            <td style="width: 180px;text-align: center"> <a href="login.jsp">返回</a></td>
        </tr>
    </table>


</form>
<script type="text/javascript">
    $(function (){
        $("form").validate({
            submitHandler: function() {
                $.ajax({
                    type:"post",
                    url:"Login/register",
                    data:$("form").serialize(),
                    dataType:"json",
                    success:function(data){
                        if(data.code == 1){
                            if(confirm("注册已成功 ，现在去登陆吗？")){
                                window.location.href="login.jsp";
                            }
                        }else{
                            alert(data.info);
                            alert("注册失败");
                        }
                    }
                })
            },
            //验证规则
            rules:{
                IDnumber: {
                    required: true,
              //      isIdCardNo:true,
                    minlength:18,
                    maxlength:18,
                    number: true
                },
                username:{
                    required: true,
                    maxlength:25,
                },
                password: {
                    required: true,
                    minlength:6,
                },
                refill:{
                    required: true,
                    equalTo:"#password"
                },
            },
            //验证不通过时提示信息
            messages:{
                IDnumber: {
                    required: "身份证号码不允许为空",
                   // isIdCardNo:"请输入正确的身份证号",
                    minlength:"身份证号码必须是18位",
                    maxlength:"身份证号码必须是18位",
                    number:"身份证号码必须位全数字",
                },
                username: {
                    required:"用户名不允许为空",
                    maxlength:"用户名最多25位",
                },
                password: {
                    required:"密码不允许为空",
                    minlength:"密码最少位6位",
                },
                refill:{
                    required: "请确认密码",
                    equalTo:"两次密码不一样",
                },
            }

        })
    })
</script>
<%--
<script type="text/javascript">
    // 身份证号码验证
    jQuery.validator.addMethod("isIdCardNo", function(value, element) {
        return this.optional(element) || isIdCardNo(value);
    }, "请正确输入您的身份证号码");
    //身份证验证 引入的方法
    function isIdCardNo(num) {
        var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,8, 4, 2, 1);
        var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4","3", "2");
        var varArray= new Array();
        var intValue;
        var lngProduct = 0;
        var intCheckDigit;
        var intStrLen = num.length;
        var idNumber= num;
        //initialize
        if((intStrLen != 15) && (intStrLen !=18)) {
            return false;
        }
        // check andset value
        for (i = 0;i < intStrLen; i++) {
            varArray[i] = idNumber.charAt(i);
            if ((varArray[i] < '0' || varArray[i]> '9') && (i != 17)){
                return false;
            } else if (i < 17) {
                varArray[i] = varArray[i] * factorArr[i];
            }
        }



        if(intStrLen == 18) {
            //check date
            var date8 = idNumber.substring(6, 14);
            if (isDate8(date8) == false) {
                return false;
            }
            // calculate the sum of the products
            for (i = 0; i < 17; i++) {
                lngProduct = lngProduct + varArray[i];
            }
            // calculate the check digit
            intCheckDigit = parityBit[lngProduct % 11];
            // check last digit
            if (varArray[17] != intCheckDigit) {
                return false;
            }
        }
        else{       //length is 15
            //check date
            var date6 = idNumber.substring(6, 12);
            if (isDate6(date6) == false) {
                return false;
            }
        }
        return true;
    }
    function isDate6(sDate) {
        if(!/^[0-9]{6}$/.test(sDate)) {
            return false;
        }
           var year,month, day;
            year =sDate.substring(0, 4);
            month =sDate.substring(4, 6);
            if (year< 1700 || year > 2500) returnfalse
            if (month< 1 || month > 12) return false
            return true
        }



        function isDate8(sDate) {
            if(!/^[0-9]{8}$/.test(sDate)) {
                return false;
            }
            var year,month, day;
            year =sDate.substring(0, 4);
            month =sDate.substring(4, 6);
            day =sDate.substring(6, 8);
            var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30,31]
            if (year< 1700 || year > 2500) return false
            if (((year %4 == 0) && (year % 100 != 0)) ||(year % 400 == 0)) iaMonthDays[1] = 29;
            if (month< 1 || month > 12) return false
            if (day< 1 || day > iaMonthDays[month - 1])return false
            return true
        }
    </script>
--%>
