package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TableDto;

@WebServlet("/AdminTable")
public class AdminTableServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	protected void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");	
		
		if(command.equals("update")) {	//update 테이블 리스트에서 수정으로 들어갔을때
			AdminTableService ats = new AdminTableService();
			List<TableDto> list = ats.getAllTableList();
			
			req.setAttribute("TableList", list);	
			forward("adminTableUpdate.jsp", req, resp);
			
		}else if(command.equals("delete")) { //delete 테이블 리스트에서 삭제로 들어갔을때
			forward("adminTableDelete.jsp", req, resp);
		}else if(command.equals("back")) { //뒤로가기
			forward("admin.jsp", req, resp);
		}else {
			//그 외
		}	
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
	
}
