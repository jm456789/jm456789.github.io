package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AuthVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.MgCriteria;
import org.zerock.mapper.MgMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MgServiceImpl implements MgService {

	@Setter(onMethod_ = @Autowired)
	private MgMapper mapper;
	
	@Override
	public void register(MemberVO mg) {

		log.info("register......" + mg);

		mapper.insertSelectKey(mg);
		//mg.getAuthList().get(0).setE_id(mg.getE_id());
		//mapper.insertAuth(mg.getAuthList());
	}
	
//	@Override
//	public List<MemberVO> getList(){
//		log.info("getList......");
//		return mapper.getList();
//	}
	
	@Override
	public List<MemberVO> getList(MgCriteria cri){
		log.info("getList Cri......" + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public MemberVO get(String e_id) {

		log.info("get......" + e_id);

		return mapper.read(e_id);
	}
	
	@Override
	public AuthVO getAuth(AuthVO authVO) {

		

		return mapper.readAuth(authVO);
	}
	@Override
	public boolean modify(MemberVO mg) {
		log.info("modify..........."+ mg);
		
		return mapper.update(mg) == 1;
	}
	
	@Override
	public boolean modifyAuth(AuthVO auth) {
		log.info("modify..........."+ auth);
		
		return mapper.updateAuth(auth) == 1;
	}
	@Override
	public boolean removeAuth(AuthVO auth) {
		log.info("remove......."+auth);
		
		return mapper.deleteAuth(auth) == 1;
	}
	@Override
	public boolean remove(String e_id) {
		log.info("remove......."+e_id);
		
		return mapper.delete(e_id) == 1;
	}

	@Override
	public int getTotal(MgCriteria cri) {
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}

}
