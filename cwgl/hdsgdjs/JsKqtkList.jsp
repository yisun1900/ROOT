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
  <B><font size="3">δ���㷣���¼</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="8%">�ۿ��¼</td>
	<td  width="6%">ʩ����</td>
	<td  width="10%">�ۿ���</td>
	<td  width="6%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="13%">¼�벿��</td>
	<td  width="7%">�����־</td>
	<td  width="28%">��ע</td>
</tr>
<%	
	String kkjlh=null;
	String sgdmc=null;
	double kkje=0;
	String lrr=null;
	String lrsj=null;
	String dwmc=null;
	String jsbz=null;
	String bz=null;
	double allkkje=0;

	ls_sql="SELECT cw_kqtkjl.kkjlh,sq_sgd.sgdmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj,sq_dwxx.dwmc, DECODE(cw_kqtkjl.jsbz,'N','δ����','Y','�ѽ���') jsbz,cw_kqtkjl.jsjlh,cw_kqtkjl.bz  ";
	ls_sql+=" FROM cw_kqtkjl,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd and cw_kqtkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_kqtkjl.sgd='"+sgd+"' and cw_kqtkjl.jsbz='N'";
    ls_sql+=" order by cw_kqtkjl.kkjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kkjlh=cf.fillNull(rs.getString("kkjlh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		kkje=rs.getDouble("kkje");
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		jsbz=cf.fillHtml(rs.getString("jsbz"));
		bz=cf.fillHtml(rs.getString("bz"));
		allkkje+=kkje;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="kkjlh" type="checkbox" value="<%=kkjlh%>">
			</td>
			<td><%=kkjlh%></td>
			<td><%=sgdmc%></td>
			<td><%=kkje%></td>
			<td><%=lrr%></td>
			<td><%=lrsj%></td>
			<td><%=dwmc%></td>
			<td><%=jsbz%></td>
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
	<td><%=allkkje%></td>
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
  <B><font size="3">�ѽ��㷣���¼�������¼�ţ�<%=gdjsjlh%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="8%">�ۿ��¼</td>
	<td  width="6%">ʩ����</td>
	<td  width="10%">�ۿ���</td>
	<td  width="6%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="13%">¼�벿��</td>
	<td  width="7%">�����־</td>
	<td  width="28%">��ע</td>
</tr>

<%
	allkkje=0;
	ls_sql="SELECT cw_kqtkjl.kkjlh,sq_sgd.sgdmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj,sq_dwxx.dwmc, DECODE(cw_kqtkjl.jsbz,'N','δ����','Y','�ѽ���') jsbz,cw_kqtkjl.jsjlh,cw_kqtkjl.bz  ";
	ls_sql+=" FROM cw_kqtkjl,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd and cw_kqtkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_kqtkjl.jsjlh='"+gdjsjlh+"'";
    ls_sql+=" order by cw_kqtkjl.kkjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kkjlh=cf.fillNull(rs.getString("kkjlh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		kkje=rs.getDouble("kkje");
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		jsbz=cf.fillHtml(rs.getString("jsbz"));
		bz=cf.fillHtml(rs.getString("bz"));
		allkkje+=kkje;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="kkjlh" type="checkbox" value="<%=kkjlh%>">
			</td>
			<td><%=kkjlh%></td>
			<td><%=sgdmc%></td>
			<td><%=kkje%></td>
			<td><%=lrr%></td>
			<td><%=lrsj%></td>
			<td><%=dwmc%></td>
			<td><%=jsbz%></td>
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
	<td><%=allkkje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="12" > 
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

	FormName.action="SaveJsKqtk.jsp";
	FormName.submit();
	return true;
}

function f_scjs(FormName)//����FormName:Form������
{

	FormName.action="DeleteJsKqtk.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

