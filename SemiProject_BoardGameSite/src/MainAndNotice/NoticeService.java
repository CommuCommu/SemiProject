package MainAndNotice;

import java.util.List;

import dto.NoticeDto;

public class NoticeService {
	
	NoticeDAO dao = NoticeDAO.getInstance();
	
	// 작성
	public boolean writeNotice(NoticeDto dto) {
		return dao.writeNotice(dto);
	}
	
	// 수정
	public boolean updateNotice(String title, String content, int seq) {
		return dao.updateNotice(title, content, seq);
	}
	
	// 삭제
	public boolean deleteNotice(int seq) {
		return dao.deleteNotice(seq);
	}
	
	// 검색된 리스트들 가져오기
	public List<NoticeDto> getNoticeList(String choice, String searchWord) {
		return dao.getNoticeList(choice, searchWord);
	}
	
	public int getAllNotice(String choice, String searchWord) {
		return dao.getAllNotice(choice, searchWord);
	}
	
	// 조회수
	public void viewCount(int seq) {
		
	}
	
	// 글 상세조회
	public NoticeDto noticeDetail(int seq) {
		return dao.noticeDetail(seq);
	}
	
	
	public List<NoticeDto> getNoticePagingList(String choice, String searchWord, int page) {
		return dao.getNoticePagingList(choice, searchWord, page);
	}
}
