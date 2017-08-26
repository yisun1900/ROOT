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
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

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
	  <B><font size="3">已签单－回访统计（回访时间：<%=hfsj%>--><%=hfsj2%>）</font></B>
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="3%">序号</td>
		<td  width="10%">合同号</td>
		<td  width="8%">姓名</td>
		<td  width="24%">房屋地址</td>
		<td  width="8%">质检员</td>
		<td  width="8%">设计师</td>
		<td  width="10%">签约时间</td>
		<td  width="10%">实开工时间</td>
		<td  width="13%">签约店面</td>
		<td  width="6%">回访次数</td>
	</tr>

<%
	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String dwmc=null;
	String sjs=null;
	String zjxm=null;
	String sjkgrq=null;
	String zxhfsj=null;
	String qyrq=null;
	String ysgcjdmc=null;
	int sl=0;

	int row=0;

	ls_sql="SELECT crm_hfjl.khbh,hth,khxm,fwdz,sq_dwxx.dwmc,sjs,zjxm,sjkgrq,crm_khxx.qyrq,count(*) sl ";
	ls_sql+=" FROM crm_hfjl,crm_khxx,sq_dwxx ";
	ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_hfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,crm_hfjl.khbh,hth,khxm,fwdz,sq_dwxx.dwmc,sjs,zjxm,sjkgrq,crm_khxx.qyrq ";
	ls_sql+=" order by crm_khxx.fgsbh,crm_khxx.qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		sl=rs.getInt("sl");

		row++;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><%=hth%></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=zjxm%></td>
			<td><%=sjs%></td>
			<td><%=qyrq%></td>
			<td><%=sjkgrq%></td>
			<td><%=dwmc%></td>
			<td><A HREF="ViewCrm_hfjl.jsp?khbh=<%=khbh%>" target="_blank"><%=sl%></A></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	
%>
	</table>

	<CENTER >
	  <B><font size="3">咨询客户－回访统计（回访时间：<%=hfsj%>--><%=hfsj2%>）</font></B>
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="4%">序号</td>
		<td  width="10%">姓名</td>
		<td  width="24%">房屋地址</td>
		<td  width="10%">设计师</td>
		<td  width="10%">业务员</td>
		<td  width="14%">咨询店面</td>
		<td  width="10%">录入时间</td>
		<td  width="12%">咨询状态</td>
		<td  width="6%">回访次数</td>
	</tr>

<%
	String ywy=null;
	String lrsj=null;
	String zxztmc=null;

	row=0;

	ls_sql="SELECT crm_zxhfjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,sq_dwxx.dwmc,crm_zxkhxx.sjs,crm_zxkhxx.ywy,crm_zxkhxx.lrsj,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') zxztmc,count(*) sl ";
	ls_sql+=" FROM crm_zxhfjl,crm_zxkhxx,sq_dwxx ";
	ls_sql+=" where crm_zxhfjl.khbh=crm_zxkhxx.khbh(+) and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" and crm_zxhfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_zxhfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
	ls_sql+=wheresql1;
	ls_sql+=" group by crm_zxkhxx.ssfgs,crm_zxhfjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,sq_dwxx.dwmc,crm_zxkhxx.sjs,crm_zxkhxx.ywy,crm_zxkhxx.lrsj,crm_zxkhxx.zxzt ";
	ls_sql+=" order by crm_zxkhxx.ssfgs,crm_zxkhxx.lrsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		ywy=cf.fillHtml(rs.getString("ywy"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		zxztmc=cf.fillHtml(rs.getString("zxztmc"));
		sl=rs.getInt("sl");

		row++;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><A HREF="/dhzx/dhzx/ViewCrm_zxkhxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=sjs%></td>
			<td><%=ywy%></td>
			<td><%=dwmc%></td>
			<td><%=lrsj%></td>
			<td><%=zxztmc%></td>
			<td><A HREF="ViewCrm_zxhfjl.jsp?khbh=<%=khbh%>" target="_blank"><%=sl%></A></td>
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