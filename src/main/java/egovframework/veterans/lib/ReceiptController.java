package egovframework.veterans.lib;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.lib.service.ReceiptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ReceiptController {

	static Functions f = Functions.getInstance();
	
	private final HttpSession session;
	private final ReceiptService receiptService;
	
	public static Marker Receipt = MarkerFactory.getMarker("Receipt");
	
	// TODO 영수증 발행	
	@GetMapping(value = "/{uparam}/Receipt.do")
	public String selectReceipt(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{

		switch (uparam) {
		case "lecture":
			List<Map<String,Object>> receiptList = receiptService.getReceipt(request.getParameter("PKID"));
			insertReceiptItem(request.getParameter("PKID"),receiptService);
			model.addAttribute("receiptList", receiptList);
			return "/receipt/receipt";
		case "locker":
			List<Map<String,Object>> receiptLockerList = receiptService.getReceiptLocker(request.getParameter("PKID"));
			insertReceiptLocker(request.getParameter("PKID"),receiptService);
			model.addAttribute("receiptList", receiptLockerList);
			return "/receipt/receiptLocker";
		case "etc":
			List<Map<String,Object>> receiptEtcList = receiptService.getReceiptEtc(request.getParameter("PKID"));
			insertReceiptEtc(request.getParameter("PKID"),receiptService);
			model.addAttribute("receiptList", receiptEtcList);
			return "/receipt/receiptEtc";
		case "order":
			List<Map<String,Object>> receiptOrderList = receiptService.getReceiptOrder(request.getParameter("PKID"));
			//insertReceiptOrder(request.getParameter("PKID"),receiptService);
			model.addAttribute("receiptList", receiptOrderList);
			return "/receipt/receiptOrder";
		default:
			break;
		}
		return null;
	}

	public static void insertReceiptItem(String PKID, ReceiptService receiptService) throws Exception {
		String receiptText = "";
		List<Map<String,Object>> receiptList = receiptService.getReceipt(PKID);
		
		NumberFormat format = NumberFormat.getNumberInstance(Locale.US);
		format.setMaximumFractionDigits(0);
		String dayName = "";
		int gonggub = 0;
		int vat = 0;
		int RealPrice = 0;
		int PaidPrice = 0;
		int Misu = 0;
		int state = 0;
		receiptText = receiptText + "<div>";
		for(Map<String,Object> receiptMap : receiptList) {
			if(state == 0) {
				receiptText = receiptText + "<h3 style='text-align:center;'>"+receiptMap.get("SiteName")+"</h3>";
				receiptText = receiptText + "<div><span>"+receiptMap.get("SiteBNo")+" (대표:"+receiptMap.get("PName")+")</span></div>";
				receiptText = receiptText + "<div><address>"+receiptMap.get("Address")+" "+receiptMap.get("SubAddress")+"</address></div>";
				receiptText = receiptText + "<div><span>TEL) "+receiptMap.get("Phone1")+"</span></div>";
				receiptText = receiptText + "<div><span>["+receiptMap.get("saletype")+"] "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div><span>회원번호: "+receiptMap.get("MemberID")+" ["+receiptMap.get("Name")+"]</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
			}
			switch (f.getNullToSpaceStrValue(receiptMap.get("DayName"))) {
			case "월화수목금토일":
				dayName = "월~일";
				break;
			case "월화수목금토":
				dayName = "월~토";
				break;
			case "월화수목금":
				dayName = "월~금";
				break;
			default:
				dayName = f.getNullToSpaceStrValue(receiptMap.get("DayName"));
				break;
			}

			receiptText = receiptText + "<div><span>강 습 반: ["+receiptMap.get("CategoryName")+"]"+receiptMap.get("JungName")+" "+receiptMap.get("LevelName")+" "+dayName+" "+receiptMap.get("FromTime")+"</span></div>";
			receiptText = receiptText + "<div><span>등 록 일: "+receiptMap.get("SaleDate")+"</span></div>";
			receiptText = receiptText + "<div><span>수강기간: "+receiptMap.get("RFromDate")+"~"+receiptMap.get("RToDate")+"("+receiptMap.get("RegMonth")+")</span></div>";
			receiptText = receiptText + "<div><span>강 습 료: "+format.format(receiptMap.get("ItemPrice"))+"</span></div>";
			receiptText = receiptText + "<div><span>할인금액: "+format.format(receiptMap.get("dcPrice"))+"</span></div>";
			
			switch (f.getNullToSpaceStrValue(receiptMap.get("NVAT"))) {
			case "Y":
				receiptText = receiptText + "<div><span>강습금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
				receiptText = receiptText + "<div><span>부 가 세: "+format.format(receiptMap.get("vat"))+"</span></div>";
				break;

			default:
				receiptText = receiptText + "<div><span>강습금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
				break;
			}
			receiptText = receiptText + "<div>-----------------------------------------------</div>";

			gonggub = gonggub + f.getNullToSpaceInt(receiptMap.get("gonggub"));
			vat = vat + f.getNullToSpaceInt(receiptMap.get("vat"));
			RealPrice = RealPrice + f.getNullToSpaceInt(receiptMap.get("RealPrice"));
			PaidPrice = PaidPrice + f.getNullToSpaceInt(receiptMap.get("PaidPrice"));
			Misu = Misu + f.getNullToSpaceInt(receiptMap.get("Misu"));
			
			if(state + 1 == receiptList.size()) {
				receiptText = receiptText + "<div><span>공급가액: "+format.format(gonggub)+"</span></div>";
				receiptText = receiptText + "<div><span>부 가 세: "+format.format(vat)+"</span></div>";
				receiptText = receiptText + "<div><span>받을금액: "+format.format(RealPrice)+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				
				switch (f.getNullToSpaceStrValue(receiptMap.get("paytype"))) {
				case "현금":
					receiptText = receiptText + "<div><span>현   금: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "현금영수증":
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "신용카드":
					receiptText = receiptText + "<div><span>카드종류: "+receiptMap.get("CardName")+"</span></div>";
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "간편결제":
					receiptText = receiptText + "<div><span>간편결제: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "제로페이":
					receiptText = receiptText + "<div><span>제로페이: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "계좌이체":
					receiptText = receiptText + "<div><span>계좌이체: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				}
				receiptText = receiptText + "<div><span>승인일자: "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				receiptText = receiptText + "<div><span>받은금액: "+format.format(PaidPrice)+"</span></div>";
				if(Misu > 0) {
					receiptText = receiptText + "<div><span>미납금액: "+format.format(Misu)+"</span></div>";
				}
				receiptText = receiptText + "<div><span>담 당 자: ["+receiptMap.get("SawonNo")+"]"+receiptMap.get("SawonName")+"</span></div>";
			}
			state++;
		}
		receiptText = receiptText + "</div>";
		//log.debug(receiptText);
		Map<String,Object> sqlMap = new HashMap<String,Object>();
		sqlMap.put("FPKID",receiptList.get(0).get("PKID"));
		sqlMap.put("SiteCode",receiptList.get(0).get("SiteCode"));
		sqlMap.put("SiteBNo",receiptList.get(0).get("SiteBNo"));
		sqlMap.put("MemberID",receiptList.get(0).get("MemberID"));
		sqlMap.put("CellPhone",f.fn_Encrypt(f.fn_Decrypt(f.getNullToSpaceStrValue(receiptList.get(0).get("CellPhone")), 4), 4));
		sqlMap.put("receiptText",receiptText);
		log.debug(sqlMap.toString());
		receiptService.insertReceipt(sqlMap);
	}
	
	public static void insertReceiptLocker(String PKID, ReceiptService receiptService) throws Exception {
		String receiptText = "";
		List<Map<String,Object>> receiptList = receiptService.getReceiptLocker(PKID);
		NumberFormat format = NumberFormat.getNumberInstance(Locale.US);
		format.setMaximumFractionDigits(0);
		String dayName = "";
		int gonggub = 0;
		int vat = 0;
		int RealPrice = 0;
		int PaidPrice = 0;
		int Misu = 0;
		int state = 0;
		receiptText = receiptText + "<div>";
		for(Map<String,Object> receiptMap : receiptList) {
			if(state == 0) {
				receiptText = receiptText + "<h3 style='text-align:center;'>"+receiptMap.get("SiteName")+"</h3>";
				receiptText = receiptText + "<div><span>"+receiptMap.get("SiteBNo")+" (대표:"+receiptMap.get("PName")+")</span></div>";
				receiptText = receiptText + "<div><address>"+receiptMap.get("Address")+" "+receiptMap.get("SubAddress")+"</address></div>";
				receiptText = receiptText + "<div><span>TEL) "+receiptMap.get("Phone1")+"</span></div>";
				receiptText = receiptText + "<div><span>["+receiptMap.get("saletype")+"] "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div><span>회원번호: "+receiptMap.get("MemberID")+" ["+receiptMap.get("Name")+"]</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
			}
			receiptText = receiptText + "<div><span>사 물 함: ["+receiptMap.get("PLockerGroupName")+" / "+receiptMap.get("PLockerLocation")+"]"+receiptMap.get("PLockerNo")+"</span></div>";
			receiptText = receiptText + "<div><span>등 록 일: "+receiptMap.get("RegDate")+"</span></div>";
			receiptText = receiptText + "<div><span>사용기간: "+receiptMap.get("FromDate")+"~"+receiptMap.get("ToDate")+"("+receiptMap.get("RegMonth")+")</span></div>";
			receiptText = receiptText + "<div><span>사 용 료: "+format.format(receiptMap.get("UsePrice"))+"</span></div>";
			receiptText = receiptText + "<div><span>할인금액: "+format.format(receiptMap.get("DCPrice"))+"</span></div>";
			
			switch (f.getNullToSpaceStrValue(receiptMap.get("NVAT"))) {
			case "Y":
				receiptText = receiptText + "<div><span>금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
				receiptText = receiptText + "<div><span>부 가 세: "+format.format(receiptMap.get("vat"))+"</span></div>";
				break;

			default:
				receiptText = receiptText + "<div><span>대여금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
				break;
			}
			receiptText = receiptText + "<div>-----------------------------------------------</div>";

			gonggub = gonggub + f.getNullToSpaceInt(receiptMap.get("gonggub"));
			vat = vat + f.getNullToSpaceInt(receiptMap.get("vat"));
			RealPrice = RealPrice + f.getNullToSpaceInt(receiptMap.get("UsePrice"));
			PaidPrice = PaidPrice + f.getNullToSpaceInt(receiptMap.get("Price"));
			Misu = Misu + f.getNullToSpaceInt(receiptMap.get("Misu"));
			
			if(state + 1 == receiptList.size()) {
				receiptText = receiptText + "<div><span>공급가액: "+format.format(gonggub)+"</span></div>";
				receiptText = receiptText + "<div><span>부 가 세: "+format.format(vat)+"</span></div>";
				receiptText = receiptText + "<div><span>받을금액: "+format.format(RealPrice)+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				
				switch (f.getNullToSpaceStrValue(receiptMap.get("paytype"))) {
				case "현금":
					receiptText = receiptText + "<div><span>현   금: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "현금영수증":
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "신용카드":
					receiptText = receiptText + "<div><span>카드종류: "+receiptMap.get("CardName")+"</span></div>";
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "간편결제":
					receiptText = receiptText + "<div><span>간편결제: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "제로페이":
					receiptText = receiptText + "<div><span>제로페이: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "계좌이체":
					receiptText = receiptText + "<div><span>계좌이체: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				}
				receiptText = receiptText + "<div><span>승인일자: "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				receiptText = receiptText + "<div><span>받은금액: "+format.format(PaidPrice)+"</span></div>";
				if(Misu > 0) {
					receiptText = receiptText + "<div><span>미납금액: "+format.format(Misu)+"</span></div>";
				}
				receiptText = receiptText + "<div><span>담 당 자: ["+receiptMap.get("SawonNo")+"]"+receiptMap.get("SawonName")+"</span></div>";
			}
			state++;
		}
		receiptText = receiptText + "</div>";
		//log.debug(receiptText);
		Map<String,Object> sqlMap = new HashMap<String,Object>();
		sqlMap.put("FPKID",receiptList.get(0).get("PKID"));
		sqlMap.put("SiteCode",receiptList.get(0).get("SiteCode"));
		sqlMap.put("SiteBNo",receiptList.get(0).get("SiteBNo"));
		sqlMap.put("MemberID",receiptList.get(0).get("MemberID"));
		sqlMap.put("CellPhone",f.fn_Encrypt(f.fn_Decrypt(f.getNullToSpaceStrValue(receiptList.get(0).get("CellPhone")), 4), 4));
		sqlMap.put("receiptText",receiptText);
		log.debug(sqlMap.toString());
		receiptService.insertReceipt(sqlMap);
	}
	
	public static void insertReceiptEtc(String PKID, ReceiptService receiptService) throws Exception {
		String receiptText = "";
		List<Map<String,Object>> receiptList = receiptService.getReceiptEtc(PKID);
		NumberFormat format = NumberFormat.getNumberInstance(Locale.US);
		format.setMaximumFractionDigits(0);
		int gonggub = 0;
		int vat = 0;
		int PaidPrice = 0;
		int Misu = 0;
		int state = 0;
		receiptText = receiptText + "<div>";
		for(Map<String,Object> receiptMap : receiptList) {
			if(state == 0) {
				receiptText = receiptText + "<h3 style='text-align:center;'>"+receiptMap.get("SiteName")+"</h3>";
				receiptText = receiptText + "<div><span>"+receiptMap.get("SiteBNo")+" (대표:"+receiptMap.get("PName")+")</span></div>";
				receiptText = receiptText + "<div><address>"+receiptMap.get("Address")+" "+receiptMap.get("SubAddress")+"</address></div>";
				receiptText = receiptText + "<div><span>TEL) "+receiptMap.get("Phone1")+"</span></div>";
				receiptText = receiptText + "<div><span>["+receiptMap.get("saletype")+"] "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div><span>회원번호: "+receiptMap.get("MemberID")+" ["+receiptMap.get("Name")+"]</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
			}
			System.out.println(receiptMap.get("RealPrice"));
			receiptText = receiptText + "<div><span>항 목: "+receiptMap.get("ExpenseName")+"("+receiptMap.get("ExpCnt")+")</span></div>";
			receiptText = receiptText + "<div><span>매출금액: "+format.format(receiptMap.get("RealPrice"))+"</span></div>";
			
			switch (f.getNullToSpaceStrValue(receiptMap.get("NVAT"))) {
			case "Y":
				receiptText = receiptText + "<div><span>금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
				receiptText = receiptText + "<div><span>부 가 세: "+format.format(receiptMap.get("vat"))+"</span></div>";
				break;

			default:
				receiptText = receiptText + "<div><span>금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
				break;
			}
			receiptText = receiptText + "<div>-----------------------------------------------</div>";

			gonggub = gonggub + f.getNullToSpaceInt(receiptMap.get("gonggub"));
			vat = vat + f.getNullToSpaceInt(receiptMap.get("vat"));
			PaidPrice = PaidPrice + f.getNullToSpaceInt(receiptMap.get("Price"));
			Misu = Misu + f.getNullToSpaceInt(receiptMap.get("Misu"));
			
			if(state + 1 == receiptList.size()) {
				receiptText = receiptText + "<div><span>공급가액: "+format.format(gonggub)+"</span></div>";
				receiptText = receiptText + "<div><span>부 가 세: "+format.format(vat)+"</span></div>";
				receiptText = receiptText + "<div><span>받을금액: "+format.format(receiptMap.get("RealPrice"))+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				
				switch (f.getNullToSpaceStrValue(receiptMap.get("paytype"))) {
				case "현금":
					receiptText = receiptText + "<div><span>현   금: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "현금영수증":
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "신용카드":
					receiptText = receiptText + "<div><span>카드종류: "+receiptMap.get("CardName")+"</span></div>";
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "간편결제":
					receiptText = receiptText + "<div><span>간편결제: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "제로페이":
					receiptText = receiptText + "<div><span>제로페이: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "계좌이체":
					receiptText = receiptText + "<div><span>계좌이체: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				}
				receiptText = receiptText + "<div><span>승인일자: "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				receiptText = receiptText + "<div><span>받은금액: "+format.format(PaidPrice)+"</span></div>";
				if(Misu > 0) {
					receiptText = receiptText + "<div><span>미납금액: "+format.format(Misu)+"</span></div>";
				}
				receiptText = receiptText + "<div><span>담 당 자: ["+receiptMap.get("SawonNo")+"]"+receiptMap.get("SawonName")+"</span></div>";
			}
			state++;
		}
		receiptText = receiptText + "</div>";
		//log.debug(receiptText);
		Map<String,Object> sqlMap = new HashMap<String,Object>();
		sqlMap.put("FPKID",receiptList.get(0).get("PKID"));
		sqlMap.put("SiteCode",receiptList.get(0).get("SiteCode"));
		sqlMap.put("SiteBNo",receiptList.get(0).get("SiteBNo"));
		sqlMap.put("MemberID",receiptList.get(0).get("MemberID"));
		sqlMap.put("CellPhone",f.fn_Encrypt(f.fn_Decrypt(f.getNullToSpaceStrValue(receiptList.get(0).get("CellPhone")), 4), 4));
		sqlMap.put("receiptText",receiptText);
		log.debug(sqlMap.toString());
		receiptService.insertReceipt(sqlMap);
	}
	
	public static void insertReceiptOrder(String PKID, ReceiptService receiptService) throws Exception {
		String receiptText = "";
		List<Map<String,Object>> receiptList = receiptService.getReceiptOrder(PKID);
		
		NumberFormat format = NumberFormat.getNumberInstance(Locale.US);
		format.setMaximumFractionDigits(0);
		String dayName = "";
		int gonggub = 0;
		int vat = 0;
		int RealPrice = 0;
		int PaidPrice = 0;
		int Misu = 0;
		int state = 0;
		receiptText = receiptText + "<div>";
		for(Map<String,Object> receiptMap : receiptList) {
			if(state == 0) {
				receiptText = receiptText + "<h3 style='text-align:center;'>"+receiptMap.get("SiteName")+"</h3>";
				receiptText = receiptText + "<div><span>"+receiptMap.get("SiteBNo")+" (대표:"+receiptMap.get("PName")+")</span></div>";
				receiptText = receiptText + "<div><address>"+receiptMap.get("Address")+" "+receiptMap.get("SubAddress")+"</address></div>";
				receiptText = receiptText + "<div><span>TEL) "+receiptMap.get("Phone1")+"</span></div>";
				receiptText = receiptText + "<div><span>["+receiptMap.get("saletype")+"] "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
			}
			if(state == 0 || receiptMap.get("ItemName").equals(receiptList.get(state - 1).get("ItemName"))) {
				receiptText = receiptText + "<div><span>메 뉴 명: ["+(receiptMap.get("GroupName"))+"] "+(receiptMap.get("ItemeName"))+"</span></div>";
				receiptText = receiptText + "<div><span>수   량: "+(receiptMap.get("Amount"))+"</span></div>";
				receiptText = receiptText + "<div><span>메뉴금액: "+format.format(receiptMap.get("SiteName"))+"</span></div>";
				receiptText = receiptText + "<div><span>할인금액: "+format.format(receiptMap.get("SiteName"))+"</span></div>";
				switch (f.getNullToSpaceStrValue(receiptMap.get("NVAT"))) {
				case "Y":
					receiptText = receiptText + "<div><span>강습금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
					receiptText = receiptText + "<div><span>부 가 세: "+format.format(receiptMap.get("vat"))+"</span></div>";
					break;

				default:
					receiptText = receiptText + "<div><span>강습금액: "+format.format(receiptMap.get("gonggub"))+"</span></div>";
					break;
				}
				receiptText = receiptText + "<div>-----------------------------------------------</div>";

				gonggub = gonggub + f.getNullToSpaceInt(receiptMap.get("gonggub"));
				vat = vat + f.getNullToSpaceInt(receiptMap.get("vat"));
				RealPrice = RealPrice + f.getNullToSpaceInt(receiptMap.get("RealPrice"));
				PaidPrice = PaidPrice + f.getNullToSpaceInt(receiptMap.get("PaidPrice"));
			}
			if(state + 1 == receiptList.size()) {
				receiptText = receiptText + "<div><span>공급가액: "+format.format(gonggub)+"</span></div>";
				receiptText = receiptText + "<div><span>부 가 세: "+format.format(vat)+"</span></div>";
				receiptText = receiptText + "<div><span>받을금액: "+format.format(RealPrice)+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				
				switch (f.getNullToSpaceStrValue(receiptMap.get("paytype"))) {
				case "현금":
					receiptText = receiptText + "<div><span>현   금: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "현금영수증":
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "신용카드":
					receiptText = receiptText + "<div><span>카드종류: "+receiptMap.get("CardName")+"</span></div>";
					receiptText = receiptText + "<div><span>승인구분: "+receiptMap.get("AssignType")+"</span></div>";
					receiptText = receiptText + "<div><span>승인번호: "+receiptMap.get("AssignNo")+"</span></div>";
					receiptText = receiptText + "<div><span>승인금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "간편결제":
					receiptText = receiptText + "<div><span>간편결제: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "제로페이":
					receiptText = receiptText + "<div><span>제로페이: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				case "계좌이체":
					receiptText = receiptText + "<div><span>계좌이체: "+format.format(receiptMap.get("Price"))+"</span></div>";
					break;
				}
				receiptText = receiptText + "<div><span>승인일자: "+receiptMap.get("RealSaleDate")+"</span></div>";
				receiptText = receiptText + "<div>-----------------------------------------------</div>";
				receiptText = receiptText + "<div><span>받은금액: "+format.format(receiptMap.get("Price"))+"</span></div>";
				if(Misu > 0) {
					receiptText = receiptText + "<div><span>미납금액: "+format.format(Misu)+"</span></div>";
				}
				receiptText = receiptText + "<div><span>담 당 자: ["+receiptMap.get("SawonNo")+"]"+receiptMap.get("SawonName")+"</span></div>";
			}
			state++;
		}
		receiptText = receiptText + "</div>";
		//log.debug(receiptText);
		Map<String,Object> sqlMap = new HashMap<String,Object>();
		sqlMap.put("FPKID",receiptList.get(0).get("PKID"));
		sqlMap.put("SiteCode",receiptList.get(0).get("SiteCode"));
		sqlMap.put("SiteBNo",receiptList.get(0).get("SiteBNo"));
		sqlMap.put("MemberID",receiptList.get(0).get("MemberID"));
		sqlMap.put("CellPhone",f.fn_Encrypt(f.fn_Decrypt(f.getNullToSpaceStrValue(receiptList.get(0).get("CellPhone")), 4), 4));
		sqlMap.put("receiptText",receiptText);
		log.debug(sqlMap.toString());
		receiptService.insertReceipt(sqlMap);
	}

	// TODO 영수증 재발행
	@GetMapping(value = "/{uparam}/ReReceipt.do")
	public String selectReReceipt(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");

		Map<String,Object> setSql = new HashMap<String,Object>();
		if (users != null) {
			setSql.put("SiteCode",users.getSiteCode());
		}else {
			
		}
		Map<String,Object> receipt = new HashMap<String,Object>();
		switch (uparam) {
		case "lecture":
			setSql.put("FPKID",request.getParameter("PKID"));
			receipt = receiptService.getReReceipt(setSql);
			if(Objects.isNull(receipt)) {
				return "redirect:/lecture/Receipt.do?PKID="+request.getParameter("PKID");
			}
			break;
		case "locker":
			setSql.put("FPKID",request.getParameter("PKID"));
			receipt = receiptService.getReReceipt(setSql);
			if(Objects.isNull(receipt)) {
				return "redirect:/locker/Receipt.do?PKID="+request.getParameter("PKID");
			}
			break;
		case "etc":
			setSql.put("FPKID",request.getParameter("PKID"));
			receipt = receiptService.getReReceipt(setSql);
			if(Objects.isNull(receipt)) {
				return "redirect:/etc/Receipt.do?PKID="+request.getParameter("PKID");
			}
			break;
		case "order":
			setSql.put("FPKID",request.getParameter("PKID"));
			receipt = receiptService.getReReceipt(setSql);
			if(Objects.isNull(receipt)) {
				return "redirect:/etc/Receipt.do?PKID="+request.getParameter("PKID");
			}
			break;
		default:
			break;
		}
				
		model.addAttribute("receipt", receipt);
		return "/receipt/reReceipt";
	}
}
