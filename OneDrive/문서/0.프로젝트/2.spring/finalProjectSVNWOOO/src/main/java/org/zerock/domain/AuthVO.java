package org.zerock.domain;


import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AuthVO {

  private String e_id;
  private String auth;
  
}
