<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pVal = "3대 7.8";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 - param </title>
</head>
<body>
    <jsp:useBean id="person" class="com.common.Person" scope="request"/>
    <jsp:setProperty name="person" property="name" value="민또기"/>
    <jsp:setProperty name="person" property="age" value="20"/>
    <jsp:forward page="ParamForward.jsp?param1=허민석">
        <jsp:param name="param2" value="창원"/>
        <jsp:param name="param3" value="<%=pVal%>"/>
    </jsp:forward>

</body>
</html>