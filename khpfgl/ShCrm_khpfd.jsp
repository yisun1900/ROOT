<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String tsjlh=null;
String khbh=null;
String pfyy=null;
String dwbh=null;
String pfjecdf=null;
String pfje=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String lrr=null;
String shyj=null;


String tsbxsj=null;
String tsnr=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String sgdmc=null;


String pfjlh=cf.GB2Uni(request.getParameter("pfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,khbh,pfyy,dwbh,pfjecdf,pfje,lrsj,lrbm,bz,lrr,shyj ";
	ls_sql+=" from  crm_khpfd";
	ls_sql+=" where  (pfjlh='"+pfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		pfyy=cf.fillNull(rs.getString("pfyy"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		pfjecdf=cf.fillNull(rs.getString("pfjecdf"));
		pfje=cf.fillNull(rs.getString("pfje"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		shyj=cf.fillNull(rs.getString("shyj"));
	}
	rs.close();
	ps.close();

	ls_sql="select tsbxsj,tsnr";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,sjs,sgdmc,fgsbh";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
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
<title>�⸶�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveShCrm_khpfd.jsp" name="editform">
<div align="center">�⸶������ˣ��⸶��¼��:<%=pfjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">Ͷ�߱��޼�¼��</font></td>
    <td><%=tsjlh%></td>
    <td align="right"><font color="#0000CC">�ͻ����</font></td>
    <td><%=khbh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">�ͻ�����</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">���ʦ</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#0000CC">ʩ����</font></td>
    <td><%=sgdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">�ͻ�Ͷ��ʱ��</font></td>
    <td colspan="3"><%=tsbxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">Ͷ������</font></td>
    <td colspan="3"><%=tsnr%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">�⸶ԭ��</font></td> 
  <td colspan="3"><%=pfyy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">¼����</font></td>
  <td><%=lrr%></td>
  <td align="right"><font color="#0000CC">¼��ʱ��</font></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">��ע</font></td>
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">������β���</font></td> 
  <td width="32%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�⸶���</td>
  <td><input type="text" name="pfje" size="20" maxlength="17"  value="<%=pfje%>" ></td>
  <td align="right"><font color="#FF0000">*</font>�⸶���е���</td>
  <td><input type="text" name="pfjecdf" size="20" maxlength="20"  value="<%=pfjecdf%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�����</font></td>
  <td><input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="8" readonly></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">���ʱ��</font></td>
  <td><input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������</td>
  <td colspan="3"><label>
    <textarea name="shyj" cols="72" rows="3"><%=shyj%></textarea>
  </label></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="pfjlh"  value="<%=pfjlh%>" >
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
	if(	javaTrim(FormName.pfjlh)=="") {
		alert("������[�⸶��¼��]��");
		FormName.pfjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.pfjecdf)=="") {
		alert("������[�⸶���е���]��");
		FormName.pfjecdf.focus();
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

	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
