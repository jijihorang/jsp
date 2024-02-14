package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("*.one") /* 공통으로 적힌 ~.one이 온다면 */

public class FrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        System.out.println("FrontController doGet 진입"); /* 출력 안될 시 위에 값과 jsp 파일에서 오류 발생 */

        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/"); /* 마지막 슬러시를 찾아 */
        String commandStr = uri.substring(lastSlash); /* 그 뒤에 값을 가져온다는 의미 */
        /* <li><a href="../12/regist.one">회원가입</a></li> */

        if(commandStr.equals("/regist.one")) {
            registFun(req);
        } else if (commandStr.equals("/login.one")) {
            loginFun(req);
        } else if (commandStr.equals("/freeboard.one")) {
            freeboardFun(req);
        }

        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        req.getRequestDispatcher("/12/FrontController.jsp").forward(req,resp);
        
    }
    // 페이지 별 처리 메서드 
    void  registFun(HttpServletRequest req) {
        System.out.println("회원가입");
        req.setAttribute("resultValue", "<h2>회원가입</h2>");
    }

    void  loginFun(HttpServletRequest req) {
        System.out.println("로그인");
        req.setAttribute("resultValue", "<h2>로그인</h2>");
    }

    void  freeboardFun(HttpServletRequest req) {
        System.out.println("자유게시판");
        req.setAttribute("resultValue", "<h2>자유게시판</h2>");
    }

}
