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
		// request.getRealPath("?ƒ??ê²½ë¡œ") ë¥? ?†µ?•´ ?ŒŒ?¼?„ ???¥?•  ? ˆ?? ê²½ë¡œë¥? êµ¬í•´?˜¨?‹¤.
	    // ?š´?˜ì²´ì œ ë°? ?”„ë¡œì ?Š¸ê°? ?œ„ì¹˜í•  ?™˜ê²½ì— ?”°?¼ ê²½ë¡œê°? ?‹¤ë¥´ê¸° ?•Œë¬¸ì— ?•„?˜ì²˜ëŸ¼ êµ¬í•´?˜¤?Š”ê²? ì¢‹ìŒ
	    String uploadPath = request.getRealPath("/uploadFile");	    
	    System.out.println("? ˆ??ê²½ë¡œ : " + uploadPath + "<br/>");
	    
	     
	    int maxSize = 1024 * 1024 * 10; // ?•œë²ˆì— ?˜¬ë¦? ?ˆ˜ ?ˆ?Š” ?ŒŒ?¼ ?š©?Ÿ‰ : 10Më¡? ? œ?•œ
	     
	    String fileName1 = ""; // ì¤‘ë³µì²˜ë¦¬?œ ?´ë¦?
	    String originalName1 = ""; // ì¤‘ë³µ ì²˜ë¦¬? „ ?‹¤? œ ?›ë³? ?´ë¦?
	    long fileSize = 0; // ?ŒŒ?¼ ?‚¬?´ì¦?
	    String fileType = ""; // ?ŒŒ?¼ ???…
	     
	    MultipartRequest multi = null;
	    AskDTO dto = new AskDTO();  
	    
	    FileRenamePolicy policy = new DefaultFileRenamePolicy();
	    
	    try{
	        // request,?ŒŒ?¼???¥ê²½ë¡œ,?š©?Ÿ‰,?¸ì½”ë”©???…,ì¤‘ë³µ?ŒŒ?¼ëª…ì— ???•œ ê¸°ë³¸ ? •ì±?
	        multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",policy);
	         
         
	        // ? „?†¡?•œ ? „ì²? ?ŒŒ?¼?´ë¦„ë“¤?„ ê°?? ¸?˜´
	        Enumeration files = multi.getFileNames();
	        while(files.hasMoreElements()){
	            // form ?ƒœê·¸ì—?„œ <input type="file" name="?—¬ê¸°ì— ì§?? •?•œ ?´ë¦?" />?„ ê°?? ¸?˜¨?‹¤.
	            String file1 = (String)files.nextElement(); // ?ŒŒ?¼ input?— ì§?? •?•œ ?´ë¦„ì„ ê°?? ¸?˜´
	            // ê·¸ì— ?•´?‹¹?•˜?Š” ?‹¤?¬ ?ŒŒ?¼ ?´ë¦„ì„ ê°?? ¸?˜´
	            originalName1 = multi.getOriginalFileName(file1);
	            // ?ŒŒ?¼ëª…ì´ ì¤‘ë³µ?  ê²½ìš° ì¤‘ë³µ ? •ì±…ì— ?˜?•´ ?’¤?— 1,2,3 ì²˜ëŸ¼ ë¶™ì–´ unique?•˜ê²? ?ŒŒ?¼ëª…ì„ ?ƒ?„±?•˜?Š”?°
	            // ?´?•Œ ?ƒ?„±?œ ?´ë¦„ì„ filesystemName?´?¼ ?•˜?—¬ ê·? ?´ë¦? ? •ë³´ë?? ê°?? ¸?˜¨?‹¤.(ì¤‘ë³µ?— ???•œ ì²˜ë¦¬)
	            fileName1 = multi.getFilesystemName(file1);	
	            
	          
	          /*  // ?ŒŒ?¼ ???… ? •ë³´ë?? ê°?? ¸?˜´
	            fileType = multi.getContentType(file1);            
	            // input file name?— ?•´?‹¹?•˜?Š” ?‹¤?¬ ?ŒŒ?¼?„ ê°?? ¸?˜´            
	            File file = multi.getFile(file1);
	            // ê·? ?ŒŒ?¼ ê°ì²´?˜ ?¬ê¸°ë?? ?•Œ?•„?ƒ„
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

	
	