<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dqbm=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String cgjhph=null;
cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF"  onLoad="insertform.clbm.focus();" >
<form method="post" action="SaveInsertXh.jsp" name="insertform" target="_back">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ϱ���</td> 
  <td colspan="3"><input type="text" name="clbm" id="txt" size="40" maxlength="100"  onKeyup="changheIn(insertform,this);" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'">
  ������<input type="text" name="sl" value="0" size="8" maxlength="50" onfocus="this.style.backgroundColor='#E5F0FF'" onblur="this.style.backgroundColor='#FFFFFF'" onKeyup="ksl(insertform);">
  <input type="button" name="cp" value=" �� �� " onClick="f_do(insertform)" onKeyup="kcp(insertform);">
  <!--  <input type="button" name="tj" value="�ύ�ɹ��ƻ�" onClick="f_tj(insertform)"> -->
  <input type="hidden" name="dqbm" value="<%=dqbm%>" size="20" maxlength="50" readonly>
  <input type="hidden" name="cgjhph" value="<%=cgjhph%>" size="20" maxlength="50" readonly>
</td>
  </tr>
</tr>
    <tr align="center"  bgcolor="#FFFFFF"  height="300"> 
      <td colspan="4"> 
<iframe width="100%" height="100%" src="ViewJxc_cljgb2.jsp" name="centerframe" marginwidth="0" marginheight="0" scrolling="NO" FrameBorder="0"> 
            <p>��Ʒ��Ϣ��ѯ 
            </iframe> 
	</td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function changheIn(FormName,ithis2)
{   
	//�����س�����
	if(event.keyCode==13)
	{
		if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
		}
		if (FormName.clbm.value=="")
		{
//			alert("������[���ϱ���]��");
			FormName.clbm.focus();
			return false;
		}
		FormName.sl.value="";
		FormName.sl.focus();
		FormName.target="centerframe";
		FormName.action="ViewJxc_cljgb.jsp?clbm="+FormName.clbm.value+"&dqbm=<%=dqbm%>";
		FormName.submit();

	}    
}
function ksl(FormName)
	{  
		//�����س�����
		if(event.keyCode==13)
		{
			if(	javaTrim(FormName.sl)=="") {
			alert("������[����]��");
			FormName.sl.focus();
			return false;
			}
			if(!(isFloat(FormName.sl, "����"))) {
			return false;
			}
			if (FormName.sl.value=="0")
			{
				alert("[����]����Ϊ0��");
				FormName.sl.select();
				return false;
			}
			FormName.cp.focus();

		}
	}
function kcp(FormName)//����FormName:Form������
{
	//�����س�����
	if(event.keyCode==13)
	{
		f_do("insertform");
	}
}
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.sl, "����"))) {
	return false;
	}
	if (FormName.sl.value=="0")
	{
		alert("[����]����Ϊ0��");
		FormName.sl.select();
		FormName.xh.focus();
		return false;
	}

	FormName.target="tjmain2";
	FormName.action="SaveInsertXh.jsp";
	FormName.submit();  
	FormName.clbm.value="";
	FormName.clbm.focus();
//	FormName.sl.value="0";
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
//	alert("[����]����Ϊ0��");
	FormName.target="";
	FormName.action="tjcgjh.jsp";
	FormName.submit();  
	return true;
}
//-->
</SCRIPT>
