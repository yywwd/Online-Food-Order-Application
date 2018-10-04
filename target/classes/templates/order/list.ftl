<html>
<#include "../common/header.ftl">

<body>
<div id="wrapper" class="toggled">

    <#--sidebar-->
    <#include "../common/nav.ftl">

    <#--content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Custome Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Total Price</th>
                            <th>Order Status</th>
                            <th>Payment Status</th>
                            <th>Create Time</th>
                            <th colspan="2">Operation</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list orderDTOPage.content as orderDTO>
                        <tr>
                            <td>${orderDTO.orderId}</td>
                            <td>${orderDTO.buyerName}</td>
                            <td>${orderDTO.buyerPhone}</td>
                            <td>${orderDTO.buyerAddress}</td>
                            <td>${orderDTO.orderAmount}</td>
                            <td>${orderDTO.getOrderStatusEnum().message}</td>
                            <td>${orderDTO.getPayStatusEnum().message}</td>
                            <td>${orderDTO.createTime}</td>
                            <td><a href="/sell/seller/order/detail?orderId=${orderDTO.orderId}">Operation</a></td>
                            <td>
                                <#if orderDTO.getOrderStatusEnum().message == "New Order">
                                    <a href="/sell/seller/order/cancel?orderId=${orderDTO.orderId}">Cancel</a>
                                </#if>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--Paging-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#if currentPage lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/sell/seller/order/list?page=${currentPage - 1}&size=${size}">Prev Page</a></li>
                    </#if>

                    <#list 1..orderDTOPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/sell/seller/order/list?page=${index}&size=${size}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if currentPage gte orderDTOPage.getTotalPages()>
                        <li class="disabled"><a href="#">Next Page</a></li>
                    <#else>
                        <li><a href="/sell/seller/order/list?page=${currentPage + 1}&size=${size}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<#--Popup-->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    Prompt
                </h4>
            </div>
            <div class="modal-body">
                You Have New Order
            </div>
            <div class="modal-footer">
                <button onclick="javascript:document.getElementById('notice').pause()" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button onclick="location.reload()" type="button" class="btn btn-primary">Find New Order</button>
            </div>
        </div>
    </div>
</div>

<#--Play Music-->
<audio id="notice" loop="loop">
    <source src="/sell/mp3/song.mp3" type="audio/mpeg" />
</audio>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    var websocket = null;
    if('WebSocket' in window) {
        websocket = new WebSocket('ws://sell.natapp4.cc/sell/webSocket');
    }else {
        alert('Browser Does Not Support WebSocket!');
    }

    websocket.onopen = function (event) {
        console.log('Establish Connection');
    }

    websocket.onclose = function (event) {
        console.log('Disconnection');
    }

    websocket.onmessage = function (event) {
        console.log('Receive Message:' + event.data)
        $('#myModal').modal('show');

        document.getElementById('notice').play();
    }

    websocket.onerror = function () {
        alert('WebSocket Communication Error！');
    }

    window.onbeforeunload = function () {
        websocket.close();
    }

</script>

</body>
</html>