<%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-30
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    errorPage="isErrorPage.jsp"
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int Age = Integer.parseInt(request.getParameter("age")) + 10;
        out.println("10년 후 당신의 나이는 : " + Age + "입니다.");
    %>
</body>
</html>

