package company.model;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import company.dao.CompanyDAO;
import net.sf.json.JSONObject;

public class CoNumFindHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 사업자등록번호 등록체크
		request.setCharacterEncoding("UTF-8");
		int result = 0;
		int cpnum = Integer.parseInt(request.getParameter("cpnum"));
		
		CompanyDAO dao = CompanyDAO.getInstance();

		//count == 1 등록 가능, count == 0 등록 불가능 
		Connection conn = null; 
		JSONObject data = null; // { "count": result }

		try{ 
			conn = ConnectionProvider.getConnection(); 
			data = new JSONObject(); 
			result = dao.cpNumCheck(cpnum,conn);

			data.put("count", result);  
			request.setAttribute("data", data);

		}catch(Exception e){ 
			e.printStackTrace(); 
		}finally{ 
			try{ 

				/*conn.close(); */
			}catch(Exception e){} 

		} 

		return  "/WEB-INF/view/company/job_reg_ok.jsp";


	}
}
