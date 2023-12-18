import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import egovframework.rte.fdl.cryptography.impl.EgovEnvCryptoServiceImpl;
import lombok.extern.log4j.Log4j;

@Log4j
public class EgovEnvCryptoUserTest {
	
	public static void main(String[] args) {

		String[] arrCryptoString = {
				"root", // 데이터베이스 접속 계정 설정
				"Vtc2010s", // 데이터베이스 접속 패드워드 설정
				"jdbc:jtds:sqlserver://112.222.214.53:33069/uspot_test", // 데이터베이스 접속 주소 설정
				"net.sourceforge.jtds.jdbc.Driver" // 데이터베이스 드라이버
		};

		log.info("------------------------------------------------------");
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "classpath:/egovframework/spring/com/context-crypto-test.xml" });
		EgovEnvCryptoService cryptoService = context.getBean(EgovEnvCryptoServiceImpl.class);
		log.info("------------------------------------------------------");

		String label = "";
		try {
			for (int i = 0; i < arrCryptoString.length; i++) {
				if (i == 0)
					label = "사용자 아이디";
				if (i == 1)
					label = "사용자 비밀번호";
				if (i == 2)
					label = "접속 주소";
				if (i == 3)
					label = "데이터 베이스 드라이버";
				log.info(label + " 원본(orignal):" + arrCryptoString[i]);
				log.info(label + " 인코딩(encrypted):" + cryptoService.encrypt(arrCryptoString[i]));
				log.info("------------------------------------------------------");
			}
		} catch (IllegalArgumentException e) {
			log.error("[" + e.getClass() + "] IllegalArgumentException : " + e.getMessage());
		} catch (Exception e) {
			log.error("[" + e.getClass() + "] Exception : " + e.getMessage());
		}

	}
}
