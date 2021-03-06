<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><spring:message code="system.title"/></title>
<%@include file="/WEB-INF/common/global.jsp"%>
<!-- basic styles -->

<link href="<%=g_contextPath%>/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=g_contextPath%>/assets/css/font-awesome.min.css" />

<!--[if IE 7]>
  <link rel="stylesheet" href="<%=g_contextPath%>/assets/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->


<!-- ace styles -->

<link rel="stylesheet" href="<%=g_contextPath%>/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=g_contextPath%>/assets/css/ace-rtl.min.css" />

<!--[if lte IE 8]>
  <link rel="stylesheet" href="<%=g_contextPath%>/assets/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="<%=g_contextPath%>/assets/js/html5shiv.js"></script>
<script src="<%=g_contextPath%>/assets/js/respond.min.js"></script>
<![endif]-->

</head>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="icon-leaf green"></i> <span class="red">Ace</span> <span class="white">Application</span>
							</h1>
							<h4 class="blue">&copy; Company Name</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> Please Enter Your Information
										</h4>
										<div class="space-6"></div>
										<c:if test="${not empty param['error'] && not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
												<div class="alert alert-danger" role="alert">
												<span class="glyphicon icon-warning-sign red bigger-130" aria-hidden="true"></span> 
												${SPRING_SECURITY_LAST_EXCEPTION.message}
											</div>
										</c:if>
										
										<jsp:useBean id="loginUserVo"  class="com.jos.community.module.vo.LoginUserVo" scope="request" ></jsp:useBean>
										<form:form action="${g_contextPath}/login" method="post" modelAttribute="loginUserVo">
											<fieldset>
												<label class="block clearfix"> 
													<span class="block input-icon input-icon-right"> 
														<form:input path="userName" id="userName" class="form-control"  placeholder="User Name"/>
														<i class="icon-user"></i>
													</span>
													
												</label> 
												<p class="text-danger "><form:errors path="userName" cssClass="error" /></p>
												
												<label class="block clearfix"> 
													<span class="block input-icon input-icon-right"> 
														<form:password path="password" id="password" class="form-control"  placeholder="Password"/>
														<i class="icon-lock"></i>
													</span>
												</label>
												<p class="text-danger "><form:errors path="password" cssClass="error" /></p>
												
												<label class="block clearfix"> 
													<span class="block form-inline"> 
														<form:input path="captcha" id="captcha" class="input-small form-control"  placeholder="Verify Code" maxlength="4"/>
														<img alt="" src="${g_contextPath}/kaptcha/getKaptchaImage.shtml" id="kaptchaImage" name="kaptchaImage">
													</span>
													
												</label> 
												<p class="text-danger "><form:errors path="captcha" cssClass="error" /></p>
												
												<div class="space"></div>

												<div class="clearfix">
													<label class="inline"> <input type="checkbox" class="ace" /> <span class="lbl"> Remember Me</span>
													</label>
	
													<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
														<i class="icon-key"></i> Login
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
											
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										</form:form>

										<div class="social-or-login center">
											<span class="bigger-110">Or Login Using</span>
										</div>

										<div class="social-login center">
											<a class="btn btn-primary"> <i class="icon-facebook"></i>
											</a> <a class="btn btn-info"> <i class="icon-twitter"></i>
											</a> <a class="btn btn-danger"> <i class="icon-google-plus"></i>
											</a>
										</div>
									</div>
									<!-- /widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link"> <i class="icon-arrow-left"></i> I forgot my password
											</a>
										</div>

										<div>
											<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link"> I want to register <i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="icon-key"></i> Retrieve Password
										</h4>

										<div class="space-6"></div>
										<p>Enter your email and to receive instructions</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="email" class="form-control" placeholder="Email" /> <i class="icon-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
														<i class="icon-lightbulb"></i> Send Me!
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /widget-main -->

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link"> Back to login <i class="icon-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="icon-group blue"></i> New User Registration
										</h4>

										<div class="space-6"></div>
										<p>Enter your details to begin:</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="email" class="form-control" placeholder="Email" /> <i class="icon-envelope"></i>
												</span>
												</label> <label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="text" class="form-control" placeholder="Username" /> <i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="password" class="form-control" placeholder="Password" /> <i class="icon-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="password" class="form-control" placeholder="Repeat password" /> <i class="icon-retweet"></i>
												</span>
												</label> <label class="block"> <input type="checkbox" class="ace" /> <span class="lbl"> I accept the <a href="#">User Agreement</a>
												</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="icon-refresh"></i> Reset
													</button>

													<button type="button" class="width-65 pull-right btn btn-sm btn-success">
														Register <i class="icon-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link"> <i class="icon-arrow-left"></i> Back to login
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /signup-box -->
						</div>
						<!-- /position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->


	<!--[if !IE]> -->

	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='<%=g_contextPath%>/assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=g_contextPath%>/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='<%=g_contextPath%>/assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		function show_box(id) {
			jQuery('.widget-box.visible').removeClass('visible');
			jQuery('#' + id).addClass('visible');
		}
		
		$(function(){
	        $('#kaptchaImage').click(function () { 
	            $(this).attr('src', '${g_contextPath}/kaptcha/getKaptchaImage.shtml?' + Math.floor(Math.random()*100)); 
	        })
	    });
	</script>
</body>
</html>