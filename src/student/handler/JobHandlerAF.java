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


import student.dao.JApplicationDAO;
import student.dao.Member01DAO;
import student.dao.TpNameDAO;

public class JobHandlerAF implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection conn = ConnectionProvider.getConnection();
        request.setCharacterEncoding("utf-8"); 
        HttpSession session =  request.getSession();
        
        String userd = request.getParameter("userId");
        String memberId = (String) session.getAttribute("loginUser");
        //request.setAttribute("userInfo", memeberInfoDAO.selectOne(userId));
        Map paramMap = new HashMap();
        paramMap.put("tpid", request.getParameter("tpid"));
        paramMap.put("memberId", memberId);
        paramMap.put("hschool", request.getParameter("hschool"));
        paramMap.put("linea", request.getParameter("linea"));
        paramMap.put("college", request.getParameter("college"));
        paramMap.put("cdepartment", request.getParameter("cdepartment"));
        paramMap.put("university", request.getParameter("university"));
        paramMap.put("udepartment", request.getParameter("udepartment"));
        paramMap.put("gschool", request.getParameter("gschool"));
        paramMap.put("gdepartment", request.getParameter("gdepartment"));
        paramMap.put("hgyear", request.getParameter("hgyear"));
        paramMap.put("hgmonth", request.getParameter("hgmonth"));
        paramMap.put("hgclassification", request.getParameter("hgclassification"));
        paramMap.put("hlocation", request.getParameter("hlocation"));
        paramMap.put("cgyear", request.getParameter("cgyear"));
        paramMap.put("cgmonth", request.getParameter("cgmonth"));
        paramMap.put("cgclassification", request.getParameter("cgclassification"));
        paramMap.put("clocation", request.getParameter("clocation"));
        paramMap.put("ugyear", request.getParameter("ugyear"));
        paramMap.put("ugmonth", request.getParameter("ugmonth"));
        paramMap.put("ugclassification", request.getParameter("ugclassification"));
        paramMap.put("ulocation", request.getParameter("ulocation"));
        paramMap.put("ggyear", request.getParameter("ggyear"));
        paramMap.put("ggmonth", request.getParameter("ggmonth"));
        paramMap.put("ggclassification", request.getParameter("ggclassification"));
        paramMap.put("glocation", request.getParameter("glocation"));
        paramMap.put("csexualA", request.getParameter("csexualA"));
        paramMap.put("csexualB", request.getParameter("csexualB"));
        paramMap.put("usexualA", request.getParameter("usexualA"));
        paramMap.put("usexualB", request.getParameter("usexualB"));
        paramMap.put("gsexualA", request.getParameter("gsexualA"));
        paramMap.put("gsexualB", request.getParameter("gsexualB"));
        paramMap.put("mprocess", request.getParameter("mprocess"));
        paramMap.put("eprocess", request.getParameter("eprocess"));
        paramMap.put("msd", request.getParameter("msd"));
        paramMap.put("stype", request.getParameter("stype"));
        paramMap.put("exemption", request.getParameter("exemption"));
        paramMap.put("periodsy", request.getParameter("periodsy"));
        paramMap.put("periodsm", request.getParameter("periodsm"));
        paramMap.put("periodey", request.getParameter("periodey"));
        paramMap.put("periodem", request.getParameter("periodem"));
        paramMap.put("foreignlA", request.getParameter("foreignlA"));
        paramMap.put("foreignlB", request.getParameter("foreignlB"));
        paramMap.put("foreignlC", request.getParameter("foreignlC"));
        paramMap.put("testA", request.getParameter("testA"));
        paramMap.put("testB", request.getParameter("testB"));
        paramMap.put("testC", request.getParameter("testC"));
        paramMap.put("scoreA", request.getParameter("scoreA"));
        paramMap.put("scoreB", request.getParameter("scoreB"));
        paramMap.put("scoreC", request.getParameter("scoreC"));
        paramMap.put("workesA", request.getParameter("workesA"));
        paramMap.put("worketsyA", request.getParameter("worketsyA"));
        paramMap.put("worketsmA", request.getParameter("worketsmA"));
        paramMap.put("worketsdA", request.getParameter("worketsdA"));
        paramMap.put("worketeyA", request.getParameter("worketeyA"));
        paramMap.put("worketemA", request.getParameter("worketemA"));
        paramMap.put("worketedA", request.getParameter("worketedA"));
        paramMap.put("mworkeA", request.getParameter("mworkeA"));
        paramMap.put("licenseA", request.getParameter("licenseA"));
        paramMap.put("acquisitionyA", request.getParameter("acquisitionyA"));
        paramMap.put("acquisitionmA", request.getParameter("acquisitionmA"));
        paramMap.put("acquisitiondA", request.getParameter("acquisitiondA"));
        paramMap.put("IssuanceA", request.getParameter("IssuanceA"));
        paramMap.put("computational", request.getParameter("computational"));
        paramMap.put("motive", request.getParameter("motive"));


        JApplicationDAO.insert(conn, paramMap);
        
        return "/WEB-INF/view/main/index.jsp";
    }

}
