package android.com.goods.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import android.com.goods.model.GoodsService;
import android.com.goods.model.GoodsVO;


@WebServlet("/android/GoodsServlet")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Gson gson = new Gson();  
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();

		String action = req.getParameter("action");
		
		
		if("get_one_by_Id".equals(action)) {
			
			String goodId = req.getParameter("goodId");
			
			GoodsService goodsSvc = new GoodsService();
			
			GoodsVO goodsVO = goodsSvc.getOneGood(goodId);
			out.print(gson.toJson(goodsVO));
			
			
		}
		
		if("get_all".equals(action)) {
			
			
			GoodsService goodsSvc = new GoodsService();
			List<GoodsVO> goodsVOs = goodsSvc.getAll();
			out.print(gson.toJson(goodsVOs));
		}
		
		
		
		
	}

}
