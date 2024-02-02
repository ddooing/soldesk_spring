<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
  </head>
  <body>
    <h2>���� ����</h2>
    <p id="paymentKey"></p>
    <p id="orderId"></p>
    <p id="amount"></p>

    <script>
      // ���� �Ķ���� ���� ���� ��û�� �� ���� �����Ϳ� �������� �ݵ�� Ȯ���ϼ���.
      // Ŭ���̾�Ʈ���� ���� �ݾ��� �����ϴ� ������ ������ �� �ֽ��ϴ�.
      const urlParams = new URLSearchParams(window.location.search);
      const paymentKey = urlParams.get("paymentKey");
      const orderId = urlParams.get("orderId");
      const amount = urlParams.get("amount");


      // �ֿܼ� ������ ���
      console.log("Payment Key: ", paymentKey);
      console.log("Order ID: ", orderId);
      console.log("Amount: ", amount);

      async function confirm() {
        const requestData = {
          paymentKey: paymentKey,
          orderId: orderId,
          amount: amount,};

        const response = await fetch("${root}/confirm",{
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          			},
          body: JSON.stringify(requestData),
        });

        const json = await response.json(); // ����

        if (!response.ok) {
          // ���� ���� ����Ͻ� ������ �����ϼ���.
          console.log(json);
          window.location.href = 'http://localhost:8080/SpringMiniProject/toss/fail?message=${json.message}&code=${json.code}';
        }

        // ���� ���� ����Ͻ� ������ �����ϼ���.
        console.log(json);
      }
      
      //POST ��û
      confirm();

      const paymentKeyElement = document.getElementById("paymentKey");
      const orderIdElement = document.getElementById("orderId");
      const amountElement = document.getElementById("amount");

      orderIdElement.textContent = "�ֹ���ȣ: " + orderId;
      amountElement.textContent = "���� �ݾ�: " + amount;
      paymentKeyElement.textContent = "paymentKey: " + paymentKey;
    </script>
  </body>
</html>