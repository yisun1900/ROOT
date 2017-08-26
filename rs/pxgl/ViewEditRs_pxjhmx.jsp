<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String shbh=null;

String pxmxbh=null;
String pxjhbh=null;
String pxlx=null;
String skxs=null;
String kclx=null;
String pxkc=null;
String kcnr=null;
String pxcd=null;
String pxrs=null;
String pxfy=null;
String shhrs=null;
String shhfy=null;
String gcrs=null;
String zcrs=null;
String jcrs=null;
String pxjs=null;
String pxkssj=null;
String pxjssj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherepxmxbh=null;
wherepxmxbh=cf.GB2Uni(request.getParameter("pxmxbh"));
shbh=cf.GB2Uni(request.getParameter("shbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select pxmxbh,pxjhbh,DECODE(pxlx,'0','��ѵ','1','��ѵ') pxlx,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxkc,kcnr,pxcd,pxrs,pxfy,shhrs,shhfy,gcrs,zcrs,jcrs,pxjs,pxkssj,pxjssj,lrr,lrsj,bz ";
	ls_sql+=" from  rs_pxjhmx,rs_pxskxsbm,rs_pxkclxbm ";
	ls_sql+=" where rs_pxjhmx.skxs=rs_pxskxsbm.skxs and rs_pxkclxbm.kclx=rs_pxjhmx.kclx and  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pxmxbh=cf.fillNull(rs.getString("pxmxbh"));
		pxjhbh=cf.fillNull(rs.getString("pxjhbh"));
		pxlx=cf.fillNull(rs.getString("pxlx"));
		skxs=cf.fillNull(rs.getString("skxs"));
		kclx=cf.fillNull(rs.getString("kclx"));
		pxkc=cf.fillNull(rs.getString("pxkc"));
		kcnr=cf.fillNull(rs.getString("kcnr"));
		pxcd=cf.fillNull(rs.getString("pxcd"));
		pxrs=cf.fillNull(rs.getString("pxrs"));
		pxfy=cf.fillNull(rs.getString("pxfy"));
		shhrs=cf.fillNull(rs.getString("shhrs"));
		shhfy=cf.fillNull(rs.getString("shhfy"));
		gcrs=cf.fillNull(rs.getString("gcrs"));
		zcrs=cf.fillNull(rs.getString("zcrs"));
		jcrs=cf.fillNull(rs.getString("jcrs"));
		pxjs=cf.fillNull(rs.getString("pxjs"));
		pxkssj=cf.fillNull(rs.getDate("pxkssj"));
		pxjssj=cf.fillNull(rs.getDate("pxjssj"));
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ��ϸ���
  </td>
  <td width="35%"> 
    <%=pxmxbh%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ�ƻ����
  </td>
  <td width="35%"> 
    <%=pxjhbh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ����
  </td>
  <td width="35%"> 
    <%=pxrs%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ����
  </td>
  <td width="35%"> 
    <%=pxfy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
     <font color=red>��˺�����</font>
  </td>
  <td width="35%"> 
    <%=shhrs%>
  </td>
  <td align="right" width="15%"> 
    <font color=red>��˺����</font>
  </td>
  <td width="35%"> 
    <%=shhfy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ����
  </td>
  <td width="35%"> 
    <%=pxlx%>
  </td>
  <td align="right" width="15%"> 
    �ڿ���ʽ
  </td>
  <td width="35%"> 
    <%=skxs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �γ�����
  </td>
  <td width="35%"> 
    <%=kclx%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ����
  </td>
  <td width="35%"> 
    <%=pxcd%>
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �߲�����
  </td>
  <td width="35%"> 
    <%=gcrs%>
  </td>
  <td align="right" width="15%"> 
    �в�����
  </td>
  <td width="35%"> 
    <%=zcrs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��������
  </td>
  <td width="35%"> 
    <%=jcrs%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ��ʦ
  </td>
  <td width="35%"> 
    <%=pxjs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ��ʼʱ��
  </td>
  <td width="35%"> 
    <%=pxkssj%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ����ʱ��
  </td>
  <td width="35%"> 
    <%=pxjssj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ¼����
  </td>
  <td width="35%"> 
    <%=lrr%>
  </td>
  <td align="right" width="15%"> 
    ¼��ʱ��
  </td>
  <td width="35%"> 
    <%=lrsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �γ�����
  </td>
  <td width="35%" colspan="3"> 
    <%=kcnr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ�γ�
  </td>
  <td width="35%" colspan="3"> 
    <%=pxkc%>
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ע
  </td>
  <td width="35%" colspan="3"> 
    <%=bz%>
  </td>
</tr>
</table>
<%

try {
	conn=cf.getConnection();
	ls_sql="select shhrs,shhfy ";
	ls_sql+=" from  rs_pxjhmx";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pxrs=cf.fillNull(rs.getString("shhrs"));
		pxfy=cf.fillNull(rs.getString("shhfy"));
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
<br>
<div align="center"> �����ϸ��������</div>
<form method="post" action=" SaveShXgEditmx.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>��ѵͬ������</font></td> 
  <td width="35%"> 
    <input type="text" name="pxrs" size="20" maxlength="8"  value="<%=pxrs%>">
  </td>
  <td align="right" width="15%"><font color=red>��ѵͬ�����</font></td> 
  <td width="35%"> 
    <input type="text" name="pxfy" size="20" maxlength="9"  value="<%=pxfy%>">
  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="wherepxmxbh"  value="<%=wherepxmxbh%>" >
	  <input type="hidden" name="shbh"  value="<%=shbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>
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
	if(	javaTrim(FormName.pxrs)=="") {
		alert("������[��ѵͬ������]��");
		FormName.pxrs.focus();
		return false;
	}
	if(!(isNumber(FormName.pxrs, "��ѵͬ������"))) {
		return false;
	}
	if(	javaTrim(FormName.pxfy)=="") {
		alert("������[��ѵͬ�����]��");
		FormName.pxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.pxfy, "��ѵͬ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>