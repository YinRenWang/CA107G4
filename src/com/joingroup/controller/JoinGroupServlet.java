package com.joingroup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import com.joingroup.model.JoinGroupService;
import com.joingroup.model.JoinGroupVO;

public class JoinGroupServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
	if ("456".equals(action)) { // 來自addEmp.jsp的請求  
	
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			java.sql.Date hiredate = null;
			try {
				
				String memId = req.getParameter("memId").trim();		
				String teamId = req.getParameter("teamId").trim();
			
				JoinGroupVO joinGroupVO = new JoinGroupVO();
				joinGroupVO.setMemId(memId);
				joinGroupVO.setTeamId(teamId);
					
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("joinGroupeVO", joinGroupVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/joinGroup/listAllEmp.jsp");
					failureView.forward(req, res);
					return;
				}	
				/***************************2.開始新增資料***************************************/
				JoinGroupService joinGroupSvc = new JoinGroupService();
				System.out.println("1234");
				joinGroupVO = joinGroupSvc.addJoinGroupVO(memId,teamId);
			
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/joinGroup/listAllEmp.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);	
				

			}catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/joinGroup/listAllEmp.jsp");
				failureView.forward(req, res);
			}
			}
    
    
	}}
