package student.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import student.dao.TpNameDAO;

public class JobHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub
        String index = request.getParameter("index");
        Connection conn = ConnectionProvider.getConnection();
        HttpSession session =  request.getSession(false);
        System.out.println(index);

        if(index.equals("11")) {
            request.setAttribute("list", TpNameDAO.select(conn,index));
            request.setAttribute("title", "프로그래밍 과정");
        } else if(index.equals("12")) { 
            request.setAttribute("list", TpNameDAO.select(conn,index));
            request.setAttribute("title", "데이터베이스 과정");
        } else if(index.equals("13")) {
            request.setAttribute("list", TpNameDAO.select(conn,index));
            request.setAttribute("title", "스마트폰 과정");
        }
        
        request.setAttribute("userId",(String) session.getAttribute("loginUser"));
        return "/WEB-INF/view/student/jobM.jsp";
    }

}
