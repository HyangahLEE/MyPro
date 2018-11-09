package student.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import student.dao.TpNameDAO;

public class IncumbentHandlerV implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub
        String tpid = request.getParameter("tpid");
        HttpSession session =  request.getSession(false);
        
        request.setAttribute("tpid", tpid);
        request.setAttribute("userId",(String) session.getAttribute("loginUser"));
        
        return "/WEB-INF/view/student/studentV.jsp";
    }

}
