package com.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.team.model.TeamService;
import com.team.model.TeamVO;
import com.withdrawalrecord.model.WithdrawalRecordService;
import com.inscourse.model.InsCourseService;
import com.inscourse.model.InsCourseVO;
import com.inscoursetime.model.InsCourseTimeService;
import com.inscoursetime.model.InsCourseTimeVO;
import com.joingroup.model.JoinGroupService;
import com.joingroup.model.JoinGroupVO;
@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet {

	private static final String String = null;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("Search_One".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("str");

				/*************************** 2.開始查詢資料 *****************************************/

				InsCourseService insCourseSvc = new InsCourseService();
				List<InsCourseVO> insCourseVOList = insCourseSvc.findClassName(str.trim());
				
				if (insCourseVOList.size() == 0) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/One.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("insCourseVOList", insCourseVOList);
				// 資料庫取出的empVO物件,存入req
				String url = "/front-end/team/One.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				System.out.println("1234");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("HI");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/One.jsp");
				failureView.forward(req, res);
			}
		}
//	---------------------------------------------------------------------------------------------	
		if ("insert".equals(action)) {
			System.out.println("請進");// 來自addEmp.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				JoinGroupService joinGroupSvc = new JoinGroupService();

				String memId = req.getParameter("memId").trim();
				System.out.println("123" + memId);
				String teamId = req.getParameter("teamId").trim();
				if (joinGroupSvc.findById(memId, teamId).getMemId() == null) {
					/****** ********************* 2.開始新增資料 ***************************************/
					JoinGroupVO joinGroupVO = new JoinGroupVO();
					joinGroupVO = joinGroupSvc.addJoinGroupVO(memId, teamId);
					MemberService memberSvc = new MemberService();
					MemberVO membe = memberSvc.getOneMember(req.getParameter("memId"));

					joinGroupSvc.getAll();
					int memblance = 0;
					int blance = membe.getMemBalance();
					Integer wrmoney = new Integer(req.getParameter("inscPrice"));
					int memBlock = membe.getMemBlock();
					System.out.println("餘額" + blance);
					System.out.println("要扣的錢" + wrmoney);
					System.out.println("預扣款項" + memblance);

					if (blance < wrmoney) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/withdrawalrecord/withdrawalrecord.jsp");
						failureView.forward(req, res);
						return;
					} else {

						Integer a = (int) (wrmoney * 0.8);

						System.out.println("8折價" + a);
						memblance = blance - a;
						memBlock = a + memBlock;
						System.out.println("memblance=" + memblance);
						wrmoney = a;
						System.out.println("到資料庫" + wrmoney);
					}
					memberSvc.update1(memblance, memBlock, membe.getMemId());
					// 新增交易紀錄
					WithdrawalRecordService wrSvc = new WithdrawalRecordService();
					wrSvc.addWithdrawalRecord(membe.getMemId(), -wrmoney,
							new Date(new GregorianCalendar().getTimeInMillis()));

					System.out.println("新增完成");

					/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
					String url = "/front-end/team/myTeam.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);
				} else {
					errorMsgs.add("您已經有相同的揪團了");
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/team.jsp");
					failureView.forward(req, res);
					return;
				}
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/myTeam.jsp");
				failureView.forward(req, res);
			}
		}
