<%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-30
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         isErrorPage="true"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h2>
        서비스 중 일시적 오류가 발생하였습니다.
    </h2>
    <p>
        오류명 : <%= exception.getClass().getName()%>
        오류 메시지 : <%= exception.getMessage()%>
    </p>
</body>
</html>
