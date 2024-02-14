<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - ForTokens </title>
</head>
<body>
    <h2> JSTL forTokens 사용 </h2>
    <%
        String rgba = "Red,Green,Blue,Black";  /* 구분자 (,)  분리 */
        String num = "010-2364-1792"; /* 구분자 (-) 분리 */
        String num2 = "010-2364-1792_1111"; /* 구분자 (-,_) 분리 */
    %>

    <c:forTokens items="<%=rgba%>" delims="," var="c">
        <span style="color : ${c}"> ${c} </span>
    </c:forTokens>

    <c:forTokens items="<%=num%>" delims="-" var="tel">
        <p> ${tel} </p>
    </c:forTokens>

    <c:forTokens items="<%=num2%>" delims="-_" var="tel">
        <p> ${tel} </p>
    </c:forTokens>

</body>
</html>
