<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<title>视频打卡系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script language="JavaScript">
<!--
var flashID; 
	
	function getID(swfID) {
		if (navigator.appName.indexOf("Microsoft") > -1) {
			flashID = window[swfID];
		} else {
			flashID = document[swfID];
		}
	}

	function loadFrontImg(str){
		flashID.changeFrontImg(str);
	}

//-->
</script>
</head>
<body bgcolor="#ffffff" onLoad="getID('makepic');">
<!-- 影片中使用的 URL-->
<!-- 影片中使用的文本-->
<!-- saved from url=(0013)about:internet -->
<center>
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="550" height="480" id="makepic" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="makepic.swf" />
<param name="quality" value="high" />
<param name="bgcolor" value="#ffffff" />
<embed src="makepic.swf" quality="high" bgcolor="#ffffff" width="550" height="480" name="makepic" align="middle" swLiveConnect="true"
 allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
</center>
</body>
</html>
