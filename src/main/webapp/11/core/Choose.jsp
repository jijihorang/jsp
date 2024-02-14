<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - Choose, When, Otherwise </title>
</head>
<body>
    <c:set var="number" value="100"/>
    <h2> choose 태그로 홀짝 판단 </h2>
   <c:choose>
       <c:when test="${number % 2 == 0}">
           ${number}는 짝수입니다.
       </c:when>
       <c:otherwise>
           ${number}는 홀수입니다.
       </c:otherwise>
   </c:choose>

    <h2> 민또의 국영수 평균 학점 </h2>
    <form>
        국어 : <input type="text" name="kor"><br/>
        영어 : <input type="text" name="eng"><br/>
        수학 : <input type="text" name="math"><br/>
        <input type="submit" value="학점 구하기">
    </form>
    <%-- form에 모든 과목 점수가 입력되었는지 확인 --%>
    <c:if test="${!(empty param.kor or empty param.eng or empty param.math)}" >
        <%-- 값이 들어갔으면 평균 계산 --%>
        <c:set var="avg" value="${(param.kor + param.eng + param.math)/3}"/>
        평균 점수는 ${avg} 이므로
        <c:choose>
            <c:when test="${avg>=90}"> A학점 </c:when>
            <c:when test="${avg>=80}"> B학점 </c:when>
            <c:when test="${avg>=70}"> C학점 </c:when>
            <c:when test="${avg>=60}"> D학점 </c:when>
            <c:otherwise> F학점 </c:otherwise>
        </c:choose>
    </c:if>
</body>
</html>
