package egovframework.veterans.lib;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

	@GetMapping("/locker/check.do")
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
}
