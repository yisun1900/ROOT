<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh1=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
%>

<%

String xh=null;
String dwbh=null;
String khsj=null;
String khr=null;
String cw=null;
String ht=null;
String dmgl=null;
String wj=null;
String wpsb=null;
String bgyp=null;
String xcyp=null;
String gxbb=null;
String jk=null;
String kq=null;
String gzap=null;
String ts=null;
String khbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,dwbh,khsj,khr,cw,ht,dmgl,wj,wpsb,bgyp,xcyp,gxbb,jk,kq,gzap,ts,khbm ";
	ls_sql+=" from  xz_xzzlkhb";
	ls_sql+=" where  (xh='"+wherexh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khsj=cf.fillNull(rs.getDate("khsj"));
		khr=cf.fillNull(rs.getString("khr"));
		cw=cf.fillNull(rs.getString("cw"));
		ht=cf.fillNull(rs.getString("ht"));
		dmgl=cf.fillNull(rs.getString("dmgl"));
		wj=cf.fillNull(rs.getString("wj"));
		wpsb=cf.fillNull(rs.getString("wpsb"));
		bgyp=cf.fillNull(rs.getString("bgyp"));
		xcyp=cf.fillNull(rs.getString("xcyp"));
		gxbb=cf.fillNull(rs.getString("gxbb"));
		jk=cf.fillNull(rs.getString("jk"));
		kq=cf.fillNull(rs.getString("kq"));
		gzap=cf.fillNull(rs.getString("gzap"));
		ts=cf.fillNull(rs.getString("ts"));
		khbm=cf.fillNull(rs.getString("khbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXz_xzzlkhb.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xh" size="20" maxlength="7"  value="<%=xh%>" readonly  >
  </td>
  <td width="15%"> 
    <div align="right">�����˲���</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dqbm='"+dqbm+"' and dwlx='F2'",dwbh);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����ʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khsj" size="20" maxlength="10"  value="<%=khsj%>" >
  </td>
  <td width="15%"> 
    <div align="right">������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khr" size="20" maxlength="8"  value="<%=khr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����15��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cw" size="20" maxlength="2"  value="<%=cw%>" >
  </td>
  <td width="15%"> 
    <div align="right">��ͬ10��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ht" size="20" maxlength="2"  value="<%=ht%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������10��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dmgl" size="20" maxlength="2"  value="<%=dmgl%>" >
  </td>
  <td width="15%"> 
    <div align="right">�ļ�5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wj" size="20" maxlength="1"  value="<%=wj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��Ʒ�豸10</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wpsb" size="20" maxlength="9"  value="<%=wpsb%>" >
  </td>
  <td width="15%"> 
    <div align="right">�칫��Ʒ5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgyp" size="20" maxlength="1"  value="<%=bgyp%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������Ʒ5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xcyp" size="20" maxlength="1"  value="<%=xcyp%>" >
  </td>
  <td width="15%"> 
    <div align="right">�����15��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="gxbb" size="20" maxlength="2"  value="<%=gxbb%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jk" size="20" maxlength="1"  value="<%=jk%>" >
  </td>
  <td width="15%"> 
    <div align="right">����7��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kq" size="20" maxlength="1"  value="<%=kq%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������8��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="gzap" size="20" maxlength="1"  value="<%=gzap%>" >
  </td>
  <td width="15%"> 
    <div align="right">�������ż���ԱͶ��5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ts" size="20" maxlength="1"  value="<%=ts%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���˲���</div>
  </td>
  <td width="35%"> 
    <select name="khbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh1+"'",khbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
	    <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xh)=="") {
		alert("������[�������]��");
		FormName.xh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�����˲���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khsj)=="") {
		alert("������[����ʱ��]��");
		FormName.khsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.khr)=="") {
		alert("������[������]��");
		FormName.khr.focus();
		return false;
	}
	if(	javaTrim(FormName.cw)=="") {
		alert("������[����15��]��");
		FormName.cw.focus();
		return false;
	}
	if(!(isFloat(FormName.cw, "����15��"))) {
		return false;
	}
	if(	javaTrim(FormName.ht)=="") {
		alert("������[��ͬ10��]��");
		FormName.ht.focus();
		return false;
	}
	if(!(isFloat(FormName.ht, "��ͬ10��"))) {
		return false;
	}
	if(	javaTrim(FormName.dmgl)=="") {
		alert("������[�������10��]��");
		FormName.dmgl.focus();
		return false;
	}
	if(!(isFloat(FormName.dmgl, "�������10��"))) {
		return false;
	}
	if(	javaTrim(FormName.wj)=="") {
		alert("������[�ļ�5��]��");
		FormName.wj.focus();
		return false;
	}
	if(!(isFloat(FormName.wj, "�ļ�5��"))) {
		return false;
	}
	if(	javaTrim(FormName.wpsb)=="") {
		alert("������[��Ʒ�豸10]��");
		FormName.wpsb.focus();
		return false;
	}
	if(!(isFloat(FormName.wpsb, "��Ʒ�豸10"))) {
		return false;
	}
	if(	javaTrim(FormName.bgyp)=="") {
		alert("������[�칫��Ʒ5��]��");
		FormName.bgyp.focus();
		return false;
	}
	if(!(isFloat(FormName.bgyp, "�칫��Ʒ5��"))) {
		return false;
	}
	if(	javaTrim(FormName.xcyp)=="") {
		alert("������[������Ʒ5��]��");
		FormName.xcyp.focus();
		return false;
	}
	if(!(isFloat(FormName.xcyp, "������Ʒ5��"))) {
		return false;
	}
	if(	javaTrim(FormName.gxbb)=="") {
		alert("������[�����15��]��");
		FormName.gxbb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxbb, "�����15��"))) {
		return false;
	}
	if(	javaTrim(FormName.jk)=="") {
		alert("������[���5��]��");
		FormName.jk.focus();
		return false;
	}
	if(!(isFloat(FormName.jk, "���5��"))) {
		return false;
	}
	if(	javaTrim(FormName.kq)=="") {
		alert("������[����7��]��");
		FormName.kq.focus();
		return false;
	}
	if(!(isFloat(FormName.kq, "����7��"))) {
		return false;
	}
	if(	javaTrim(FormName.gzap)=="") {
		alert("������[��������8��]��");
		FormName.gzap.focus();
		return false;
	}
	if(!(isFloat(FormName.gzap, "��������8��"))) {
		return false;
	}
	if(	javaTrim(FormName.ts)=="") {
		alert("������[�������ż���ԱͶ��5��]��");
		FormName.ts.focus();
		return false;
	}
	if(!(isFloat(FormName.ts, "�������ż���ԱͶ��5��"))) {
		return false;
	}
	if(	javaTrim(FormName.khbm)=="") {
		alert("��ѡ��[���˲���]��");
		FormName.khbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
