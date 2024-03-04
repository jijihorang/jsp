package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

// 파일 하나만 업로드
public class FileUtil { 

    // 파일 업로드
    public static String uploadFile(HttpServletRequest req, String sDir)
        throws ServletException, IOException {

        // part 객체를 통해 서버로 전송된 파일명 읽기
        Part part = req.getPart("ofile");  /* ofile 읽어오기 */

        // part 객체의 헤더값 content-disposition 값 읽기
        String partHeader = part.getHeader("content-disposition");

        // form-data; name="attachedFile"; filename="파일명.확장자"
        System.out.println("partHeader ::: " + partHeader);

        // 헤더 값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");

        // 전송된 파일이 있으면 디렉토리에 저장
        if(!originalFileName.isEmpty()) {
            /* C://download/filename/확장자 형식으로 저장  */
            part.write(sDir + File.separator + originalFileName);
        }
        return originalFileName;
    }

    public static String renameFile(String sDir, String fileName) {
        // 확장자 잘라내기
        // temp.png
        String ext = fileName.substring(fileName.lastIndexOf("."));

        // 날짜_시간. 확장자 새로운 파일명 생성
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        String newFileName = now + ext;

        // 기존 파일명을 새 파일명으로 변경
        File oldFile = new File(sDir+File.separator+fileName);
        File newFile = new File(sDir+File.separator+newFileName);
        oldFile.renameTo(newFile);

        return newFileName;
    }
    
    // multiple 속성 추가로 2개 이상 파일 업로드 (메소드명과 반환값만 다름)
    public static ArrayList<String> multipleFile(HttpServletRequest req, String sDir)
        throws ServletException, IOException {

        // 파일명 저장을 위한 컬렉션
        ArrayList<String> listFileName = new ArrayList<>();

        // Part 객체를 통해 서버로 전송된 파일명 읽어오기
        Collection<Part> parts = req.getParts(); //  Part part = req.getPart("attachedFile"); 같음
        for(Part part : parts) {
            // 파일이 아니라면 업로드 대상에서 무시
           if(!part.getName().equals("ofile")) {
               continue;
           }
            String partHeader = part.getHeader("content-disposition");

            System.out.println("partHeader ::: " + partHeader);

            String[] phArr = partHeader.split("filename=");
            String originalFileName = phArr[1].trim().replace("\"", "");

            if(!originalFileName.isEmpty()) {
                part.write(sDir + File.separator + originalFileName);
            }

            //컬렉션에 추가
            listFileName.add(originalFileName);
        }

        return listFileName;
    }

    public static void download(HttpServletRequest req, HttpServletResponse resp, String dir, String sfileName, String ofileName) {

        // dir = "/Uploads
        String sDir = req.getServletContext().getRealPath("/Uploads");

        try {
            File file = new File(sDir, sfileName);
            InputStream inputStream = new FileInputStream(file);

            String client = req.getHeader("User-Agent");

            if(client.indexOf("WOW64")== -1) {  // 익스플로러가 아닌 경우
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1"); // 한글 파일명 깨짐 방지
                System.out.println("클라이언트 헤더 정보 : " + client);
            } else { // 익스플로러일 경우
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            resp.reset();
            resp.setContentType("application/octet-stream; charset=utf-8");
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName);
            resp.setHeader("Content-Length", "" + file.length());


            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream outStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte[] b = new byte[(int)file.length()];  // 파일 길이를 byte 만큼 배열
            int readBuffer = 0;
            while((readBuffer = inputStream.read(b))>0) { // 파일 다운 기본 형식
                outStream.write(b,0,readBuffer);
            }

            // 입출력 스트림 닫음
            inputStream.close();
            outStream.close();

        } catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없음");

        } catch (Exception e) {
            System.out.println("파일 다운로드 중 예외 발생");
            e.printStackTrace();
        }
    }

    // 파일 삭제 (사진)
    public static void deleteFile(HttpServletRequest req, String dir, String fileName) {
        String sDir = req.getServletContext().getRealPath(dir);
        File file = new File(sDir + File.separator +fileName);
        if(file.exists()) {
            file.delete();
        }
    }
}
