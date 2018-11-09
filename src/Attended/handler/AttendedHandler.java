package Attended.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import Attended.dao.TpNameDAO01;

public class AttendedHandler implements CommandHandler{

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String index = request.getParameter("index");
        Connection conn = ConnectionProvider.getConnection();
        
        if(index.equals("재직자")) {
            request.setAttribute("list", TpNameDAO01.select(conn,index));
        } else if(index.equals("취업자")) { 
            request.setAttribute("list", TpNameDAO01.select(conn,index));
        }
        
       
        
        return "/WEB-INF/view/Attended/AttendedM.jsp";
    }

    
}
