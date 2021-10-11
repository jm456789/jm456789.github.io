package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.RemoteVO;
import org.zerock.mapper.MypageMapper;
import org.zerock.mapper.RemoteMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class RemoteServiceImpl implements RemoteService {

	@Setter(onMethod_ = @Autowired)
	private RemoteMapper mapper;
	
	@Override
	public RemoteVO get(String e_id) {

		log.info("get......" + e_id);

		return mapper.read(e_id);
	}
	
	}
