package MainAndNotice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDto;


@WebServlet("/NoticeWrite")
public class NoticeWriteServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunction(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	public void processFunction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		String command = req.getParameter("command");
		System.out.println(command);
		
		if(command.equals("write")) {
			resp.sendRedirect("NoticeWrite.jsp");
		
			
		// NoticeWrite.jsp ���� �� �ۼ��� �Ϸ��ϰ� finding ���� ó���ϵ��� isS �� �Ѱ��ش�.
		} else if(command.equals("writeAf")) {
			NoticeDAO dao = NoticeDAO.getInstance();
			String id = req.getParameter("id");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			NoticeDto dto = new NoticeDto(id, title, content);
			boolean isS = dao.writeNotice(dto);
			resp.sendRedirect("finding");
			
		}
	}
	
}
