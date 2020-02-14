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
		System.out.println("NoticeListServlet command Ȯ�� = " + command);
		
		
		// �˻�� �ƹ��͵� �Ѿ���� �ʾ��� ���� �������� ����(notice.jsp)�� �̵��ϵ��� �Ѵ�.
		if(command == null || command.equals("")) {
			resp.sendRedirect("notice.jsp");
			
		// �˻�� �Ѿ�� ���, notice.jsp ���� ���� �˻��� searchWord, �˻��׸��� choice ���� �޾Ƶ��δ�.
		} else if (command == "search") {
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			
			// ���� �˻��� ����Ǿ��µ� �˻��׸��� �������� �ʾҴٸ� �������� ����(notice.jsp)�� �̵��ϵ��� �Ѵ�.
			if(choice == null || searchWord == null) {
				resp.sendRedirect("notice.jsp");
			}
		}
	}
}
