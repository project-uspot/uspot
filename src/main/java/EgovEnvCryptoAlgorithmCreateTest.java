import egovframework.rte.fdl.cryptography.EgovPasswordEncoder;
import lombok.extern.log4j.Log4j;

@Log4j
public class EgovEnvCryptoAlgorithmCreateTest {
	
	//계정암호화키 키
	public String algorithmKey = "egovframe";
 
	//계정암호화 알고리즘(MD5, SHA-1, SHA-256)
	public String algorithm = "SHA-256";
 
	//계정암호화키 블럭사이즈
	public int algorithmBlockSize = 1024;
 
	public static void main(String[] args) {
		EgovEnvCryptoAlgorithmCreateTest cryptoTest = new EgovEnvCryptoAlgorithmCreateTest();
 
		EgovPasswordEncoder egovPasswordEncoder = new EgovPasswordEncoder();
		egovPasswordEncoder.setAlgorithm(cryptoTest.algorithm);
 
		log.info("------------------------------------------------------");
		log.info("알고리즘(algorithm) : "+cryptoTest.algorithm);
		log.info("알고리즘 키(algorithmKey) : "+cryptoTest.algorithmKey);
		log.info("알고리즘 키 Hash(algorithmKeyHash) : "+egovPasswordEncoder.encryptPassword(cryptoTest.algorithmKey));
		log.info("알고리즘 블럭사이즈(algorithmBlockSize)  :"+cryptoTest.algorithmBlockSize);
 
	}
}
