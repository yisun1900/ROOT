<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String pfjlh=cf.GB2Uni(request.getParameter("pfjlh"));
String tsjlh=null;
String khbh=null;
String dwbh=null;
String sfsgd=null;
String sgd=null;
String ygbh=null;
String zrbl=null;
String pfje=null;
String bz=null;

String ssfgs=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select tsjlh,khbh,dwbh,sfsgd,sgd,ygbh,zrbl,pfje,bz";
	ls_sql+=" from  crm_khpfd";
	ls_sql+=" where pfjlh='"+pfjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tsjlh=rs.getString("tsjlh");
		khbh=rs.getString("khbh");
		dwbh=rs.getString("dwbh");
		sfsgd=rs.getString("sfsgd");
		sgd=rs.getString("sgd");
		ygbh=rs.getString("ygbh");
		zrbl=rs.getString("zrbl");
		pfje=rs.getString("pfje");
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select crm_khxx.fgsbh,hth,crm_khxx.khbh,khxm,fwdz,lxfs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�⸶��ά��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">�⸶��ά����Ͷ�߼�¼�ţ�<%=tsjlh%>�� </div>


<form method="post" action="SaveEditCrm_khpfd.jsp" name="insertform"  >


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000CC">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">�ͻ�����</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#0000CC">�绰</font></td>
    <td><%=lxfs%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td width="18%" rowspan="3" align="right"><font color="#FF0000">*</font>�⸶���Ƿ�ʩ����</td>
  <td rowspan="3"><%
	cf.radioToken(out, "sfsgd","1+ʩ����&2+��ʩ����",sfsgd);
%></td>
  <td align="right">�⸶ʩ����</td>
  <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc",sgd);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�⸶������</td>
  <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwlx,dwbh",dwbh);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�⸶��</td>
  <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where sfzszg in('Y','N') and dwbh='"+dwbh+"' order by yhmc",ygbh);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���α���</td>
  <td><input type="text" name="zrbl" value="<%=zrbl%>" size="10" maxlength="10" onChange="pfje.value=round(khpfze.value*zrbl.value/100,2)">
    %</td>
  <td align="right"><font color="#FF0000">*</font>�⸶���</td>
  <td><input type="text" name="pfje" value="<%=pfje%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="8" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼���˲���</font></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="pfjlh" value="<%=pfjlh%>" >
	<input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" ></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>

function changeDwbh(FormName) 
{
	FormName.ygbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql;
	sql="select ygbh,yhmc from sq_yhxx where sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.ygbh,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.pfjlh)=="") {
		alert("������[�⸶��¼��]��");
		FormName.pfjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("������[Ͷ�߱��޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfsgd)) {
		alert("��ѡ��[�⸶���Ƿ�ʩ����]��");
		FormName.sfsgd[0].focus();
		return false;	
	}
	if (FormName.sfsgd[0].checked)
	{
		if(	javaTrim(FormName.sgd)=="") {
			alert("��ѡ��[�⸶ʩ����]��");
			FormName.sgd.focus();
			return false;
		}

		FormName.dwbh.value="";
		FormName.ygbh.value="";
	}
	else{
		if(	javaTrim(FormName.dwbh)=="") {
			alert("��ѡ��[�⸶������]��");
			FormName.dwbh.focus();
			return false;
		}
		if(	javaTrim(FormName.ygbh)=="") {
			alert("������[�⸶��]��");
			FormName.ygbh.focus();
			return false;
		}
		FormName.sgd.value="";
	}
	if(	javaTrim(FormName.zrbl)=="") {
		alert("������[���α���]��");
		FormName.zrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zrbl, "���α���"))) {
		return false;
	}
	if(	javaTrim(FormName.pfje)=="") {
		alert("������[�⸶���]��");
		FormName.pfje.focus();
		return false;
	}
	if(!(isFloat(FormName.pfje, "�⸶���"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}

	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼���˲���]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
