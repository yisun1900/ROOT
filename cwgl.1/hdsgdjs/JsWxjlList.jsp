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
  <B><font size="3">δ����ά�޼�¼</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">���</td>
	<td  width="6%">ʩ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">���޼�¼��</td>
	<td  width="5%">�Ƿ��������</td>
	<td  width="25%">��������</td>
	<td  width="7%">����ʱ��</td>
	<td  width="7%">�᰸״̬</td>
	<td  width="8%">ά���ܷ���</td>
	<td  width="8%">ʩ���ӳе�����</td>
	<td  width="5%">�����־</td>
</tr>
<%	
	String lrxh=null;
	String sgdmc=null;
	String khxm=null;
	String khbh=null;
	String tsjlh=null;
	String sftsqk=null;
	String tsnr=null;
	String slsj=null;
	String jazt=null;
	double wxzfy=0;
	double zrfcdfy=0;
	String jsbz=null;
	double allwxzfy=0;
	double allzrfcdfy=0;

	ls_sql="SELECT lrxh,sgdmc,crm_khxx.khxm,crm_khxx.khbh,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','����','N','��') sftsqk";
	ls_sql+=" ,crm_tsjl.tsnr,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','�ǿͷ��Ǽ�','1','�ͷ�����','2','�ڴ���','3','�᰸','9','������') jazt";
	ls_sql+=" ,crm_wxfmx.wxzfy,crm_wxfmx.zrfcdfy,DECODE(crm_wxfmx.jsbz,'N','δ����','Y','�ѽ���') jsbz";
	ls_sql+=" FROM crm_khxx,crm_tsjl,sq_sgd,crm_wxfmx";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsjl.tsjlh=crm_wxfmx.tsjlh";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_wxfmx.jsbz='N'";
    ls_sql+=" order by crm_tsjl.khbh,crm_tsjl.tsjlh,crm_wxfmx.lrxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lrxh=cf.fillNull(rs.getString("lrxh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		sftsqk=cf.fillHtml(rs.getString("sftsqk"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		jazt=cf.fillHtml(rs.getString("jazt"));
		wxzfy=rs.getDouble("wxzfy");
		zrfcdfy=rs.getDouble("zrfcdfy");
		jsbz=cf.fillHtml(rs.getString("jsbz"));

		allwxzfy+=wxzfy;
		allzrfcdfy+=zrfcdfy;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="lrxh" type="checkbox" value="<%=lrxh%>">
			</td>
			<td><%=lrxh%></td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A></td>
			<td><%=sftsqk%></td>
			<td><%=tsnr%></td>
			<td><%=slsj%></td>
			<td><%=jazt%></td>
			<td><%=wxzfy%></td>
			<td><%=zrfcdfy%></td>
			<td><%=jsbz%></td>
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
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=allwxzfy%></td>
	<td><%=allzrfcdfy%></td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="12" > 
	<input type="button" value='����' onclick="f_js(listform)">
	</td>
</tr>
</table>


<CENTER >
  <B><font size="3">�ѽ���ά�޼�¼�������¼�ţ�<%=gdjsjlh%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">���</td>
	<td  width="6%">ʩ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">���޼�¼��</td>
	<td  width="5%">�Ƿ��������</td>
	<td  width="25%">��������</td>
	<td  width="7%">����ʱ��</td>
	<td  width="7%">�᰸״̬</td>
	<td  width="8%">ά���ܷ���</td>
	<td  width="8%">ʩ���ӳе�����</td>
	<td  width="5%">�����־</td>
</tr>

<%
	allwxzfy=0;
	allzrfcdfy=0;
	ls_sql="SELECT lrxh,sgdmc,crm_khxx.khxm,crm_khxx.khbh,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','����','N','��') sftsqk";
	ls_sql+=" ,crm_tsjl.tsnr,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','�ǿͷ��Ǽ�','1','�ͷ�����','2','�ڴ���','3','�᰸','9','������') jazt";
	ls_sql+=" ,crm_wxfmx.wxzfy,crm_wxfmx.zrfcdfy,DECODE(crm_wxfmx.jsbz,'N','δ����','Y','�ѽ���') jsbz";
	ls_sql+=" FROM crm_khxx,crm_tsjl,sq_sgd,crm_wxfmx";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsjl.tsjlh=crm_wxfmx.tsjlh";
    ls_sql+=" and crm_wxfmx.jsjlh='"+gdjsjlh+"' ";
    ls_sql+=" order by crm_tsjl.khbh,crm_tsjl.tsjlh,crm_wxfmx.lrxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lrxh=cf.fillNull(rs.getString("lrxh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		sftsqk=cf.fillHtml(rs.getString("sftsqk"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		jazt=cf.fillHtml(rs.getString("jazt"));
		wxzfy=rs.getDouble("wxzfy");
		zrfcdfy=rs.getDouble("zrfcdfy");
		jsbz=cf.fillHtml(rs.getString("jsbz"));

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="lrxh" type="checkbox" value="<%=lrxh%>">
			</td>
			<td><%=lrxh%></td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A></td>
			<td><%=sftsqk%></td>
			<td><%=tsnr%></td>
			<td><%=slsj%></td>
			<td><%=jazt%></td>
			<td><%=wxzfy%></td>
			<td><%=zrfcdfy%></td>
			<td><%=jsbz%></td>
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
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=allwxzfy%></td>
	<td><%=allzrfcdfy%></td>
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

	FormName.action="SaveJsWxjl.jsp";
	FormName.submit();
	return true;
}

function f_scjs(FormName)//����FormName:Form������
{

	FormName.action="DeleteJsWxjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

