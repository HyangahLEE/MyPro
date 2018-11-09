package company.model;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import company.dao.CompanyDAO;


public class AddComHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		
		int cpnum = Integer.parseInt(request.getParameter("cpnum").trim());
		String cpname = request.getParameter("cpname").trim();
		String cphomepage = request.getParameter("cphomepage").trim();
		String cpestablished = request.getParameter("cpestablished").trim();
		String cpceo = request.getParameter("cpceo").trim();
		String cpaddr1 = request.getParameter("cpaddr1").trim();
		String cpaddr2 = request.getParameter("cpaddr2").trim();
		int cpempnum = Integer.parseInt(request.getParameter("cpempnum"));
		String cpsector = request.getParameter("cpsector").trim();
		String cpetc = request.getParameter("cpetc").trim();
		String cpbusinessarea = request.getParameter("cpbusinessarea").trim();
		String cpannual = request.getParameter("cpannual").trim();
		String cpscale = request.getParameter("cpscale").trim();
		int cpzipcode = Integer.parseInt(request.getParameter("cpzipcode"));
		String cpcontactname = request.getParameter("cpcontactname").trim();
		String cpcontactposition = request.getParameter("cpcontactposition").trim();
		String cpcontacttel = request.getParameter("cpcontacttel").trim();
		String cpcontactemail = request.getParameter("cpcontactemail").trim();
		String cptel = request.getParameter("cptel").trim();
		String cpfax = request.getParameter("cpfax").trim();

		
		
		Company company = new Company();
		company.setCpnum(cpnum);
		company.setCpname(cpname);
		company.setCphomepage(cphomepage);
		company.setCpestablished(cpestablished);
		company.setCpceo(cpceo);
		company.setCpaddr1(cpaddr1);
		company.setCpaddr2(cpaddr2);
		company.setCpempnum(cpempnum);
		company.setCpsector(cpsector);
		company.setCpetc(cpetc);
		company.setCpbusinessarea(cpbusinessarea);
		company.setCpannual(cpannual);
		company.setCpscale(cpscale);
		company.setCpzipcode(cpzipcode);
		company.setCpcontactname(cpcontactname);
		company.setCpcontactposition(cpcontactposition);
		company.setCpcontacttel(cpcontacttel);
		company.setCpcontactemail(cpcontactemail);
		company.setCptel(cptel);
		company.setCpfax(cpfax);

		CompanyDAO companyDAO = CompanyDAO.getInstance();
		Connection conn = null;
		
		int result = 0;
		try {
			conn = ConnectionProvider.getConnection();
			result = companyDAO.insert(company, conn);
		} catch (SQLException e) {
			System.out.println("> AddComHandler() : " + e.toString());
			e.printStackTrace();
		}
		
		if(result == 1) {
			System.out.println("> 업체 등록이 성공했습니다 ");
			return "/WEB-INF/view/company/addcom.jsp";
		} else {
			System.out.println("> 업체 등록이 실패했습니다 ");
			return "/WEB-INF/view/company/company.jsp";
		}
		
		
	}
}
