package student.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import student.dao.TpNameDAO;

public class IncumbentHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub
        String index = request.getParameter("index");
        Connection conn = ConnectionProvider.getConnection();
        System.out.println(index);

        if(index.equals("1")) {
            request.setAttribute("list", TpNameDAO.select(conn,index));
            request.setAttribute("title", "프로그래밍 과정");
        } else if(index.equals("2")) { 
            request.setAttribute("list", TpNameDAO.select(conn,index));
            request.setAttribute("title", "데이터베이스 과정");
        } else if(index.equals("3")) {
            request.setAttribute("list", TpNameDAO.select(conn,index));
            request.setAttribute("title", "스마트폰 과정");
        }
        
        
        return "/WEB-INF/view/student/studentM.jsp";
    }

}
