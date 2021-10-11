package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//인사관리 페이징
@ToString
@Setter
@Getter
public class MessageCriteria {

	private int pageNum;
	private int amount;

	private String type;
	private String keyword;

	public MessageCriteria() {
		this(1, 10);
	}

	public MessageCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {

		return type == null? new String[] {}: type.split("");
	}
	
	private String m_eid1;
	private String e_id;
	private String m_eid2;
}
