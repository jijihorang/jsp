<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 1번 방법 : session에 있는 user 정보 삭제
    session.removeAttribute("UserId");
    session.removeAttribute("UserName");
    // response.sendRedirect("LoginForm.jsp");

    // 2번 방법 : session에 모든 속성 삭제
    session.invalidate();
    response.sendRedirect("LoginForm.jsp");
%>
