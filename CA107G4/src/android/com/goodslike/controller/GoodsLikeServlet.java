package android.com.goodslike.controller;

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

import android.com.goods.model.GoodsService;
import android.com.goods.model.GoodsVO;
import android.com.goodslike.model.GoodsLikeService;
import android.com.goodslike.model.GoodsLikeVO;
import android.com.member.model.MemberVO;

@WebServlet("/android/GoodsLikeServlet")
public class GoodsLikeServlet extends HttpServlet {

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

		// 加入收藏
		if ("add_to_favorites".equals(action)) {
			String goodId = req.getParameter("goodId");
			String memId = req.getParameter("memId");
			GoodsLikeService glSvc = new GoodsLikeService();
			
			GoodsLikeVO goodsLikeVO = new GoodsLikeVO();

			GoodsVO goodsVO = new GoodsVO();
			goodsVO.setGoodId(goodId);

			MemberVO memberVO = new MemberVO();
			memberVO.setMemId(memId);

			goodsLikeVO.setGoodsVO(goodsVO);
			goodsLikeVO.setMemberVO(memberVO);

			glSvc.addGoodsLike(goodsLikeVO);

		}

		// 移除收藏
		if ("delete_from_favorites".equals(action)) {
			String goodId = req.getParameter("goodId");
			String memId = req.getParameter("memId");
			GoodsLikeService glSvc = new GoodsLikeService();
			
			

			GoodsVO goodsVO = new GoodsVO();
			goodsVO.setGoodId(goodId);

			MemberVO memberVO = new MemberVO();
			memberVO.setMemId(memId);
			
			GoodsLikeVO goodsLikeVO = new GoodsLikeVO();
			goodsLikeVO.setGoodsVO(goodsVO);
			goodsLikeVO.setMemberVO(memberVO);
			
			glSvc.deleteGoodsLike(goodsLikeVO);
		}

		// 查看我的收藏
		if ("look_my_favorites".equals(action)) {
			String memId = req.getParameter("memId");
			GoodsLikeService glSvc = new GoodsLikeService();
			
//			MemberVO memberVO = new MemberVO();
//			memberVO.setMemId(memId);
//			
//			GoodsLikeVO goodsLikeVO = new GoodsLikeVO();
//			goodsLikeVO.setMemberVO(memberVO);
			
			List<GoodsLikeVO> goodsLikeVOs = glSvc.findByMemId(memId);

			List<GoodsVO> GoodsVOs = new ArrayList<>();

			for (GoodsLikeVO glvo : goodsLikeVOs) {
				GoodsVO goodsVO = glvo.getGoodsVO();
				goodsVO.setGoodImg(null);
				GoodsVOs.add(goodsVO);
			}

			out.print(gson.toJson(GoodsVOs));

		}

	}

}
