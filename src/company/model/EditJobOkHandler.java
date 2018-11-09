package company.model;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;


import company.dao.CompanyDAO;
import company.dao.Job_regDAO;



public class EditJobOkHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// EditJobOk.do
		request.setCharacterEncoding("UTF-8");		

		String jrid = request.getParameter("jrid");
		String jrfields = request.getParameter("jrfields");
		String jrrespon = request.getParameter("jrrespon");
		String jrworkplace = request.getParameter("jrworkplace");
		int jrsal = Integer.parseInt(request.getParameter("jrsal"));
		String jrrequiredskill = request.getParameter("jrrequiredskill");
		String jreducation = request.getParameter("jreducation");
		String jrcareer = request.getParameter("jrcareer");
		int jrrecruit = Integer.parseInt(request.getParameter("jrrecruit"));
		String jrdeadline = request.getParameter("jrdeadline");
		String jretc = request.getParameter("jretc");
		String jrpreference = request.getParameter("jrpreference");
		String jrapproval = request.getParameter("jrapproval");
		String jrcondition = request.getParameter("jrcondition");
		String jremptype = request.getParameter("jremptype");
		int cpnum = Integer.parseInt(request.getParameter("cpnum"));

		Job_reg dto = new Job_reg();
		
		
		dto.setJrid(jrid);
		dto.setJrfields(jrfields);
		dto.setJrrespon(jrrespon);
		dto.setJrworkplace(jrworkplace);
		dto.setJrsal(jrsal);
		dto.setJrrequiredskill(jrrequiredskill);
		dto.setJreducation(jreducation);
		dto.setJrcareer(jrcareer);
		dto.setJrrecruit(jrrecruit);
		dto.setJrdeadline(jrdeadline);
		dto.setJretc(jretc);
		dto.setJrpreference(jrpreference);
		dto.setJrapproval(jrapproval);
		dto.setJrcondition(jrcondition);
		dto.setJremptype(jremptype);
		dto.setCpnum(cpnum);

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			Job_regDAO dao = Job_regDAO.getInstance();

			int result = dao.edit(conn, dto, cpnum, jrid);

			if( result == 1 ) {   // update 성공
				
				System.out.println("구인의뢰 수정이 완료되었습니다");
				
			}else if( result == 0 ) {   // update 실패
 
				System.out.println("구인의뢰 수정 실패했습니다");
			}
			
		} catch (Exception e) {
			System.out.println("> EditJobOkHandler.doPost()..." + e.toString());
			e.printStackTrace();
		}finally {
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}	

		String url = "/editJobList.do";
		return url;
		
	}
}
