<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String clmc=null;
String cllb=null;
String cldlbm=null;
String clxlbm=null;
String scsmc=null;
String ppmc=null;
String cllbbm=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbm=null;
String sfbhpj=null;
String pjts=null;
String cpjb=null;
String fgsx=null;
String cpsm=null;
String cd=null;
String zp=null;
String cgzq=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String nbbm=null;
String djzl=null;
String bzq=null;
String bztxq=null;
String clcd=null;
String clkd=null;
String clgd=null;
String cglb=null;
String bzgg=null;
String bzjldwbm=null;

String clbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bzjldwbm,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,cllbbm,xh,gg,clysbm,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,lrr,lrsj,lrbm,bz,nbbm,djzl,bzq,bztxq,clcd,clkd,clgd,cglb,bzgg ";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where  clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzjldwbm=cf.fillNull(rs.getString("bzjldwbm"));
		bzgg=cf.fillNull(rs.getString("bzgg"));
		cglb=cf.fillNull(rs.getString("cglb"));
		clcd=cf.fillNull(rs.getString("clcd"));
		clkd=cf.fillNull(rs.getString("clkd"));
		clgd=cf.fillNull(rs.getString("clgd"));
		bztxq=cf.fillNull(rs.getString("bztxq"));
		bzq=cf.fillNull(rs.getString("bzq"));
		djzl=cf.fillNull(rs.getString("djzl"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		cllb=cf.fillNull(rs.getString("cllb"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cllbbm=cf.fillNull(rs.getString("cllbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		clysbm=cf.fillNull(rs.getString("clysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cpsm=cf.fillNull(rs.getString("cpsm"));
		cd=cf.fillNull(rs.getString("cd"));
		zp=cf.fillNull(rs.getString("zp"));
		cgzq=cf.fillNull(rs.getString("cgzq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_clbm.jsp" name="insertform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>���ϴ���</td>
    <td>
	<select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeCldlbm(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('2','3') order by cldlmc",cldlbm);
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>����С��</td>
    <td>
	<select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeClxlbm(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm where cldlmc='"+cldlbm+"' order by clxlmc",clxlbm);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>��Ʒ��</td>
    <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc mc,ppmc from jxc_ppxx where pplb='2' and cldl='"+cldlbm+"'  order by ppmc",ppmc);
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>�ɹ����</td>
    <td>
      <%
	cf.radioToken(out, "cglb","J+���Ųɹ�&D+�ط��ɹ�",cglb);
%>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td colspan="3"><input type="text" name="clmc" size="73" maxlength="50"  value="<%=clmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="100"  value="<%=nbbm%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>������λ</td> 
  <td width="32%"><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc",jldwbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="100"  value="<%=xh%>" ></td>
  <td align="right" width="18%">���</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="100"  value="<%=gg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ����</td>
  <td><input type="text" name="djzl" size="20" maxlength="100"  value="<%=djzl%>" >
    KG</td>
  <td align="right"><span class="STYLE1">*</span>��װ������λ</td>
  <td><select name="bzjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc",bzjldwbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��װ���</td>
  <td colspan="3" >  <input type="text" name="bzgg" size="20" maxlength="8"  value="<%=bzgg%>" >
    ��&gt;=1�� ��װ������λ/������λ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ϳߴ�</td>
  <td colspan="3">��
    <input type="text" name="clcd" size="10" maxlength="100" value="<%=clcd%>">
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��
    <input type="text" name="clkd" size="10" maxlength="100" value="<%=clkd%>" >
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��
    <input type="text" name="clgd" size="10" maxlength="100" value="<%=clgd%>" >
    cm</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"><input type="text" name="bzq" size="20" maxlength="100"  value="<%=bzq%>" >
��</td>
  <td align="right" width="18%">����������</td> 
  <td width="32%"><input type="text" name="bztxq" size="20" maxlength="100"  value="<%=bztxq%>" >
  ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɹ�����</td> 
  <td width="32%"><input type="text" name="cgzq" size="20" maxlength="8"  value="<%=cgzq%>" >
��</td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>  </td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea>
  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="clbm"  value="<%=clbm%>" >
	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input type="reset"  value="����">
	</div>      </td>
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

var lx="";

function changeCldlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.clxlbm.length=1;
	FormName.ppmc.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	lx="1";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeClxlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.ppmc.length=1;

	if (FormName.clxlbm.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql="select ppmc from jxc_ppxx where pplb in('2','3') and cldl='"+FormName.cldlbm.value+"'  order by ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToItem2(insertform.clxlbm,ajaxRetStr);
	}
	else if (lx=="2")
	{
		strToItem2(insertform.ppmc,ajaxRetStr);
	}
}


function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.cldlbm)=="") {
		alert("������[���ϴ���]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("������[����С��]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cglb)) {
		alert("��ѡ��[�ɹ����]��");
		FormName.cglb[0].focus();
		return false;
	}

	if(	javaTrim(FormName.clmc)=="") {
		alert("������[��������]��");
		FormName.clmc.focus();
		return false;
	}

	if(javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(javaTrim(FormName.bzjldwbm)=="") {
		alert("��ѡ��[��װ������λ]��");
		FormName.bzjldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzgg)=="") {
		alert("������[��װ���]��");
		FormName.bzgg.focus();
		return false;
	}
	if(!(isNumber(FormName.bzgg, "��װ���"))) {
		return false;
	}
	if (parseFloat(FormName.bzgg.value)<1)
	{
		alert("[��װ���]������ڻ��ߵ���1��");
		FormName.bzgg.select();
		return false;
	}

	if(!(isFloat(FormName.djzl, "��Ʒ����"))) {
		return false;
	}
	if(!(isFloat(FormName.clcd, "��"))) {
		return false;
	}
	if(!(isFloat(FormName.clkd, "��"))) {
		return false;
	}
	if(!(isFloat(FormName.clgd, "��"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "�ɹ�����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
