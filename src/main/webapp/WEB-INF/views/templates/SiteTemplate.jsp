<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="bootstrap social network template" name="description">
<meta content="" name="author">
<title>Day-Day social network</title>
<link media="screen" rel="stylesheet"
	href="resources/css/bootstrap.min.css">
<!--  <link type="text/css" rel="stylesheet"
	href="resources/css/font-awesome.min.css">-->
<link media="screen" rel="stylesheet"
	href="resources/css/animate.min.css">
<link media="screen" rel="stylesheet" href="resources/css/dayday.css">
<link media="screen" rel="stylesheet" href="resources/css/timeline.css">
<link media="screen" rel="stylesheet" href="resources/css/big-cover.css">
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/dayday.js" type="text/javascript"></script>
<link href="resourcesimg/favicon.png" rel="shortcut icon">
</head>

<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="chat-sidebar" />
	<tiles:insertAttribute name="timeline" />
	<tiles:insertAttribute name="advertenties" />
	<tiles:insertAttribute name="chat-window" />
	<tiles:insertAttribute name="modal-message" />
	<tiles:insertAttribute name="footer" />
	</div>
</body>

</html>