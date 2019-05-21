package android.com.friendnexus.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import android.com.friendnexus.model.FriendNexusService;
import android.com.friendnexus.model.FriendNexusVO;
import android.com.member.model.MemberService;
@WebServlet("/android/FriendNexusServlet")

public class FriendNexusServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	private static final String String = null;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Gson gson = new Gson();
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		String action = req.getParameter("action");
		req.setCharacterEncoding("UTF-8");
	
		if("get_my_friends".equals(action)) {
			
			String memId = req.getParameter("memId");
			
			FriendNexusService fnSvc = new FriendNexusService();
			List<FriendNexusVO> fnVOs = fnSvc.friendNexus1(memId);
			
			MemberService memSvc = new MemberService();
			for(FriendNexusVO fnVO : fnVOs) {
				fnVO.setMemId(memSvc.getOneMember(fnVO.getFriendAcc()).getMemName());
			}
			
			out.print(gson.toJson(fnVOs));
			
		}
		
		
		
	}

}