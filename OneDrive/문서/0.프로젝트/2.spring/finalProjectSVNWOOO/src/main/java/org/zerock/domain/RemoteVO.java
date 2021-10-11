package org.zerock.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class RemoteVO {

	private String e_id;
	private String remoteIP;
	private String userId;
	private String pwd;
	
	
}
