package com.goods.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.goods.model.GoodsService;
import com.goods.model.GoodsVO;

@MultipartConfig
@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GoodsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		List<GoodsVO> goodlist = (Vector<GoodsVO>) session.getAttribute("shoppingcart");
		
		String action = req.getParameter("action");
		
		System.out.println("post---"+action);
		
//------------------------------新增物品至購物車中-------------------------------------------
		if("add_shoppingcart".equals(action)) {
			
		/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		
		String goodId = req.getParameter("goodId");
		System.out.println(goodId);
		String goodName = req.getParameter("goodName");
		Integer quantity = new Integer(req.getParameter("quantity"));
		Integer goodPrice = new Integer(req.getParameter("goodPrice"));	
		
		/*************************** 2.開始查詢資料 *****************************************/
		GoodsService goodsSvc = new GoodsService();
		GoodsVO goodVO = goodsSvc.getOneGood(goodId);
		System.out.println(goodVO);
			if(goodlist == null) {
				goodlist = new Vector<GoodsVO>();
				goodlist.add(goodVO);
			}else {
				if (goodlist.contains(goodVO)) {
					GoodsVO innerGood = goodlist.get(goodlist.indexOf(goodVO));
					innerGood.setQuantity(innerGood.getQuantity());
				} else {
					goodlist.add(goodVO);
				}
			}
		/*************************** 3.完成,準備轉交(Send the Success view) ***********/
			session.setAttribute("shoppingcart", goodlist);
			String url = "/front-end/goods/good_home.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
			return; // 程式中斷
		}
		
// ----------------------更改購物車的數量-------------------------------------------
		
					if ("QTY".equals(action)) {
		System.out.println("更改購物車的數量");
						String qty = req.getParameter("qty");
						System.out.println(qty);
						int d = Integer.parseInt(qty);
						String quantity = req.getParameter("quantity");
						System.out.println(quantity);
						int y=Integer.parseInt(quantity);
						goodlist.get(d).setQuantity(y);;
						System.out.println(goodlist);
						
						String url = "/front-end/goods/shoppingcart.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						return; // 程式中斷
						
					}
					
		
// ----------------------刪除購物車中的書籍-------------------------------------------
		
			if ("DEL".equals(action)) {
System.out.println("刪除購物車的書籍");
				String del = req.getParameter("del");
				int d = Integer.parseInt(del);
				goodlist.remove(d);
				System.out.println(goodlist);
				
				String url = "/front-end/goods/shoppingcart.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return; // 程式中斷
				
			}
			
//---------------------確認訂單，計算購物車總價錢-----------------------------------------
			try {
			if ("check_order".equals(action)) {
System.out.println("結帳");
				double total = 0;
				for (int i = 0; i < goodlist.size(); i++) {
					GoodsVO order = goodlist.get(i);
					Integer price = order.getGoodPrice();
					Integer quantity = order.getQuantity();
					total += (price * quantity);
				}
				String userBuy = req.getQueryString();
				String totalPrice = String.valueOf(total);
				req.getSession().setAttribute("totalPrice", totalPrice);
				
				if(goodlist.size()>0) {
				String url = "/front-end/goods/check_order.jsp";
				RequestDispatcher rd = req.getRequestDispatcher(url);
				rd.forward(req, res);
				return;
				}else {
					String url = "/front-end/goods/good_home.jsp";
					RequestDispatcher rd = req.getRequestDispatcher(url);
					rd.forward(req, res);
					return;
				}
			}}catch(NullPointerException ne){
				String url = "/front-end/goods/good_home.jsp";
				RequestDispatcher rd = req.getRequestDispatcher(url);
				rd.forward(req, res);
				return;
			}
					
//------------------------------------新增商品上架----------------------------------------
			if ("insert".equals(action)) {		
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String teacherId = req.getParameter("teacherId");
				String goodName = req.getParameter("goodName");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,10}$";
				if (goodName == null || goodName.trim().length() == 0) {
					errorMsgs.add("商品名稱：請勿空白");
				} else if (!goodName.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱：只能是中、英文字母、數字 , 且長度必需在2到6之間");
				}
				Integer goodPrice = null;
				try {
					goodPrice = new Integer(req.getParameter("goodPrice").trim());
				} catch (NumberFormatException e) {
					goodPrice = 0;
					errorMsgs.add("商品價格：請填數字");
				}

				String goodInfo = req.getParameter("goodInfo");
				Integer goodStatus = new Integer(req.getParameter("goodStatus"));

				// 圖片
				Part p = req.getPart("goodImg");
				InputStream in = null;
				byte[] goodImg = null;
				in = p.getInputStream();
				goodImg = new byte[in.available()];
				in.read(goodImg);
				in.close();
				
				
				GoodsVO goodVO = new GoodsVO();
				goodVO.setTeacherId(teacherId);
				goodVO.setGoodName(goodName);
				goodVO.setGoodPrice(goodPrice);
				goodVO.setGoodInfo(goodInfo);
				//圖片
				goodVO.setGoodImg(goodImg);
				goodVO.setGoodStatus(goodStatus);				
				
				if (!errorMsgs.isEmpty()) {
					String url = "/front-end/goods/addGoods.jsp";
					req.setAttribute("inCludeVO", "goods"); // 資料庫取出的memberVO物件,存入req
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					return; // 程式中斷
				}
				
				/*************************** 2.開始修改資料 *****************************************/
				GoodsService goodsSvc = new GoodsService();
				goodVO = goodsSvc.insertGood(teacherId, goodName, goodPrice, goodInfo, goodImg, goodStatus);
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/goods/addGoods.jsp";
				req.setAttribute("inCludeVO", "goods"); // 資料庫取出的memberVO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return; // 程式中斷

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				String url = "/front-end/member/viewAllMember.jsp";
				req.setAttribute("inCludeVO", "goods"); // 資料庫取出的memberVO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return; // 程式中斷
			}
		}
			
