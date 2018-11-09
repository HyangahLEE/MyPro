	package ask.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;


public class fileDownHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		 
	    
		   
	    // ���� ���ε�� ���
	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "uploadFile";
	    System.out.println(">>>>>savePath :"+savePath);
	 
	    // ������ ���� ����� ���ϸ�
	    String filename = request.getParameter("filename");
	    
	     
	    // ���� ������ ���ϸ�
	    String orgfilename = request.getParameter("filename") ;
	      
	 
	    InputStream in = null;
	    OutputStream os = null;
	    File file = null;
	    boolean skip = false;
	    String client = "";
	 
	 
	    try{
	         
	 
	        // ������ �о� ��Ʈ���� ���
	        try{
	            file = new File(savePath, filename);
	            in = new FileInputStream(file);
	        }catch(FileNotFoundException fe){
	            skip = true;
	        }
	        
	        client = request.getHeader("User-Agent");
	 
	        // ���� �ٿ�ε� ��� ����
	        response.reset() ;
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-Description", "JSP Generated Data");
	 
	 
	        if(!skip){
	 
	             
	            // IE
	            if(client.indexOf("MSIE") != -1){
	                response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
	 
	            }else{
	                // �ѱ� ���ϸ� ó��
	                orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
	 
	                response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
	                response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	            } 
	             
	            response.setHeader ("Content-Length", ""+file.length() );
	 
	 
	       
	            os = response.getOutputStream();
	            byte b[] = new byte[(int)file.length()];
	            int leng = 0;
	             
	            while( (leng = in.read(b)) > 0 ){
	                os.write(b,0,leng);
	                
	            }
	 
	        }else{
	            response.setContentType("text/html;charset=UTF-8");
	            System.out.println("<script language='javascript'>alert('������ ã�� �� �����ϴ�');history.back();</script>");
	 
	        }
	         
	       in.close();
	       os.close();
	 
	    }catch(Exception e){
	      e.printStackTrace();
	    }
		
		
		
		
		
		
		return null;
		
		
		
		
		
		
	}
	
}

	
	