<%--
  Created by IntelliJ IDEA.
  User: 王庆虎
  Date: 2019/6/4
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房产信息查询系统</title>

    <script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>

    <style>
        .error{
            color: red;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">



            $(function(){
                $("form").validate({
                    submitHandler:function () {
                        $.ajax({
                            type:"post",
                            url:"Login/in",
                            dataType:"json",
                            data:$("form").serialize(),
                            success:function (data) {
                                    if (data.code == 1){

                                         alert("验证通过");

                                         window.location.href="main.jsp";

                                    }else if (data.code ==0){

                                        alert(data.info);

                                    }else {
                                        alert(data.info);
                                        if(confirm("是否要前往注册")){
                                            window.location.href="register.jsp";
                                        }
                                    }
                            }

                        })
                    },

                    rules:{
                        IDnumber:{
                            //不许为空
                            required:true,

                            minlength:18,
                            maxlength:18,
                            number: true

                        },
                        password:{
                            //不许为空
                            required:true,
                            minlength:6
                        },
                    },

                    messages:{

                        IDnumber:{
                            required:"身份证号码不允许为空",
                            minlength:"身份证号码必须是18位",
                            maxlength:"身份证号码必须是18位",
                            number:"身份证号码必须为全数字",
                        },
                        password:{
                            required:"密码不允许为空",
                            minlength:"密码最少位6位",
                        },
                    }
                })



            })

    </script>
   <%-- <script type="text/javascript">
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
    </script>--%>

</head>
<body  style="background-image: url('1.jpg') ; background-size: 100% 100%">
        <form action="#" method="post" onsubmit="return false">
            <table border="2px" style="width:500px ; height:200px; margin-left: 550px;margin-top: 200px">
                <tr>
                    <td style="text-align:center "colspan="2"> <h1>房产信息查询系统</h1></td>
                </tr>
                <tr>
                    <td style="text-align:center " colspan="2">
                        请输入身份证号： <input type="text" id="IDnumber"  name="IDnumber"  placeholder="IDnumber" style="border-radius: 10px" />
                    </td>
                </tr>
               <%-- <tr><td><span id="span1"></span></td></tr>--%>
                <tr>
                    <td style="text-align:center " colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入密码： <input type="password" id="password"  name="password" placeholder="password" style="border-radius: 10px"/>
                    </td>
                </tr>
                <%--<tr><td><span id="span2"></span></td></tr>--%>
                <tr>
                    <td style="width: 220px;text-align: center"><button type="submit" style="border-radius: 10px;width: 80px;height: 25px;">进入</button></td>
                    <td style="width: 180px;text-align: center"><a href="register.jsp">注册</a></td>
                </tr>
            </table>
        </form>
</body>
</html>
