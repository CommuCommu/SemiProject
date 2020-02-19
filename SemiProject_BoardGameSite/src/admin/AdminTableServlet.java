package admin;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ReservationDto;
import dto.TableDto;
import member.MemberService;
import qna.QnaService;
import reservation.ReservationService;

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
			
			req.setAttribute("tableList", list);	
			forward("adminTableUpdate.jsp", req, resp);
			
		}else if(command.equals("delete")) { //delete 테이블 리스트에서 삭제로 들어갔을때
			forward("adminTableDelete.jsp", req, resp);
		}else if(command.equals("back")) {	//어드민 페이지로 돌아가기. 
			ReservationService revService = new ReservationService();
			MemberService memService = new MemberService();
			QnaService qnaService = new QnaService();
			
			// 회원 수 구하기 
			int memNum = memService.getAllMem(); 
			System.out.println("memNum: " + memNum);
			// 금일 예약 건수 구하기  
			List<ReservationDto> revList = revService.getAllCurRev();
			int revNum = 0;
			Calendar cal = Calendar.getInstance();
			int todayDate = cal.get(Calendar.DATE);
			for (int i = 0; i < revList.size(); i++) {
				int rDate = Integer.parseInt(revList.get(i).getRdate().substring(8, 10));
				if(rDate == todayDate) {
					revNum++;
				}
			}
			System.out.println("revNum: " +revNum);
			// 미응답 QnA 건수 구하기 
			int noAnswerNum = qnaService.getNoAnsCount();
			System.out.println("noAnswerNum: " + noAnswerNum);
			
			// 테이블 갯수 구하기 
			int tableNum = revService.tableCount();
			
			req.setAttribute("tableNum", tableNum);
			req.setAttribute("memNum", memNum);
			req.setAttribute("revNUm", revNum);
			req.setAttribute("noAnswerNum", noAnswerNum);
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
