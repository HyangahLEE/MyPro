package lms.student.model;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.MemberDAO;
import lms.student.dto.FollowUpdateDTO;

public class FupInputUpdateHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		System.out.println(" FupInputUpdateHandler 넘어오는 값: " + memberId);
		
		String raeligibleck = request.getParameter("raeligibleck");
		String rafacility = request.getParameter("rafacility");
		String ratecha = request.getParameter("ratecha");
		String ratechb = request.getParameter("ratechb");
		String raothers = request.getParameter("raothers");
		String rgida = request.getParameter("rgida");
		String rgidb = request.getParameter("rgidb");
		String rgidc = request.getParameter("rgidc");
		String wfield = request.getParameter("wfield");
		String htype = request.getParameter("htype");
		String wtype = request.getParameter("wtype");
		String wtime = request.getParameter("wtime");
		int radesiredsal = Integer.parseInt(request.getParameter("radesiredsal"));
		String cname = request.getParameter("cname");
		int cpnum = Integer.parseInt(request.getParameter("cpnum"));
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String efield = request.getParameter("efield");
		String insuranceck = request.getParameter("insuranceck");
		String edate = request.getParameter("edate");
		
		
		FollowUpdateDTO fudto = new FollowUpdateDTO();
		
		fudto.setMemberId(memberId);
		fudto.setRaeligibleck(raeligibleck);
		fudto.setRafacility(rafacility);
		fudto.setRatecha(ratecha);
		fudto.setRatechb(ratechb);
		fudto.setRaothers(raothers);
		fudto.setRgida(rgida);
		fudto.setRgidb(rgidb);
		fudto.setRgidc(rgidc);
		fudto.setWfield(wfield);
		fudto.setHtype(htype);
		fudto.setWtype(wtype);
		fudto.setWtime(wtime);
		fudto.setRadesiredsal(radesiredsal);
		fudto.setCname(cname);
		fudto.setCpnum(cpnum);
		fudto.setAddr(addr);
		fudto.setPhone(phone);
		fudto.setEfield(efield);
		fudto.setInsuranceck(insuranceck);
		fudto.setEdate(edate);
		
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		Connection conn = null;
		
		int result = 0;
		try {
			conn = ConnectionProvider.getConnection();
			result = memberDAO.fuupdate(conn, fudto);
			
		} catch (SQLException e) {
			System.out.println("> FupInputUpdateHandler() : " + e.toString());
			e.printStackTrace();
		}
		
		if(result == 1) {
			System.out.println("> followup insert 성공 ");
		} else {
			System.out.println("> followup insert 실패 ");
		}
		
		String url = "/followup.do";
		
		return url;
	}

	
	
}
