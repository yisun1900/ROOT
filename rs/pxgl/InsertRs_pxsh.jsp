<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String ztbm=cf.GB2Uni(request.getParameter("ztbm"));
String pxjhmc=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int shbh_int=0;
String shbh=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(shbh),0)";
	ls_sql+=" from  rs_pxsh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		shbh_int=rs.getInt(1)+1;
//		out.print(count);
	}
	rs.close();
	ps.close();

	ls_sql="select pxjhmc";
	ls_sql+=" from  rs_pxjh ";
	ls_sql+=" where pxjhbh='"+pxjhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		pxjhmc=rs.getString(1);
//		out.print(count);
	}
	rs.close();
	ps.close();

	shbh=cf.addZero(shbh_int,8);
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
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
<title>���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<div align="center"><%=pxjhmc%></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">���</td>
	<td  width="12%">��Ƹ�ƻ����</td>
	<td  width="18%">����״̬</td>
	<td  width="10%">��˽���</td>
	<td  width="10%">�����</td>
	<td  width="10%">���ʱ��</td>
	<td  width="30%">������</td>
</tr>
<%
	int row=0;
	String ys=null;
	String shbh_v=null;
	String jhbh=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	String shyj=null;
	String yztbm=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT rs_pxsh.shbh shbh,rs_pxsh.pxjhbh pxjhbh,rs_ztbm.ztmc yztbm,rs_pxshbm.shjlmc shjl,rs_pxsh.shr shr,TO_CHAR(shsj,'YYYY-MM-DD') shsj,rs_pxsh.shyj shyj ";
	ls_sql+=" FROM rs_pxsh,rs_pxshbm,rs_ztbm  ";
    ls_sql+=" where rs_pxsh.shjl=rs_pxshbm.shjl and rs_ztbm.ztbm=rs_pxsh.yztbm and rs_pxsh.pxjhbh='"+pxjhbh+"'";
	ls_sql+=" order by shbh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
//		shbh_v=rs.getString("shbh");
		jhbh=rs.getString("pxjhbh");
		shjl=rs.getString("shjl");
		shr=rs.getString("shr");
		shsj=rs.getString("shsj");
		shyj=cf.fillHtml(rs.getString("shyj"));
		yztbm=rs.getString("yztbm");

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
%> 
  <tr align="center" bgcolor="<%=ys%>">
    <td><%=row%></td>
    <td><A HREF="viewpxjhmx.jsp?pxjhbh=<%=jhbh%>" target="_blank"><%=jhbh%></A></td>
	<td><%=yztbm%></td>
    <td><%=shjl%></td>
    <td><%=shr%></td>
    <td><%=shsj%></td>
    <td><%=shyj%></td>
  </tr>
  <%
		}
		rs.close();
		ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+"<br>");
	out.print("<font color=red>��ѡ������״̬!</font>");
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
</table>

<form method="post" action="" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">�ƻ����</font></td> 
  <td width="35%"> 
    <input type="text" name="pxjhbh" value="<%=pxjhbh%>" size="20" maxlength="8" readonly>
  </td>
  <td align="right" width="15%">��˽���</td> 
  <td width="35%"> 
    <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">ͬ��</option>
    <option value="0">����</option>
    <option value="9">�޸ļƻ�</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">�����</font></td> 
  <td width="35%"> 
    <input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
    <td align="right" width="15%"><font color="#0000FF">���ʱ��</font></td> 
  <td width="35%"> 
    <input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%" colspan="3"> 
    <textarea name="shyj" cols="71" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input name="shbh" type="hidden" value="<%=shbh%>" >
	<input name="pxjhbh" type="hidden" value="<%=pxjhbh%>" >
	<input name="pxjhmc" type="hidden" value="<%=pxjhmc%>" >
	<input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
	<input type="button"  value="�޸���ϸ" onClick="f_mx(insertform)" name="Editbutton">
	<input type="reset"  value="����" name="reset">
      </td>
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
	if(	javaTrim(FormName.shbh)=="") {
		alert("������[��˱��]��");
		FormName.shbh.focus();
		return false;
	}
	if(!(isNumber(FormName.shbh, "��˱��"))) {
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("��ѡ��[��˽���]��");
		FormName.shjl.focus();
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
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
	FormName.action="SaveInsertRs_pxsh.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	FormName.Editbutton.disabled=true;
	return true;
}
function f_mx(FormName)//����FormName:Form������
{
	FormName.action="Rs_ShpxjhmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
