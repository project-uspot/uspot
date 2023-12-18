<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2" id="sidebar">
                	<div style="max-width:228px;">
                		<!-- <a href="/" target="_new">
                			<img src="/images/ci.png" style="width:100%;" />
                		</a> -->
                	</div>
                		<c:choose>
                			<c:when test="${menu_idx == 1}">
                				<!-- 로그관리 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '111'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLogList.do?pkid=111"><i class="icon-chevron-right">접속로그</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '112'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLogList.do?pkid=112"><i class="icon-chevron-right">사용자그룹별 권한관리 이력</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '113'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLogList.do?pkid=113"><i class="icon-chevron-right">사용자 권한그룹관리 이력</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '114'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLogList.do?pkid=114"><i class="icon-chevron-right">사용자접속관리</i></a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 2}">
		                    	<!-- 강습관리 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '37'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLessonList.do?pkid=37"><i class="icon-chevron-right">강습코드관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '38'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLessonList.do?pkid=38"><i class="icon-chevron-right">강습관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '39'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLessonList.do?pkid=39"><i class="icon-chevron-right">강습반 정원관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '40'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLessonList.do?pkid=40"><i class="icon-chevron-right">강사배정관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '41'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLessonList.do?pkid=41"><i class="icon-chevron-right">강습반별재등록대상현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '42'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLessonList.do?pkid=42"><i class="icon-chevron-right">휴관일자관리</i></a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 3}">
		                    	<!-- 회원관리 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '25'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectMemberList.do?pkid=25"><i class="icon-chevron-right">회원등록관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '26'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectMemberList.do?pkid=26"><i class="icon-chevron-right">회원카드발급현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '27'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectMemberList.do?pkid=27"><i class="icon-chevron-right">회원명부조회</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '28'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectMemberList.do?pkid=28"><i class="icon-chevron-right">강습반 일괄변경</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '29'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectMemberList.do?pkid=29"><i class="icon-chevron-right">강습반 이월관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '30'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectMemberList.do?pkid=30"><i class="icon-chevron-right">회원상담현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '31'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectMemberList.do?pkid=31"><i class="icon-chevron-right">회원정보동의관리</i></a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 4}">
		                    	<!-- 출입관리 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '32'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectAccessList.do?pkid=32"><i class="icon-chevron-right">출입관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '33'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectAccessList.do?pkid=33"><i class="icon-chevron-right">입장현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '34'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectAccessList.do?pkid=34"><i class="icon-chevron-right">일일입장관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '35'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectAccessList.do?pkid=35"><i class="icon-chevron-right">일일입장번호순출력</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '36'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectAccessList.do?pkid=36"><i class="icon-chevron-right">쿠폰관리</i></a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 5}">
		                    	<!-- 사물함관리 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '87'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLockerList.do?pkid=87"><i class="icon-chevron-right">사물함 분류정보 관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '88'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLockerList.do?pkid=88"><i class="icon-chevron-right">사물함코드 관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '89'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLockerList.do?pkid=89"><i class="icon-chevron-right">사물함이용현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '90'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLockerList.do?pkid=90"><i class="icon-chevron-right">사물함보증금내역</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '91'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectLockerList.do?pkid=91"><i class="icon-chevron-right">사물함이용내역</i></a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 6}">
		                    	<!-- 대관관리 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '92'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=92"><i class="icon-chevron-right">대관코드관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '93'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=93"><i class="icon-chevron-right">대관-휴관관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '94'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=94"><i class="icon-chevron-right">대관기간관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '95'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=95"><i class="icon-chevron-right">대관관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '96'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=96"><i class="icon-chevron-right">대관-환불/취소ㆍ정지</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '97'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=97"><i class="icon-chevron-right">대관-공휴일관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '98'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=98"><i class="icon-chevron-right">대관-기타금액관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '99'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=99"><i class="icon-chevron-right"></i>대관매출현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '100'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=100"><i class="icon-chevron-right"></i>대관환불현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '101'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=101"><i class="icon-chevron-right"></i>대관미납현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '102'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=102"><i class="icon-chevron-right"></i>대관추첨</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '103'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=103"><i class="icon-chevron-right"></i>대관추첨자현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '104'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=104"><i class="icon-chevron-right"></i>대관추첨현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '105'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=105"><i class="icon-chevron-right"></i>대관설비현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '106'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=106"><i class="icon-chevron-right">대관불허가현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '107'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=107"><i class="icon-chevron-right">대관팀 관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '108'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=108"><i class="icon-chevron-right">대관팀원관리</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '109'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=109"><i class="icon-chevron-right">미사용대관현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '110'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectRentList.do?pkid=110"><i class="icon-chevron-right">대관현황</i></a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 7}">
		                    	<!-- 인원현황 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '43'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=43"><i class="icon-chevron-right">접수현황 조회</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '44'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=44"><i class="icon-chevron-right">만기현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '45'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=45"><i class="icon-chevron-right">환불인원현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '46'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=46"><i class="icon-chevron-right">강좌별 현회원명부</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '47'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=47"><i class="icon-chevron-right">강좌별 현인원현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '48'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=48"><i class="icon-chevron-right">출석부</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '49'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=49"><i class="icon-chevron-right"></i>강사별출석부</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '50'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=50"><i class="icon-chevron-right"></i>수업일지</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '51'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=51"><i class="icon-chevron-right"></i>정기/반변경 상세내역</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '52'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=52"><i class="icon-chevron-right"></i>미방문회원현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '53'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=53"><i class="icon-chevron-right"></i>휴회관련회원현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '54'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=54"><i class="icon-chevron-right"></i>환불대기자현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '55'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=55"><i class="icon-chevron-right"></i>접수현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '56'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=56"><i class="icon-chevron-right">실시간접수현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '57'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=57"><i class="icon-chevron-right">종목별월별회원현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '58'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectPeopleList.do?pkid=58"><i class="icon-chevron-right">재등록 제한 현황</i></a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 8}">
		                    	<!-- 매출현황 -->
		                		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '61'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=61"><i class="icon-chevron-right">매출일보</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '62'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=62"><i class="icon-chevron-right">일일입장판매내역</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '63'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=63"><i class="icon-chevron-right">일일마감</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '64'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=64"><i class="icon-chevron-right">미납자현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '65'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=65"><i class="icon-chevron-right">일일입장매출현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '66'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=66"><i class="icon-chevron-right">수입결의서</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '67'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=67"><i class="icon-chevron-right"></i>징수결의서</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '68'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=68"><i class="icon-chevron-right"></i>강습매출조정</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '69'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=69"><i class="icon-chevron-right"></i>카드결제처리현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '70'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=70"><i class="icon-chevron-right"></i>월별종목별가입통계</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '71'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=71"><i class="icon-chevron-right"></i>월별종목별가입금액통계</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '72'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=72"><i class="icon-chevron-right"></i>수납자별입금현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '73'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=73"><i class="icon-chevron-right"></i>일일업장수입금</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '74'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=74"><i class="icon-chevron-right">품목별매출분포현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '75'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=75"><i class="icon-chevron-right">월별일일운영현황</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '76'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=76"><i class="icon-chevron-right">분기별연간수입내역</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '77'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=77"><i class="icon-chevron-right">연도별수입내역</i></a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '78'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=78"><i class="icon-chevron-right"></i>수강료납입영수증</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '79'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=79"><i class="icon-chevron-right"></i>환불현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '80'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=80"><i class="icon-chevron-right"></i>할인</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '81'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=81"><i class="icon-chevron-right"></i>기간결산</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '82'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=82"><i class="icon-chevron-right"></i>기타비용매출현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '83'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=83"><i class="icon-chevron-right"></i>현금영수증승인현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '84'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=84"><i class="icon-chevron-right"></i>카드사별승인현황</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '85'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=85"><i class="icon-chevron-right"></i>강사료산정</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '86'}">class="active"</c:if>>
			                            <a href="{pageContext.request.contextPath}/selectPaidList.do?pkid=86"><i class="icon-chevron-right"></i>제로페이매출현황</a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    
		                    <c:when test="${menu_idx == 9}">
		                    	<!-- SMS -->
								<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <li <c:if test="${pgm.pkid== '59'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectSMSList.do?pkid=59"><i class="icon-chevron-right"></i>SMS보내기</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '60'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectSMSList.do?pkid=60"><i class="icon-chevron-right"></i>SMS전송내역</a>
			                        </li>
			                    </ul>
		                    </c:when>
		                    <c:when test="${menu_idx == 10}"> 
		                    	<!-- 기초관리 -->
								<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			                        <%-- <li> <!-- class="active" -->
			                            <a><i class="icon-chevron-right"></i>${p.PGMName }</a>
			                        </li> --%>
			                        <li <c:if test="${pgm.pkid== '5'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selecSitecode.do?pkid=5"><i class="icon-chevron-right"></i>사업장관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '1'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/UserGroup.do?pkid=1"><i class="icon-chevron-right"></i>사용자그룹관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '8'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/groupAuthority.do?pkid=8"><i class="icon-chevron-right"></i>사용자그룹별 권한관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '2'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/Users.do?pkid=2"><i class="icon-chevron-right"></i>사용자관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '10'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/userAuthorityGroup.do?pkid=10"><i class="icon-chevron-right"></i>사용자별 권한그룹 지정</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '9'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/DCType.do?pkid=9"><i class="icon-chevron-right"></i>할인유형관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '20'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/ExpenseGroup.do?pkid=20"><i class="icon-chevron-right"></i>비용항목그룹관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '14'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/Expense.do?pkid=14"><i class="icon-chevron-right"></i>비용항목관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '15'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/SLOrderGroup.do?pkid=15"><i class="icon-chevron-right"></i>일일입장메뉴분류관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '16'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/SLOrderItem.do?pkid=16"><i class="icon-chevron-right"></i>일일입장메뉴관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '22'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=22"><i class="icon-chevron-right"></i>관리자수정기능</a>
			                        </li>
			                        
			                        
			                        <%-- <li <c:if test="${pgm.pkid== '3'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=3"><i class="icon-chevron-right"></i>프로그램그룹관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '4'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=4"><i class="icon-chevron-right"></i>프로그램관리</a>
			                        </li>
			                        
			                        <li <c:if test="${pgm.pkid== '6'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=6"><i class="icon-chevron-right"></i>공통코드분류관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '7'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=7"><i class="icon-chevron-right"></i>공통코드관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '11'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=11"><i class="icon-chevron-right"></i>은행관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '12'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=12"><i class="icon-chevron-right"></i>신용카드관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '13'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=13"><i class="icon-chevron-right"></i>밴사관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '17'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=17"><i class="icon-chevron-right"></i>시스템관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '18'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=18"><i class="icon-chevron-right"></i>우편번호관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '19'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=19"><i class="icon-chevron-right"></i>공지사항관리</a>
			                        </li>
			                        
			                        <li <c:if test="${pgm.pkid== '21'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=21"><i class="icon-chevron-right"></i>코드가져오기</a>
			                        </li>
			                        
			                        <li <c:if test="${pgm.pkid== '23'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=23"><i class="icon-chevron-right"></i>발권기 관리</a>
			                        </li>
			                        <li <c:if test="${pgm.pkid== '24'}">class="active"</c:if>>
			                            <a href="${pageContext.request.contextPath}/selectBaseList.do?pkid=24"><i class="icon-chevron-right"></i>관리자수정기능(신규)</a>
			                        </li> --%>
			                    </ul>
		                    </c:when>
	                    </c:choose>
                	
                </div>