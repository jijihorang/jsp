<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - Url</title>
</head>
<body>
    <c:url value="OtherPage.jsp" var="url">
        <c:param name="user_param1" value="Must"/>
        <c:param name="user_param2">Have</c:param>
    </c:url>
    <a href="${url}">OtherPage.jsp 바로가기</a>
</body>
</html>
