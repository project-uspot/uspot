package egovframework.veterans.lib;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Functions {
	
	static Functions instance;
	private Functions(){}
	//getInstance 메소드를 통해 한번만 생성된 객체를 가져온다.
	public static Functions getInstance() {
		if(instance == null) {//최초 한번만 new 연산자를 통하여 메모리에 할당한다.
			instance = new Functions();
		}
		return instance;
	}

	
	private String[] WEEKDAY_NAME = new String[]{"Sun_GroupPkid","Mon_GroupPkid","Tue_GroupPkid","Wed_GroupPkid","Thu_GroupPkid","Fri_GroupPkid","Sat_GroupPkid"};

	
	private byte bszUser_key[] = {
			(byte)0x088, (byte)0x0E3, (byte)0x04F, (byte)0x08F,
			(byte)0x008, (byte)0x017, (byte)0x079, (byte)0x0F1,
			(byte)0x0E9, (byte)0x0F3, (byte)0x094, (byte)0x037,
			(byte)0x00A, (byte)0x0D4, (byte)0x005, (byte)0x089
	};

	private byte bszIV[] = {
			(byte)0x026, (byte)0x08D, (byte)0x066, (byte)0x0A7,
			(byte)0x035, (byte)0x0A8, (byte)0x01A, (byte)0x081,
			(byte)0x06F, (byte)0x0BA, (byte)0x0D9, (byte)0x0FA,
			(byte)0x036, (byte)0x016, (byte)0x025, (byte)0x001
	};
	
	private String Encryption_Use="0";
	private String Encryption_SEED_Use = "0";
	private String Encryption_Mode="0";
	
	public String getEncryption_Use() {
		return Encryption_Use;
	}

	public String getEncryption_Mode() {
		return Encryption_Mode;
	}

	/*###############################
	단방향암호화
	###############################*/
	public String fn_EncryptPWD(String sData) throws Exception{
		KISA_SHA256 kisa_SHA256 = new KISA_SHA256();
		if(Encryption_Use.equals("1")){
			if(Encryption_Mode.equals("-1")){
				//사용안함
				return sData;
			}else if(Encryption_Mode.equals("2")){
				//디아모
				/*
				try{
					return vtcService.getDamoPWD(sData);
				}catch(Exception e){
					return sData;
				}
				*/
				return "";
			}else if(Encryption_Mode.equals("3")){
				return ""; 
			}else{
				byte[] plainText = sData.getBytes("UTF-8");
				return kisa_SHA256.getString(kisa_SHA256.Sha256EncryptB(plainText));
			}
			
		}else{
			return sData;
		}
	}
	
	/*###############################
	양방향암호화 SEED CBC
	###############################*/
	public String fn_Encrypt(String Data) throws Exception{
		if(Encryption_SEED_Use.equals("1")){
			//암호화
			byte[] plainText = Data.getBytes("euc-kr");
			byte[] cipherText = KISA_SEED_CBC.SEED_CBC_Encrypt(bszUser_key, bszIV, plainText, 0, plainText.length);
	
			return Base64.getEncoder().encodeToString(cipherText).replace("\r\n", "");
		}else {
			return Data;
		}
	}

	public String fn_Encrypt(String Data,int num) throws Exception{
		if(Encryption_SEED_Use.equals("1")){
			//암호화
			if(Data.length() < 4) {
				return Data;
			}
	
			String DataStr = Data.substring(0, Data.length()-num);
			byte[] plainText = DataStr.getBytes("euc-kr");
			byte[] cipherText = KISA_SEED_CBC.SEED_CBC_Encrypt(bszUser_key, bszIV, plainText, 0, plainText.length);
	
			return Base64.getEncoder().encodeToString(cipherText).replace("\r\n", "") + Data.substring(Data.length()-num);
		}else {
			return Data;
		}
	}

	/*###############################
	양방향복호화 SEED CBC
	###############################*/
	public String fn_Decrypt(String Data) throws Exception{
		if(Encryption_SEED_Use.equals("1")){
			//복호화
			if(Data.length() == 0) {
				return Data;
			}
			byte[] cipherText = Base64.getDecoder().decode(Data);
			byte[] plainText = KISA_SEED_CBC.SEED_CBC_Decrypt(bszUser_key, bszIV, cipherText, 0, cipherText.length);
	
			return new String(plainText,"euc-kr");
		}else {
			return Data;
		}
	}

	public String fn_Decrypt(String Data,int num) throws Exception{
		if(Encryption_SEED_Use.equals("1")){
			//복호화
			if(Data.length() == 0) {
				return Data;
			}
			String DataStr = Data.substring(0, Data.length()-num);
			byte[] cipherText = Base64.getDecoder().decode(DataStr);
			byte[] plainText = KISA_SEED_CBC.SEED_CBC_Decrypt(bszUser_key, bszIV, cipherText, 0, cipherText.length);
	
			return new String(plainText,"utf-8") + Data.substring(Data.length()-num);
		}else {
			return Data;
		}
	}
	
	public Object getNullToSpace(Object param) {
		return (Objects.isNull(param) || param.equals("null")) ? "" : param;
	}
	
	public String getNullToSpaceStrValue(Object obj) {
		//System.out.println(obj);
		return String.valueOf(obj).equals("null") || String.valueOf(obj).equals("") ? "" : String.valueOf(obj).trim();
	}
	
	public String getcurDate() {
		Calendar cal = Calendar.getInstance();
		
		int strYear = cal.get(Calendar.YEAR);
		String strMonth = ""+(cal.get(Calendar.MONTH)+1);
		String strDay = ""+cal.get(Calendar.DATE);
		String strhh = ""+cal.get(Calendar.HOUR_OF_DAY);
		String strmm = ""+cal.get(Calendar.MINUTE);
			
		if(Integer.parseInt(strMonth) < 10) {
			strMonth = "0"+strMonth;
		}
		if(Integer.parseInt(strDay)<10) {
			strDay = "0"+strDay;
		}
		if(Integer.parseInt(strhh)<10) {
			strhh = "0"+strhh;
		}
		if(Integer.parseInt(strmm)<10) {
			strmm = "0"+strmm;
		}
		
		return strYear+strMonth+strDay+strhh+strmm;
	}
	
	public String GetIPAddress(HttpServletRequest request) {
		String svr_cIP = "";
		String[] ar_cIP;
		if (Objects.isNull(request.getHeader("X-Forwarded-For")) || request.getHeader("X-Forwarded-For").equals("")) {
			svr_cIP = request.getRemoteAddr();
		} else {
			svr_cIP = request.getHeader("X-Forwarded-For");
		}
		if (svr_cIP.length() > 15) {
			ar_cIP = svr_cIP.split(",");
			svr_cIP = ar_cIP[0];
		}

		return svr_cIP;
	}

	public int getNullToSpaceInt(Object obj) {
		//System.out.println(obj);
		if (String.valueOf(obj).equals("null") || String.valueOf(obj).equals("") || Objects.isNull(obj)) {
			return 0;
		} else {
			try {
				return Integer.parseInt(String.valueOf(obj).trim());
			} catch (Exception e) {
				try {
					return (int) Double.parseDouble(String.valueOf(obj).trim());
				}catch (Exception e1) {
					return -1;
				}
			}
		}
	}
	
	
	public static byte[] generatelmage(byte[] imageContent, String mainPosition, int maxWH) throws IOException  {
		// 원본 이미지 가져오기
		BufferedImage originalImg = ImageIO.read(new ByteArrayInputStream(imageContent));

		String imgFormat = "jpg";  // 새 이미지 포맷. jpg, gif 등
	    int imageWidth;
	    int imageHeight;
	    double ratio;
	    int w;
	    int h;

	    // 원본 이미지 사이즈 가져오기
	    imageWidth = originalImg.getWidth(null);
	    imageHeight = originalImg.getHeight(null);

	    if(mainPosition.equals("W")){    // 넓이기준
	        ratio = (double)maxWH/(double)imageWidth;
	        w = (int)(imageWidth * ratio);
	        h = (int)(imageHeight * ratio);
	    }else if(mainPosition.equals("H")){ // 높이기준
	        ratio = (double)maxWH/(double)imageHeight;
	        w = (int)(imageWidth * ratio);
	        h = (int)(imageHeight * ratio);
	    }else{ //설정값 (비율무시)
	        w = maxWH;
	        h = maxWH;
	    }

	    // 이미지 리사이즈
	    // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
	    // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
	    // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
	    // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
	    // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
	    Image resizeImage = originalImg.getScaledInstance(w, h, Image.SCALE_SMOOTH);

	    // 새 이미지  저장하기
		BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
	    Graphics g = newImage.getGraphics();
	    g.drawImage(resizeImage, 0, 0, null);
	    g.dispose();

		ByteArrayOutputStream output = new ByteArrayOutputStream();
		ImageIO.write(newImage, imgFormat, output);

		return output.toByteArray();
	}

	public static byte[] generatelmage(byte[] imageContent, String mainPosition, int maxW, int maxH) throws IOException {
		// 원본 이미지 가져오기
		BufferedImage originalImg = ImageIO.read(new ByteArrayInputStream(imageContent));

		String imgFormat = "jpg";  // 새 이미지 포맷. jpg, gif 등

	    // 이미지 리사이즈
	    // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
	    // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
	    // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
	    // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
	    // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
	    Image resizeImage = originalImg.getScaledInstance(maxW, maxH, Image.SCALE_SMOOTH);

	    // 새 이미지  저장하기
		BufferedImage newImage = new BufferedImage(maxW, maxH, BufferedImage.TYPE_INT_RGB);
	    Graphics g = newImage.getGraphics();
	    g.drawImage(resizeImage, 0, 0, null);
	    g.dispose();

		ByteArrayOutputStream output = new ByteArrayOutputStream();
		ImageIO.write(newImage, imgFormat, output);

		return output.toByteArray();
	}
	
    public String generateClientId() {
        try {
            InetAddress localHost = InetAddress.getLocalHost();
            String hostName = localHost.getHostName(); // 컴퓨터 이름
            String ipAddress = localHost.getHostAddress(); // 내부 IP 주소

            return hostName + "_" + ipAddress;
        } catch (UnknownHostException e) {
            e.printStackTrace();
            return "UnknownHost";
        }
    }
    

	public Date parseDate(String dateString, String type) throws ParseException {
		Date date = new Date();
		SimpleDateFormat format;
		switch (type) {
		case "yMd":
			format = new SimpleDateFormat ( "yyyy-MM-dd");
			date = format.parse(dateString);
			break;
		case "yMdR":
			format = new SimpleDateFormat ( "yyyyMMdd");
			date = format.parse(dateString);
			break;
		default:
			format = new SimpleDateFormat ( "yyyy-MM-dd");
			date = format.parse(dateString);
			break;
		}
		return date;
	}

	public String formatDate(Date date, String type) throws ParseException {
		String formatDate = "";
		SimpleDateFormat format;
		switch (type) {
		case "yMd":
			format = new SimpleDateFormat ( "yyyy-MM-dd");
			formatDate = format.format(date);
			break;
		case "yMdR":
			format = new SimpleDateFormat ( "yyyyMMdd");
			formatDate = format.format(date);
			break;
		case "yMdHm":
			format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
			formatDate = format.format(date);
			break;
		case "yMdHmR":
			format = new SimpleDateFormat ( "yyyyMMddHHmm");
			formatDate = format.format(date);
			break;
		case "yMdHms":
			format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			formatDate = format.format(date);
			break;
		case "yMdHmsR":
			format = new SimpleDateFormat ( "yyyyMMddHHmmss");
			formatDate = format.format(date);
			break;
		case "Hm":
			format = new SimpleDateFormat ( "HH:mm");
			formatDate = format.format(date);
			break;
		case "Hms":
			format = new SimpleDateFormat ( "HH:mm:ss");
			formatDate = format.format(date);
			break;
		default:
			format = new SimpleDateFormat ( "yyyy-MM-dd");
			formatDate = format.format(date);
			break;
		}
		return formatDate;
	}
	
	public Map<String,String> JsonpToMap(String jsonp){
		// JSONP에서 JSON 부분만 추출
		String json = jsonp.substring(jsonp.indexOf("(")+1,jsonp.lastIndexOf(")"));

		// JSON 문자열의 작은 따옴표를 큰따옴표로 변경(JSON 표준형식)
		json = json.replace("'","\"");

		ObjectMapper mapper = new ObjectMapper();

		Map<String, String> dataMap = null;
		try {
			dataMap = mapper.readValue(json, Map.class);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return dataMap;
	}
	
	public String MapToJson(Map<String,Object> map){

		ObjectMapper mapper = new ObjectMapper();

		String json = null;
		try {
			json = mapper.writeValueAsString(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return json;
	}
	
	//가능한 인코딩 리스트
	private static final List<String> POSSIBLE_ENCODINGS = Arrays.asList("ISO-8859-1", "UTF-8", "EUC-KR", "windows-1252");

    public static String fixEncoding(String brokenString) {
    	try {
    		byte[] bytes = brokenString.getBytes("ISO-8859-1");
    		String fixedString = new String(bytes, "UTF-8");
    		if(fixedString.matches(".*[가-힣]+.*")) {
    			return fixedString;
    		}
    	}catch (Exception e) {
    		
    	}
        for (String encoding : POSSIBLE_ENCODINGS) {
            try {
                // 깨진 문자열을 바이트 배열로 변환
                byte[] bytes = brokenString.getBytes(encoding);

                // 다른 인코딩으로 시도하여 문자열로 변환
                for (String tryEncoding : POSSIBLE_ENCODINGS) {
                    try {
                        String fixedString = new String(bytes, tryEncoding);
                        // 여기서 추가 검증 로직을 추가할 수 있음
                        // 예: 정규 표현식으로 한글이 포함되어 있는지 검사
                        log.debug(encoding+"->"+tryEncoding+":"+fixedString);
                        if (isLikelyValidKorean(fixedString)) {
                            return fixedString; // 유효한 한글 문자열이 확인되면 반환
                        }
                    } catch (Exception e) {
                        // 변환 실패 시 다음 인코딩 시도
                    }
                }
            } catch (Exception e) {
                // 초기 바이트 변환 실패 시 다음 인코딩 시도
            }
        }
        return brokenString; // 적절한 변환을 찾지 못함
    }

    // 문자열이 유효한 한글을 포함하고 있는지 간단한 검증
    // 이 함수는 더 정교한 검증 로직으로 대체될 수 있습니다.
    private static boolean isLikelyValidKorean(String text) {
        //return text.matches(".*[가-힣]+.*");
    	return text.matches("^[가-힣A-Za-z0-9\\s\\-\\_\\.\\(\\)]{1,100}$");
    }
}
