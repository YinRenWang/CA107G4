package android.com.goodsorder.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import android.com.goods.model.GoodsService;
import android.com.goods.model.GoodsVO;
import android.com.goodsdetails.model.GoodsDetailsService;
import android.com.goodsdetails.model.GoodsDetailsVO;
import android.com.goodsorder.model.GoodsOrderService;
import android.com.goodsorder.model.GoodsOrderVO;
import android.com.member.model.MemberService;
import android.com.member.model.MemberVO;
import android.com.withdrawalrecord.model.WithdrawalRecordService;

@WebServlet("/android/GoodsOrderServlet")
public class GoodsOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Gson gson = new GsonBuilder()

				.setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");

		
		if("update_order_status".equals(action)) {
			String goodOrderId = req.getParameter("goodOrderId");
			Integer orderStatus = Integer.parseInt(req.getParameter("orderStatus"));
			
			//包裝資料
			GoodsOrderVO goVO = new GoodsOrderVO();
			goVO.setGoodOrderId(goodOrderId);
			goVO.setGoodOrdStatus(orderStatus);
			
			GoodsOrderService goSvc = new GoodsOrderService();
			goSvc.update(goVO);
			
			
			
		}
				
		if ("find_good_order_by_TeacherId".equals(action)) {
			String teacherId = req.getParameter("teacherId");
			
			GoodsOrderService goSvc = new GoodsOrderService();
			List<GoodsOrderVO> goVOs = goSvc.getAll();
			
			
			//濾掉沒有的
			List<GoodsOrderVO> goVOsfinal = 
			goVOs.stream()
			.filter( goVO -> goVO.getGoodsDetailsVOs().stream()
					.filter( gdVO -> gdVO.getGoodsVO().getTeacherId().equals(teacherId))
					.collect(Collectors.toSet())
					.size() != 0 )
			.collect(Collectors.toList());
			
			//殺掉圖片 去除非本人商品
			for(GoodsOrderVO goVO : goVOsfinal) {
				Set<GoodsDetailsVO> setfinal = new HashSet<>();
				for(GoodsDetailsVO gdVO : goVO.getGoodsDetailsVOs()) {
					if(gdVO.getGoodsVO().getTeacherId().equals(teacherId)) {
						gdVO.getGoodsVO().setGoodImg(null);
						setfinal.add(gdVO);		
					}
					
				}
				goVO.setGoodsDetailsVOs(setfinal);
			}
			
			
			out.print(gson.toJson(goVOsfinal));
			
		}

		if ("find_my_good_by_memId".equals(action)) {

			String memId = req.getParameter("memId");
			GoodsOrderService goSvc = new GoodsOrderService();
			List<GoodsOrderVO> gvos = goSvc.findMyGoodOrderByMemId(memId);
			for(GoodsOrderVO govo : gvos) {
				for(GoodsDetailsVO gdvo : govo.getGoodsDetailsVOs()) {
					gdvo.getGoodsVO().setGoodImg(null);
				}
			}
			
			out.print(gson.toJson(gvos));

		}

		if ("add_new_good_order".equals(action)) {

			GoodsOrderVO goodsOrderVO = gson.fromJson(req.getParameter("goodsOrderVO"), GoodsOrderVO.class);
			// 取出memId 比對餘額是否充足
			String memId = goodsOrderVO.getMemId();
			MemberService memSvc = new MemberService();
			MemberVO memberVO = memSvc.getOneMember(memId);
			if (memberVO.getMemBalance() < goodsOrderVO.getGoodTotalPrice()) {
				// 餘額不足
				out.print("Insufficient_account_balance");
				return;
			}

			// 取出我的車
			Type mapType = new TypeToken<Map<GoodsVO, Integer>>() {
			}.getType();
			Map<GoodsVO, Integer> myCart = gson.fromJson(req.getParameter("myCart"), mapType);

			// 建立訂單VO
			goodsOrderVO.setBuyerName(memberVO.getMemName());
			goodsOrderVO.setBuyerAddress(memberVO.getMemAdd());
			goodsOrderVO.setBuyerPhone(memberVO.getMemPhone());
			goodsOrderVO.setGoodOrdStatus(1);

			// 建立訂單詳情
			Set<GoodsDetailsVO> goodsDetailsVOs = new HashSet<>();
			for (GoodsVO gvo : myCart.keySet()) {
				GoodsDetailsVO gdvo = new GoodsDetailsVO();
				System.out.println(gvo.getGoodId());
				gdvo.setGoodsVO(gvo);
				gdvo.setGoodsOrderVO(goodsOrderVO);
				gdvo.setGoodAmount(myCart.get(gvo));
				goodsDetailsVOs.add(gdvo);
			}
			goodsOrderVO.setGoodsDetailsVOs(goodsDetailsVOs);

			// 建立訂單Service
			GoodsOrderService goodsOrderSvc = new GoodsOrderService();
			goodsOrderSvc.add(goodsOrderVO);

			// 扣除款項
			memberVO.setMemBalance(memberVO.getMemBalance() - goodsOrderVO.getGoodTotalPrice());
			memSvc.update_balance(memberVO);

			// 新增交易紀錄
			WithdrawalRecordService wrSvc = new WithdrawalRecordService();
			wrSvc.addWithdrawalRecord(memberVO.getMemId(), -goodsOrderVO.getGoodTotalPrice(),
					new Date(new GregorianCalendar().getTimeInMillis()));

			out.print("Success");

		}

	}

}
