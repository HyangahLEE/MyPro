package ask.model;


import java.io.File;
import java.sql.Connection;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.CommandHandler;
import com.util.ConnectionProvider;

import ask.dao.AskDAO;


public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {		

		
		request.setCharacterEncoding("UTF-8");
		// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	    String uploadPath = request.getRealPath("/uploadFile");	    
	    System.out.println("절대경로 : " + uploadPath + "<br/>");
	    
	     
	    int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	     
	    String fileName1 = ""; // 중복처리된 이름
	    String originalName1 = ""; // 중복 처리전 실제 원본 이름
	    long fileSize = 0; // 파일 사이즈
	    String fileType = ""; // 파일 타입
	     
	    MultipartRequest multi = null;
	    AskDTO dto = new AskDTO();  
	    
	    FileRenamePolicy policy = new DefaultFileRenamePolicy();
	    
	    try{
	        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	        multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",policy);
	         
         
	        // 전송한 전체 파일이름들을 가져옴
	        Enumeration files = multi.getFileNames();
	        while(files.hasMoreElements()){
	            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	            String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴
	            // 그에 해당하는 실재 파일 이름을 가져옴
	            originalName1 = multi.getOriginalFileName(file1);
	            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
	            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
	            fileName1 = multi.getFilesystemName(file1);	
	            
	          
	          /*  // 파일 타입 정보를 가져옴
	            fileType = multi.getContentType(file1);            
	            // input file name에 해당하는 실재 파일을 가져옴            
	            File file = multi.getFile(file1);
	            // 그 파일 객체의 크기를 알아냄
	            fileSize = file.length();*/
	           
	            
	        }  
	        
	     
	        
	        dto.setAcontent(multi.getParameter("acontent"));
			dto.setEmail(multi.getParameter("email"));
			dto.setPass(multi.getParameter("pass"));
			dto.setWriter(multi.getParameter("writer"));
			dto.setAtitle(multi.getParameter("atitle"));
			dto.setAfile(originalName1);
			dto.setSavefile(fileName1);
			dto.setAdid(multi.getParameter("adid"));
			
			String p_num =  multi.getParameter("p_num");
			System.out.println(p_num);
			
			if (  p_num.equals("") || p_num == null ) {  
				dto.setStep(0);
				dto.setDepth(0);
					}else { 	    					
						System.out.println(p_num);
						dto.setAnum(Integer.parseInt(p_num));						
						dto.setRef(Integer.parseInt(multi.getParameter("p_ref"))); 		
						dto.setStep(Integer.parseInt(multi.getParameter("p_step")));		
						dto.setDepth(Integer.parseInt(multi.getParameter("p_depth")));	
					}
	        
	        
	            Connection conn = 
						ConnectionProvider.getConnection();
				AskDAO dao = AskDAO.getInstance();
				
				int result = dao.insert(conn, dto);
							
				if( result == 1 ) {
					return "ask_list.do";     			
				}
				
	    }catch(Exception e){
	        e.printStackTrace();
	    }
		
		
		return "ask_list.do";
		
	}
	
}

	
	