package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MessageVO {

	private Long m_id;
	private String m_title;
	private String m_content;
	private Date m_time;
	private String m_eid1;
	private String m_eid2;
	private String m_sc;
	
	private String e_id;
	private List<MemberVO> memberList;
}
