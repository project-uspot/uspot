package egovframework.veterans.lib;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UNILockerController {

	Functions f = Functions.getInstance();
	
	private final HttpSession session;
	private final VtcService VtcService;

	public static Marker uni = MarkerFactory.getMarker("uni");

	@GetMapping("/unilock/check.do")
	@ResponseBody
	public String checkWebSocketAvailability() throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return "unavailable";
		}

		String SiteCode = users.getSiteCode();

		Map<String,Object> siteIdSet = VtcService.selectSiteIdSet(SiteCode);

		String IP = f.getNullToSpaceStrValue(siteIdSet.get("Locker_Svr_IP"));
		int Port = f.getNullToSpaceInt(siteIdSet.get("Locker_Svr_Port"));
		WebSocketService socket = new WebSocketService();
		
		if(socket.getSocketChk(IP, Port)) {
			return "available";
		}else {
			return "unavailable";
		}
	}

	// 수동발권
	@PostMapping("/unilock/manual.do")
	@ResponseBody
	public String UniLockerManulBa(HttpServletRequest request) throws Exception{
		WebSocketService socket = new WebSocketService();
		
		return null;
	}
	
	//자동발권
	public static String UniLockAutoB(String SiteCode, String MemberID, int iUpjang, int lockerType, String IP, int Port, String strLockerCondition, int lngLockerManAddNum, int lngLockerWoManAddNum) throws InterruptedException {
		WebSocketService socket = new WebSocketService();
		String UPJANG = "1";
		String GENDER = "";
		String userid = "1";//고정값

		if(iUpjang == 1){
			UPJANG = String.valueOf((char)0x31);
		}else if(iUpjang == 2){
			UPJANG = String.valueOf((char)0x32);
		}else if(iUpjang == 3){
			UPJANG = String.valueOf((char)0x33);
		}else if(iUpjang == 4){
			UPJANG = String.valueOf((char)0x34);
		}else{
			UPJANG = String.valueOf(UPJANG);
		}

		if(lockerType==0){
			GENDER = String.valueOf((char)0x30);//남자 대인
		}else if(lockerType == 1){
			GENDER = String.valueOf((char)0x31);//남자 소인
		}else if(lockerType == 2){
			GENDER = String.valueOf((char)0x32);//여자 대인
		}else if(lockerType == 3){
			GENDER = String.valueOf((char)0x33);//여자 소인
		}
		
		String sMsg1 = String.valueOf((char)0x70) + "A" + String.valueOf((char)0x0) + String.valueOf((char)0x0) + String.valueOf((char)0x0) + String.valueOf((char)0x0) ;
		
		for(int i=0; i < 19 ;i++){
			userid = userid + (char)0x0;
		}
		
		//Packet Data A
		String sMsg2 = "Pos1" + userid + UPJANG + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x31);
		//Packet Data LockerData
		String sMsg3 = String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x31) + GENDER + String.valueOf((char)0x30) + String.valueOf((char)0x30);
		
		String lens = String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((sMsg2 + sMsg3).length());
		lens = lens.substring(lens.length()-5);

		sMsg1 = sMsg1 + lens;

		String sendmsg = sMsg1 + sMsg2 + sMsg3;

		log.info(uni,"업장: "+SiteCode+" 회원번호:" + MemberID + ", svrIp:" +IP +", svrPort:" + Port+", "+ sendmsg);
		String msg = socket.setSocket(2000,IP, Port, sendmsg);//리얼
		//String msg = socket.setSocket(2000,testip, 31000, sendmsg);//테스트
		log.info(uni, "업장: "+SiteCode+" 회원번호:" + MemberID + ", "+msg);
		
		if(Integer.parseInt(msg.substring(20,24)) > 0 && msg.subSequence(1,2).equals("s")){
			//발권 성공
			
			//H Packet Header
			sMsg1 = String.valueOf((char)0x70) + "H" + String.valueOf((char)0x0) + String.valueOf((char)0x0) + String.valueOf((char)0x0) + String.valueOf((char)0x0) ;
			// Packet Data H
			sMsg2 = "Pos1" + userid;
			// Packet Data LockerData 
			//sMsg3 = msg.substring(24, 29) + GENDER + String.valueOf((char)0x30) + String.valueOf((char)0x30);
			sMsg3 = msg.substring(24, 32);
			
			lens = String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((char)0x30) + String.valueOf((sMsg2 + sMsg3).length());
			lens = lens.substring(lens.length()-5);

			sMsg1 = sMsg1 + lens;
			sendmsg = sMsg1 + sMsg2 + sMsg3;

			Thread.sleep(1000);//1초 텀주기
			log.info(uni,"업장: "+SiteCode+" 회원번호:" + MemberID + ", svrIp:" +IP +", svrPort:" + Port+", "+ sendmsg);
			String msg2 = socket.setSocket(2000,IP, Port, sendmsg);//리얼
			//String msg2 = socket.setSocket(2000,testip, 31000, sendmsg);//테스트
			log.info(uni, "업장: "+SiteCode+" 회원번호:" + MemberID + ", "+msg2);
			
			int sendCnt = Integer.parseInt(msg.substring(16, 20)); //발권요청수량
			int recvCnt = Integer.parseInt(msg.substring(20, 24)); //발권결과수량
			
			int lLockerNo = Integer.parseInt(msg.substring(24, 29)); // 락커번호
			int lLockerTypeCode = Integer.parseInt(msg.substring(29,30)); //0:남자대인, 1:남자소인, 2:여자대인, 3:여자소인
			int lUpJangCode = Integer.parseInt(msg.substring(30,31)); //발권 그룹

			if(recvCnt < sendCnt) {
				//발권실패
				return "false";
			}else {
				//정상발권
				if(lLockerTypeCode < 2){
					lLockerNo = lLockerNo - lngLockerManAddNum;
				}else{
					lLockerNo = lLockerNo - lngLockerWoManAddNum;
				}

				return ""+lLockerNo;
			}
		}else {
			//발권 실패
			return "false";
		}
	}
}
