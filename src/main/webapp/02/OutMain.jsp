<%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-31
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>내장 객체 - OUT</title>
</head>
<body>
    <%--
        out 내장객체
        - 브라우저에 출력할 때 사용

        <%=%> 표현식으로 출력하는 경우가 편해서 out 내장객체 자주 사용 x

        out 내장 객체는 버퍼 (buffer) 사용
        모든 정보는 버퍼에 먼저 저장된 후 웹브라우저에 출력
    --%>

    <%
        // 버퍼 내용 삭제
        out.print("출력되지 않는 테스트");  // 출력 불가
        out.clearBuffer();

        out.print("<h2> out 내장객체</h2>");

        out.print("출력 버퍼의 크기 " +  out.getBufferSize() + "<br/>");
        out.print("남은 버퍼의 크기 " +  out.getRemaining() + "<br/>");

        out.flush(); // 버퍼 내용 출력
        out.print("flush 후 버퍼의 크기" + out.getRemaining() + "<br/>");  // 전체 크기 출력

        out.print(1);
        out.print(false);
        out.print('가');
    %>
</body>
</html>
