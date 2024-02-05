<%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-30
  Time: 오후 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    trimDirectiveWhitespaces="true"
%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<html>
<head>
    <title>page 지시어 - import 속성 </title>
</head>
<body>
    <%
        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String todayStr = dateFormat.format(today);
        out.println("오늘 날짜 : " + todayStr);  // 오늘 날짜를 출력
    %>
</body>
</html>
