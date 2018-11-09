<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	
	});
</script>
</head>
<body>
	<%

request.setCharacterEncoding("UTF-8");

//파일명 가져오기
String fileName = request.getParameter("fileName");

/* 
//경로 가져오기(상대경로)
String saveDir = "/WebContent/upload/"; */

//경로 가져오기(절대경로)
String downPath = request.getServletContext().getRealPath("upload");


System.out.println(" 절대 경로 위치 : " + downPath);
System.out.println(" fileName : " + fileName);

// \ 표시 == \\
String sFilePath = downPath + "\\" + fileName;
System.out.println(" sFilePath 위치 : " + sFilePath);


try {

	
	//파일 객체 생성
	File outputFile = new File(sFilePath);
	
	//파일을 읽어와서 임시 버퍼에 저장 + 한 번에 저장 가능한 크기 지정(10M)
	byte[] temp = new byte[1024*1024*10];
	
	//page - ContentType 동적으로 바꾸기 위해 초기화
	response.reset();
	
	//기타 내용 추가+ 브라우저에서 다운로드 시 화면에 출력
	response.setHeader("Content-Type", "application/octet-stream;");
	
	 //한글 인코딩
	fileName = new String(fileName.getBytes("UTF-8"), "8859_1");
	 
	 //파일 클릭시 다운로드 저장 화면 출력
	response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
	 
	 
	  if(outputFile.isFile()) {
		//inputStream으로 파일을 읽어와 연다.
		  FileInputStream in = new FileInputStream(outputFile);
		
		BufferedInputStream bis = new BufferedInputStream(in);
		
		//jsp자체의 out객체 비워주기
		out.clear();
		out = pageContext.pushBody();
		
		
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
/* 		//브라우저에 쓰기
		  ServletOutputStream outStream = response.getOutputStream(); */
		
		
		//파일을 클리어인트쪽으로 저장
		  int readNum = 0;

		//inputStream을 읽어온다. 끝 전까지 ( -1 )
		while ((readNum = bis.read(temp, 0 , temp.length)) != -1) { //temp 배열을 0번째부터 최대 temp.length만큼 읽어온다.
			//읽어올 게 없다면 -1 리턴
			
			bos.write(temp, 0 ,readNum); //temp 배열 0 ~ numRead까지 출력
		}
		
		bos.flush();
		bos.close();
		in.close();
		
	  }

} catch(Exception e) {
	System.out.println( " DownloadPage 에러 " + e.getMessage());
	
}

/* 
//파일을 읽어와서 임시 버퍼에 저장 + 한 번에 저장 가능한 크기 지정(10M)
byte[] temp = new byte[1024*1024*10];

//inputStream으로 파일을 읽어와 연다.
FileInputStream in = new FileInputStream(outputFile);

//request.getHeader("user-agent") == 웹브라우저 확인 [ IE ]
boolean MSIE = request.getHeader("user-agent").indexOf("MSIE") != -1;

/*  //파일명 인코딩
if(MSIE) {// 공백 > + 변환된 것을 다시 공백으로 변환
	fileName = URLEncoder.encode(fEncoding, "UTF8").replaceAll("\\+", " ");
}else { //브라우저가 IE가 아닐경우
	fileName = new String(fEncoding.getBytes("UTF-8"), "8859_1");
} 


 */


 






%>
</body>
</html>