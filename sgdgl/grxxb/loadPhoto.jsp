<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=request.getParameter("ssfgs");
String xm=cf.GB2Uni(cf.getParameter(request,"xm"));


double perMaxSize = 3*1024;//�����ļ������max��С
String sizeUnit = "KB";//perMaxSize���ݶ�Ӧ�ĵ�λ
String ext = "";//�����ϴ����ļ�����


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	ls_sql="SELECT wjlx  ";
	ls_sql+=" FROM xz_yxscwjlx  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		ext=ext+"*."+rs.getString("wjlx")+";";
	}
	rs.close();
	ps.close();

	ext=ext.substring(0,ext.lastIndexOf(";"));
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

//�ļ��ϴ��ύ��Ŀ��ҳ��
StringBuffer uploadUrl = new StringBuffer("http://");
uploadUrl.append(request.getHeader("Host"));
uploadUrl.append(request.getContextPath());
uploadUrl.append("/sgdgl/grxxb/saveLoad.jsp");
%>

<html>
<head>
<title>������Ƭ�ϴ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="/css/upload.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/swfupload.js"></script>
<script type="text/javascript" src="/js/swfupload.swfobject.js"></script>
<script type="text/javascript" src="/js/swfupload.queue.js"></script>
<script type="text/javascript" src="/js/fileprogress.js"></script>
<script type="text/javascript" src="/js/handlers.js"></script>

<script type="text/javascript">
var swfu;

SWFUpload.onload = function () 
{
	var settings = {
		flash_url : "/js/swfupload.swf",
		upload_url: "<%=uploadUrl.toString()%>",
		post_params: {
			"ssfgs" : "<%=ssfgs%>",
			"xm" : "<%=java.net.URLEncoder.encode(xm,"UTF-8")%>",
			"ext" : "<%=ext%>"
		},
		file_size_limit : "<%=perMaxSize%> <%=sizeUnit%>",
		file_types : "<%=ext%>",
		file_types_description : "<%=ext%>",
		file_upload_limit : 300,
		file_queue_limit : 0,
		custom_settings : {
			progressTarget : "fsUploadProgress",
			cancelButtonId : "btnCancel",
			uploadButtonId : "btnUpload",
			myFileListTarget : "idFileList"
		},
		debug: false,
		auto_upload:false,

		// Button Settings
		button_image_url : "/images/XPButtonUploadText_61x22.png",	// Relative to the SWF file
		button_placeholder_id : "spanButtonPlaceholder",
		button_width: 61,
		button_height: 22,

		// The event handler functions are defined in handlers.js
		swfupload_loaded_handler : swfUploadLoaded,
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,
		queue_complete_handler : queueComplete,	// Queue plugin event
		
		// SWFObject settings
		minimum_flash_version : "9.0.28",
		swfupload_pre_load_handler : swfUploadPreLoad,
		swfupload_load_failed_handler : swfUploadLoadFailed
	};

	swfu = new SWFUpload(settings);
}

</script>
</head>
<body bgcolor="#FCFCFC" topmargin="0px" leftmargin="10px" rightmargin="10px" scroll="yes">
<table width="100%" cellspacing="4" cellpadding="4" border="0" bgcolor="#FCFCFC">
	<tr> 
	<td class="DH1">
	<table width="100%" cellspacing="4" cellpadding="4" border="0" bgcolor="#FCFCFC">
		<tr>
			<td class="DH2">
				<STRONG>����������<%=xm%></STRONG> 
			</td>
			<td class="DH2" align="right">
				<STRONG>�ͻ���ţ�<%=ssfgs%></STRONG> 
			</td>
		</tr>
		<tr>
			<td class="DH2">
				<STRONG>�����ϴ���Ƭ ��֧�ֵ���Ƭ���ͣ�JPG��������Ƭ����ܳ�����<%=perMaxSize%> <%=sizeUnit%>��</STRONG> 
			</td>
			<td class="DH2" align="right">
			</td>
		</tr>
	</table>
<div id="content">
	<form id="form1" action="saveLoad.jsp" method="post" target="_blank" enctype="multipart/form-data">
		<table width="90%" cellspacing="0" cellpadding="0" border="0"><tr><td>
		<span id="spanButtonPlaceholder"></span>
		<input id="btnUpload" type="button" value="�ϴ���Ƭ" >
		<input id="btnCancel" type="button" value="ȡ��ȫ���ϴ�" disabled="disabled"  ></td>
		</tr></table>
		<table id="idFileList" class="uploadFileList"><tr class="uploadTitle"><td><B>�ļ���</B></td><td><B>�ļ���С</B></td><td width=100px><B>״̬</B></td><td width=35px>&nbsp;</td></tr></table>
		�ȴ��ϴ� <span id="idFileListCount">0</span> �� ���ɹ��ϴ� <span id="idFileListSuccessUploadCount">0</span> ��
		<div id="divSWFUploadUI" style="visibility: hidden;"></div>
		<noscript style="display: block; margin: 10px 25px; padding: 10px 15px;">
			�ܱ�Ǹ����Ƭ�ϴ������޷����룬�뽫��������ó�֧��JavaScript��
		</noscript>
		<div id="divLoadingContent" class="content" style="background-color: #FFFF66; border-top: solid 4px #FF9966; border-bottom: solid 4px #FF9966; margin: 10px 25px; padding: 10px 15px; display: none;">
			��Ƭ�ϴ������������룬���Ժ�...
		</div>
		<div id="divLongLoading" class="content" style="background-color: #FFFF66; border-top: solid 4px #FF9966; border-bottom: solid 4px #FF9966; margin: 10px 25px; padding: 10px 15px; display: none;">
			��Ƭ�ϴ���������ʧ�ܣ���ȷ��������Ѿ�������JavaScript��֧�֣������Ѿ���װ���Թ�����Flash����汾��
		</div>
		<div id="divAlternateContent" class="content" style="background-color: #FFFF66; border-top: solid 4px #FF9966; border-bottom: solid 4px #FF9966; margin: 10px 25px; padding: 10px 15px; display: none;">
			�ܱ�Ǹ����Ƭ�ϴ������޷����룬�밲װ������������Flash�����
			����ʣ� <a href="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank">Adobe��վ</a> ��ȡ���µ�Flash�����
		</div>
	</form>
</div>
</td></tr></table>
</body>
</html>