package Attended.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import Attended.dao.JapplicationDAO02;
import Attended.dao.SattendmDAO;

public class AttendedHandlerV implements CommandHandler{

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection conn = ConnectionProvider.getConnection();
        String tpid = request.getParameter("tpid");
        request.setAttribute("list", SattendmDAO.getMember(conn, tpid));
        request.setAttribute("month", SattendmDAO.getMonth(conn, tpid));
        return "/WEB-INF/view/Attended/AttendedV.jsp";
    }

    
}