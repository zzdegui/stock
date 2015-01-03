<%@page contentType="text/html" pageEncoding="UTF-8"
        extends="com.xmall.payment.web.PrePay"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8" />
    <title>网上支付|云Mall</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lt IE 9]>
    <script src="//y.xgimg.net/js/vendor/html5.js?v=${resourceVersion}"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script src="//y.xgimg.net/js/vendor/pngfix.js"></script>
    <![endif]-->
    <link rel="shortcut icon" type="image/x-icon"
          href="//y.xgimg.net/img/shortcuticon.ico?v=${resourceVersion}" />
    <link rel="stylesheet"
          href="//y.xgimg.net/~?f=usage/ym/payment-option&amp;v=${resourceVersion}" />
    <script type="text/javascript">
        <jsp:include page="./common/paymentjs.jsp" flush="true" />
    </script>
</head>
<body>
<div id="xg-front">
    <jsp:include page="./common/header.jsp" flush="true"/>
    <section id="bd">
        <c:choose>
	<c:when test="${payType==3 }">
	<form data-role="j_gopay_form" method="POST" target="_self" action="balancePayment.jhtml">
                    <input type="hidden" value="${payType}" id="payType" name="payType">
				    <input type="hidden" value="${payIds}" id="payIdStr" name="payIdStr">
				    <input type="hidden" name="orderIds" value="${orderIds}">
				    <input type="hidden" value="${balancePay}" id="balancePay" name="balancePay">
				    <input type="hidden" value="${currentUserId}" id="currentUserId" name="currentUserId">
				    <input type="hidden" value="${balanceMoney}" id="balanceMoney" name="balanceMoney">
				    <input type="hidden" name="payParam" value='<c:out value="${payParam}" />' />
				    <input type="hidden" value="" id="hidden_rc" name="hidden_rc">
		<div id="bd-inner">
			<div class="m-content">
				<section class="nav-content">
					<ul class="nav-content-lst">
						<li>
							<span>1. 查看购物车</span> <i></i>
						</li>
						<li>
							<span>2. 填写订单信息</span> <i></i>
						</li>
						<li class="lst-on">
							<span>3. 选择支付方式</span>
							<i></i>
						</li>
						<li>
							<span>4. 支付成功</span>
							<i></i>
						</li>
					</ul>
				</section>
				<div class="amount1">
					<p>应付金额： <em>${totalMoney}</em> 元</p>
				</div>
				<dl class="payment-type">
				<dt class="dt">付款方式：</dt>
				<dd><p> 账户余额， 支付金额 <em>${balanceMoney}</em> 元</p>
				</dd>
				</dl>
				<p class="confirm-text">使用账户余额付款，需要短信确认，验证码已发送至手机：${mobile}，请按提示操作。</p>
				<p class="security-code">
					<input placeholder="请您输入验证码" class="m-inp" name="check_code" data-role="check_code">  
					<input type="hidden" id="randomCode" name="randomCode" value="${randomCode }">
					<input type="hidden" value="${hiddenMobile}" id="hiddenMobile" name="hiddenMobile">
					<span class="m-btn btn-gs" >
						<button type="button" class="btn-r" data-phone="${hiddenMobile}" data-role="get-msgval">(60)秒重新获取</button>
					</span>
					<span class="error-tip"></span>
				</p>
				<button class="m-btn btn-primary" data-role="j_gopay" type="button">去支付</button>
			</div>
			<input type="hidden" value="${orderListUrl }" id="successUrl">
            <input id="repaywayUrl" type="hidden" value="./cashier.jhtml?tradeIdentity=1&orderid=${orderIds}">
		</div>
		</form></c:when>
	<c:when test="${payType==2 }">
			<form data-role="j_gopay_form" method="POST" target="_self" action="toebank.jhtml" id="moui_1389671113956">
			 <input type="hidden" name="payParam" value='<c:out value="${payParam}" />' />
             <input type="hidden" name="orderIds" value="${orderIds}">
             <input type="hidden" name="pageTotalMoney" value="${totalMoney}">
             <input type="hidden" value="${payType}" id="payType" name="payType">
             <input type="hidden" value="" id="hidden_rc" name="hidden_rc">
		<div id="bd-inner">
			<div class="m-content" id="moui_1389671113981">
				<section class="nav-content">
					<ul class="nav-content-lst">
						<li>
							<span>1. 查看购物车</span> <i></i>
						</li>
						<li>
							<span>2. 填写订单信息</span> <i></i>
						</li>
						<li class="lst-on">
							<span>3. 选择支付方式</span>
							<i></i>
						</li>
						<li>
							<span>4. 支付成功</span>
							<i></i>
						</li>
					</ul>
				</section>

				<div class="amount1" id="moui_1389671114005">
					<p id="moui_1389671114004">应付金额： <em>${totalMoney}</em> 元</p>
				</div>
				<dl class="payment-type" id="moui_1389671114002">
				<dt class="dt" id="moui_1389671114007">付款方式：</dt>
				<dd id="moui_1389671114001"><p id="moui_1389671114000"> 账户余额， 支付金额 <em>${balanceMoney}</em> 元</p>
					<p data-role="title-pay" title="${selName }" id="moui_1389671114006"> <img src="${bankCode }" class="bank-img" />， 支付金额 <em>${onlineMoney}</em> 元</p>
				</dd>
				</dl>
				<p class="confirm-text">使用账户余额付款，需要短信确认，验证码已发送至手机：${mobile}，请按提示操作。</p>
				<p class="security-code" id="moui_1389671114003">
					<input placeholder="请您输入验证码" class="m-inp" name="check_code" data-role="check_code" id="moui_1389671113953">
					<input type="hidden" id="randomCode" name="randomCode" value="${randomCode }">
					<input type="hidden" value="${hiddenMobile}" id="hiddenMobile" name="hiddenMobile">
						<button type="button" class="btn-r" data-phone="${hiddenMobile}" data-role="get-msgval" id="moui_1389671113968">免费获取短信验证码</button>
					<span class="error-tip"></span>
				</p>
				<button class="m-btn btn-primary" data-role="j_gopay" type="button" id="moui_1389671113955">去支付</button>
			</div>
				<input type="hidden" value="${orderListUrl }" id="successUrl">
                <input id="repaywayUrl" type="hidden" value="./cashier.jhtml?tradeIdentity=1&orderid=${orderIds}">
		</div>
		</form>
	</c:when>
	<c:otherwise>
	<form action="toebank.jhtml" method="post" target="_blank">
             <input type="hidden" name="payParam" value='<c:out value="${payParam}" />' />
             <input type="hidden" name="orderIds" value="${orderIds}">
             <input type="hidden" name="pageTotalMoney" value="${totalMoney}">
             <input type="hidden" value="${payType}" id="payType" name="payType">
            <div id="bd-inner">
            <div class="m-content">
				<section class="nav-content">
					<ul class="nav-content-lst">
						<li>
							<span>1. 查看购物车</span> <i></i>
						</li>
						<li>
							<span>2. 填写订单信息</span> <i></i>
						</li>
						<li class="lst-on">
							<span>3. 选择支付方式</span>
							<i></i>
						</li>
						<li>
							<span>4. 支付成功</span>
							<i></i>
						</li>
					</ul>
				</section>
				<div class="amount1">
					<p>应付金额： <em>${totalMoney }</em> 元</p>
				</div>
				<dl class="payment-type">
				<dt class="dt">付款方式：</dt>
				<dd>
					<p data-role="title-pay" title="${selName }"> 
					<img src="${bankCode}" class="bank-img" />，支付金额 <em>${totalMoney }</em> 元</p>
				</dd>
				</dl>
<!-- 				<span class="m-btn btn-ln"> -->
<!-- 					<span class="m-btn btn-ln"> -->
						<button class="m-btn btn-primary" data-role="j_gopay" type="button" id="moui_1389670748603">去支付</button>
<!-- 					</span> -->
<!-- 				</span> -->
			</div>
                <input type="hidden" value="${orderListUrl }" id="successUrl">
                <input id="repaywayUrl" type="hidden"value="./cashier.jhtml?tradeIdentity=1&orderid=${orderIds}">
            </div>
        </form>
        </c:otherwise>
	</c:choose>
        
    </section>
    <jsp:include page="./common/footer.jsp" flush="true" />
</div>

<script
        src="//y.xgimg.net/js/moui/1.0.5/mo.js?debug=true&mv=1.0.5&v=${resourceVersion}"></script>
        
<script>

    Mo.usage("ym/modules/common,ym/payment-gopay")
</script>
</body>
</html>

