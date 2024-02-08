<%@ page import="com.common.JDBCConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h2>회원 추가 테스트(executeQuery() 사용)</h2>
<%
    JDBCConnect jdbc = new JDBCConnect();

    // 쿼리문 생성
    String sql = "SELECT * FROM member_jsp";
    Statement stmt = jdbc.con.createStatement();

    // 쿼리 실행
    ResultSet rs = stmt.executeQuery(sql);

    // 결과 확인 (페이지에 출력)
    while(rs.next()) {
        String id = rs.getString(1);
        String pw = rs.getString(2);
        String name = rs.getString("name");
        Date regiDate = rs.getDate("regiDate");

        out.println(String.format("%s %s %s %s", id, pw, name, regiDate) + "<br/>");
    }

    // 연결 종료
    jdbc.close();
%>
</body>
</html>
