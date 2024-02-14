<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- 자동 태그 만들어주기--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - Set 2</title>
</head>
<body>
  <h2> List 컬렉션 </h2>
  <%
    ArrayList<Person> pList = new ArrayList<>();
    pList.add(new Person("허민석", 30));
    pList.add(new Person("허민또", 29));
  %>

  <c:set var="personList" value="<%=pList%>" scope="request"/>
  <ul>
    <li>이름 : ${requestScope.personList[0].name}</li> <%-- 이름은 0번쨰 위치한 허민석 출력 --%>
    <li>나이 : ${personList[1].age}</li> <%-- 나이는 1번쨰 위치한 29 출력 --%>
  </ul>

  <h2> Map 컬렉션 </h2>
  <%
    Map<String, Person> pMap = new HashMap<>();
    pMap.put("personArg1", new Person("허피바라", 25));
    pMap.put("personArg2", new Person("카피바라", 29));
  %>
<c:set var="personMap" value="<%=pMap%>" scope="request"/>
<ul>
  <li>이름 : ${requestScope.personMap.personArg1.name}</li> <%-- 이름은 0번쨰 위치한 허피바라 출력 --%>
  <li>나이 : ${personMap.personArg2.age}</li> <%-- 나이는 1번쨰 위치한 29 출력--%>
</ul>
</body>
</html>
