package notice.model;


import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import notice.dao.NoticeDAO;


public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setNcontent(request.getParameter("ncontent"));
		dto.setEmail(request.getParameter("email"));
		dto.setPass(request.getParameter("pass"));
		dto.setMgid(request.getParameter("mgid"));
		dto.setNtitle(request.getParameter("ntitle"));
		
		// hidden p_num , p_ref, p_step, p_depth ?占쏙옙占�?
			if ( request.getParameter("p_num") == "" || request.getParameter("p_num") == null ) {  //?占쏙옙占�? ?占쏙옙占�?
		dto.setStep(0);
		dto.setDepth(0);
			}else { 
				
				// dto    setNum				
				dto.setNnum(Integer.parseInt(request.getParameter("p_num").trim()));
				dto.setRef(Integer.parseInt(request.getParameter("p_ref"))); 		
				dto.setStep(Integer.parseInt(request.getParameter("p_step")));		
				dto.setDepth(Integer.parseInt(request.getParameter("p_depth")));	
			}
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			
			int result = dao.insert(conn, dto);
			System.out.println(result);
						
			if( result == 1 ) {
				return "notice_list.do";
			}
		} catch (Exception e) {
			System.out.println("> Write.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		return "notice_list.do";
		
	}
	
}

	
	