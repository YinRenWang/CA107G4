package ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajax.model.ClassVO;
import ajax.model.UserVO;

@WebServlet("/servletResponse")
public class servletResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public servletResponse() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		/*************************** 1.接收請求參數 ****************************************/
		String action = req.getParameter("action");
		String gradeId = req.getParameter("gradeId");
		String classId = req.getParameter("classId");
		System.out.print("我進來了");
		// 處理三階動態選單資料區塊
		if ("getSelect".equals(action)) {
			try {
			List<ClassVO> classList = null;
			List<UserVO> userlist = null;
			// 查詢年級、班級對應同學資料區塊
			if (!"-1".equals(classId)) {
				/*************************** 2.開始查詢資料 ****************************************/
				/* 此一區塊應由service去資料庫依年級、班級查詢取得 */
				
				if ("AA101".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("白玫瑰");
					user1.setNameId("1001");
					user1.setClassId("AA101");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("紅玫瑰");
					user2.setNameId("1002");
					user2.setClassId("AA101");
					userlist.add(user2);

					UserVO user3 = new UserVO();
					user3.setName("黃玫瑰");
					user3.setNameId("1003");
					user3.setClassId("AA101");
					userlist.add(user3);
				}
				if ("AA102".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("白向日葵");
					user1.setNameId("1004");
					user1.setClassId("AA102");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("紅向日葵");
					user2.setNameId("1005");
					user2.setClassId("AA102");
					userlist.add(user2);
				}
				if ("AB101".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("波絲喵");
					user1.setNameId("1006");
					user1.setClassId("AB101");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("橘子喵");
					user2.setNameId("1007");
					user2.setClassId("AB101");
					userlist.add(user2);
				}
				if ("AB102".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("拉拉");
					user1.setNameId("1008");
					user1.setClassId("AB102");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("柴柴");
					user2.setNameId("1009");
					user2.setClassId("AB102");
					userlist.add(user2);
				}
				if ("AB103".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("黃牛");
					user1.setNameId("1010");
					user1.setClassId("AB103");
					userlist.add(user1);
				}
				if ("AC101".equals(classId)) {
					userlist = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("皮卡丘1號");
					user1.setNameId("1011");
					user1.setClassId("AC101");
					userlist.add(user1);

					UserVO user2 = new UserVO();
					user2.setName("皮卡丘2號");
					user2.setNameId("1012");
					user2.setClassId("AC101");
					userlist.add(user2);
				}
				/*---------------------------------------------*/
			} 
			if(!"-1".equals(gradeId)){
				
				/* 此一區塊應由service去資料庫依年級、班級查詢取得 */
				
				if ("grade1".equals(gradeId)) {
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AA101");
					cls1.setClassName("玫瑰班");
					cls1.setGradeId("grade1");
					classList.add(cls1);

					ClassVO cls2 = new ClassVO();
					cls2.setClassId("AA102");
					cls2.setClassName("向日葵班");
					cls2.setGradeId("grade1");
					classList.add(cls2);
				}
				if ("grade2".equals(gradeId)) {
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AB101");
					cls1.setClassName("喵喵班");
					cls1.setGradeId("grade2");
					classList.add(cls1);

					ClassVO cls2 = new ClassVO();
					cls2.setClassId("AB102");
					cls2.setClassName("汪汪班");
					cls2.setGradeId("grade2");
					classList.add(cls2);

					ClassVO cls3 = new ClassVO();
					cls3.setClassId("AB103");
					cls3.setClassName("哞哞班");
					cls3.setGradeId("grade2");
					classList.add(cls3);
				}
				if ("grade3".equals(gradeId)) {
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AC101");
					cls1.setClassName("皮卡丘班");
					cls1.setGradeId("grade3");
					classList.add(cls1);
				}
				/*---------------------------------------------*/
			}
			
			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			System.out.println(action);
			req.setAttribute("classList", classList);    // 資料庫取出的物件,存入request scope
			req.setAttribute("userList", userlist);      // 資料庫取出的物件,存入request scope
		
			RequestDispatcher successView = req.getRequestDispatcher("/inscourse/selectChange.jsp");
			successView.forward(req, res);
			
			/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
			
//			res.setContentType("text/plain");
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			out.write(array.toString());
//			out.flush();
//			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
