<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String wheresql="";
String wheresql1="";

String fgs=null;
fgs=request.getParameter("fgs");
if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(fgs.equals("")))	wheresql1+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";

String dwbh=null;
dwbh=request.getParameter("dwbh");
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	if (!(dwbh.equals("")))	wheresql1+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
}

String hfsj=request.getParameter("hfsj");
String hfsj2=request.getParameter("hfsj2");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String getkhbh=null;

try {
	conn=cf.getConnection();
%>


	<CENTER >
	  <B><font size="3">��ǩ�����ط�ͳ�ƣ��ط�ʱ�䣺<%=hfsj%>--><%=hfsj2%>��</font></B>
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">���</td>
		<td  width="17%">�ֹ�˾</td>
		<td  width="21%">ǩԼ����</td>
		<td  width="15%">�ͻ�����</td>
		<td  width="10%">�طÿͻ���</td>
		<td  width="10%">�طô���</td>
		<td  width="10%">�ط�ǩ���ͻ���</td>
		<td  width="10%">�طóɹ���</td>
	</tr>

<%
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String hfr=null;
	int qdkhsl=0;
	int khsl=0;
	int sl=0;

	int row=0;

	ls_sql="SELECT fgsmc,dwbh,dmmc,hfr,count(distinct khbh) khsl,count(*) sl,count(distinct qdkhbh) qdkhsl";
	ls_sql+=" from (";

	ls_sql+=" SELECT a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc dmmc,crm_hfjl.khbh,crm_hfjl.hfr,crm_hfjl.khbh qdkhbh";
	ls_sql+=" FROM crm_hfjl,crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh(+) and crm_khxx.fgsbh=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_hfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;


	ls_sql+=" UNION ALL ";
	
	ls_sql+=" SELECT a.dwmc fgsmc,crm_zxkhxx.zxdm,b.dwmc dmmc,crm_zxhfjl.khbh,crm_zxhfjl.hfr,'' qdkhbh";
	ls_sql+=" FROM crm_zxhfjl,crm_zxkhxx,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where crm_zxhfjl.khbh=crm_zxkhxx.khbh(+) and crm_zxkhxx.ssfgs=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" and crm_zxhfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_zxhfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
	ls_sql+=wheresql1;

	ls_sql+=" ) ";
	ls_sql+=" group by fgsmc,dwbh,dmmc,hfr";
	ls_sql+=" order by fgsmc,dwbh,dmmc,hfr";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsmc=rs.getString("fgsmc");
		getdwbh=cf.fillHtml(rs.getString("dwbh"));
		dmmc=cf.fillHtml(rs.getString("dmmc"));
		hfr=rs.getString("hfr");
		khsl=rs.getInt("khsl");
		sl=rs.getInt("sl");
		qdkhsl=rs.getInt("qdkhsl");

		double hfcgl=0;
		if (sl==0)
		{
			hfcgl=0;
		}
		else{
			hfcgl=qdkhsl*100.0/khsl;
		}

		row++;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><%=fgsmc%></td>
			<td><%=dmmc%></td>
			<td><%=hfr%></td>
			<td><%=khsl%></td>
			<td><A HREF="ViewCrm_hfcgl.jsp?dwbh=<%=getdwbh%>&hfr=<%=hfr%>" target="_blank"><%=sl%></A></td>
			<td><%=qdkhsl%></td>
			<td><%=cf.formatDouble(hfcgl)%>%</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	
%>
	</table>

</body>
</html>

<%

}
catch (Exception e) {
	out.print("Exception: " + e);
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