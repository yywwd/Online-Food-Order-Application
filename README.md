### Online Food Order Application
---
#### Description
I Built this application with Maven, Spring Boot, Sparing Data JPA, and FreeMarker.

The Application can be splited into two parts: Customer Side and Seller Side.

For customer side, the frontend is implemented by [this repo]( https://github.com/cccyb/vue-eleme-app). I pack frontend codes and redis using CentOS, because the size is too big(over 2 GB), I don't upload it here.

I have the API doc located in /doc/API.md, and I implement the backend for customer side using this doc.

For seller side, I use FreeMarker as a template to design seller management webpage.
Also, I finish the backend design for seller side

#### If you also want to setup, please follow these steps:
1. you need a business license, and apply Wechat Official Account in [Wechat Admin Platform](https://mp.weixin.qq.com/?lang=en_US), this can be used to implement customer login function
2. you need apply Account in [Wechat Open Platform](http://open.wechat.com/cgi-bin/newreadtemplate?t=overseas_open/index), this can to used to implement seller login function by scaning QR code
3. you need apply Wechat Pay license in [Wechat Pay](https://pay.weixin.qq.com/index.php/public/wechatpay)
4. after finishing these 3 steps, you need follow these two docs to replace related parameter in application.yml 
https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1445241432

    https://pay.weixin.qq.com/wechatpay_guide/help_docs.shtml
    
    and follow these docs if you want to use third-party SDK
    
    https://github.com/Wechat-Group/weixin-java-tools
    
    https://github.com/Pay-Group/best-pay-sdk
    
5. I borrow these account when I designed this application, and implemented all the functions. But now, I only have Wechat Official Account
