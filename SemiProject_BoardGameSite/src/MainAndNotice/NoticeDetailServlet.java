package MainAndNotice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDto;

@WebServlet("/noticeDetail")
public class NoticeDetailServlet extends HttpServlet {

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
		
		// noticeDetail.jsp 에서 보낸 seq 를 받아들인다.
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		// singleton
		NoticeDAO dao = NoticeDAO.getInstance();
		
		// 조회수 메소드 호출
		dao.viewCount(seq);
		
		// seq 를 통해 dto 를 가져오는 메소드 호출
		NoticeDto dto = dao.noticeDetail(seq);
		
		// setAttribute 로 dto 를 packing 하여 forward 를 통해 noticeDetail.jsp 로 보낸다.
		req.setAttribute("dto", dto);
		forward("noticeDetail.jsp", req, resp);
	}

	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) 
						throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
		
	}
}
