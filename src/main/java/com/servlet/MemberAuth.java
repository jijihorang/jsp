package com.servlet;

import com.membership.MemberDAO;
import com.membership.MemberDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class MemberAuth extends HttpServlet {
    private static final long serialVersionUID = 1L; /* 클래스 버전 관리 식별자 */

    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        // 어플리케이션 내장객체
        ServletContext app = this.getServletContext();

        // DAO 생성
        dao = new MemberDAO();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        // 서블릿 초기화 매개변수에서 관리자 ID 받기 (web.xml에 파라미터로 받아둔거 가져옴)
        String admin_id = this.getInitParameter("admin_id");

        // 인증을 요청한 ID/PWD 받기 (jsp에 있는 쿼리스트링 아이디 비번을 받아옴)
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        MemberDTO dto = dao.getMemberDTO(id, pass);

        String memberName = dto.getName();

        if(memberName != null) { // 일치하는 회원이 있을 때
            req.setAttribute("authMessage", memberName + "회원님 반갑습니다.");
        } else { // 일치하는 회원이 없을 때
            if(admin_id.equals(id)) {
                req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
            } else {
                req.setAttribute("authMessage", "비회원입니다.");
            }
        }

        req.getRequestDispatcher("/12/MemberAuth.jsp").forward(req,resp);
    }

    @Override
    public void destroy() {
        dao.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
