package student.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import student.dao.TpNameDAO;

public class JobHandlerV implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
    	Connection conn = ConnectionProvider.getConnection();
    	HttpSession session =  request.getSession();
    	
        String userId = request.getParameter("userId");
        
        //request.setAttribute("userInfo", memeberInfoDAO.selectOne(userId));
        
        String tpid =request.getParameter("tpid");
        
        

        request.setAttribute("tpid", tpid);
        request.setAttribute("userId",(String) session.getAttribute("loginUser"));
        
        return "/WEB-INF/view/student/jobV.jsp";
    }

}
