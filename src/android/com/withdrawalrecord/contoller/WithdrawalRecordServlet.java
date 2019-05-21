package android.com.withdrawalrecord.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import android.com.withdrawalrecord.model.WithdrawalRecordService;
import android.com.withdrawalrecord.model.WithdrawalRecordVO;

@WebServlet("/android/WithdrawalRecordServlet")
public class WithdrawalRecordServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Gson gson = new GsonBuilder()  
				  .setDateFormat("yyyy-MM-dd HH:mm:ss")  
				  .create(); 
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();

		String action = req.getParameter("action");
		System.out.println(action);
		
		if("get_my_money_record".equals(action)) {
			
			String memId = req.getParameter("memId");
			WithdrawalRecordService wrSvc = new WithdrawalRecordService();
			List<WithdrawalRecordVO> wrVOs = wrSvc.findByKey(memId);
			
			out.print(gson.toJson(wrVOs));
			
		}
		

		

	}
}
