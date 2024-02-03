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

      const urlParams = new URLSearchParams(window.location.search);
      const paymentKey = urlParams.get("paymentKey");
      const orderId = urlParams.get("orderId");
      const amount = urlParams.get("amount");


      
      const paymentKeyElement = document.getElementById("paymentKey");
      const orderIdElement = document.getElementById("orderId");
      const amountElement = document.getElementById("amount");

      orderIdElement.textContent = "�ֹ���ȣ: " + orderId;
      amountElement.textContent = "���� �ݾ�: " + amount;
      paymentKeyElement.textContent = "paymentKey: " + paymentKey;
    </script>
  </body>
</html>