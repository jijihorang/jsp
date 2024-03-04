package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/13/MultipleProcess.do") // 웹서블릿 이름만 다름 
@MultipartConfig(
        maxFileSize = 1024*1024*1,
        maxRequestSize = 1024*1024_10
)
public class MultipleProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String saveDirectory = getServletContext().getRealPath("/Uploads");
            System.out.println("saveDir 확인 : " + saveDirectory);

            // 다중 파일 업로드 
            ArrayList<String> listFileName = FileUtil.multipleFile(req,saveDirectory);

            // listFileName for문 돌리기
            for(String originalFileName : listFileName) {
                // 저장돈 파일명 변경 
                String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
                
                // DB에 저장하기 (한 번 등록으로 여러 게시글이 등록)
                insertFile(req, originalFileName, savedFileName);
            }

            resp.sendRedirect("FileList.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMessage", "멀티파일 업로드 오류");
            req.getRequestDispatcher("MultiUploadMain.jsp").forward(req, resp);
        }
    }
    private void insertFile(HttpServletRequest req, String oFileName, String sFileName) {
        // file 외의 폼 값 받기 (작성자, 제목, 카테고리)
        String title = req.getParameter("title");
        String[] cateArr = req.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();
        if(cateArr == null) {
            cateBuf.append("선택한 항목 없음.");
        }
        else {
            boolean isFirst = true;
            for(String s : cateArr) {
                if(!isFirst)
                    cateBuf.append(", ");
                else
                    isFirst = false;
                cateBuf.append(s);
            }
        }
        System.out.println("파일 외 폼 값 :: " + title + " " + cateBuf);

        // DB 입력하기
        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(oFileName);
        dto.setSfile(sFileName);

        // DAO를 통해 DB에 반영
        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();
    }
}


