package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.veterans.com.cmm.service.VtcSMSService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.sms_mungu;
import egovframework.veterans.com.cmm.service.vo.tblsite_id;
import egovframework.veterans.lib.HttpPostMultipart;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcSMSController {

	private final HttpSession session;
	private final VtcSMSService vtcSMSService;
	private final VtcService vtcService;

	@GetMapping("/SendSMSF.do")
	public String SendSMSF(Model model) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "reload");

			return "common/msg";
		}

		List<sms_mungu> munguList = vtcSMSService.munguBySitecode(users.getSiteCode());
		List<Sitecode> sitecode = vtcService.selectSiteCode(users.getSiteCode());

		model.addAttribute("mungulist", munguList);
		model.addAttribute("sitecode", sitecode.get(0));

		return "SMS/send/SendSMSF";
	}

	@ResponseBody
	@PostMapping("/sms_munguInsert")
	public int sms_munguInsert(sms_mungu sms_mungu) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {

			return 0;
		}

		sms_mungu.setSiteCode(users.getSiteCode());

		vtcSMSService.sms_munguInsert(sms_mungu);

		return sms_mungu.getCode();
	}

	@ResponseBody
	@PostMapping("/sms_munguUpdate")
	public String sms_munguUpdate(sms_mungu sms_mungu) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {

			return "0";
		}

		sms_mungu.setSiteCode(users.getSiteCode());

		vtcSMSService.sms_munguUpdate(sms_mungu);

		return "success";
	}

	@ResponseBody
	@PostMapping("/sms_munguRemove")
	public String sms_munguRemove(sms_mungu sms_mungu) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {

			return "0";
		}

		sms_mungu.setSiteCode(users.getSiteCode());

		vtcSMSService.sms_munguRemove(sms_mungu);

		return "success";
	}

	@ResponseBody
	@PostMapping("/sms_munguList")
	public List<sms_mungu> sms_munguList() throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");

		List<sms_mungu> sms_mungulist = vtcSMSService.munguBySitecode(users.getSiteCode());

		return sms_mungulist;
	}

	@ResponseBody
	@PostMapping("/smsBalsong")
	public String smsBalsong(@RequestParam Map<String, Object> map) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {

			return "0";
		}
		
		tblsite_id tblsite_id = vtcService.tblsite_idBySiteCode(users.getSiteCode());
		Map<String, String> headers = new HashMap<String, String>();
		HttpPostMultipart multipart = new HttpPostMultipart("https://balsong.com/Linkage/API/", "utf-8", headers);

		multipart.addFormField("UserID",tblsite_id.getBalsongID());								// 사용자 계정
		multipart.addFormField("UserPW",tblsite_id.getBalsongPW());								// 사용자 암호
		multipart.addFormField("Service",(String) map.get("BalsongType"));						// SMS:단문, LMS:장문
		multipart.addFormField("Type", "Send");													// Send 기입
		multipart.addFormField("Send_Date", "");												// 발송시각 - 미입력 시 즉시발송, 예약 날짜형식) YYYY-MM-DD HH:NN
		multipart.addFormField("Callback",((String)map.get("SenderPN")).replace("-", ""));		// 발신번호
		multipart.addFormField("Subject",(String) map.get("Title"));							// 발송 제목
		multipart.addFormField("Main_Text",(String) map.get("Content"));						// 기본 문자내용
		
		
		String json = (String) map.get("contactArray");
		
        ObjectMapper objectMapper = new ObjectMapper();

        //사용자 배열 받는거 list 형식으로 변환
        List<Map<String, Object>> list = objectMapper.readValue(
        		json.substring(json.indexOf('[')),
        		objectMapper.getTypeFactory().constructCollectionType(List.class, Map.class));
		
		JSONArray DestArr = new JSONArray();
		
		for (Map<String,Object> vo : list) {
			JSONObject Dest1 = new JSONObject();
			Dest1.put("Company","베테랑스정보통신");
	        Dest1.put("Name",vo.get("name"));
	        Dest1.put("Phone",((String)vo.get("phoneNumber")).replace("-", ""));
			DestArr.add(Dest1);
		}
		
		multipart.addFormField("Destination", DestArr.toString());
		
		//응답 값
        String ResultJson = multipart.finish();
         
        // Json parse (json.simple 라이브러리)
        JSONParser jsonParse = new JSONParser();
        JSONObject ObjToJson = (JSONObject) jsonParse.parse(ResultJson);
        
        if(!ObjToJson.get("Result").equals("OK")){
        	return "문자 발송에 실패하였습니다.";
        }else {
        	return "발송되었습니다.";
        }
	}
}
