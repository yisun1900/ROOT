<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgd=null;
String bzmc=null;
String xm=null;
String xb=null;
String jg=null;
String csrq=null;
String gz=null;
String rzsj=null;
String dj=null;
String lx=null;
String sfzh=null;
String zz=null;
String dh=null;
String pxsm=null;
String jjlxr=null;
String jjlxrdh=null;
String jjlxrdz=null;
String sgzbh=null;
String wheresgd=cf.getParameter(request,"sgd");
String wherebzmc=cf.getParameter(request,"bzmc");
String wherexm=cf.getParameter(request,"xm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sgd,bzmc,xm,xb,jg,csrq,gz,rzsj,dj,lx,sfzh,zz,dh,pxsm,jjlxr,jjlxrdh,jjlxrdz,sgzbh ";
	ls_sql+=" from  sq_grdjb";
	ls_sql+=" where  (sgd='"+wheresgd+"') and  (bzmc='"+wherebzmc+"') and  (xm='"+wherexm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		bzmc=cf.fillNull(rs.getString("bzmc"));
		xm=cf.fillNull(rs.getString("xm"));
		xb=cf.fillNull(rs.getString("xb"));
		jg=cf.fillNull(rs.getString("jg"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		gz=cf.fillNull(rs.getString("gz"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		dj=cf.fillNull(rs.getString("dj"));
		lx=cf.fillNull(rs.getString("lx"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		zz=cf.fillNull(rs.getString("zz"));
		dh=cf.fillNull(rs.getString("dh"));
		pxsm=cf.fillNull(rs.getString("pxsm"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));
		jjlxrdh=cf.fillNull(rs.getString("jjlxrdh"));
		jjlxrdz=cf.fillNull(rs.getString("jjlxrdz"));
		sgzbh=cf.fillNull(rs.getString("sgzbh"));
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
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSq_grdjb.jsp" name="editform">
<div align="center">ά������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>ʩ����</td>
      <td width="35%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"' ",sgd);
%> 
        </select>      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>�೤</td>
      <td width="35%"> 
        <select name="bzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+sgd+"' order by bzmc",bzmc);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>����</td>
      <td width="35%"> 
      <input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>�Ա�</td>
      <td width="35%"> <%
	cf.radioToken(out, "xb","��+��&Ů+Ů",xb);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>����</td>
      <td width="35%"> 
      <input type="text" name="jg" size="20" maxlength="50"  value="<%=jg%>" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>��������</td>
      <td width="35%"> 
        <input type="text" name="csrq" size="20" maxlength="10"  value="<%=csrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>����</td>
      <td colspan="3"> <%
	cf.radioToken(out, "gz","ľ��+ľ��&ˮ�繤+ˮ�繤&���Ṥ+���Ṥ&�߹�+�߹�&�ӹ�+�ӹ�",gz);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>��ְʱ��</td>
      <td><input type="text" name="rzsj" size="20" maxlength="10"  value="<%=rzsj%>" onDblClick="JSCalendar(this)"></td>
      <td align="right"><span class="STYLE2">*</span>����</td>
      <td><%
	cf.radioToken(out, "lx","��ʱ+��ʱ&����+����",lx);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ϸ�֤���</td>
      <td><input name="sgzbh" type="text" id="sgzbh" value="<%=sgzbh%>" size="20" maxlength="20" ></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>�ȼ�</td>
      <td width="35%"> 
      <input type="text" name="dj" size="20" maxlength="10"  value="<%=dj%>" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>���֤��</td>
      <td width="35%"><input type="text" name="sfzh" size="20" maxlength="18"  value="<%=sfzh%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>�绰</td>
      <td colspan="3"><input type="text" name="dh" size="73" maxlength="50"  value="<%=dh%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>סַ</td>
      <td colspan="3"> 
        <input type="text" name="zz" size="73" maxlength="50"  value="<%=zz%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>������ϵ��</td>
      <td><input type="text" name="jjlxr" value="<%=jjlxr%>" size="20" maxlength="20" >      </td>
      <td align="right"><font color="#FF0000">*</font>��ϵ�˵绰</td>
      <td><input type="text" name="jjlxrdh" value="<%=jjlxrdh%>" size="20" maxlength="50" >      </td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>������ϵ�˵�ַ</td>
      <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text"  value="<%=jjlxrdz%>" size="72" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ѵ˵��</td>
      <td colspan="3"> 
        <textarea name="pxsm" cols="71" rows="3"><%=pxsm%></textarea>      </td>
    </tr>
    <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
    <input type="hidden" name="wherebzmc"  value="<%=wherebzmc%>" >
    <input type="hidden" name="wherexm"  value="<%=wherexm%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmc)=="") {
		alert("��ѡ��[�೤]��");
		FormName.bzmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("������[����]��");
		FormName.jg.focus();
		return false;
	}
	if(	javaTrim(FormName.csrq)=="") {
		alert("������[��������]��");
		FormName.csrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.gz)) {
		alert("��ѡ��[����]��");
		FormName.gz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("������[��ְʱ��]��");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "��ְʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[�ȼ�]��");
		FormName.dj.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("������[���֤]��");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[���֤]����ֻ����15λ��18λ");
		FormName.sfzh.focus();
		return false;
	}

	if(	javaTrim(FormName.zz)=="") {
		alert("��ѡ��[סַ]��");
		FormName.zz.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxr)=="") {
		alert("��ѡ��[������ϵ��]��");
		FormName.jjlxr.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdh)=="") {
		alert("��ѡ��[������ϵ�˵绰]��");
		FormName.jjlxrdh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdz)=="") {
		alert("��ѡ��[������ϵ�˵�ַ]��");
		FormName.jjlxrdz.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
