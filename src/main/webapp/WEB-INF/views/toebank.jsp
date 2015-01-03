<%@page contentType="text/html" pageEncoding="UTF-8"
        extends="com.xmall.payment.web.ToEBank"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="${payResult.requestCharset}" />
    <title></title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
</head>
<body>
<div class="jump-tips" style="background:#fff; text-align:center; padding-top:300px;">
    <img src="http://y.xgimg.net/img/ym/payment/jump.png"></div>
<form name="autoloadForm" action="${payResult.requestUrl }"
      method="${payResult.requestMethod }">
    <c:forEach var="item" items="${payResult.requestData }">
        <input type="hidden" name="${item.key }" value="${item.value }" />
    </c:forEach>
</form>
<script>
    <!--
    window.onload=function(){document.autoloadForm.submit();}
    //-->
</script>

</body>
</html>
