<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String ysxmflbm=null;
String ysxmflmc=null;
String gcysxmbm=null;
String gcysxmmc=null;
String sffszg=null;
String yssj=null;
String ysr=null;
String ysjg=null;
String yssm=null;
String sfkhbrqz=null;
String dqzysq=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String gj=null;
String dd=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sybgcrq=null;
double ysdf=0;

String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ysdf,khbh,ysxmflbm,ysxmflmc,gcysxmbm,gcysxmmc,sffszg,yssj,ysr,ysjg,yssm,sfkhbrqz,dqzysq,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  crm_gcfxysjl";
	ls_sql+=" where  (ysjlh='"+ysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysdf=rs.getDouble("ysdf");
		khbh=cf.fillNull(rs.getString("khbh"));
		ysxmflbm=cf.fillNull(rs.getString("ysxmflbm"));
		ysxmflmc=cf.fillNull(rs.getString("ysxmflmc"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		sffszg=cf.fillNull(rs.getString("sffszg"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		ysjg=cf.fillNull(rs.getString("ysjg"));
		yssm=cf.fillNull(rs.getString("yssm"));
		sfkhbrqz=cf.fillNull(rs.getString("sfkhbrqz"));
		dqzysq=cf.fillNull(rs.getString("dqzysq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwmc,sgd,sgbz,gj,dd,zjxm,sybgcrq";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
	}
	rs.close();
	ps.close();
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
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><strong>�������գ�ά��</strong>�����ռ�¼�ţ�<%=ysjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"> �ͻ����� </td>
    <td><%=khxm%></td>
    <td align="right"> ��ͬ�� </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">���ݵ�ַ</td>
    <td><%=fwdz%></td>
    <td align="right">���̵���</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> ǩԼ���� </td>
    <td><%=dwmc%> </td>
    <td align="right"> ���ʦ </td>
    <td><%=sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> ǩԼ���� </td>
    <td><%=qyrq%> </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> ʩ���� </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>    </td>
    <td align="right"> �೤ </td>
    <td><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">�ܼ�</td>
    <td><%=gj%></td>
    <td align="right">����</td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">��ͬ��������</td>
    <td><font color="#000000"><%=kgrq%></font></td>
    <td align="right">��ͬ��������</td>
    <td><font color="#000000"><%=jgrq%></font></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">ʵ�ʿ�������</td>
    <td><font color="#000000"><%=sjkgrq%></font></td>
    <td align="right">ʵ�ʿ�������</td>
    <td><font color="#000000"><%=sjjgrq%></font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>������Ŀ����</td> 
  <td width="31%"> 
    <select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeYsxmflbm(insertform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm",ysxmflbm);
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>������Ŀ</td> 
  <td colspan="3"> 
    <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc||DECODE(sfhf,'Y','����طã�','N','') from dm_gcysxm where ysxmflbm='"+ysxmflbm+"' order by ysxmflbm,gcysxmbm",gcysxmbm);
%>
    </select>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>������</td> 
  <td width="31%"> 
    <input type="text" name="ysr" size="20" maxlength="20"  value="<%=ysr%>" >  </td>
  <td align="right" width="19%"><font color="#FF0000">*</font>����ʱ��</td> 
  <td width="31%"><input type="text" name="yssj" size="20" maxlength="10"  value="<%=yssj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���ս��</td>
  <td><%
	cf.radioToken(out,"ysjg","1+�ϸ�&2+���ϸ�",ysjg);
%></td>
  <td align="right"><font color="#FF0000">*</font>���յ÷�</td>
  <td><input type="text" name="ysdf" value="<%=ysdf%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�������</td>
  <td><%
	cf.radioToken(out,"sffszg", "1+��&2+��",sffszg);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>�Ƿ�ͻ�����ǩ��</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "sfkhbrqz","Y+��&N+��",sfkhbrqz);
%>  </td>
  <td align="right" width="19%"><font color="#FF0000">*</font>��ǩ���Ƿ�����Ȩ</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "dqzysq","Y+��&N+����Ȩ",dqzysq);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����˵��</td>
  <td colspan="3"><textarea name="yssm" cols="72" rows="3"><%=yssm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td> 
  <td width="31%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td> 
  <td width="31%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font> </td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="ysjlh"  value="<%=ysjlh%>" >
	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input type="button"  value="�ϴ���Ƭ" onClick="f_lr(insertform)" name="lr" >
      <input type="button"  value="�鿴��Ƭ" onClick="f_ck(insertform)" name="ck" >
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>


function changeYsxmflbm(FormName) 
{
	FormName.gcysxmbm.length=1;

	if (FormName.ysxmflbm.value=="")
	{
		return;
	}

	var sql;
	sql="select gcysxmbm,gcysxmmc||DECODE(sfhf,'Y','����طã�','N','') from dm_gcysxm where ysxmflbm='"+FormName.ysxmflbm.value+"' order by gcysxmbm";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.gcysxmbm,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("��ѡ��[������Ŀ����]��");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("��ѡ��[������Ŀ]��");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysr)=="") {
		alert("������[������]��");
		FormName.ysr.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("������[����ʱ��]��");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "����ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.ysjg)) {
		alert("��ѡ��[���ս��]��");
		FormName.ysjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ysdf)=="") {
		alert("������[���յ÷�]��");
		FormName.ysdf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysdf, "���յ÷�"))) {
		return false;
	}
	if(	!radioChecked(FormName.sffszg)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sffszg[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkhbrqz)) {
		alert("��ѡ��[�Ƿ�ͻ�����ǩ��]��");
		FormName.sfkhbrqz[0].focus();
		return false;
	}

	if (FormName.sfkhbrqz[1].checked)
	{
		if(	!radioChecked(FormName.dqzysq)) {
			alert("��ѡ��[��ǩ���Ƿ�����Ȩ]��");
			FormName.dqzysq[0].focus();
			return false;
		}
	}
	else{
		FormName.dqzysq[0].checked=false;
		FormName.dqzysq[1].checked=false;
	}

	if (FormName.ysjg[1].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("���ս�����ϸ�������[����˵��]��");
			FormName.yssm.focus();
			return false;
		}
	}
	if (FormName.sffszg[0].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("�������ģ�������[����˵��]��");
			FormName.yssm.focus();
			return false;
		}
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
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}


	FormName.action="SaveEditCrm_gcfxysjl.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="UploadFile.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("������[���ռ�¼��]��");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
