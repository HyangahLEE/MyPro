package ask2.model;


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
import ask.model.AskDTO;
import ask2.dao.Ask2DAO;


public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {		

		
		request.setCharacterEncoding("UTF-8");
		// request.getRealPath("?��??경로") �? ?��?�� ?��?��?�� ???��?�� ?��?? 경로�? 구해?��?��.
	    // ?��?��체제 �? ?��로젝?���? ?��치할 ?��경에 ?��?�� 경로�? ?��르기 ?��문에 ?��?��처럼 구해?��?���? 좋음
	    String uploadPath = request.getRealPath("/uploadFile");	    
	    System.out.println("?��??경로 : " + uploadPath + "<br/>");
	    
	     
	    int maxSize = 1024 * 1024 * 10; // ?��번에 ?���? ?�� ?��?�� ?��?�� ?��?�� : 10M�? ?��?��
	     
	    String fileName1 = ""; // 중복처리?�� ?���?
	    String originalName1 = ""; // 중복 처리?�� ?��?�� ?���? ?���?
	    long fileSize = 0; // ?��?�� ?��?���?
	    String fileType = ""; // ?��?�� ???��
	     
	    MultipartRequest multi = null;
	    AskDTO dto = new AskDTO();  
	    
	    FileRenamePolicy policy = new DefaultFileRenamePolicy();
	    
	    try{
	        // request,?��?��???��경로,?��?��,?��코딩???��,중복?��?��명에 ???�� 기본 ?���?
	        multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",policy);
	         
         
	        // ?��?��?�� ?���? ?��?��?��름들?�� �??��?��
	        Enumeration files = multi.getFileNames();
	        while(files.hasMoreElements()){
	            // form ?��그에?�� <input type="file" name="?��기에 �??��?�� ?���?" />?�� �??��?��?��.
	            String file1 = (String)files.nextElement(); // ?��?�� input?�� �??��?�� ?��름을 �??��?��
	            // 그에 ?��?��?��?�� ?��?�� ?��?�� ?��름을 �??��?��
	            originalName1 = multi.getOriginalFileName(file1);
	            // ?��?��명이 중복?�� 경우 중복 ?��책에 ?��?�� ?��?�� 1,2,3 처럼 붙어 unique?���? ?��?��명을 ?��?��?��?��?��
	            // ?��?�� ?��?��?�� ?��름을 filesystemName?��?�� ?��?�� �? ?���? ?��보�?? �??��?��?��.(중복?�� ???�� 처리)
	            fileName1 = multi.getFilesystemName(file1);	
	            
	          
	          /*  // ?��?�� ???�� ?��보�?? �??��?��
	            fileType = multi.getContentType(file1);            
	            // input file name?�� ?��?��?��?�� ?��?�� ?��?��?�� �??��?��            
	            File file = multi.getFile(file1);
	            // �? ?��?�� 객체?�� ?��기�?? ?��?��?��
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
				Ask2DAO dao = Ask2DAO.getInstance();
				
				int result = dao.insert(conn, dto);
							
				if( result == 1 ) {
					return "ask2_list.do";     			
				}
				
	    }catch(Exception e){
	        e.printStackTrace();
	    }
		
		
		return "ask_list.do";
		
	}
	
}

	
	