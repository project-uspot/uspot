package egovframework.veterans.com.cmm.lib;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Objects;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

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

	private String Encryption_Use="1";
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
	
	
}