//------------------------------------更新商品----------------------------------------

			if ("updateGood".equals(action)) {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String goodId = req.getParameter("goodId");
				String teacherId = req.getParameter("teacherId");
				String goodName = req.getParameter("goodName");
				Integer goodPrice = new Integer(req.getParameter("goodPrice"));
				String goodInfo = req.getParameter("goodInfo");
				Integer goodStatus = new Integer(req.getParameter("goodStatus"));
				
				GoodsService goodsSvc = new GoodsService();
				GoodsVO goodVO_Old = goodsSvc.getOneGood(goodId);
				
				byte[] goodImg = goodVO_Old.getGoodImg();
				// 圖片
				Part p = req.getPart("goodImg");

				if (p.getSubmittedFileName().length() != 0) {
					System.out.println("getSubmittedFileName() +" + p.getSubmittedFileName()); 
					InputStream in = null;
					goodImg = null;
					in = p.getInputStream();
					goodImg = new byte[in.available()];
					goodVO_Old.setGoodImg(goodImg);
					in.read(goodImg);
					in.close();
				}
				
				
				goodVO_Old.setGoodId(goodId);
				goodVO_Old.setTeacherId(teacherId);
				goodVO_Old.setGoodName(goodName);
				goodVO_Old.setGoodPrice(goodPrice);
				goodVO_Old.setGoodInfo(goodInfo);
				goodVO_Old.setGoodImg(goodImg);
				goodVO_Old.setGoodStatus(goodStatus);

				/*************************** 2.開始查詢資料 *****************************************/
// above have ---- GoodsService goodsSvc = new GoodsService(); 
				GoodsVO goodVO = goodsSvc.updateGood(goodVO_Old);
				System.out.println(goodVO);
				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("inCludeVO", "goods"); // 資料庫取出的memberVO物件,存入req
				String url = "/front-end/member/viewAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				return; // 程式中斷
			}
			

			if ("updateStatus".equals(action)) {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String goodId = req.getParameter("goodId");
				/*************************** 2.開始查詢資料 *****************************************/
				GoodsService goodsSvc = new GoodsService();
				GoodsVO goodsVO = goodsSvc.getOneGood(goodId);
				int st = goodsVO.getGoodStatus();

				if (st == 0) {
					goodsVO.setGoodStatus(1);
				} else {
					goodsVO.setGoodStatus(0);
				}
				System.out.println(goodsVO);
				goodsSvc.updateStatus(goodsVO);

				/*************************** 3.完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/goods/listAllGoods.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return; // 程式中斷

			}

			if ("delete".equals(action)) {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String goodId = req.getParameter("goodId");
				/*************************** 2.開始查詢資料 *****************************************/
				GoodsService goodsSvc = new GoodsService();
				GoodsVO goodsVO = goodsSvc.getOneGood(goodId);
				goodsSvc.delete(goodId);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/goods/listAllGoods.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				return; // 程式中斷

			}
			

			if ("getOne_Goods".equals(action)) {
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String goodId = req.getParameter("goodId");

				/*************************** 2.開始查詢資料 *****************************************/
				GoodsService goodsSvc = new GoodsService();
				GoodsVO goodVO = goodsSvc.getOneGood(goodId);
				if (goodVO == null) {
					errorMsgs.add("查無資料");
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("goodVO", goodVO);
				String url = "/front-end/goods/shoppingcart.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				return; // 程式中斷

			}
			
//-------------------------更新一樣商品----------------------------------
			
			if ("getOne_For_Update".equals(action)) {
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String goodId = req.getParameter("goodId");
				
				/*************************** 2.開始查詢資料 *****************************************/

				GoodsService goodsSvc = new GoodsService();
				GoodsVO goodVO = goodsSvc.getOneGood(goodId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("goodVO", goodVO); // 資料庫取出的goodVO物件,存入req

				String url = "/front-end/goods/update_Good_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Good_input.jsp
				successView.forward(req, res);
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/goods/listAllGoods.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
			}
			
			
			
//--------------------返回商城首頁------------------------------------------
			if("go_home_page".equals(action)) {
				String url = "/front-end/goods/good_home.jsp";
				res.sendRedirect(req.getContextPath()+url);
				return;
			}

		}
	
	
	
}

