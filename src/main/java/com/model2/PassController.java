package com.model2;

import com.fileupload.FileUtil;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
         req.setAttribute("mode", req.getParameter("mode")); /* mode 값을 담아서 그 다음 페이지로 넘겨줌*/
         req.getRequestDispatcher("/14/Pass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        System.out.println("doPost 진입 : ");
         // 매개변수 저장
        String idx = req.getParameter("idx");
        String mode = req.getParameter("mode");
        String pass = req.getParameter("pass");
        System.out.println("파라미터 확인"+ idx + "::" +mode + "::" + pass);

        // 비밀번호 확인
        MVCBoardDAO dao = new MVCBoardDAO();
        boolean confirmed = dao.confirmPassword(pass, idx);
        dao.close();

        if(confirmed) {  // 비밀번호 검증 성공
            // 1. mode = edit일 경우
            if(mode.equals("edit")) {
                HttpSession session = req.getSession();
                session.setAttribute("pass", pass);
                resp.sendRedirect("../mvcboard/edit.do?idx=" + idx);
            } else if(mode.equals("delete")) {
                // 2. mode = delete일 경우
                dao = new MVCBoardDAO();
                MVCBoardDTO dto = dao.selectView(idx);
                int result = dao.deletePost(idx);
                if(result == 1) {
                    String saveFileName = dto.getSfile();
                    FileUtil.deleteFile(req, "/Uploads", saveFileName);
                }
                JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
            }
        } else {  // 비밀번호 검증 실패

            JSFunction.alertBack(resp, "비밀번호 검증 실패");
        }
    }
}
