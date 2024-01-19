package egovframework.veterans.com.cmm.lib;

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
	
	public static Marker test = MarkerFactory.getMarker("Test");
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientId = request.getParameter("clientId"); // 클라이언트 식별자
        String data = request.getParameter("data");

        ServletContext context = getServletContext();
        context.setAttribute("data_" + clientId, data); // 클라이언트 식별자를 사용하여 데이터 저장
        request.getSession().setAttribute("clientId", clientId);
        log.info(test,"receive : clientId_"+clientId);
        response.setContentType("text/plain");
        response.getWriter().println("Data received successfully for client: " + clientId);
    }
}
