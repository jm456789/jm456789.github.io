package org.zerock.domain;

import java.util.Date;
import java.util.List;


import lombok.Data;

@Data
public class HolidayVO {

	private Long h_id;
	private Date h_start;
	private Date h_end;
	private String h_reason;
	private String h_eid1;
	private String h_sledding;
	private String h_sledding2;
	private String h_eid2;
	private String h_did;
	private Date h_date;
	private String h_division;
	private String h_title;
	
	private String e_id;
	private String e_name;
	private String holidaySelect;
	
	private List<MemberVO> memList;
	
	
	private String keyword = "";
	
	private String title;
	private String start2;
	private String start;
	private String end;

	
}
