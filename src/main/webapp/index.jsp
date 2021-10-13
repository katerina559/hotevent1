<%--
  Created by IntelliJ IDEA.
  User: 纪俊羽
  Date: 2021/10/7
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>首页</title>
</head>
<body>
<div style="border: 3px solid black;width: 600px" >
    <div style="margin: 0px auto;">
    <form action="/page" method="post" style="text-align: center">
        关键词：<input type="text" name="keyWord" value="${param.keyWord}" />
        <input type="hidden" name="pageIndex" value="1" />
        <input type="submit" value="查询" />
    </form>
    </div>
    <span style="text-align: center" ><h2>热点事件排行榜</h2></span>
    <table border="1" width="600px">
        <tr>
            <td>关键字</td>
            <td>搜索指数</td>
            <td>创建时间</td>
        </tr>
        <c:forEach items="${page.list}" var="o">
            <tr>
                <td>${o.keyWord}</td>
                <td>${o.searchSum}</td>
                <td>${o.createDate}</td>
            </tr>
        </c:forEach>
    </table>
    <span style="text-align: center;">
        <c:if test="${page.pageIndex != 1}">
            <a href="javascript:void(0)" onclick="topage(1)" >首页</a>
            <a href="javascript:void(0)" onclick="topage(${page.pageIndex - 1})" >上一页</a>
        </c:if>
        <c:if test="${page.pageIndex != page.pageCount}">
            <a href="javascript:void(0)" onclick="topage(${page.pageIndex + 1})" >下一页</a>
            <a href="javascript:void(0)" onclick="topage(${page.pageCount})" >末页</a>
        </c:if>
    </span>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.min.js"></script>
<script>
    function topage(pageIndex){
        $("input[name='pageIndex']").val(pageIndex);
        $("form").submit();
    }
</script>