package edu.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;

public class EduServiceHandler4 implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/WEB-INF/view/eduservice/eduservice-4.jsp";
	}

}