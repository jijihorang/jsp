<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int pInt2 = (Integer)pageContext.getAttribute("pageInt");  // 형 변환 후 저장된 값 가져오기
  // String pStr2 = pageContext.getAttribute("pageStr").toString();  // 값 가져오기
  Person person2 = (Person)pageContext.getAttribute("pagePerson");  // 형 변환 후 저장된 값 가져오기
%>

<ul>
  <li>Include 페이지 int : <%=pInt2%></li>  <%-- 출력 --%>
  <li>Include 페이지 Str : <%=pageContext.getAttribute("pageStr")%></li>  <%-- 출력 --%>
  <li>Include 페이지 Person :<%=person2.getName()%>, <%=person2.getAge()%></li>   <%-- 출력 --%>
</ul>
