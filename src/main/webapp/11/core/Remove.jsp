<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 변수 선언 --%>
<c:set var="scopeVar" value="Page Value"/> <%-- 영역 지정 안할 시 페이지 영역 출력--%>
<c:set var="scopeVar" value="Request Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>

<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - Remove</title>
</head>
<body>
  <h2> 출력 </h2>
  <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>request scopeVar: ${requestScope.scopeVar}</li>
    <li>Session  scopeVar: ${sessionScope.scopeVar}</li>
    <li>Application scopeVar : ${applicationScope.scopeVar}</li>
  </ul>

  <h2> scope 지정 없이 삭제 </h2>
  <c:remove var="scopeVar" scope="session"/>
  <ul>
      <li>scopeVar : ${scopeVar}</li>
      <li>request scopeVar: ${requestScope.scopeVar}</li>
      <li>Session  scopeVar: ${sessionScope.scopeVar}</li>
      <li>Application scopeVar : ${applicationScope.scopeVar}</li>
  </ul>

    <h2> scope 지정 없이 삭제 </h2>
    <c:remove var="scopeVar"/>

    <ul>
        <li>scopeVar : ${scopeVar}</li>
        <li>request scopeVar: ${requestScope.scopeVar}</li>
        <li>Application scopeVar : ${applicationScope.scopeVar}</li>
    </ul>
</body>
</html>
