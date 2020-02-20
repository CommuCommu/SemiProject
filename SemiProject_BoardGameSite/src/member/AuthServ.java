package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dto.MemberDto;

/**
 * Servlet implementation class AuthServ
 */
@WebServlet("/auth")
public class AuthServ extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getParameter("command");
		System.out.println("command:" + command);
		
		
		MemberService memService = new MemberService();
		
		if(command.equals("getMemlist")) {
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			String item = req.getParameter("item");
			String sort = req.getParameter("sort");
			System.out.println("item:" + item+ " sort: " + sort + " pageNum: " + pageNum);
			
			List<MemberDto> memList = memService.getMemList(item, sort, pageNum);
			int len = memService.getAllMem();
			req.setAttribute("item", item);
			req.setAttribute("sort", sort);
			req.setAttribute("page", pageNum);	
			req.setAttribute("memList", memList);
			req.setAttribute("len", len);	
			RequestDispatcher dispatcher = req.getRequestDispatcher("memberList.jsp");
			dispatcher.forward(req, resp);

		}else if(command.equals("getMemDetail")) {
			String id = req.getParameter("id");
			MemberDto dto = memService.getMemDetail(id);
			
			req.setAttribute("dto", dto);
			RequestDispatcher dispatcher = req.getRequestDispatcher("memDetail.jsp");
			dispatcher.forward(req, resp);
			
		}else if(command.equals("searchList")) {
			int page = Integer.parseInt(req.getParameter("page"));
			String item = req.getParameter("item");
			String searchWord = req.getParameter("searchWord");
			System.out.println("item:" + item+ "searchWord: " + searchWord + " page: " + page);
			
			List<MemberDto> memList = memService.searchList(item, searchWord, page);
			int len = memService.getSearchMem(item, searchWord);
			req.setAttribute("item", item);	
			req.setAttribute("memList", memList);
			req.setAttribute("page", page);	
			req.setAttribute("len", len);	
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("memSearchList.jsp");
			dispatcher.forward(req, resp);
			
			
		}
	}
	
}
