package company.model;


import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import company.dao.Job_regDAO;

public class AddJobHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		String jrfields = request.getParameter("jrfields").trim();
		String jrrespon = request.getParameter("jrrespon").trim();
		String jrworkplace = request.getParameter("jrworkplace").trim();
		int jrsal = Integer.parseInt(request.getParameter("jrsal").trim());
		String jrrequiredskill = request.getParameter("jrrequiredskill").trim();
		String jreducation = request.getParameter("jreducation").trim();
		String jrcareer = request.getParameter("jrcareer").trim();
		int jrrecruit = Integer.parseInt(request.getParameter("jrrecruit").trim());
		String jrdeadline = request.getParameter("jrdeadline").trim();
		String jretc = request.getParameter("jretc").trim();
		String jrpreference = request.getParameter("jrpreference").trim();
		String jrcondition = request.getParameter("jrcondition").trim();
		String jremptype = request.getParameter("jremptype").trim();
		int cpnum = Integer.parseInt(request.getParameter("cpnum").trim());

		
		Job_reg jobreg = new Job_reg();
		
		jobreg.setJrfields(jrfields);
		jobreg.setJrrespon(jrrespon);
		jobreg.setJrworkplace(jrworkplace);
		jobreg.setJrsal(jrsal);
		jobreg.setJrrequiredskill(jrrequiredskill);
		jobreg.setJreducation(jreducation);
		jobreg.setJrcareer(jrcareer);
		jobreg.setJrrecruit(jrrecruit);
		jobreg.setJrdeadline(jrdeadline);
		jobreg.setJretc(jretc);
		jobreg.setJrpreference(jrpreference);
		jobreg.setJrcondition(jrcondition);
		jobreg.setJremptype(jremptype);
		jobreg.setCpnum(cpnum);
		
		Job_regDAO jobregDAO = Job_regDAO.getInstance();
		
		Connection conn = null;
		
		int result = 0;
		try {
			conn = ConnectionProvider.getConnection();
			result = jobregDAO.insert(jobreg, conn);
		} catch (SQLException e) {
			System.out.println("> AddJobHandler() : " + e.toString());
			e.printStackTrace();
		}
		
		if(result == 1) {
			System.out.println("> 구인의뢰 등록이 성공했습니다 ");
			return "/WEB-INF/view/company/addjob.jsp";
		} else {
			System.out.println("> 구인의뢰 등록이 실패했습니다 ");
			return "/WEB-INF/view/company/job_reg.jsp";
		}
		 
	}
}
