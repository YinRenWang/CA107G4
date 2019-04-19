package ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

public class CallBackDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CallBackDemo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("account");
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		JSONObject obj = new JSONObject();
		String value = new String();
		if("pikachu".equals(id)){
			value = "Yes";
		} else {
			value = "No";
		}
		obj.put("canPass", value);
		out.write(obj.toString());
		out.flush();
		out.close();
	}

}
