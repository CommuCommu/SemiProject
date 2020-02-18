package MainAndNotice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/noticeList")
public class NoticeListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}
	
	
	public void processFunction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		System.out.println("NoticeListServlet command = " + command);
	
		if(command == null || command.equals("")) {
			resp.sendRedirect("notice.jsp");
			
		} else if (command.equals("search")) {
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			System.out.println("검색어 = " + searchWord);
			resp.sendRedirect("notice.jsp?searchWord=" + searchWord + "&choice=" + choice);
		
		} else if (command.equals("page")) {
			String pageNumber = req.getParameter("pageNumber");
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			
			if(choice == null || searchWord == null) {
				resp.sendRedirect("notice.jsp?pageNumber=" + pageNumber);
			} else if(!choice.equals("sel") && !searchWord.equals("")) {
				resp.sendRedirect("notice.jsp?pageNumber=" + pageNumber + "&searchWord=" + searchWord + "&choice=" + choice);
			}
		}
	}
}
