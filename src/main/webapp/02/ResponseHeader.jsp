<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.Collator" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-31
  Time: 오후 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        // 응답헤더 정보 추가용 메소드 (add, set)
        // add : 새로 추가
        // set : 기존 값 수정할 때

        // 응답헤더에 추가할 값 준비
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 대문자 Month, 소문자 minute
        long add_date = sd.parse(request.getParameter("add_date")).getTime(); // request를 쓰면 문자열로 받기 때문에 형 변환 !
        int add_int = Integer.parseInt(request.getParameter("add_int")); // request를 쓰면 문자열로 받기 때문에 형 변환 !
        String add_str = request.getParameter("add_str");

        // 응답 헤더에 값 추가
        response.addDateHeader("today", add_date);
        response.addIntHeader("myNum", add_int); // 폼에서 수정하면 그 값이 출력
        response.addIntHeader("myNum", 1000);   // 추가 -> 배열 값(myNum)에만 출력
        response.addHeader("myName", add_str);
        response.setHeader("myName", "안중근");  // 수정
    %>
<head>
    <title>내장객체 - response</title>
</head>
<body>
    <h2> 응답 헤더 출력하기</h2>
    <%
        Collection<String> headersNames = response.getHeaderNames();

        for(String hName : headersNames) {
            String hValue = response.getHeader(hName);

    %>
    <li> <%=hName%> : <%=hValue%></li>  <%-- 출력 --%>
    <%
        }
    %>

    <h2>myNum만 출력하기</h2>
    <%
        Collection<String> myNum = response.getHeaders("myNum");

        for(String num : myNum) {
    %>
        <li>myNum : <%=num%></li>
    <%
        }
    %>
</body>
</html>
