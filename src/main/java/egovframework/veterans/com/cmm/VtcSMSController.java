package egovframework.veterans.com.cmm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class VtcSMSController {

	private final HttpSession session;
	private final VtcSMSService vtcSMSService;
	private final VtcService vtcService;
	
	public static Marker sms = MarkerFactory.getMarker("sms");

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
	
	@ResponseBody
	@PostMapping("/sms_munguSearch")
	public List<sms_mungu> sms_munguSearch(sms_mungu sms_mungu)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		sms_mungu.setSiteCode(users.getSiteCode());
		
		List<sms_mungu> mungulist = vtcSMSService.sms_munguSearch(sms_mungu);
		
		return mungulist;
	}
	
	@GetMapping("/SendTalkF.do")
	public String SendTalkF(Model model) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "reload");

			return "common/msg";
		}
		
		List<Sitecode> sitecode = vtcService.selectSiteCode(users.getSiteCode());

		model.addAttribute("templatelist",TemplateList());
		model.addAttribute("sitecode",sitecode.get(0));

		return "SMS/talk/SendTalkF";
	}
	
	@GetMapping("/TemplateSMSF.do")
	public String TemplateSMSF(Model model)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "reload");

			return "common/msg";
		}
		
		model.addAttribute("templatelist",TemplateList());
		
		return "SMS/talk/TemplateSMSF";
	}
	
	@ResponseBody
	@PostMapping("/TemplateList")
	public List<Map<String, Object>> TemplateList() throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tblsite_id tblsite_id = vtcService.tblsite_idBySiteCode(users.getSiteCode());
		Map<String, String> headers = new HashMap<String, String>();
		HttpPostMultipart multipart = new HttpPostMultipart("https://balsong.com/Linkage/API/", "utf-8", headers);

		
		multipart.addFormField("UserID",tblsite_id.getBalsongID());		// 사용자 계정
		multipart.addFormField("UserPW",tblsite_id.getBalsongPW());		// 사용자 암호
		multipart.addFormField("Service","ATALK");						//"ATALK" 기입
		multipart.addFormField("Type", "Template_List");				// 	"Template_List" 기입
		multipart.addFormField("Status", "APR");						// 템플릿 상태별 조회 :빈값일 경우 전체목록을 가져옴
		
		String ResultJson = multipart.finish();
        
        // Json parse (json.simple 라이브러리)
        JSONParser jsonParse = new JSONParser();
        
        JSONObject jsonObject = (JSONObject) jsonParse.parse(ResultJson);

        // Extract JSONArray from the JSONObject
        JSONArray jsonArray = (JSONArray) jsonObject.get("List");

        // Convert JSONArray to List<Map<String, Object>>
        List<Map<String, Object>> list = new ArrayList<>();
        for (Object obj : jsonArray) {
            JSONObject jsonObj = (JSONObject) obj;
            Map<String, Object> map = new HashMap<>();
            for (Object key : jsonObj.keySet()) {
                String keyStr = (String) key;
                Object value = jsonObj.get(keyStr);
                map.put(keyStr, value);
            }
            list.add(map);
        }
        
        return list;
	}
	
	@ResponseBody
	@PostMapping("/TemplateInsert")
	public String TemplateInsert(@RequestParam Map<String, Object> map)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {
			return "0";
		}
		
		tblsite_id tblsite_id = vtcService.tblsite_idBySiteCode(users.getSiteCode());
		Map<String, String> headers = new HashMap<String, String>();
		HttpPostMultipart multipart = new HttpPostMultipart("https://balsong.com/Linkage/API/", "utf-8", headers);
		
		
		multipart.addFormField("UserID",tblsite_id.getBalsongID());					// 사용자 계정
		multipart.addFormField("UserPW",tblsite_id.getBalsongPW());					// 사용자 암호
		multipart.addFormField("Service","ATALK");									//"ATALK" 기입
		multipart.addFormField("Type", "Template_Reg");								// 	"Template_Reg" 기입
		multipart.addFormField("Channel_ID", "@용인시청소년미래재단");						// 템플릿 상태별 조회 :빈값일 경우 전체목록을 가져옴
		multipart.addFormField("Template_NM",(String) map.get("Template_NM"));		// 템플릿 이름
		multipart.addFormField("Template_Text",(String) map.get("Template_Text"));	// 템플릿 내용
		multipart.addFormField("Template_Btn","");									// 버튼
		
		String ResultJson = multipart.finish();
        
        // Json parse (json.simple 라이브러리)
        JSONParser jsonParse = new JSONParser();
        
        JSONObject jsonObject = (JSONObject) jsonParse.parse(ResultJson);
		
        log.info(sms,"관리자 pkid : "+users.getUserPKID()+", 템플릿 등록정보"+jsonObject);
        
        if(!jsonObject.get("Result").equals("OK")){
        	return (String) jsonObject.get("Message");
        }else {
        	return "등록되었습니다.";
        }
	}
	
	@ResponseBody
	@PostMapping("/TemplateRemove")
	public String TemplateRemove(String Template_Seq)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {
			return "0";
		}
		
		tblsite_id tblsite_id = vtcService.tblsite_idBySiteCode(users.getSiteCode());
		Map<String, String> headers = new HashMap<String, String>();
		HttpPostMultipart multipart = new HttpPostMultipart("https://balsong.com/Linkage/API/", "utf-8", headers);
		
		
		multipart.addFormField("UserID",tblsite_id.getBalsongID());					// 사용자 계정
		multipart.addFormField("UserPW",tblsite_id.getBalsongPW());					// 사용자 암호
		multipart.addFormField("Service","ATALK");									//"ATALK" 기입
		multipart.addFormField("Type", "Template_Del");								// 	"Template_Del" 기입
		multipart.addFormField("Channel_ID", "@용인시청소년미래재단");						// 템플릿 상태별 조회 :빈값일 경우 전체목록을 가져옴
		multipart.addFormField("Template_Seq",Template_Seq);						// 버튼
		
		String ResultJson = multipart.finish();
        
        // Json parse (json.simple 라이브러리)
        JSONParser jsonParse = new JSONParser();
        
        JSONObject jsonObject = (JSONObject) jsonParse.parse(ResultJson);
		
        log.info(sms,"관리자 pkid : "+users.getUserPKID()+", 템플릿 삭제정보"+jsonObject);
        
        if(!jsonObject.get("Result").equals("OK")){
        	return (String) jsonObject.get("Message");
        }else {
        	return "삭제되었습니다.";
        }
	}
	
	@ResponseBody
	@PostMapping("/TalkBalsong")
	public String TalkBalsong(@RequestParam Map<String, Object> map) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");

		if (users == null) {

			return "0";
		}
		
		tblsite_id tblsite_id = vtcService.tblsite_idBySiteCode(users.getSiteCode());
		Map<String, String> headers = new HashMap<String, String>();
		HttpPostMultipart multipart = new HttpPostMultipart("https://balsong.com/Linkage/API/", "utf-8", headers);

		multipart.addFormField("UserID",tblsite_id.getBalsongID());								// 사용자 계정
		multipart.addFormField("UserPW",tblsite_id.getBalsongPW());								// 사용자 암호
		multipart.addFormField("Service","ATALK");						// SMS:단문, LMS:장문
		multipart.addFormField("Type", "Send");													// Send 기입
		multipart.addFormField("Channel_ID", "@용인시청소년미래재단");									// 카카오톡 채널ID
		multipart.addFormField("Fail_To", "");													// 알림톡 실패 시 전환발송
		multipart.addFormField("Template_Seq",(String) map.get("Template_Seq"));				// 템플릿 코드
		multipart.addFormField("Send_Date", "");												// 발송시각 - 미입력 시 즉시발송, 예약 날짜형식) YYYY-MM-DD HH:NN
		multipart.addFormField("Callback",((String)map.get("SenderPN")).replace("-", ""));		// 발신번호
		multipart.addFormField("Subject",(String) map.get("Title"));							// 발송 제목
		multipart.addFormField("Main_Text",(String) map.get("Content"));						// 대표 내용 - 실제 발송내용은 아님
		
		
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
	        
	     // Replace_Datas 배열 생성
	        JSONArray replaceDatas = new JSONArray();
	        
	        // 회사명 추가
