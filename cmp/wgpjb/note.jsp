<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>���̷������۱�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {font-family: "����"}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

    <table width="100%" border="0" style="FONT-SIZE:68" bgcolor="#999999" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFFFFF">
        <td width="28%"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
        <td width="72%"><span class="STYLE3">���̷������۱�</span></td>
      </tr>
    </table>

    <table width="100%" border="0" style="FONT-SIZE:48" bgcolor="#999999" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right">&nbsp;</td>
        <td><span class="STYLE3">�𾴵Ŀͻ���</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right">&nbsp;</td>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;���ã����ĸ�л�������Σ�ѡ�������ڴ�</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">��װ�������Ϊ���ṩ�Ҿ�װ��װ�޷���</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">��ʩ���и��������Ĳ��㣬�����½⣡��</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">�ҵ�ϣ���������ǵĹ����͹�����������</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">��������ı���������飬��л����֧</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">�֣�</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
    </table>

</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


startCall();


var timer=0;
function startCall()
{
	//����ʱ�ӣ�1�����һ�κ���:doCall()
	timer = setInterval("doCall()",2000); //setInterval() �����ɰ���ָ�������ڣ��Ժ���ƣ������ú����������ʽ
}


function doCall()
{
	var dateObj=new Date();
	var ldsj=dateObj.toLocaleTimeString();
	var actionStr="getKhxx.jsp?cmpbh=FBJ01&ldsj="+ldsj;


//	alert(actionStr);

	
//	window.open(actionStr);
	openAjax(actionStr);
}


<%
	//����Ajax
	cf.ajax(out);
%>


function getAjax(ajaxRetStr) 
{
	//ȥ��ǰ��Ļ��з�
	while (true)
	{
		if (ajaxRetStr.substring(0,1)=="\r")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else if (ajaxRetStr.substring(0,1)=="\n")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else{
			break;
		}
	}

	if (ajaxRetStr!="")
	{
		document.location="InsertCmp_khpjb.jsp?khbh="+ajaxRetStr;
	}


}

//-->
</SCRIPT>
