<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="IE=edge, chrome=1">
    <title>网上服装购物系统</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/index.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="js/slide.js"></script>
</head>
<body>
<script>
    $(function(){
        $('.nav ul li').hover(function(){
            $(this).children(".details").show();
        },function(){
            $(this).children(".details").hide();
        });
        $('#my').hover(function(){
            $(this).find("div").show();
        },function(){
            $(this).find("div").hide();
        });
    });
</script>
<!------------顶部---------------->
<jsp:include page="top.jsp"></jsp:include>

<!----------------轮播图-------------------->
<div class="index_banner minWidth" id="focus" >
    <ul>
    <c:forEach items="${pclist}" var="picture" >
        <li style="background:url(./upload/${picture.filename}) no-repeat center;height: 452px"></li>
    </c:forEach>
    </ul>
</div>
<div class="clear"></div>
<!--------------中间部分------------->

<!---------------商品介绍一大块----------------->
<div class="product">
    <div class="wt1080">
        <!------------上部分----------->
        <!------------下部分----------->
        <div class="down">
            <div class="fl">
                <ul>
                <c:forEach items="${phlist}" var="phproduct" begin="0" end="1">
                    <li>
                        <div class="pic" ><a href="productDetails.do?id=${phproduct.id}" ><img src="upload/${phproduct.filename}" style="width: 100%;height: 200px;"></a></div>
                        <p><a href="productDetails.do?id=${phproduct.id}">${phproduct.productname}</a></p>
                        <div>
                            
                            <c:choose>
			                 <c:when test="${phproduct.tprice gt 0}">
			                 <span class="one">￥${phproduct.tprice}</span>
			                 <span class="two">原价￥${phproduct.price}</span>
			                 </c:when>
			                 <c:otherwise>
			                 <span class="one">￥${phproduct.price}</span>
			                 </c:otherwise>
			               </c:choose>
                            
                            <div class="clear"></div>
                        </div>
                    </li>
                    
                    
                </c:forEach>
                </ul>
            </div>
            <div class="fr">
                <div class="f_one">
                    <span>最新资讯</span>
                    <a href="newsLb.do">更多&gt;&gt;</a>
                </div>
                <div class="f_two" style="border:0px solid red;min-height: 240px;">
                    <ul style="width: 100%;border:0px solid red;">
                    <c:forEach items="${newslist}" var="news">
                        <li style="border-bottom: 1px dashed gray;margin-left: 3px;"><a href="newsShow.do?id=${news.id }">${news.title}</a></li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <!--------------商品开始---------------->
    <!------------------1楼-------------->
    <c:set var="numstr" value="" scope="request"/>
    <c:set var="colorstr" value="#1d84a7" scope="request"/>
    <c:set var="bgcolorstr" value="#48aacd" scope="request"/>
    <c:forEach items="${fcategorylist}" var="fcategory" varStatus="status">
    <c:if test="${status.count==1}">
    </c:if>
    <c:if test="${status.count==2}">
    <c:set var="colorstr" value="#a50332" scope="request"/>
    <c:set var="bgcolorstr" value="#cc3467" scope="request"/>
    </c:if>
    <c:if test="${status.count==3}">
    <c:set var="colorstr" value="#217575" scope="request"/>
    <c:set var="bgcolorstr" value="#339a99" scope="request"/>
    </c:if>
    <c:if test="${status.count==4}">
    <c:set var="colorstr" value="#ee6018" scope="request"/>
    <c:set var="bgcolorstr" value="#ff9a66" scope="request"/>
    </c:if>
    
    <c:if test="${status.count==5}">
    <c:set var="colorstr" value="#ee6018" scope="request"/>
    <c:set var="bgcolorstr" value="#ff9a66" scope="request"/>
    </c:if>
    
    
    <div class="floor wt1080" style="border-top:2px solid ${colorstr};">
        <div class="${numstr}"></div>
        <!---------------左边---------------->
        <div class="left">
            <div class="start" style="background: ${colorstr};border:0px solid red;padding: 40px;">${fcategory.name}</div>
            <div class="second" style="background: ${bgcolorstr};min-height: 340px;">
                <ul>
                <c:forEach items="${fcategory.scategorylist}" var="scategory">
                    <li><a href="productLb.do?sid=${ scategory.id}">${scategory.name }</a></li>
                </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
        <!--------------中间---------------->
        <div class="zhongbu">
            	<ul>
            	
            	<c:forEach items="${fcategory.ptlist}" var="tjproudct" begin="0" end="3">
                <li style="padding: 0px;border:0px solid red;height: 239.5px;">
                <div  style="border:0px solid red;margin: 0px;padding-top: 17px;padding-bottom: 17px;"><a href="productDetails.do?id=${tjproudct.id}"><img src="upload/${tjproudct.filename}" style="width: 150px;height: 150px;"></a></div>
                <p style="display: block;"><a href="productDetails.do?id=${tjproudct.id}" style="font-size:14px;">${tjproudct.productname}</a></p>
                <p style="text-align: left;display: block;padding-left: 10px;">
                
                <c:choose>
                  <c:when test="${tjproudct.tprice gt 0}">
                  <span style="color: #fe5500;margin-right: 10px;">￥<span style="font-size:20px;">${tjproudct.tprice}</span></span>
                  <span style="text-decoration:line-through">￥${tjproudct.price}</span>
                  </c:when>
                  <c:otherwise>
                  <span style="color: #fe5500;margin-right: 10px;">￥<span style="font-size:20px;">${tjproudct.price}</span></span>
                  </c:otherwise>
                </c:choose>
                
                </p>
           		</li>
           		</c:forEach>
            </ul>
            <span class="heng"></span>
            <span class="shu"></span>
        </div>
        <!--------------------右边部分-------------------------->
        <div class="right">
            <h1>最新热卖</h1>
            <ul>
            <c:forEach items="${fcategory.zphlist}" var="product" begin="0" end="3">
                <li>
                    <dl>
                        <dt><a href="productDetails.do?id=${product.id}"><img src="upload/${product.filename}"></a></dt>
                        <dd class="xiangxi"><a href="productDetails.do?id=${product.id}">${product.productname }</a></dd>
                        <dd>
                        <c:choose>
                          <c:when test="${product.tprice gt 0}">
                          <span class="fl">￥${product.tprice}</span><span class="fr">￥${product.price }</span>
                          </c:when>
                          <c:otherwise>
                          <span class="fl">￥${product.price}</span>
                          </c:otherwise>
                        </c:choose>
                        
                        </dd>
                    </dl>
                    <div class="clear"></div>
                </li>
            </c:forEach>
            </ul>
        </div>
    </div>
    
    
    
    
	</c:forEach>
    <!------------------2楼-------------->

    <!------------------3楼-------------->
    <!------------------4楼-------------->
    <!------------------5楼-------------->
</div>
<!---------------------保障------------------->
<jsp:include page="foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</html>