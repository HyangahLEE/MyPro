package company.model;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import company.dao.CompanyDAO;
import company.dao.Job_regDAO;



public class EditJobHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// selectOne 
		Connection conn = null;
		request.setCharacterEncoding("UTF-8");
		
		String jrid = request.getParameter("jrid");
		Job_reg dto = new Job_reg();
		
		try{
			
			conn = ConnectionProvider.getConnection();
			Job_regDAO jobregdao = Job_regDAO.getInstance();
			
			dto = jobregdao.selectOne(conn, jrid);		
			
		} catch (Exception e) {
			System.out.println("> EditJobHandler error ");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		request.setAttribute("dto", dto);
		
		return "/WEB-INF/view/company/editJob.jsp";
	}
}
