<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String cpmc=cf.GB2Uni(cf.getParameter(request,"cpmc"));

String dqbm=null;
String hxbm=null;
String jgwzbm=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String ydj=null;
String tcdj=null;
String sjzj=null;
String jsj=null;
String sl=null;
String lrr=null;
String lrsj=null;
String bz=null;




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,tcmc,hxbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz ";
	ls_sql+=" from  bj_khwntcmxh";
    ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and cpmc='"+cpmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));

		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		ydj=cf.fillNull(rs.getString("ydj"));
		tcdj=cf.fillNull(rs.getString("tcdj"));
		sjzj=cf.fillNull(rs.getString("sjzj"));
		jsj=cf.fillNull(rs.getString("jsj"));
		sl=cf.fillNull(rs.getString("sl"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBj_wntczcmx.jsp" name="editform">
<div align="center">���޸ģ���ů�ײ���ϸ�����������:<%=zjxxh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�ײ�����</span></td>
    <td colspan="3"><input type="text" name="tcmc" value="<%=tcmc%>" size="73" maxlength="50" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">��Ʒ����</span></td>
    <td colspan="3"><input type="text" name="cpmc" size="73" maxlength="100"  value="<%=cpmc%>" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ṹλ��</td>
    <td colspan="3"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc",jgwzbm);
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ͺ�</td>
  <td colspan="3"><input type="text" name="xh" size="73" maxlength="100"  value="<%=xh%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���</td>
  <td colspan="3"><input type="text" name="gg" size="73" maxlength="100"  value="<%=gg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ʒ��</td>
  <td colspan="3"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value="<%=ppmc%>"><%=ppmc%></option>
  </select></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������λ</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"><input type="text" name="sl" size="20" maxlength="17"  value="<%=sl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"><input type="text" name="tcdj" size="20" maxlength="17"  value="<%=tcdj%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�����</td> 
  <td width="32%"><input type="text" name="jsj" size="20" maxlength="17"  value="<%=jsj%>" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cpmc)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.tcdj)=="") {
		alert("������[����]��");
		FormName.tcdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tcdj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsj)=="") {
		alert("������[�����]��");
		FormName.jsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jsj, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
