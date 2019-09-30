package hwarang.artg.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hwarang.artg.common.model.CriteriaDTO;
import hwarang.artg.community.service.FreeBoardService;
import hwarang.artg.community.service.FreeReplyService;
import hwarang.artg.manager.model.BlockStatusVO;
import hwarang.artg.manager.model.NoticeReplyVO;
import hwarang.artg.manager.model.NoticeVO;
import hwarang.artg.mapper.BlockStatusMapper;
import hwarang.artg.mapper.NoticeMapper;
import hwarang.artg.mapper.NoticeReplyMapper;

@Service
public class BlockStatusService {
	@Autowired
	private BlockStatusMapper dao;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private FreeReplyService freeReplyService;
	
	
	//신고 등록
	public boolean blockRegister(BlockStatusVO block) {
		if(dao.insertBlock(block) > 0) {
			return true;
		}
		return false;
	}
	
	//신고자_신고 사유 수정(내용만)
	public boolean blockModify(BlockStatusVO block) {
		if(dao.updateBlock(block) > 0) {
			return true;
		}
		return false;
	}
	
	//관리자_신고 답글 수정
	public boolean replyModify(String reply, int num) {
		if(dao.updateReply(reply, num) > 0) {
			return true;
		}
		return false;
	}
	
	//신고게시물 삭제
	public boolean blockRemove(int num) {
		if(dao.deleteBlock(num) > 0) {
			return true;
		}
		return false;
	}
	
	//신고게시물 불러오기
	public BlockStatusVO blockGetOne(int num) {
		return dao.selectBlock(num);
	}
	
	//사용자-내가 신고한 게시글
	public List<BlockStatusVO> blockGetAllById(String memId) {
		return dao.selectAllBlocksById(memId);
	}
	
	//관리자-신고 전체 리스트
	public List<BlockStatusVO> blockGetAll() {
		return dao.selectAllBlocks();
	}
	
	//최근 접수된 신고 불러오기
	public List<BlockStatusVO> blockGetByRegDate(){
		return dao.getListByRegDate();
	}
	
	//관리자를 위한 페이징 처리
	public List<BlockStatusVO> pagingList(CriteriaDTO cri) {
		return dao.getListWithPaging(cri);
	}
	
	public int getTotalCount() {
		return dao.getTotalCount();
	}
	
	//user위한 페이징 처리 (사용자 아이디로)
	public List<BlockStatusVO> pagingList(CriteriaDTO cri, String memId) {
		return dao.getPagingListById(cri, memId);
	}
	
	public int getTotalCount(String memId) {
		return dao.getTotalCountById(memId);
	}
	
	
	//Block처리
	public void doCheckCategory(int num) {
		BlockStatusVO block = dao.selectBlock(num);
		int boardNum = block.getBoardNum();
		String category = block.getCategory().substring(0, block.getCategory().indexOf("_"));
		String subCategory = block.getCategory().substring(block.getCategory().indexOf("_")+1);
		if(subCategory.equals("Board")) {
			subCategory = "게시글";
			switch(category) {
			case "Notice" :
				category = "공지게시판";
				noticeService.doNoticeBlock("true", boardNum);
				break;
			case "Free" :
				category = "자유게시판";
				freeBoardService.doBoardBlock("true", boardNum);
				break;
			case "Party" :
				category = "파티게시판";
				break;
			case "Ticket" :
				category = "티켓게시판";
				break;
			case "Review" :
				category = "리뷰게시판";
				break;
			}
		}else {
			subCategory = "댓글";
			switch(category) {
			case "Notice" :
				category = "공지게시판";
				noticeService.doNoticeReplyBlock("true", boardNum);
				break;
			case "Free" :
				category = "자유게시판";
				freeReplyService.doReplyBlock("true", boardNum);
				break;
			case "Party" :
				category = "파티게시판";
				break;
			case "Ticket" :
				category = "티켓게시판";
				break;
			case "Review" :
				category = "리뷰게시판";
				break;
			}
			noticeService.doNoticeReplyBlock("true", boardNum);
		}
	}
	
	public Map<String, Object> doCheckBlock(int num) {
		Map<String, Object> params = new HashMap<String, Object>();
		BlockStatusVO block = dao.selectBlock(num);
		int boardNum = block.getBoardNum();
		String category = block.getCategory().substring(0, block.getCategory().indexOf("_"));
		String subCategory = block.getCategory().substring(block.getCategory().indexOf("_")+1);
		String originContent = "";
		switch(category) {
		case "Notice" :
			category = "공지게시판";
			if(subCategory.equals("Board")) {
				subCategory = "게시글";
				NoticeVO notice = noticeService.noticeGetOne(boardNum);
				originContent = notice.getContent();
			}else if(subCategory.equals("Reply")) {
				subCategory = "댓글";
				System.out.println("댓글");
				NoticeReplyVO noticeReply = noticeService.nReplyGetOne(boardNum);
				originContent = noticeReply.getContent();
			}
			break;
		case "Free" :
			category = "자유게시판";
			break;
		case "Party" :
			category = "파티게시판";
			break;
		case "Ticket" :
			category = "티켓게시판";
			break;
		case "Review" :
			category = "리뷰게시판";
			break;
		}
		
		params.put("block", block);
		params.put("category", category);
		params.put("subCategory", subCategory);
		params.put("originContent", originContent);
		return params;
	}
	
	
}