package egovframework.veterans.lib;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class HttpRequester {

	// GET 요청을 처리하는 메소드
	public String sendGet(String url) throws Exception {
		URL obj = new URL(url);
		HttpURLConnection connection = (HttpURLConnection) obj.openConnection();
		connection.setRequestMethod("GET");

		int responseCode = connection.getResponseCode();
		log.debug("GET Response Code :: " + responseCode);

		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
			String inputLine;
			StringBuilder response = new StringBuilder();
	
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
	
			return response.toString();
		}
	}

	// POST 요청을 처리하는 메소드
	public String sendPost(String url, String urlParameters) throws Exception {
		byte[] postData = urlParameters.getBytes(StandardCharsets.UTF_8);
		URL myUrl = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) myUrl.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postData.length));
		conn.setDoOutput(true);

		try (OutputStream os = conn.getOutputStream()) {
		    os.write(postData);
		}

		int responseCode = conn.getResponseCode();
		log.debug("POST Response Code :: " + responseCode);

		try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
		    String inputLine;
		    StringBuilder response = new StringBuilder();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}

			return response.toString();
		}
	}

	// 요청 방식에 따라 적절한 메소드를 호출하는 메소드
	public String executeRequest(String method, String url, String urlParameters) throws Exception {
		if ("GET".equalsIgnoreCase(method)) {
    		return sendGet(url);
	    } else if ("POST".equalsIgnoreCase(method)) {
			return sendPost(url, urlParameters);
		} else {
			throw new IllegalArgumentException("Unsupported request method: " + method);
		}
	}

	public static void main(String[] args) {
		HttpRequester requester = new HttpRequester();
		try {
			// 예제 GET 요청
			String getResult = requester.executeRequest("GET", "http://example.com", null);
			log.debug("GET Request Result:\n" + getResult);

			// 예제 POST 요청
			String postResult = requester.executeRequest("POST", "http://example.com", "param1=value1&param2=value2");
			log.debug("POST Request Result:\n" + postResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
