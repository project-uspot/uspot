package egovframework.veterans.com.cmm.lib;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketService {
	
	private final static int BUFFER_SIZE = 1024;
	
	public String setSocket(int Time,String IP, int PORT, String msg) {
		String result = null;
		//인스턴스 생성
		try(Socket c_socket = new Socket()) {
			//서버접속
			InetSocketAddress ipep = new InetSocketAddress(IP,PORT);
			c_socket.setSoTimeout(Time);
			c_socket.connect(ipep);
			//outputstream과 inputstream을 받는다
			try (OutputStream send = c_socket.getOutputStream();
				 InputStream recv = c_socket.getInputStream();){
				
				//콘솔 출력
				log.debug("socket connected IP address = " + c_socket.getRemoteSocketAddress().toString());

				try{
					// byte 변환
					byte[] b = msg.getBytes();
					// 서버로 메시지 전송
					send.write(b);
					log.debug(msg);
				}catch (Exception e) {
					// 에러 콘솔 출력
					log.debug(e.getMessage());
				}
				
				try {
					// 버퍼 생성
					byte[] b = new byte[BUFFER_SIZE];
					// 메시지를 받는다.
					recv.read(b, 0, b.length);
					result = new String(b);
				} catch (Throwable e) {
					// 에러 콘솔 출력
					log.debug(e.getMessage());
				}

			}
		}catch (Exception e) {
			log.debug(e.getMessage());
		}
		return result;
	}

	
}
