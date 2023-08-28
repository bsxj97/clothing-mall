<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
<script type="text/javascript" src="<%=path %>/admin/js/popup.js"></script>
<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>

<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
<script charset="utf-8" src="../kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh-CN.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
<script>
    KindEditor.ready(function(K) {
        K.create('textarea[name="note"]', {
            uploadJson : '../kindeditor/jsp/upload_json.jsp',
            fileManagerJson : '../kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            allowImageUpload : true,
            autoHeightMode : true,
            afterCreate : function() {this.loadPlugin('autoheight');},
            afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
        });
    });
</script>
</head>
<body>
<% 
String ordermsgid = request.getParameter("ordermsgid");
%>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<!--logo end-->
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
	<div class="form-w3layouts">
        <!-- page start-->
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12" style="min-height: 384px;">
                    <section class="panel">
                        <header class="panel-heading">
                           	 添加物流信息
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form"  method="post" action="<%=path %>/admin/wlrecordAdd.do">
                                <input type="hidden" name="ordermsgid" value="<%=ordermsgid %>"/>
                                
                                <div class="form-group">
                                <label for="exampleInputEmail1">物流进度</label>
                                <input type="text" class="form-control" name="content" id="content"  placeholder="物流进度" required oninvalid="setCustomValidity('请输入物流进度')" oninput="setCustomValidity('');">
                                </div>
                                
                                <div class="form-group">
                                <label for="exampleInputEmail1">当前时间</label>
                                <input type="text" class="form-control" name="savetime" id="savetime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  placeholder="当前时间" required oninvalid="setCustomValidity('请输入当前时间')" oninput="setCustomValidity('');">
                                </div>
                                
                                <div class="form-group">
                                <label for="exampleInputEmail1">当前状态</label>
							  	
							  	<select name="status" id="status"  class="form-control">
							  	  <option value="派件中">派件中</option>
							  	  <option value="抵达目的地">抵达目的地</option>
							  	</select>
							  	
                                </div>
                                
                                <button type="submit" class="btn btn-info">提交</button>
                            </form>
                            </div>

                        </div>
                    </section>

            </div>
            

        <!-- page end-->
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
<script type="text/javascript">
function up(tt)
{
		    layer.open({
		      type: 2,
		      title: '上传文件',
		      shadeClose: true,
		      shade: false,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['450px', '200px'],
		      content: '/ncpsalewzssm/upload.jsp?Result='+tt
		    });
}	




function selectsid(){
	var sid = $("#sid");
	$.ajax({
  	  url:"searchCtype.do?fatherid="+$('#fid').val(),
  	  datetype:"json",
  	  type:"post",
  	  contentType: "application/Json; charset=UTF-8",
  	  success:function(msg){
  		  sid.empty();
      	  //key2.append("<option value=\"\">请选择</option>");
      	  sid.append(msg);
	  }
	});
}
</script>
</html>
