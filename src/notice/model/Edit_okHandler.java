package notice.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

public class Edit_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
request.setCharacterEncoding("UTF-8");		
		
     NoticeDTO dto = new NoticeDTO();
     dto.setNcontent(request.getParameter("content"));
     dto.setEmail(request.getParameter("email"));
     dto.setPass(request.getParameter("pass"));
     dto.setMgid(request.getParameter("mgid"));
     dto.setNtitle(request.getParameter("title"));
     dto.setNnum(Integer.parseInt(request.getParameter("num")));
		
		Connection conn = null;
					
		try {
			conn = 
					ConnectionProvider.getConnection();
			notice.dao.NoticeDAO dao = notice.dao.NoticeDAO.getInstance();
			
			int result = dao.edit(conn, dto);
			
						
			if( result == 0 ) {
				/*response.sendRedirect("list.do");*/ 
				//return "notice_list.do";
				
				//int error= 0;
				//request.setAttribute("error", error);
				
			}else if( result == -1 ) {
								
				
				/*return "list.do";*/
				
				//int error=-1;
				//request.setAttribute("error", error);
				request.setAttribute("fs", "n");
				 return "notice_list.do?error=-1"; 
				
			}
		} catch (Exception e) {
			System.out.println("> Edit.doPost()...");
			e.printStackTrace();
		}finally {
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}	
		//에러 잡고 list.do로 떠야 하므로, redirect 시켜야 한다.
		request.setAttribute("fs", "n");
		return "notice_list.do";
		
		
	}
	
}

	
	