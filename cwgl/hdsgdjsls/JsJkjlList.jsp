<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<%

	String sgd=request.getParameter("sgd");
	String gdjsjlh=request.getParameter("gdjsjlh");

	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;

try {
	conn=cf.getConnection();
%>

<form method="POST" name="listform" target="_blank">
<input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
<CENTER >
  <B><font size="3">δ�������¼</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">����¼��</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="5%">�������</td>
	<td  width="6%">�����</td>
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="4%">�����־</td>
	<td  width="12%">��ע</td>
</tr>
<%	
	String gdjkjlh=null;
	String sgdmc=null;
	String khxm=null;
	String khbh=null;
	String jklx=null;
	double jkje=0;
	String jkblr=null;
	String jkblsj=null;
	String lrr=null;
	String lrsj=null;
	String dwmc=null;
	String gdjsjd=null;
	String bz=null;
	double alljkje=0;

	ls_sql="SELECT cw_gdjkjl.gdjkjlh,sgdmc,cw_gdjkjl.khbh,crm_khxx.khxm, DECODE(cw_gdjkjl.jklx,'1','�����','2','���Ͽ�','9','����') as jklx";
	ls_sql+=" ,cw_gdjkjl.jkje,cw_gdjkjl.jkblr,cw_gdjkjl.jkblsj,cw_gdjkjl.lrr,cw_gdjkjl.lrsj,dwmc,DECODE(cw_gdjkjl.gdjsjd,'0','δ����','1','�ѽ���') gdjsjd,cw_gdjkjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh and cw_gdjkjl.sgd=sq_sgd.sgd(+) and cw_gdjkjl.lrbm=sq_dwxx.dwbh";
	ls_sql+=" and cw_gdjkjl.sgd='"+sgd+"' and cw_gdjkjl.gdjsjd='0' and cw_gdjkjl.jklx in('1','9') and cw_gdjkjl.scbz='N' and cw_gdjkjl.czlx!='3'";
    ls_sql+=" order by crm_khxx.sgd,cw_gdjkjl.khbh,cw_gdjkjl.gdjkjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gdjkjlh=cf.fillNull(rs.getString("gdjkjlh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		jklx=cf.fillNull(rs.getString("jklx"));
		jkje=rs.getDouble("jkje");
		jkblr=cf.fillHtml(rs.getString("jkblr"));
		jkblsj=cf.fillHtml(rs.getDate("jkblsj"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		gdjsjd=cf.fillHtml(rs.getString("gdjsjd"));
		bz=cf.fillHtml(rs.getString("bz"));

		alljkje+=jkje;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="gdjkjlh" type="checkbox" value="<%=gdjkjlh%>">
			</td>
			<td><%=gdjkjlh%></td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><%=jklx%></td>
			<td><%=jkje%></td>
			<td><%=jkblr%></td>
			<td><%=jkblsj%></td>
			<td><%=lrr%></td>
			<td><%=lrsj%></td>
			<td><%=dwmc%></td>
			<td><%=gdjsjd%></td>
			<td><%=bz%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

%>
<tr bgcolor="#FFFFFF" align='center'>
	<td>С ��</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=alljkje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="13" > 
	<input type="button" value='����' onclick="f_js(listform)">
	</td>
</tr>
</table>


<CENTER >
  <B><font size="3">�ѽ������¼�������¼�ţ�<%=gdjsjlh%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">����¼��</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="5%">�������</td>
	<td  width="6%">�����</td>
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="4%">�����־</td>
	<td  width="12%">��ע</td>
</tr>

<%
	alljkje=0;
	ls_sql="SELECT cw_gdjkjl.gdjkjlh,sgdmc,cw_gdjkjl.khbh,crm_khxx.khxm, DECODE(cw_gdjkjl.jklx,'1','�����','2','���Ͽ�','9','����') as jklx";
	ls_sql+=" ,cw_gdjkjl.jkje,cw_gdjkjl.jkblr,cw_gdjkjl.jkblsj,cw_gdjkjl.lrr,cw_gdjkjl.lrsj,dwmc,DECODE(cw_gdjkjl.gdjsjd,'0','δ����','1','�ѽ���') gdjsjd,cw_gdjkjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh and cw_gdjkjl.sgd=sq_sgd.sgd(+) and cw_gdjkjl.lrbm=sq_dwxx.dwbh";
	ls_sql+=" and cw_gdjkjl.gdjsjlh='"+gdjsjlh+"'";
    ls_sql+=" order by crm_khxx.sgd,cw_gdjkjl.khbh,cw_gdjkjl.gdjkjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gdjkjlh=cf.fillNull(rs.getString("gdjkjlh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		jklx=cf.fillNull(rs.getString("jklx"));
		jkje=rs.getDouble("jkje");
		jkblr=cf.fillHtml(rs.getString("jkblr"));
		jkblsj=cf.fillHtml(rs.getDate("jkblsj"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		gdjsjd=cf.fillHtml(rs.getString("gdjsjd"));
		bz=cf.fillHtml(rs.getString("bz"));

		alljkje+=jkje;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="gdjkjlh" type="checkbox" value="<%=gdjkjlh%>">
			</td>
			<td><%=gdjkjlh%></td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><%=jklx%></td>
			<td><%=jkje%></td>
			<td><%=jkblr%></td>
			<td><%=jkblsj%></td>
			<td><%=lrr%></td>
			<td><%=lrsj%></td>
			<td><%=dwmc%></td>
			<td><%=gdjsjd%></td>
			<td><%=bz%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();
%>
<tr bgcolor="#FFFFFF" align='center'>
	<td>С ��</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=alljkje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="13" > 
	<input type="button" value='ɾ������' onclick="f_scjs(listform)">
	</td>
</tr>
</table>




<%
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

</form> 

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_js(FormName)//����FormName:Form������
{

	FormName.action="SaveJsJkjl.jsp";
	FormName.submit();
	return true;
}

function f_scjs(FormName)//����FormName:Form������
{

	FormName.action="DeleteJsJkjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

