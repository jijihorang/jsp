<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - ForEach2 </title>
</head>
<body>
    <h2>List 컬렉션</h2>
    <%
        LinkedList<Person> lists = new LinkedList<>();
        lists.add(new Person("허민석", 29));
        lists.add(new Person("허민또", 28));
        lists.add(new Person("허피바라", 27));
    %>

    <c:set var="lists" value="<%=lists%>"/>
    <c:forEach items="${lists}" var="list">
        <li>이름 : ${list.name}, 나이 : ${list.age}</li> <%-- 리스트 하나씩 뽑아서 출력하기 때문에 list 사용 --%>
    </c:forEach>

    <h2> Map 컬렉션 </h2>
    <%
        Map<String, Person> maps =  new HashMap<>();
        maps.put("1st", new Person("허민석", 29));
        maps.put("2nd", new Person("허민또", 28));
        maps.put("3rd", new Person("허피바라", 27));
    %>

    <c:set var="maps" value="<%=maps%>"/>
    <c:forEach items="${maps}" var="map">
        <li>Key => ${map.key}</li>
        <li>Value => 이름 : ${map.value.name} 나이 : ${map.value.age}</li>
    </c:forEach>
</body>
</html>
