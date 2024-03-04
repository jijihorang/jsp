package com.model2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        // 게시물 불러오기
        MVCBoardDAO dao = new MVCBoardDAO();
        String idx = req.getParameter("idx");

        dao.updateVisitCount(idx);  // 조회수 1 증가
        MVCBoardDTO dto = dao.selectView(idx);

        dao.close();

        // 줄바꿈 처리 (\r\n을 <br/>로 바꿈)
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

        // 첨부파일 확장자 확인하고 이미지 타입 확인
        String ext = null;
        String fileName = dto.getSfile();

        if(fileName != null) {
            ext = fileName.substring(fileName.lastIndexOf(".") + 1); /* 확장자 가져옴 */
        }

        String[] mimeStr = {"png", "jpg", "gif"};  // 배열 생성
        List<String> mimeList= Arrays.asList(mimeStr); // 리스트에 배열을 담아 asList 형식으로 변환
        boolean isImage = false;

        // 확장자 파일을 가지고 있다면 true 나머지는 다 false
        if(mimeList.contains(ext)) {
            isImage = true;
        }
        req.setAttribute("dto", dto);
        req.setAttribute("isImage", isImage);
        req.getRequestDispatcher("/14/View.jsp").forward(req,resp);
    }
}
