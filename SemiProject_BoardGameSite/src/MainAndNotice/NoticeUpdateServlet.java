package MainAndNotice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.NoticeDto;

@WebServlet("/noticeUpdate")
public class NoticeUpdateServlet extends HttpServlet {

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
		
		if(command.equals("noticeUpdate")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			
			
			
			NoticeDAO dao = NoticeDAO.getInstance();
			NoticeDto dto = dao.noticeDetail(seq);
			
			// packing
			req.setAttribute("dto", dto);
			
			// sending
			forward("noticeUpdate.jsp", req, resp);
			
			
		// noticeUpdate.jsp 에서 글 작성을 완료하고 noticeUpdateAf.jsp 로 넘어간다.	
		} else if(command.equals("noticeUpdateAf")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			
			String title = req.getParameter("title");
			String content = req.getParameter("ir1");
			
			NoticeDAO dao = NoticeDAO.getInstance();
			
//			HttpSession session = req.getSession();
//			MemberDto sDto = (MemberDto)session.getAttribute("login"); 
//			
//			String id = sDto.getId();
//			String title = req.getParameter("title");
//			String content = req.getParameter("content");
//			NoticeDto dto = new NoticeDto(id, title, content);
			
			boolean isS = dao.updateNotice(title, content, seq);
			System.out.println("업데이트 = " + isS);
			resp.sendRedirect("noticeUpdateAf.jsp?command=noticeUpdateAf&isS=" + isS);
			
		}
	}

	private void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(link);
		dispatcher.forward(req, resp);
	}

}
