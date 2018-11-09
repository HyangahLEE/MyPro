package company.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;


import company.dao.Job_regDAO;



public class EditJobListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 구인의뢰목록 수정 select
		
		request.setCharacterEncoding("UTF-8");
		
		int cpnum = Integer.parseInt(request.getParameter("cpnum"));
		
		
		System.out.println( "EditJobListHandler"+  request.getParameter("error") );
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			Job_regDAO dao = Job_regDAO.getInstance();
			
			
			List<Job_reg> list = null; 
			list = dao.selectList(conn, cpnum);
			
			
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			System.out.println("> EditJobListHandler.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return "/WEB-INF/view/company/editJobList.jsp";
	}
}
