<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - ForEach2</title>
</head>
<body>
    <h2> 향상된 for문 헝태의 foreach 태그 </h2>
    <%
        String[] rgba = {"Red", "Green", "Blue", "Black"};
    %>

    <c:forEach items="<%=rgba%>" var="item">
        <span style="color : ${item}"> ${item} </span> <%-- 색깔, 스타일 컬러 변경 --%>
    </c:forEach>

    <h2> varStatus 속성 살펴보기 </h2>
    <table border="1">
        <c:forEach items="<%=rgba%>" var="c" varStatus="loop">
            <tr>
                <td>count : ${loop.count}</td> <%-- 1부터 시작 --%>
                <td>index : ${loop.index}</td> <%-- 배열의 인덱스는 0부터 시작 --%>
                <td>current : ${loop.current}</td>
                <td>first : ${loop.first}</td> <%-- 첫번째 값 true --%>
                <td>last : ${loop.last}</td> <%-- 마지막 값 true --%>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
