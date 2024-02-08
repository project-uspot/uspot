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
@WebServlet(value="/barCodeReceiveData.do")
public class BarCodeDataReceiverServlet extends HttpServlet {
	
	Functions f = Functions.getInstance();
	
	public static Marker test = MarkerFactory.getMarker("Test");
	/**
	 * 바코드 데이터 데스크톱에서 전송받음
	 * */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String data = request.getParameter("data");

        ServletContext context = getServletContext();
        context.setAttribute("data_" + f.generateClientId(), data); // 클라이언트 식별자를 사용하여 데이터 저장

        log.info(test,"receive : clientId_"+request.getSession().getAttribute("clientId"));
    }
}
