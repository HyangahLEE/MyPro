package join.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.DBConn;

import join.dao.JoinDAO;
import net.sf.json.JSONObject;
import sist.mainHandler.MemberDTO;

public class JoinFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		
		return "/WEB-INF/view/join/joinForm.jsp";
		
	}
	
}
