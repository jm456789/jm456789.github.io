package org.zerock.domain;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberVO {
	
	private String e_id;
	private String e_name;
	private String e_did;
	private String e_pid;
	private String e_tell;
	private String e_tell2;
	private String e_tell3;
	private String e_email;
	private String e_birth;
	private String e_address;
	private String e_address2;
	private String e_address3;
	private String e_cell;
	private String e_cell2;
	private String e_cell3;
	private String e_pass;
	private boolean enabled;
	
	private List<RemoteVO> remoteList;
	private List<AuthVO> authList;
	private List<DepartmentVO> departList;
	private List<PositionVO> positionList;
	
}
