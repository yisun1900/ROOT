<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String lx=request.getParameter("lx");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double tcjg=0;
String zcsfxxz=null;
String zcsfxxzmc=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT tcjg,bj_cltcmc.zcsfxxz,DECODE(bj_cltcmc.zcsfxxz,'1','�Զ�ѡ��','2','�˹�ѡ��') zcsfxxzmc";
	ls_sql+=" FROM bj_cltcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsfxxz=rs.getString("zcsfxxz");
		zcsfxxzmc=rs.getString("zcsfxxzmc");
		tcjg=rs.getDouble("tcjg");
	}
	rs.close();
	ps.close();


	ls_sql="SELECT sjmj";
	ls_sql+=" FROM bj_khwntcmc";
	ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">ѡ���ײ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�ͻ����</span></td> 
  <td width="32%"><%=khbh%> </td>
  <td align="right" width="18%"><span class="STYLE2">�ײͼ۸�</span></td> 
  <td width="32%"><%=tcjg%></td></tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�ײ�����</span></td>
  <td><%=tcmc%></td>
  <td align="right"><span class="STYLE2">�����Ƿ���ѡ��</span></td>
  <td><%=zcsfxxzmc%></td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="lx" value="<%=lx%>" >
	<input type="hidden" name="dqbm" value="<%=dqbm%>" >
	<input type="hidden" name="hxbm" value="<%=hxbm%>" >
	<input type="hidden" name="tcmc" value="<%=tcmc%>" >
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="xzmx" type="button" onClick="f_xzmx(insertform)"  value="ѡ����ϸ" disabled>
	<input type="reset"  value="����" name="reset">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<A HREF="ViewBj_cltczcmx.jsp?dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=tcmc%>" target="_blank">�鿴�ײ���ϸ</A>	</td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}


	FormName.action="SaveInsertBj_khcltcmc.jsp";
	FormName.submit();

		FormName.xzmx.disabled=false;
	return true;
}

function f_xzmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	window.open("Bj_khcltcfjslList.jsp?khbh=<%=khbh%>&dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=java.net.URLEncoder.encode(tcmc,"UTF-8")%>&lx=<%=lx%>");
}
//-->
</SCRIPT>
