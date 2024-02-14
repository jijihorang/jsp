<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - import </title>
</head>
<body>
    <%-- 외부 파일을 현재 위치에 삽입할 때 사용 --%>
    <c:set var="requestVar" value="민또" scope="request"/>
    <c:import url="OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="금쪽이2"/>
        <c:param name="user_param2" value="잼민이 민또"/>
    </c:import>

    <h2> 다른 문서 삽입하기 </h2>  <%-- 다른 문서 변수명 삽입해야 출력 가능 --%>
    ${contents}

    <iframe src="GoldPage.jsp" style="width: 100%; height: 600px;"></iframe>
</body>
</html>
