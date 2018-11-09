package ceo.model;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;



public class ListHandler implements com.util.CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String searchCondition = request.getParameter("searchCondition");
		if( searchCondition == null || searchCondition=="") searchCondition="ceotitle";
		
		String searchWord = request.getParameter("searchWord");
		
		System.out.println( "ListHandler>>> "+  request.getParameter("error") );
	 
		
		int currentPage = 
				request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
				//
		int start, end;
		int pageSize = 10; 
		int pageBlock = 10; 
		
		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			ceo.dao.CeoDAO dao = ceo.dao.CeoDAO.getInstance();
			
			int totalRecords = 0;
			int totalPages = 0;
			
			if( searchWord == null) { 
				totalRecords = dao.getTotalRecords(conn);
				searchWord = "";
			}else {
				totalRecords = dao.getTotalRecords(conn, searchCondition, searchWord);
			}
			
			totalPages = (int) Math.ceil((double)totalRecords/pageSize);
			start = (currentPage-1)*pageSize +1;
			end = start + pageSize -1 ;
			
			java.util.List<CeoDTO> list = null; 
					dao.selectList(conn, start, end);
			
			if( searchWord == "") { 
				list = dao.selectList(conn, start, end);
			}else {
				list = dao.selectList(conn, start, end, searchCondition, searchWord);
			}
			
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
		
			//
			String paging = dao.pagingProc(currentPage, pageSize, pageBlock, totalPages,searchCondition, searchWord);
			request.setAttribute("paging", paging);
			System.out.println(paging);
			/*RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/WEB-INF/view/list.jsp");
			dispatcher.forward(request, response);*/
			
		} catch (Exception e) {
			System.out.println("> List.doGet()...");
			e.printStackTrace();
		}finally {
			
		}
		
		
		
		return "/WEB-INF/view/CEOboard/list.jsp";
	}

}