//	        JSONObject companyObject = new JSONObject();
//	        companyObject.put("Key", "#{회사명}");
//	        companyObject.put("Value", "베테랑스정보통신");
//	        replaceDatas.add(companyObject);
	        
	        // 이름 추가
	        JSONObject nameObject = new JSONObject();
	        nameObject.put("Key", "#{이름}");
	        nameObject.put("Value", vo.get("name"));
	        replaceDatas.add(nameObject);
	        
	        // 기타 정보 추가
	        JSONObject extraObject1 = new JSONObject();
	        extraObject1.put("Key", "#{기타1}");
	        extraObject1.put("Value",(String) map.get("etc1"));
	        replaceDatas.add(extraObject1);
	        
	        // 기타 정보 추가
	        JSONObject extra2Object = new JSONObject();
	        extra2Object.put("Key", "#{기타2}");
	        extra2Object.put("Value",(String) map.get("etc2"));
	        replaceDatas.add(extra2Object);
	        
	        // 기타 정보 추가
	        JSONObject extra3Object = new JSONObject();
	        extra3Object.put("Key", "#{기타2}");
	        extra3Object.put("Value",(String) map.get("etc3"));
	        replaceDatas.add(extra3Object);
	        
	        // 기타 정보 추가
	        JSONObject extra4Object = new JSONObject();
	        extra4Object.put("Key", "#{기타4}");
	        extra4Object.put("Value",(String) map.get("etc4"));
	        replaceDatas.add(extra4Object);
	        
	        // Dest1에 Replace_Datas 추가
	        Dest1.put("Replace_Datas", replaceDatas);
	        
			DestArr.add(Dest1);
		}
		
		multipart.addFormField("Destination", DestArr.toString());
		
		//응답 값
        String ResultJson = multipart.finish();
         
        // Json parse (json.simple 라이브러리)
        JSONParser jsonParse = new JSONParser();
        JSONObject ObjToJson = (JSONObject) jsonParse.parse(ResultJson);
        
        System.out.println(ObjToJson);
        
        if(!ObjToJson.get("Result").equals("OK")){
        	return "문자 발송에 실패하였습니다.";
        }else {
        	return "발송되었습니다.";
        }
	}
}
