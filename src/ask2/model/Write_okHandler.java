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
		// request.getRealPath("???κ²½λ‘") λ₯? ?΅?΄ ??Ό? ???₯?  ? ?? κ²½λ‘λ₯? κ΅¬ν΄?¨?€.
	    // ?΄?μ²΄μ  λ°? ?λ‘μ ?Έκ°? ?μΉν  ?κ²½μ ?°?Ό κ²½λ‘κ°? ?€λ₯΄κΈ° ?λ¬Έμ ??μ²λΌ κ΅¬ν΄?€?κ²? μ’μ
	    String uploadPath = request.getRealPath("/uploadFile");	    
	    System.out.println("? ??κ²½λ‘ : " + uploadPath + "<br/>");
	    
	     
	    int maxSize = 1024 * 1024 * 10; // ?λ²μ ?¬λ¦? ? ?? ??Ό ?©? : 10Mλ‘? ? ?
	     
	    String fileName1 = ""; // μ€λ³΅μ²λ¦¬? ?΄λ¦?
	    String originalName1 = ""; // μ€λ³΅ μ²λ¦¬?  ?€?  ?λ³? ?΄λ¦?
	    long fileSize = 0; // ??Ό ?¬?΄μ¦?
	    String fileType = ""; // ??Ό ???
	     
	    MultipartRequest multi = null;
	    AskDTO dto = new AskDTO();  
	    
	    FileRenamePolicy policy = new DefaultFileRenamePolicy();
	    
	    try{
	        // request,??Ό???₯κ²½λ‘,?©?,?Έμ½λ©???,μ€λ³΅??Όλͺμ ??? κΈ°λ³Έ ? μ±?
	        multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",policy);
	         
         
	        // ? ?‘? ? μ²? ??Ό?΄λ¦λ€? κ°?? Έ?΄
	        Enumeration files = multi.getFileNames();
	        while(files.hasMoreElements()){
	            // form ?κ·Έμ? <input type="file" name="?¬κΈ°μ μ§?? ? ?΄λ¦?" />? κ°?? Έ?¨?€.
	            String file1 = (String)files.nextElement(); // ??Ό input? μ§?? ? ?΄λ¦μ κ°?? Έ?΄
	            // κ·Έμ ?΄?Ή?? ?€?¬ ??Ό ?΄λ¦μ κ°?? Έ?΄
	            originalName1 = multi.getOriginalFileName(file1);
	            // ??Όλͺμ΄ μ€λ³΅?  κ²½μ° μ€λ³΅ ? μ±μ ??΄ ?€? 1,2,3 μ²λΌ λΆμ΄ unique?κ²? ??Όλͺμ ??±???°
	            // ?΄? ??±? ?΄λ¦μ filesystemName?΄?Ό ??¬ κ·? ?΄λ¦? ? λ³΄λ?? κ°?? Έ?¨?€.(μ€λ³΅? ??? μ²λ¦¬)
	            fileName1 = multi.getFilesystemName(file1);	
	            
	          
	          /*  // ??Ό ??? ? λ³΄λ?? κ°?? Έ?΄
	            fileType = multi.getContentType(file1);            
	            // input file name? ?΄?Ή?? ?€?¬ ??Ό? κ°?? Έ?΄            
	            File file = multi.getFile(file1);
	            // κ·? ??Ό κ°μ²΄? ?¬κΈ°λ?? ???
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

	
	