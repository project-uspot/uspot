package egovframework.veterans.lib;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketService {
	
	private final static int BUFFER_SIZE = 1024;
	
	public String setSocket(int Time,String IP, int PORT, String msg) {
		String result = null; // 서버로부터 받은 응답을 저장할 변수
		//인스턴스 생성
		try (Socket c_socket = new Socket()) {
            // 소켓 주소 설정 및 연결 시간 초과 설정
            InetSocketAddress ipep = new InetSocketAddress(IP, PORT);
            c_socket.setSoTimeout(Time); // 소켓의 읽기/쓰기 작업에 대한 타임아웃 설정
            c_socket.connect(ipep); // 서버에 연결
            
            log.debug("socket connected to IP address = " + c_socket.getRemoteSocketAddress().toString());

            // 데이터 송수신을 위한 스트림 생성
            try (OutputStream send = c_socket.getOutputStream();
                 InputStream recv = c_socket.getInputStream()) {
				
            	byte[] b = msg.getBytes(); // 보낼 메시지를 바이트 배열로 변환
                send.write(b); // 데이터를 서버로 전송
                send.flush();
                log.debug("Sent message: " + msg);

                byte[] buffer = new byte[BUFFER_SIZE]; // 응답을 받기 위한 버퍼
                int readBytes = recv.read(buffer); // 서버로부터 데이터 읽기 (읽은 바이트 수 반환)
                if (readBytes > 0) {
                    result = new String(buffer, 0, readBytes); // 응답을 문자열로 변환
                } else {
                    log.error("No response received."); // 응답이 없을 경우 로그 기록
                }

            } catch (IOException e) {
            	// 데이터 송수신 중 발생한 IOException 처리
            	log.error("IOException in send/receive: " + e.getMessage());
            }
		}catch (IOException e) {
			// 소켓 연결 중 발생한 IOException 처리
			log.error(e.getMessage());
		}
		return result; // 서버로부터 받은 응답 반환
	}

	
}
