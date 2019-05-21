package android.com.goodsdetails.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import android.com.goods.model.GoodsService;
import android.com.goods.model.GoodsVO;
import android.com.goodsdetails.model.GoodsDetailsService;
import android.com.goodsdetails.model.GoodsDetailsVO;


@WebServlet("/android/GoodsDetailsServlet")
public class GoodsDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd HH:mm:ss")
                .create(); 
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		System.out.println(action);
		
		
//		
//		if("find_good_detail_by_orderId".equals(action)) {
//			
//			String goodOrderId = req.getParameter("goodOrderId");
//			GoodsDetailsService gdetailSvc = new GoodsDetailsService();
//			List<GoodsDetailsVO> goodsDetailsVOs =  gdetailSvc.findByOrderId(goodOrderId);
//
//			
//			GoodsService goodsSvc = new GoodsService();
//			List<GoodsVO> goodsVOs = new ArrayList<>();
//			for(GoodsDetailsVO goodsDetailsVO : goodsDetailsVOs) {
//				GoodsVO goodsVO = goodsSvc.getOneGood(goodsDetailsVO.getGoodId());
//				goodsVO.setGoodStatus(goodsDetailsVO.getGoodAmount());
//				goodsVOs.add(goodsVO);		
//			}
//			
//			out.print(gson.toJson(goodsVOs));
//			
//			
//		}
		
		
		
		
	}

}
