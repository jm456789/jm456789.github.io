package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {  //클래스 내의 데이터 초기화하는 키워드. static은 한번만 초기화
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {  //실행은 testConnection더블클릭 - Run As - 2 JUnit
		
		//try-with-resources 문법이다. Autocloseable 인터페이스를 구현하는 클래스 기반...?
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##final", "1234")){  //성공적으로 Connection 될경우 나중에 자동으로 close해줌
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());  //fail은 Test(JUnit)에서 쓸 수 있는거?
		}
	}
}
