<%@ page import="java.util.HashMap" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application 영역</title>
</head>
<body>
<%--
    웹 애플리케이션 당 하나의 application 객체 생성 가능
    서버를 닫기 전까지 계속 유지
    클라이언트가 요청하는 모든 페이지가 application 객체 공유
--%>
<%
  Map<String, Person> maps = new HashMap<>();  // LinkedHasMap<>() 사용 시 순서대로 출력
  maps.put  ("Person1", new Person("페이커", 28));
  maps.put  ("Person2", new Person("구마유시", 24));
  maps.put  ("Person3", new Person("오너", 27));
  maps.put  ("Person4", new Person("제우스", 21));
  maps.put  ("Person5", new Person("케리아", 23));
  application.setAttribute("maps", maps);
%>

<p>application 영역에 속성이 저장되었습니다.</p>
</body>
</html>
