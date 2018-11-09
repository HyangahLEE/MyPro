package sist.mainHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import notice.dao.NoticeDAO;
import notice.model.NoticeDTO;
import student.dao.TpNameDAO;
import student.model.TpNameDTO;

public class MainHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Connection conn = null;
		
		System.out.println("MainHandler �씠�룞");
		
		try {
			conn = ConnectionProvider.getConnection();
			TpNameDAO tndao = TpNameDAO.getInstance();
			List<TpNameDTO> list = null;
			list = tndao.getCourse();
			
			NoticeDAO ndao = NoticeDAO.getInstance();
			List<NoticeDTO> listN = null;
			listN = ndao.getAllNotice();
			
			
			System.out.println(">>list size" +list.size());
			System.out.println(">>listN size" +listN.size());
			
			request.setAttribute("list", list);
			request.setAttribute("listN", listN);
			

			
		} catch (Exception e) {
			System.out.println(" MainHandler  : " +e.toString());
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}

		return "/WEB-INF/view/main/index.jsp";
	}

}
