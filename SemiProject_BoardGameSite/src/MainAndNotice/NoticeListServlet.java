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
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	public void processFunction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		System.out.println("NoticeListServlet command 확인 = " + command);
		
		
		// 검색어가 아무것도 넘어오지 않았을 때는 공지사항 메인(notice.jsp)로 이동하도록 한다.
		if(command == null || command.equals("")) {
			resp.sendRedirect("notice.jsp");
			
		// 검색어가 넘어온 경우, notice.jsp 에서 보낸 검색어 searchWord, 검색항목인 choice 값을 받아들인다.
		} else if (command == "search") {
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			
			// 만약 검색이 실행되었는데 검색항목을 선택하지 않았다면 공지사항 메인(notice.jsp)로 이동하도록 한다.
			if(choice == null || searchWord == null) {
				resp.sendRedirect("notice.jsp");
			}
		}
	}
}
