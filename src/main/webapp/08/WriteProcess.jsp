<%@ page import="com.model1.board.BoardDTO" %>
<%@ page import="com.model1.board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="IsLoggedIn.jsp"%>

<%
  // DTO 설정
  String title = request.getParameter("title");
  String content = request.getParameter("content");

  BoardDTO dto = new BoardDTO();
  dto.setTitle(title);
  dto.setContent(content);
  dto.setId(session.getAttribute("UserId").toString());

  // DAO 설정
  BoardDAO dao = new BoardDAO();
  int iResult = dao.insertWrite(dto);

  /* <writeprocess 기능용 테스트 >
  int iResult = 0;
  for(int i = 0; i <= 100; i++) {
  dto.setTitle(title + " -" + i);
  iResult = dao.insertWrite(dto);
  } */

  dao.close();

  if(iResult == 1) {  // 글쓰기 성공
    response.sendRedirect("List.jsp");
  } else { // 글쓰기 실패
    JSFunction.alertBack("글쓰기 실패", out);
  }
%>