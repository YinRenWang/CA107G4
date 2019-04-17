package com.member.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.member.model.MemberService;
import com.member.model.MemberVO;

public class DBGifReader_VER2 extends HttpServlet {
	

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			String memId = req.getParameter("memId");
			MemberService memSvc = new MemberService();
			MemberVO memberVO = memSvc.getOneMember(memId);
			byte[] buf = memberVO.getMemImage(); // 4K buffer
			out.write(buf);
		} catch (Exception e) {
			InputStream in =getServletContext().getResourceAsStream("/NoData/no.png");
			byte[] b =new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}

	

}