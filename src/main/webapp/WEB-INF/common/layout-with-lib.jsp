<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- basic styles -->
<link href="${g_contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${g_contextPath}/assets/css/font-awesome.min.css" />
<!--[if IE 7]>
  <link rel="stylesheet" href="+${g_contextPath}+""assets/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles eg.jqgrid -->
<link rel="stylesheet" href="${g_contextPath}/assets/css/jquery-ui-1.10.3.full.min.css" />
<link rel="stylesheet" href="${g_contextPath}/assets/css/datepicker.css" />
<link rel="stylesheet" href="${g_contextPath}/assets/css/ui.jqgrid.css" />

<!-- fonts -->

<!-- ace styles -->
<link rel="stylesheet" href="${g_contextPath}/assets/css/ace.min.css" />
<link rel="stylesheet" href="${g_contextPath}/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${g_contextPath}/assets/css/ace-skins.min.css" />

<!--[if lte IE 8]>
  <link rel="stylesheet" href="${g_contextPath}/assets/css/ace-ie.min.css" />
<![endif]-->


</head>
<body>
	
<!-- ace settings handler -->
<script src="${g_contextPath}/assets/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="${g_contextPath}/assets/js/html5shiv.js"></script>
<script src="${g_contextPath}/assets/js/respond.min.js"></script>
<![endif]-->

<!-- basic scripts -->
<!--[if !IE]> -->
<script src="${g_contextPath}/assets/js/jquery-2.0.3.min.js"></script>
<!-- <![endif]-->

<!--[if IE]>
<script src="${g_contextPath}/assets/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='${g_contextPath}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="${g_contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${g_contextPath}/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts eg,jqgrid-->
<script src="${g_contextPath}/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${g_contextPath}/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${g_contextPath}/assets/js/jqGrid/i18n/grid.locale-en.js"></script>

<!-- ace scripts -->
<script src="${g_contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${g_contextPath}/assets/js/ace.min.js"></script>
<!-- inline scripts related to this page -->
<script src="${g_contextPath}/module/system/role_init.js"></script>
</body>
</html>