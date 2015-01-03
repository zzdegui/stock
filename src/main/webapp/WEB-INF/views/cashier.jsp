<%@page contentType="text/html" pageEncoding="UTF-8"
	extends="com.xmall.payment.web.Cashier"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<title>请选择支付方式|云Mall</title>
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
<link rel="stylesheet" href="//y.xgimg.net/~?f=usage/ym/payment-option&amp;v=${resourceVersion}" />
<script type="text/javascript">
<jsp:include page="./common/paymentjs.jsp" flush="true" />
</script>
</head>
<body>
	<div id="xg-front">
		<jsp:include page="./common/header.jsp" flush="true" />
		<section id="bd">
		  <form action="./toebank.jhtml" method="post" target="_blank">
			<div id="bd-inner">

				<div class="m-content">

					<section class="nav-content">
						<ul class="nav-content-lst">
							<li><span>1. 查看购物车</span> <i></i></li>
							<li><span>2. 填写订单信息</span> <i></i></li>
							<li class="lst-on"><span>3. 选择支付方式</span> <i></i></li>
							<li><span>4. 支付成功</span> <i></i></li>
						</ul>
					</section>

					<div class="amount">
						应付金额： <span>¥</span> <em>${orderInfo.totalMoney}</em> <a href="cashier.jhtml?orderid=${requestParam.orderid}&tradeIdentity=${requestParam.tradeIdentity }">刷新</a>
					</div>
					<div class="check-payment" id="moui_1389231012203">
					<h2 id="moui_1389231012202">请选择支付方式</h2>
					<%--
					<c:choose>
					  <c:when test="${isSelectBalance == true}"> 
					    <p>
						<input type="checkbox" checked="checked" id="balancePay" value="true"
						 class="balancePay-check" data-role="balancePay-check" name="balancePay">
						使用账户余额支付 <em>¥ <b data-role="balancePay-number" class="balancenum"><fmt:formatNumber type="number" value="${balanceInfo.useBalanceMoney}" pattern="#,##0.00#" /></b></em>
						当前账户余额 ¥ <fmt:formatNumber type="number" value="${balanceInfo.accountMoney}" pattern="#,##0.00#" />
					     </p>
				       </c:when>
				       <c:otherwise>
					       <p style ="display:none;">
							<input type="checkbox"  id="balancePay" value="false"
							 class="balancePay-check" data-role="balancePay-check" name="balancePay">
							使用账户余额支付 <em>¥ <b data-role="balancePay-number" class="balancenum"><fmt:formatNumber type="number" value="${balanceInfo.useBalanceMoney}" pattern="#,##0.00#" /></b></em>
							当前账户余额 ¥ <fmt:formatNumber type="number" value="${balanceInfo.accountMoney}" pattern="#,##0.00#" />
						   </p>
  					   </c:otherwise>
				    </c:choose>
				    --%>
					</div>
					<input type="hidden" name="orderinfo" value='<c:out value="${orderInfo.toJSON() }" />'>
					<%--1:全网银,2:混合支付,3:全余额 --%>
					<%--<input type="hidden" name="useBalanceMoney" value="${balanceInfo.useBalanceMoney}">--%>
                    <c:set var="showbank" value="${eBankList.bankList.size() != 0 }" />
					<div id="paySwitch">
						<%--<div class="m-tab">
							<ul class="strip pay-option-head">
                                <c:if test="${showbank}">
								<li class="on"><a href="#"> <span> <span>储蓄卡</span>
									</span>
								</a></li>
								<li><a href="#"> <span> <span>信用卡</span>
									</span>
								</a></li>
                                <li><a href="#"> <span> <span>支付平台</span>
                                </span>
                                </a></li>
                                </c:if>
                                <c:if test="${not showbank}">
                                <li class="on"><a href="#"> <span> <span>支付平台</span>
                                </span>
                                </a></li></c:if>
							</ul>
						</div>
						--%>
						<div class="pay-option-body">
						 <c:if test="${showbank}">
                              <p class="tips">
                                                                            支付平台 
                              </p>
						       <div class="pay-con">
                                    <ul class="bank-list pay-plat-list">
                                        <c:if test="${agencyList.agencyList!='' }">
                                        <c:forEach var="agency" items="${agencyList.agencyList }" varStatus="status">
                                            <li><input type="radio" name="selectPay"
                                                    <c:if test="${status.count == 1}">
                                                        checked="checked"
                                                    </c:if>
                                                       value='<c:out value="${agency.toJSON() }" />'
                                                class="bank-check" /> <a href="javascript:;"
                                                title="${agency.agency_name }"> <img
                                                    src="${agency.agency_logo}" class="bank-img" />
                                            </a></li>
                                        </c:forEach>
                                        </c:if>
                                    </ul>
                                </div>
							<%--储蓄卡网上支付--%>
							<div class="pay-con">
									<p class="tips">
									银行卡
									<span>  
									(储蓄卡和信用卡都支持)</span>
									</p>
									<ul class="bank-list">
									    <c:if test="${eBankList.bankList!='' }">
										<c:forEach var="eBank" items="${eBankList.bankList }" varStatus="status">
											<li><input type="radio" name="selectPay"
												class="bank-check" 
												value='<c:out value="${eBank.toJSON() }" />' /><a
												href="javascript:;" title="${eBank.bank_name }"> <img
													src="${eBank.bank_logo}" class="bank-img"
                                                    />
											</a></li>
										</c:forEach>
										</c:if>
									</ul>
								</div>
							<%--信用卡支付 
							<div class="pay-con" style="">
								<p class="tips">
									信用卡网上支付 <span>(需要开通网银)</span>
								</p>
									<ul class="bank-list">
									    <c:if test="${creditList.bankList!='' }">
										<c:forEach var="credit" items="${creditList.bankList }">
											<li><input type="radio" name="selectPay"
												value='<c:out value="${credit.toJSON() }" />'
												class="bank-check" /> <a
												href="javascript:;" title="${credit.bank_name }"><img
													src="${credit.bank_logo}" class="bank-img" />
											</a></li>
										</c:forEach>
										</c:if>
									</ul>
								</div>
                               --%>
                            </c:if>
								
								<span class="m-btn btn-ln f-right">
								<button type="button" class="m-btn btn-primary" data-role="j_go_pay"
									data-url="">去支付</button>
							</span>

						</div>
					</div>
				</div>
				<input type="hidden" name="pageTotalMoney" value="${orderInfo.totalMoney}">
		        <input type="hidden" id="successUrl" value="${orderUrl}">
                <input type="hidden" id="orderIds" name="orderIds" value="${orderIds}">
                <input id="repaywayUrl" type="hidden"value="./cashier.jhtml?tradeIdentity=1&orderid=${orderIds}">
                </div>
				</form>
		</section>
		<jsp:include page="./common/footer.jsp" flush="true" />
	</div>

	<script
		src="//y.xgimg.net/js/moui/1.0.5/mo.js?debug=true&mv=1.0.5&v=${resourceVersion}"></script>
	<script>
		Mo.usage("ym/modules/common,ym/payment")
	</script>
</body>
</html>
