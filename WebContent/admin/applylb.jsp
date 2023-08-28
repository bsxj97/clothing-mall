<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>网上服装购物系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<jsp:include page="top.jsp"></jsp:include>
</header>
<!--header end-->
<!--sidebar start-->
<aside>
  <jsp:include page="left.jsp"></jsp:include>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      入驻申请列表
    </div>
    <div class="row w3-res-tb">
      <div class="col-sm-5 m-b-xs">
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>营业执照</th>
            <th>商铺名称</th>
            <th>申请人身份证</th>
            <th>申请时间</th>
            <th>审核状态</th>
            <th style="width:100px;">操作</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="apply" varStatus="status">
          <tr>
            <td><img src="../upload/${apply.filename}" style="width: 60px;height: 60px;"/></td>
            <td>${apply.realname}</td>
            <td>${apply.idcard}</td>
            <td>${apply.savetime}</td>
            <td>${apply.shstatus}</td>
            <td>
              <a href="applySc.do?id=${apply.id}" title="删除" class="active" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">
        
        <div class="col-sm-5 text-center">
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li>
            <p>当前 <span>${pageInfo.pageNum}</span> 页,总 <span>${pageInfo.pages}</span> 页,共 <span>${pageInfo.total}</span> 条记录</p>
             <a href="applyLb.do?pageNum=1&key=${key}">首页</a>
             <a href="applyLb.do?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}">上一页</a>
             <a href="applyLb.do?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages : pageInfo.nextPage}&key=${key}">下一页</a>
             <a href="applyLb.do?pageNum=${pageInfo.pages}&key=${key}">尾页</a>
            </li>
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
</section>
 <!-- footer -->
		<jsp:include page="foot.jsp"></jsp:include>
  <!-- / footer -->
</section>

<!--main content end-->
</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>
</body>
</html>
