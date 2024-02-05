<%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-30
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includeFile.jsp"%>
<html>
<head>
    <title>Include 지시어</title>
</head>
<body>
    <%
    out.println("오늘 날짜 : " + today + "</br>");
    out.println("내일 날짜 : " + tomorrow);
    %>
</body>
</html>


