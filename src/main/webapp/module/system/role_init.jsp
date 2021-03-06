<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><spring:message code="system.title"/></title>
<%@include file="/WEB-INF/common/global.jsp"%>

</head>
<body>

	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>

		<ul class="breadcrumb">
			
			<li><i class="icon-home home-icon"></i> <a href="#">Home</a></li>
			<li><a href="#">Tables</a></li>
			<li class="active">jqGrid plugin</li>
		</ul>
		<!-- .breadcrumb -->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon"> <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" /> <i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div>
		<!-- #nav-search -->
	</div>

	<div class="page-content">
		<div class="page-header">
			<h1>
				jqGrid <small> <i class="icon-double-angle-right"></i> Dynamic tables and grids using jqGrid plugin
				</small>
			</h1>
		</div>
		<!-- /.page-header -->

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->

				<div class="alert alert-info">
					<i class="icon-hand-right"></i> Please note that demo server is not configured to save the changes, therefore you may get an error message.
					<button class="close" data-dismiss="alert">
						<i class="icon-remove"></i>
					</button>
				</div>

				<table id="grid-table"></table>

				<div id="grid-pager"></div>

				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.page-content -->
	
	<!-- inline scripts related to this page -->
	<script src="${g_contextPath}/module/system/role_init.js"></script>
</body>
</html>