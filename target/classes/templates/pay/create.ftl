<script>
    function onBridgeReady(){
        WeixinJSBridge.invoke(
                'getBrandWCPayRequest', {
                    "appId":"${payResponse.appId}",     //Official Name, Pass By Business
                    "timeStamp":"${payResponse.timeStamp}",         //Timestamp, From 1970 in Second Unit
                    "nonceStr":"${payResponse.nonceStr}", //Random String
                    "package":"${payResponse.packAge}",
                    "signType":"MD5",         //Wechat Signature Format
                    "paySign":"${payResponse.paySign}" //Wechat Signature
                },
                function(res){
//                    if(res.err_msg == "get_brand_wcpay_request:ok" ) {

//                    }     
                    location.href = "${returnUrl}";
                }
        );
    }
    if (typeof WeixinJSBridge == "undefined"){
        if( document.addEventListener ){
            document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
        }else if (document.attachEvent){
            document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
            document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
        }
    }else{
        onBridgeReady();
    }
</script>