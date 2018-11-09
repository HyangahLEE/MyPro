package lms.stregist.model;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import lms.stregist.dao.InterviewVDAO;




public class ViewHandler implements com.util.CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String tpid = request.getParameter("tpid");
	
			 
	    int currentPage = request.getParameter("inpage") == null ? 1 : Integer.parseInt(request.getParameter("inpage"));
		int start, end;
		int pageSize = 6; 
		int pageBlock = 10; 		
		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			InterviewVDAO dao = InterviewVDAO.getInstance();
			
			int totalRecords = 0;
			int totalPages = 0;			
			
			totalRecords = dao.getTotalRecords(conn,tpid);			
			totalPages = (int) Math.ceil((double)totalRecords/pageSize);
			start = (currentPage-1)*pageSize +1;
			end = start + pageSize -1 ;
			
			java.util.List<InterviewVDTO> list = null; 				
	
			list = dao.selectList(conn, tpid, start, end);
			
			
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
		
			//
			String paging = dao.pagingProc(currentPage, pageSize, pageBlock, totalPages, tpid);
			request.setAttribute("paging", paging);	
			
		} catch (Exception e) {
			System.out.println("> List.doGet()...");
			e.printStackTrace();
		}finally {
			
		}
		
		return "/WEB-INF/view/stregist/view.jsp";
	}

}
