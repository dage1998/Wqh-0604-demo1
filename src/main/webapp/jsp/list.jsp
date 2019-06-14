<%--
  Created by IntelliJ IDEA.
  User: 王庆虎
  Date: 2019/6/9
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>

    <script type="text/javascript">


            function  loadData() {
                $.ajax({
                    type:"post",
                    url:"../Login/selectLog",
                    data:$("form").serialize(),
                    dataType:"json",
                    success:function (data) {

                        if (data.code == 1){
                            alert(data.info)

                            $("#tbody").empty();

                            var infos = data.info;


                            alert(infos);
                            if(infos == null || infos.length == 0){
                                $("#tbody").html("抱歉，暂无数据");
                            }

                            $(infos).each(function () {
                                var ht = '   <tr>\n' +
                                '            <td>'+this.houseList.id+'</td>\n' +
                                '            <td>'+this.houseList.name+'</td>\n' +
                                '            <td>'+this.username+'</td>\n' +
                                '            <td>'+this.idnumber+'</td>\n' +
                                '            <td>'+this.houseList.house_type+'</td>\n' +
                                '            <td>'+this.houseList.area+'</td>\n' +
                                '            <td>'+this.houseList.create_time+'</td>\n' +
                                    '        </tr>';


                                // append 追加数据
                                // $(ht) 创建dom对象
                                $("#tbody").append($(ht));
                            })
                        }else {
                            alert(data.info)
                        }
                    }
                })
            }




            $(function () {

                loadData();



                $("form").submit(function () {
                    alert("213")
                    loadData();
                })
            })



    </script>
</head>
<body>

<form action="#" onsubmit="return false" method="post">

  <input type="text" name="IDnumber" id="IDnumber" placeholder="IDnumber"/>
  <input type="text" name="username" id="username" placeholder="username"/>
   <input type="submit" value="查找" />
</form>
<table style="text-align: center " border="2px" >
    <thead>
    <tr>
        <td>序号</td>
        <td>项目名称</td>
        <td>产权人</td>
        <td>身份证号</td>
        <td>房屋类型</td>
        <td>使用面积</td>
        <td>建造时间</td>
    </tr>
    </thead>
    <tbody id="tbody"></tbody>

</table>


</body>
</html>
