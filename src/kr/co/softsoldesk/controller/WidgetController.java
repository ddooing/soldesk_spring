
package kr.co.softsoldesk.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WidgetController {
  
  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @RequestMapping(value = "/confirm", method=RequestMethod.POST)
  public ResponseEntity<JSONObject> confirmPayment(@RequestBody String jsonBody) throws Exception {
    
	  System.out.println("위젯 컨트롤러 실행됨");
    JSONParser parser = new JSONParser();
    String orderId;
    String amount;
    String paymentKey;
    
    
    try {
      // 클라이언트에서 받은 JSON 요청 바디입니다.
      JSONObject requestData = (JSONObject) parser.parse(jsonBody);
      paymentKey = (String) requestData.get("paymentKey");
      orderId = (String) requestData.get("orderId");
      amount = (String) requestData.get("amount");
      
      
      System.out.println("요청 orderId :"+orderId);
  	System.out.println("요청 paymentKey :"+paymentKey);
  	System.out.println("요청 amount :"+amount);
    } catch (ParseException e) {
    	System.out.println("d오류");
    		throw new RuntimeException(e);
      
    };
    JSONObject obj = new JSONObject();
    obj.put("orderId", orderId);
    //obj.put("amount", amount);
    obj.put("amount", 1000); //실패 시 확인용 
    obj.put("paymentKey", paymentKey);
    
    
    // TODO: 개발자센터에 로그인해서 내 결제위젯 연동 키 > 시크릿 키를 입력하세요. 시크릿 키는 외부에 공개되면 안돼요.
    // @docs https://docs.tosspayments.com/reference/using-api/api-keys
    String apiKey = "test_sk_mBZ1gQ4YVX9wG14ZXOLarl2KPoqN";

    // 토스페이먼츠 API는 시크릿 키를 사용자 ID로 사용하고, 비밀번호는 사용하지 않습니다.
    // 비밀번호가 없다는 것을 알리기 위해 시크릿 키 뒤에 콜론을 추가합니다.
    // @docs https://docs.tosspayments.com/reference/using-api/authorization#%EC%9D%B8%EC%A6%9D
    Base64.Encoder encoder = Base64.getEncoder();
    byte[] encodedBytes = encoder.encode((apiKey + ":").getBytes("UTF-8"));
    String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);
    
    // 결제를 승인하면 결제수단에서 금액이 차감돼요.
    URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestProperty("Authorization", authorizations);
    connection.setRequestProperty("Content-Type", "application/json");
    connection.setRequestMethod("POST");
    connection.setDoOutput(true);
    
    OutputStream outputStream = connection.getOutputStream();
    outputStream.write(obj.toString().getBytes("UTF-8"));
    
    int code = connection.getResponseCode();
    boolean isSuccess = code == 200 ? true : false;
    System.out.println("code : "+code);
    InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();
    System.out.println("responseStream : "+responseStream);
    // 결제 성공 및 실패 비즈니스 로직을 구현하세요.
    Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
    JSONObject jsonObject = (JSONObject) parser.parse(reader);
    responseStream.close();
    
    if (isSuccess) {
        // 성공 로직
        System.out.println("connection 성공: " + jsonObject);
        System.out.println("connection 성공 code : " + code);
        // 추가 성공 처리 로직
    } else {
        // 실패 로직
        System.out.println("connection 실패: " + jsonObject);
        
        System.out.println("connection 실패 code : " + code);
        // 추가 실패 처리 로직
    }
    
    return ResponseEntity.status(code).body(jsonObject);
  }
  
}
