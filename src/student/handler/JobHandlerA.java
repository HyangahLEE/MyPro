package student.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import student.dao.Member01DAO;
import student.dao.TpNameDAO;

public class JobHandlerA implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection conn = ConnectionProvider.getConnection();
        HttpSession session =  request.getSession();
        String userId = request.getParameter("userId");
        
        String tpid =request.getParameter("tpid");
        String memberId = (String) session.getAttribute("loginUser");
        
        
        
        request.setAttribute("tpid",tpid);
        request.setAttribute("tpname",TpNameDAO.getName(conn, tpid));
        request.setAttribute("memberInfo",Member01DAO.getMember(conn, memberId));
        
        return "/WEB-INF/view/student/jobA.jsp";
    }

}
