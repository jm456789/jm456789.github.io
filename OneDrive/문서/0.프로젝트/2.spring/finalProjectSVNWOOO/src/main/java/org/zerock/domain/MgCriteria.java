package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//인사관리 페이징
@ToString
@Setter
@Getter
public class MgCriteria {

	private int pageNum;
	private int amount;

	private String type;
	private String keyword;

	public MgCriteria() {
		this(1, 10);
	}

	public MgCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {

		return type == null? new String[] {}: type.split("");
	}
}
