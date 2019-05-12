package com.goodsorder.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
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

import com.goods.model.GoodsVO;
import com.goodsdetails.model.GoodsDetailsVO;
import com.goodsorder.model.GoodsOrderService;
import com.goodsorder.model.GoodsOrderVO;

@WebServlet("/GoodsOrderServlet")
@MultipartConfig
public class GoodsOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String action = req.getParameter("action");
		System.out.println("action:" + action);
		
		if ("Detail".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String memId = req.getParameter("memId");
				Double goodTotalPricexx  = Double.valueOf(req.getParameter("goodTotalPrice"));
				Integer goodTotalPrice=goodTotalPricexx.intValue();
				String buyerName = req.getParameter("buyerName");
				String county = req.getParameter("county");
				String district = req.getParameter("district");
				String address = req.getParameter("address");
				System.out.println(county+district+address);
				String buyerAddress = county+district+address;
				String buyerPhone = req.getParameter("buyerPhone");
				Integer goodOrdStatus = 1;
								
				GoodsOrderVO orderVO = new GoodsOrderVO();
				orderVO.setMemId(memId);
				orderVO.setGoodTotalPrice(goodTotalPrice);
				orderVO.setBuyerName(buyerName);
				orderVO.setBuyerAddress(buyerAddress);
				orderVO.setBuyerPhone(buyerPhone);
				orderVO.setGoodOrdStatus(goodOrdStatus);
				
				Vector<GoodsVO> goodlist = (Vector<GoodsVO>) session.getAttribute("shoppingcart");
				List<GoodsDetailsVO>detailsList = new ArrayList();

				for(GoodsVO goodsVO:goodlist) {
					GoodsDetailsVO goodsDetailsVO = new GoodsDetailsVO();
					goodsDetailsVO.setGoodId(goodsVO.getGoodId());
					goodsDetailsVO.setGoodAmount(goodsVO.getQuantity());
					detailsList.add(goodsDetailsVO);	
				}
				
				/*************************** 2.開始查詢資料 *****************************************/
				GoodsOrderService orderSvc = new GoodsOrderService();
				GoodsOrderVO goodsOrderVO=orderSvc.insertOrders(orderVO, detailsList);
				 /*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				 req.setAttribute("goodsOrderVO", goodsOrderVO);
					String url = "/front-end/goodsdetail/Detail.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);
//			catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/goodsorder/select_page.jsp");
//				failureView.forward(req, res);
//			}
				
		}
		
		
		if ("getMemOrder".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String memId = req.getParameter("memId");
				if (memId == null || (memId.trim()).length() == 0) {
					errorMsgs.add("請輸入會員帳號");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goodsorder/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/

				GoodsOrderService orderSvc = new GoodsOrderService();
				List<GoodsOrderVO> goodsOrderList = orderSvc.getMemOrder(memId);
				if (goodsOrderList.size()==0) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goodsorder/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("goodsOrderList", goodsOrderList);
				String url = "/front-end/goodsorder/select_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder.jsp
				successView.forward(req, res);

			

		}

		if ("getOneOrder".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String goodOrderId = req.getParameter("goodOrderId");
				if (goodOrderId == null || (goodOrderId.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goodsorder/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/

				GoodsOrderService orderSvc = new GoodsOrderService();
				GoodsOrderVO orderVO = orderSvc.getOneOrder(goodOrderId);
				if (orderVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goodsorder/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orderVO", orderVO);
				String url = "/goodsorder/listOneOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goodsorder/select_page.jsp");
				failureView.forward(req, res);
			}

		}

		if ("addOrder".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				System.out.println("start getParameter");
				String goodOrderId = req.getParameter("goodOrderId");
				String memId = req.getParameter("memId");
				if (memId == null || (memId.trim()).length() == 0) {
					errorMsgs.add("請輸入會員帳號");
				}

				Integer goodTotalPrice = new Integer(req.getParameter("goodTotalPrice"));

				java.sql.Timestamp goodDate = null;
				try {
					goodDate = java.sql.Timestamp.valueOf(req.getParameter("goodDate").trim());
				} catch (IllegalArgumentException e) {
					goodDate = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				String buyerName = req.getParameter("buyerName");
				String buyerAddress = req.getParameter("buyerAddress");
				String buyerPhone = req.getParameter("buyerPhone");
				String enameReg = "^[(0-9)]{10}$";
				if (buyerPhone == null || buyerPhone.trim().length() == 0) {
					errorMsgs.add("請輸入電話");
				} else if (!buyerPhone.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("請輸入數字");
				}
				Integer goodOrdStatus = new Integer(req.getParameter("goodOrdStatus"));

				/*************************** 2.開始查詢資料 *****************************************/
				System.out.println("start execute");

				GoodsOrderService orderSvc = new GoodsOrderService();
				GoodsOrderVO orderVO = orderSvc.insert(goodOrderId, memId, goodTotalPrice, goodDate, buyerName,
						buyerAddress, buyerPhone, goodOrdStatus);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orderVO", orderVO);
				String url = "/goodsorder/listAllOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goodsorder/select_page.jsp");
				failureView.forward(req, res);
			}

		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

			String goodOrderId = req.getParameter("goodOrderId");

			/***************************2.開始查詢資料****************************************/
			GoodsOrderService orderSvc = new GoodsOrderService();
			GoodsOrderVO orderVO = orderSvc.getOneOrder(goodOrderId);
			
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("orderVO", orderVO);
			String url = "/front-end/goodsorder/update_buyer_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
		
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String goodOrderId = req.getParameter("goodOrderId");
			String memId = req.getParameter("memId");
			Integer goodTotalPrice = new Integer(req.getParameter("goodTotalPrice"));
			java.sql.Timestamp goodDate = null;
			goodDate = java.sql.Timestamp.valueOf(req.getParameter("goodDate").trim());
			String buyerName = req.getParameter("buyerName");
			String buyerAddress = req.getParameter("buyerAddress");
			String buyerPhone = req.getParameter("buyerPhone");
			Integer goodOrdStatus = new Integer(req.getParameter("goodOrdStatus"));
			
			GoodsOrderVO orderVO = new GoodsOrderVO();
			orderVO.setGoodOrderId(goodOrderId);
			orderVO.setMemId(memId);
			orderVO.setGoodTotalPrice(goodTotalPrice);
			orderVO.setGoodDate(goodDate);
			orderVO.setBuyerName(buyerName);
			orderVO.setBuyerAddress(buyerAddress);
			orderVO.setBuyerPhone(buyerPhone);
			orderVO.setGoodOrdStatus(goodOrdStatus);
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("orderVO", orderVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/goodsorder/update_buyer_input.jsp");
				failureView.forward(req, res);
				return; //程式中斷
			}

			/***************************2.開始修改資料****************************************/
			GoodsOrderService orderSvc = new GoodsOrderService();
			 orderVO = orderSvc.updateAll(goodOrderId, memId, goodTotalPrice, goodDate, buyerName, buyerAddress, buyerPhone, goodOrdStatus);
			
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("orderVO", orderVO);
			String url = "/front-end/goodsorder/listOneOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}
}
