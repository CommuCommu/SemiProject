package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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
			//System.out.println("delete");
			AdminTableService ats = new AdminTableService();
			List<TableDto> yesList = ats.getAbleDelTableList();
			List<TableDto> noList = ats.getNoDelTableList();
			
			req.setAttribute("yesList" , yesList);
			req.setAttribute("noList" , noList);
			forward("adminTableDelete.jsp", req, resp);
			
		}else if(command.equals("back")) { //뒤로가기
			forward("./auth?command=adminMain", req, resp);
		
		}else if(command.equals("tableDel")){
			AdminTableService ats = new AdminTableService();
			String[] tableNum = req.getParameterValues("tableNum");
			System.out.println("테이블갯수:" + tableNum.length);
			
			// 결과 담을 배열 선언 
			boolean[] resultArray = new boolean[tableNum.length];
			
			JSONObject jObj = new JSONObject();
			for (int i = 0; i < tableNum.length; i++) {
				System.out.println(i + "번 테이블넘버: " + tableNum[i]);
				int tNum = Integer.parseInt(tableNum[i]);
				resultArray[i] = ats.tableDel(tNum);
	
			}
			
			boolean result = true;
			for (int i = 0; i < resultArray.length; i++) {
				
				if(resultArray[i] = false) {
					result = false;
				}
				
			}
				
			jObj.put("result", result);
			resp.setContentType("application/x-json); charset=utf-8");
			resp.getWriter().print(jObj);
			
		}	
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
	
}
