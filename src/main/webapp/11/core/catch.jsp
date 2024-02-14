<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - catch</title>
</head>
<body>
  <h2>자바 코드 예외</h2>
  <%-- 예외 발생 시 예외처리하는 역할 --%>

  <%
    int num1 = 100;
  %>
  <c:catch var="eMsg"> <%-- 에러메시지 --%>
    <%
      int result = num1/0; /* 에러 발생 */
    %>
  </c:catch>
  예외 내용 : ${eMsg} <%-- 에러 발생하여 에러메시지 출력 --%>

  <h2> EL에서의 예외 </h2>
  <c:set var="num2" value="200"/>
  <c:catch var="eMsg">
    ${"일" + num2} <%-- 문자열과 NUM을 입력하니 각자 에러 메시지 출력 --%>
  </c:catch>
  예외 내용 : ${eMsg}
</body>
</html>
