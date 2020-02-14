package MainAndNotice;

import java.util.List;

import dto.NoticeDto;

public class NoticeService {
	
	NoticeDAO dao = NoticeDAO.getInstance();
	
	// �ۼ�
	public boolean writeNotice(NoticeDto dto) {
		return dao.writeNotice(dto);
	}
	
	// ����
	public boolean updateNotice(String title, String content, int seq) {
		return dao.updateNotice(title, content, seq);
	}
	
	// ����
	public boolean deleteNotice(int seq) {
		return dao.deleteNotice(seq);
	}
	
	// �˻��� ����Ʈ�� ��������
	public List<NoticeDto> getNoticeList(String choice, String searchWord) {
		return dao.getNoticeList(choice, searchWord);
	}
	
	public int getAllNotice(String choice, String searchWord) {
		return dao.getAllNotice(choice, searchWord);
	}
	
	// ��ȸ��
	public void viewCount(int seq) {
		
	}
	
	// �� ����ȸ
	public NoticeDto noticeDetail(int seq) {
		return dao.noticeDetail(seq);
	}
	
	
	public List<NoticeDto> getNoticePagingList(String choice, String searchWord, int page) {
		return dao.getNoticePagingList(choice, searchWord, page);
	}
}
