<%--
  Created by IntelliJ IDEA.
  User: 纪俊羽
  Date: 2021/10/7
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>第二个首页</title>
</head>
<body>
<div>
    <form action="/list" method="post">
        关键字:<input type="text" name="keyWord" />
        <input type="hidden" name="pageIndex" value="1" />
        <input type="button" value="查询" id="btn" />
    </form>
</div>
<div>
    <table border="1">
        <thead>
        <tr>
            <td>关键词</td>
            <td>搜索指数</td>
            <td>创建时间</td>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>
<div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.min.js"></script>
<script>
    $(function(){
        page(1);
        $("#btn").click(function(){
            page(1);
        })
    })
    function page(pageIndex){
        var keyWord = $("input[name='keyWord']").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/list",
            data:{"pageIndex":pageIndex,"keyWord":keyWord},
            type:"post",
            dataType:"json",
            success:function(result){
                var list = result.list;
                var tbody = "";
                for(var i = 0; i < list.length; i++){
                    tbody += "<tr><td><a href='${pageContext.request.contextPath}/query?id="+list[i].id+"'>"+list[i].keyWord+"</a></td>" +
                        "<td>"+list[i].searchSum+"</td><td>"+list[i].createDate+"</td></tr>";
                }
                $("tbody").html(tbody)
            }
        })
    }
</script>