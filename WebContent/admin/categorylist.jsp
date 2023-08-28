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
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
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
      类别列表
    </div>
    <div class="row w3-res-tb">
      <div class="col-sm-5 m-b-xs">
        <form action="<%=path %>/admin/categoryList.do" method="post" id="searchform" name="searchform">
        按类别名称<input type="text" class="input-sm form-control w-sm inline v-middle" style="width: 200px;" value="${key}" placeholder="请输入标题" name="key">
        <button class="btn btn-sm btn-default">搜索</button>     
        </form>           
      </div>
      <div><button class="btn btn-sm btn-default" onclick="location.replace('categoryadd.jsp?fatherid=0');">新增</button></div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>商品大类</th>
            <th>商品小类</th>
          </tr>
        </thead>
        <tbody>
 		 <c:forEach items="${pageInfo.list}" var="fcategory">
          <tr>
            <td>
            ${fcategory.name}
            <a href="showCategory.do?id=${fcategory.id}" title="编辑" class="active" ui-toggle-class=""><i class="fa fa-pencil"></i></a>
            <a href="categoryDelAll.do?id=${fcategory.id}" title="删除" class="active" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
            </td>
            <td>
            <a href="categoryadd.jsp?fatherid=${fcategory.id}"  class="active" ui-toggle-class=""><i class="fa fa-plus-square"></i></a>
            <c:forEach items="${fcategory.scategorylist}" var="scategory">
            ${scategory.name}
            <a href="showCategory.do?id=${scategory.id}" title="编辑" class="active" ui-toggle-class=""><i class="fa fa-pencil"></i></a>
            <a href="categoryDelAll.do?id=${scategory.id}" title="删除" class="active" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
            &nbsp;&nbsp;
            </c:forEach>
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
             <a href="categoryList.do?pageNum=1&key=${key}">首页</a>
             <a href="categoryList.do?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}">上一页</a>
             <a href="categoryList.do?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages : pageInfo.nextPage}&key=${key}">下一页</a>
             <a href="categoryList.do?pageNum=${pageInfo.pages}&key=${key}">尾页</a>
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
