<%@ page import="com.util.JSFunction" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String saveDir = application.getRealPath("/Uploads");
    String saveFileName = request.getParameter("sName");
    String originalFileName = request.getParameter("oName");

    System.out.println("저장 경로 : " + saveDir);
    System.out.println("저장 파일 : " + saveFileName);
    System.out.println("원본 파일 : " + originalFileName);

    try {
        // 파일을 찾아 입력 스트림 생성
        File file = new File(saveDir, saveFileName);
        InputStream inputStream = new FileInputStream(file);

        String client = request.getHeader("User-Agent");

        // 웹 브라우저 방식이 다르기 때문에 구분해서 적음
        if(client.indexOf("WOW64")== -1) {  // 익스플로러가 아닌 경우
            originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1"); // 한글 파일명 깨짐 방지
            System.out.println("클라이언트 헤더 정보 : " + client);
        } else { // 익스플로러일 경우
            originalFileName = new String(originalFileName.getBytes("KSC5601"), "ISO-8859-1");
        }

        // 파일 다운로드용 헤더 설정
        response.reset();
        response.setContentType("application/octet-stream; charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName);
        response.setHeader("Content-Length", "" + file.length());

        // 출력 스트림 초기화
        out.clear();

        // response 내장 객체로부터 새로운 출력 스트림 생성
        OutputStream outStream = response.getOutputStream();

        // 출력 스트림에 파일 내용 출력
        byte[] b = new byte[(int)file.length()];  // 파일 길이를 byte 만큼 배열
        int readBuffer = 0;
        while((readBuffer = inputStream.read(b))>0) { // 파일 다운 기본 형식
            outStream.write(b,0,readBuffer);
        }

        // 입출력 스트림 닫음
        inputStream.close();
        outStream.close();

    } catch (FileNotFoundException fe) {
        JSFunction.alertBack("파일을 찾을 수 없습니다.", out);

    } catch (Exception e) {
        JSFunction.alertBack("예외가 발생했습니다.", out);
    }

%>
