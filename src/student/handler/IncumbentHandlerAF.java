package student.handler;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import student.dao.IApplicationDAO;
import student.dao.Member01DAO;
import student.dao.TpNameDAO;

public class IncumbentHandlerAF implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection conn = ConnectionProvider.getConnection();
        request.setCharacterEncoding("utf-8"); 
        HttpSession session =  request.getSession(false);
        
        String userId = request.getParameter("userId");
        String memberId = (String) session.getAttribute("loginUser");
        //request.setAttribute("userInfo", memeberInfoDAO.selectOne(userId));
        Map paramMap = new HashMap();
        paramMap.put("tpid", request.getParameter("tpid"));
        paramMap.put("memberId", memberId);
        paramMap.put("company", request.getParameter("company"));
        paramMap.put("department", request.getParameter("department"));
        paramMap.put("tel", request.getParameter("tel"));
        paramMap.put("fax", request.getParameter("fax"));
        paramMap.put("naverid", request.getParameter("naverid"));
        paramMap.put("division", request.getParameter("division"));
        paramMap.put("mprocess", request.getParameter("mprocess"));
        paramMap.put("eprocess", request.getParameter("eprocess"));
        paramMap.put("payment", request.getParameter("payment"));

        IApplicationDAO.insert(conn, paramMap);
        
        return "/WEB-INF/view/main/index.jsp";
    }

}
