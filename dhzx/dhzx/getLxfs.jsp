<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��¼����ϵ��ʽ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String dhqh=request.getParameter("dhqh");
String lxr=cf.GB2Uni(cf.getParameter(request,"lxr"));
String khlxfs=cf.GB2Uni(cf.getParameter(request,"khlxfs"));
java.util.StringTokenizer rowArray=new java.util.StringTokenizer(khlxfs,"*");
int row=rowArray.countTokens();
%>
<body bgcolor="#FFFFFF" onbeforeunload="f_do(insertform)">
<form method="post" action="SaveInsertCrm_khlxfs.jsp" name="insertform" target="_blank">
<div align="center">��¼����ϵ��ʽ���绰���ţ�<%=dhqh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr align="center" bgcolor="#FFFFFF">
  <td><span class="STYLE1">*</span>��ϵ��</td>
  <td><span class="STYLE1">*</span>�绰����</td>
  <td><span class="STYLE1">*</span>�绰����</td>
  <td>�ֻ� </td>
  </tr>
<%
	for (int i=0;i<row;i++ )
	{
		String rowStr=rowArray.nextToken();
		java.util.StringTokenizer colArray=new java.util.StringTokenizer(rowStr,"^");
		int col=colArray.countTokens();
		String getlxr="";
		String lx="";
		String getdhqh="";
		String qhdh="";
		String dhhm="";
		String fenji="";

		if (col>0)
		{
			getlxr=colArray.nextToken();
		}
		if (col>1)
		{
			lx=colArray.nextToken();
		}
		if (col>2)
		{
			getdhqh=colArray.nextToken();
		}
		if (col>3)
		{
			qhdh=colArray.nextToken();
		}
		if (col>4)
		{
			dhhm=colArray.nextToken();
		}
		if (col>5)
		{
			fenji=colArray.nextToken();
		}

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td width="25%"><input type="text" name="lxr" value="<%=getlxr%>" size="15" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td width="24%">
			<select name="lx" style="FONT-SIZE:12PX;WIDTH:102PX" onChange="getDh(insertform,<%=i%>)">
			  <option value=""></option>
			  <%
			cf.selectToken(out,"1+�ֻ�&2+����&3+С��ͨ",lx);
		%>
			</select> 
		  </td>
		  <td width="26%"><input type="text" name="dhhm" value="<%=dhhm%>" size="18" maxlength="11" onChange="getDh(insertform,<%=i%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td width="25%"><input type="text" name="fj" value="<%=fenji%>" size="18" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">

			<input type="hidden" name="qhdh" value="<%=qhdh%>" size="20" maxlength="20" >
			</td> 
		</tr>
		<%
	}
	for (int i=row;i<5;i++ )
	{
		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td width="25%"><input type="text" name="lxr" value="<%=lxr%>" size="15" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td width="24%">
			<select name="lx" style="FONT-SIZE:12PX;WIDTH:102PX" onChange="getDh(insertform,<%=i%>)">
			  <option value=""></option>
			  <%
			cf.selectToken(out,"1+�ֻ�&2+����&3+С��ͨ","");
		%>
			</select> 
		  </td>
		  <td width="26%"><input type="text" name="dhhm" value="" size="18" maxlength="11" onChange="getDh(insertform,<%=i%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td width="25%"><input type="text" name="fj" value="" size="18" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">

			<input type="hidden" name="qhdh" value="" size="20" maxlength="20" >
			</td> 
		</tr>
		<%
	}
%>

    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="dhqh" value="<%=dhqh%>">
	<input type="button"  value="�������ر�" onClick="f_do(insertform)"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
var lxfs="";
var khlxfs="";


function getDh(FormName,row)//����FormName:Form������
{
	if (FormName.lx[row].value=="1")
	{
		FormName.qhdh[row].value=FormName.dhhm[row].value;
	}
	else if (FormName.lx[row].value=="")
	{
		FormName.qhdh[row].value="";
	}
	else{
		FormName.qhdh[row].value=FormName.dhqh.value+FormName.dhhm[row].value;
	}
}

function f_do(FormName)//����FormName:Form������
{
	lxfs="";
	khlxfs="";
	if(	javaTrim(FormName.dhqh)=="") {
		alert("������[�绰����]��");
		FormName.dhqh.focus();
		return false;
	}

	for (var i=0;i<5 ;i++ )
	{
		if (FormName.lx[i].value!="")
		{
			if(	javaTrim(FormName.lxr[i])=="") {
				alert("������[��ϵ��]��");
				FormName.lxr[i].focus();
				return false;
			}

			if(	javaTrim(FormName.dhhm[i])=="") {
				alert("������[�绰����]��");
				FormName.dhhm[i].focus();
				return false;
			}
			if (FormName.lx[i].value=="1")//�ֻ�
			{
				if(!(isMPhone(FormName.dhhm[i], "�绰����"))) {
					return false;
				}
			}
			else{
				if(!(isTPhone(FormName.dhhm[i], "�绰����"))) {
					return false;
				}
			}
			if(	javaTrim(FormName.qhdh[i])=="") {
				alert("������[�����ŵ绰]��");
				FormName.qhdh[i].focus();
				return false;
			}

			if (FormName.lxr[i].value=="<%=lxr%>")
			{
			}
			else{
				lxfs+="("+FormName.lxr[i].value+")";
			}


			if (FormName.lx[i].value=="1")//�ֻ�
			{
				lxfs+=FormName.dhhm[i].value+"��";
			}
			else 
			{
				if(	javaTrim(FormName.fj[i])=="")//�޷ֻ�
				{
					lxfs+="("+FormName.dhqh.value+")"+FormName.dhhm[i].value+"��";
				}
				else{//�зֻ�
					lxfs+="("+FormName.dhqh.value+")"+FormName.dhhm[i].value+"ת"+FormName.fj[i].value+"��";
				}
			}

			khlxfs+=FormName.lxr[i].value+"^"+FormName.lx[i].value+"^"+FormName.dhqh.value+"^"+FormName.qhdh[i].value+"^"+FormName.dhhm[i].value+"^"+FormName.fj[i].value+"*";
		}
		else{
			if(	javaTrim(FormName.dhhm[i])!="") {
				alert("����[�绰����]Ϊ�գ���������[�绰����]��");
				FormName.dhhm[i].select();
				return false;
			}
			if(	javaTrim(FormName.qhdh[i])!="") {
				alert("����[�绰����]Ϊ�գ���������[�����ŵ绰]��");
				FormName.qhdh[i].select();
				return false;
			}
		}
	}

	lxfs=lxfs.substring(0,lxfs.length-1);

	window.opener.document.insertform.lxfs.value=lxfs;
	window.opener.document.insertform.khlxfs.value=khlxfs;
	window.close();

}
//-->
</SCRIPT>