//	____________________________________________________________________________________________	
		if ("findOneteam".equals(action)) { // 來自listAllEmp.jsp 或 /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String memId = new String(req.getParameter("memId"));
				HttpSession session = req.getSession();
				/*************************** 2.開始查詢資料 ****************************************/
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/myTeam.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				session.setAttribute("memberVO", memId); // 資料庫取出的memberVO物件,存入req
				String url = "/front-end/team/team.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/myTeam.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {
			System.out.println("再見"); // 來自listAllEmp.jsp 或 /dept/listEmps_ByDeptno.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String memId = new String(req.getParameter("memId"));
				String teamId = new String(req.getParameter("teamId"));
				/*************************** 2.開始刪除資料 ***************************************/
				JoinGroupService joinGroupSvc = new JoinGroupService();
				JoinGroupVO joinGroupVO = joinGroupSvc.deleteJoinGroup(memId, teamId);
				joinGroupSvc.deleteJoinGroup(memId, teamId);
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/team/myTeam.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {

				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);

			}
		}

		if ("insert1".equals(action)) { // 來自addEmp.jsp的請求
			System.out.println(action);
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String leaderID = req.getParameter("leaderID");
				System.out.println(leaderID);
				System.out.println("3");
				String memidReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (leaderID == null || leaderID.trim().length() == 0) {
					errorMsgs.add("會員帳號請勿空白");
				} else if (!leaderID.trim().matches(memidReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員帳號: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}
				System.out.println("4");
				String inscID = req.getParameter("inscID");
				if (inscID == null) {
					errorMsgs.add("課程編號請勿空白");
				}
				System.out.println("5");
				java.sql.Date teamMFD = new java.sql.Date(System.currentTimeMillis());

				java.sql.Date teamEXP = null;
				try {
					teamEXP = java.sql.Date.valueOf(req.getParameter("teamEXP").trim());
				} catch (IllegalArgumentException e) {
					teamEXP = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				TeamVO teamVO = new TeamVO();

				teamVO.setLeaderID(leaderID);
				;
				teamVO.setInscID(inscID);
				teamVO.setTemaMFD(teamMFD);
				;
				teamVO.setTeamEXP(teamEXP);

				System.out.println(leaderID);
				System.out.println(inscID);
				System.out.println(teamMFD);
				System.out.println(teamEXP);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("teamVO", teamVO); // 含有輸入格式錯誤的withdrawalRecordVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/addTeam.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始新增資料 *****************************************/
				TeamService teamSvc = new TeamService();
				teamSvc.addTeam(leaderID, inscID, teamMFD, teamEXP, 1);

				InsCourseService inscourseSvc = new InsCourseService();
				InsCourseVO incrouseVO = inscourseSvc.findOneById(inscID);

				int status = incrouseVO.getInscType();

				status = 1;
				inscourseSvc.updateStatus(inscID, status);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				res.sendRedirect(req.getContextPath() +"/front-end/team/team.jsp");

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/team/addTeam.jsp");
				failureView.forward(req, res);
			}
		}

		if ("include1".equals(action)) { // 來自listAllEmp.jsp 或 /dept/listEmps_ByDeptno.jsp 的請求

			/*************************** 1.接收請求參數 ****************************************/

			System.out.println("有近來");
			String inscId = req.getParameter("inscId");

			JSONArray array = new JSONArray();
			System.out.println(inscId);
			TeamService teamSvc = new TeamService();
			TeamVO teamVO = teamSvc.getOneTeam(inscId);

			InsCourseService inscourseSvc = new InsCourseService();
			InsCourseVO incrouseVO = inscourseSvc.findOneById(inscId);

			MemberService memberSvc = new MemberService();
			MemberVO memberVO = memberSvc.getOneMember(teamVO.getLeaderID());

			JSONObject obj = new JSONObject();
			System.out.println(teamVO.getLeaderID());

			try {
				obj.put("member_name", memberVO.getMemName());
				obj.put("member_phone", memberVO.getMemPhone());
				obj.put("team_price", incrouseVO.getInscPrice());
				obj.put("team_MFD", teamVO.getTemaMFD());

				array.put(obj);

			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(obj);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
//				   out.flush();
			out.close();

			/*************************** 2.開始查詢資料 ****************************************/

////					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/	

		}

		if ("include2".equals(action)) { // 來自listAllEmp.jsp 或 /dept/listEmps_ByDeptno.jsp 的請求

			/*************************** 1.接收請求參數 ****************************************/

			System.out.println("有近來");
			String teamId = req.getParameter("teamId");

			TeamService teamSvc = new TeamService();
			TeamVO teamVO = teamSvc.findByPrimaryKey1(teamId);

			System.out.println(teamId);

			JoinGroupService joinGroupSvc = new JoinGroupService();
			JSONArray array = new JSONArray();
			List<JoinGroupVO> listsize = joinGroupSvc.findByTeamId(teamVO.getTeamId());
			req.setAttribute("listsize", listsize);
			MemberService memberSvc = new MemberService();
			JSONObject obj;
			for (JoinGroupVO joinGroupVO : listsize) {
				MemberVO memberVO = memberSvc.getOneMember(joinGroupVO.getMemId());
				try {
					obj = new JSONObject();
					obj.put("member_Email", memberVO.getMemEmail());
					obj.put("member_Name", memberVO.getMemName());
					array.put(obj);
					// System.out.println(obj);
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}

			System.out.println(array);
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();

		}
		
		

		if ("joinTeam".equals(action)) {
		
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String inscID = new String(req.getParameter("inscID"));
				MemberVO memberVO = (MemberVO)req.getSession().getAttribute("memberVO");
				String leaderID =memberVO.getMemId();
				/*************************** 2.開始刪除資料 ***************************************/
				TeamService teamSvc = new TeamService();
		
					java.sql.Date teamEXP = null;
					try {
						teamEXP = java.sql.Date.valueOf(req.getParameter("teamEXP").trim());
					} catch (IllegalArgumentException e) {
						teamEXP = new java.sql.Date(System.currentTimeMillis());
					}
				teamSvc.addTeam(leaderID, inscID, new Date(new GregorianCalendar().getTimeInMillis()), teamEXP, 1);
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/team/myTeam.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {

				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);

			}
		}
		
		if ("addTeam".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String inscID = new String(req.getParameter("inscID"));
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("inscID", inscID);
				String url = "/front-end/team/addTeam.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {

				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);

			}
		}
		
		
		
		
		
		
		
		

	}
}
