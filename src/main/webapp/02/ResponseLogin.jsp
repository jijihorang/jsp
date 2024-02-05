fhr<%--
  Created by IntelliJ IDEA.
  User: jiho7
  Date: 2024-01-31
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Response 내장객체</title>
</head>
<body>
    <%
        String id = request.getParameter("user_id");  // user_id를 받아와 정보 저장
        String pwd = request.getParameter("user_pwd"); // user)pwd를 받아와 정보 저장

        if(id.equalsIgnoreCase("must") && pwd.equals("1234")) {  // 값이랑 같은지 비교 (Ignorecase : 대소문자 구별 x)
            response.sendRedirect("ResponseWelcome.jsp");  // true
        } else {
            request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")  // false
                    .forward(request, response);
        }
     %>
</body>
</html>
