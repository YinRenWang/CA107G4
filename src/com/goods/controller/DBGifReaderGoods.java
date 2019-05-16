package com.goods.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.goods.model.GoodsService;
import com.goods.model.GoodsVO;
@WebServlet("/DBGifReaderGoods")
public class DBGifReaderGoods extends HttpServlet {
	

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			String goodId = req.getParameter("goodId");
			GoodsService goodSvc = new GoodsService();
			GoodsVO goodVO = goodSvc.getOneGood(goodId);
			byte[] buf = goodVO.getGoodImg(); // 4K buffer
			out.write(buf);
		} catch (Exception e) {
			InputStream in =getServletContext().getResourceAsStream("images/NoData/book.png");
			byte[] b =new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}

	

}