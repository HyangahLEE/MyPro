package lms.student.model;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.QuestionDAO;
import lms.student.dto.QuestionDTO;

public class QnaListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String searchCondition = request.getParameter("searchCondition");
		
		/*추가*/
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		if (searchCondition == null || searchCondition == "")
			searchCondition = "qtitle";

		String searchWord = request.getParameter("searchWord");

		System.out.println(">>> error : " + request.getParameter("error"));

		int currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		//
		int start, end;
		int pageSize = 10;
		int pageBlock = 10;

		try {
			Connection conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();

			int totalRecords = 0;
			int totalPages = 0;

			if (searchWord == null) {
				totalRecords = dao.getTotalRecords(conn);
				searchWord = "";
			} else {
				totalRecords = dao.getTotalRecords(conn, searchCondition, searchWord);
			}

			totalPages = (int) Math.ceil((double) totalRecords / pageSize);
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;

			List<QuestionDTO> list = null;
			dao.selectList(conn, start, end, memberId);

			if (searchWord == "") {
				list = dao.selectList(conn, start, end, memberId);
			} else {
				list = dao.selectList(conn, start, end, searchCondition, searchWord, memberId);
			}

			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);

			//
			String paging = dao.pagingProc(currentPage, pageSize, pageBlock, totalPages, searchCondition, searchWord);
			request.setAttribute("paging", paging);

		} catch (Exception e) {
			System.out.println("> List.doGet()...");
			e.printStackTrace();
		} finally {

		}
		return "/WEB-INF/view/qna/qnaList.jsp";
		
	}

}
