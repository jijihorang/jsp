<%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-31
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장객체 - request</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
        String id = request.getParameter("id");
        String sex = request.getParameter("sex");  // 2개의 값 중 하나만 선택
        String[] favo = request.getParameterValues("favo");  // 3개의 값 중 여러개 선택 가능하기 때문에 배열 사용
        // ["eco", "pol", "ent"] 배열 for문 돌리기
        String favoStr = "";
        if(favo != null) {
            for(int i = 0; i < favo.length; i++) {
                favoStr += favo[i] + " ";
            }

            // (String s : favo) {  // 향상된 for문
            //    favoStr += s + " ";
            //  }
        }

        String intro = request.getParameter("intro").replace("\r\n", "<br/>");
        <%-- 자바에서는 \r\n을 인식하지만 html에서는 인식을 못하기 때문에 <br/>도 적어줌 --%>
    %>
    <ul>
        <li>아이디 : <%= id %></li>  <%-- 출력 --%>
        <li>성별 : <%= sex %></li>
        <li>관심사 : <%= favoStr %></li>
        <li>자기소개 : <%= intro %></li>
    </ul>
</body>
</html>


