<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/svg+xml" href="/vite.svg" />
<title>상품 결제 페이지</title>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
</head>
<body>
	<div id="payment-method"></div>
    <button id="payment-request-button">결제하기</button>
    <script>
    const paymentWidget = PaymentWidget(
        "test_ck_Kma60RZblrqA7NX2LnErwzYWBn14",
        // 비회원 customerKey
    	PaymentWidget.ANONYMOUS
    );
    
    var price = 200;
    
    /**
     * 결제창을 렌더링합니다.
     * @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods%EC%84%A0%ED%83%9D%EC%9E%90-%EA%B2%B0%EC%A0%9C-%EA%B8%88%EC%95%A1
     */
    paymentWidget.renderPaymentMethods("#payment-method", { value: '${odata.pPrice}' });

    const paymentRequestButton = document.getElementById(
        "payment-request-button"
    );
    paymentRequestButton.addEventListener("click", () => {
        /** 결제 요청
         * @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment%EA%B2%B0%EC%A0%9C-%EC%A0%95%EB%B3%B4
         */
        paymentWidget.requestPayment({
        	orderId: generateRandomString(),
        	orderName: '${odata.pName}',
            //successUrl: window.location.origin + "/success.jsp",
            successUrl: "http://localhost:8080/a_projectAPI/success.jsp",
            failUrl: "http://localhost:8080/a_projectAPI//fail.jsp",
        });
    });
      
    function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
    }
    </script>
</body>
</html>