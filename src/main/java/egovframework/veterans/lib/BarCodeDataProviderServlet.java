package egovframework.veterans.lib;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Marker;
import org.slf4j.MarkerFactory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebServlet(value="/barCodeGetData.do")
public class BarCodeDataProviderServlet extends HttpServlet {
	
	Functions f = Functions.getInstance();
	
	public static Marker test = MarkerFactory.getMarker("Test");
	/**
	 * 바코드 데이터 웹페이지에 전송
	 * */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String clientId = request.getParameter("clientId"); // 클라이언트 식별자
    	//String clientId = f.getNullToSpaceStrValue(request.getSession().getAttribute("clientId"));
    	log.info(test,"provider : clientId_"+f.generateClientId());
    	request.getSession().removeAttribute("clientId");
    	
        ServletContext context = getServletContext();
        String data = (String) context.getAttribute("data_" + f.generateClientId()); // 클라이언트 식별자를 사용하여 데이터 검색

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.println(data != null ? data : "No data available for client: " + f.generateClientId());
	}
}
