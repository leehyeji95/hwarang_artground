package hwarang.artg.funding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hwarang.artg.common.model.CriteriaDTO;
import hwarang.artg.funding.model.CrowdfundingVO;
import hwarang.artg.mapper.CrowdfundingMapper;

/*
 * ���� : memberRegister
���� : memberModify
���� :memberRemove
��ü�ϳ����� : memberGetOne
��簳ü���� : memberGetAll
����¡ó���İ�ü���� : memberGetListByPaging
��й�ȣ Ȯ�� : memberCheckPw
 * */

public interface CrowdfundingService {
	
	public void register(CrowdfundingVO funding);
    public CrowdfundingVO get(int funding_num);
    public boolean modify(CrowdfundingVO funding);
    public boolean remove(int funding_num);
    public List<CrowdfundingVO> getList(CriteriaDTO cri);
    public int getTotal(CriteriaDTO cri);
    public CrowdfundingVO payment(int funding_num);
}
