<%@page contentType="text/html" pageEncoding="UTF-8" extends="com.xmall.payment.web.PaySuccess"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<title>支付成功</title>
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

    <jsp:include page="./common/header.jsp" flush="true"/>
    <section id="bd">
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
                        <li>
                            <span>3. 选择支付方式</span>
                            <i></i>
                        </li>
                        <li class="lst-on">
                            <span>4. 支付成功</span>
                            <i></i>
                        </li>
                    </ul>
                </section>
                    <div class="sucs-tips">

                        <div class="w-tips">
                            <i class="m-icon i-succ-l"></i>
                        </div>
                        <div class="hint">
                            <h2 class="title-l">支付成功！ </h2>
                            <p>
                                <a href="${orderUrl }">查看我的订单</a></p>
                         
                        </div>


                    </div>

            </div>
        </div>

    </section>
    
    <jsp:include page="./common/footer.jsp" flush="true" />
</div>

<script src="//y.xgimg.net/js/moui/1.0.5/mo.js?debug=true&mv=1.0.5&v=${resourceVersion}"></script>
<script>
        Mo.usage("ym/modules/common,")
    </script>
</body>
</html>

