<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='173001'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[积单报表]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[积单报表]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));

String wheresql="";
String wheresql1="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_zxkhxx.ssfgs in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}


if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}



%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style type="text/css">
<!--
.STYLE1 {
	font-size: 15px;
	color: #0000CC;
}
-->
</style>
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<center>店面积单统计</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">咨询店面</td>
	<td  width="10%">查看设计师积单</td>
	<td  width="10%">查看客户经理积单</td>
	<td  width="8%">积单客户数</td>
	<td  width="15%">交款总额</td>
	<td  width="8%">家装订金客户数</td>
	<td  width="8%">套餐订金客户数</td>
	<td  width="8%">设计费客户数</td>
</tr>


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int zjjds=0;
	int zjfkze=0;
	int zjlfdjkhs=0;
	int zjhddjkhs=0;
	int zjsjfkhs=0;
	int zjqths=0;

	String fgsbh="";
	String fgsmc="";
	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	if (!(fgs.equals("")))	ls_sql+=" and  (ssfgs='"+fgs+"')";

	
	
	ls_sql+=" order by dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsbh=rs.getString("dwbh");
		fgsmc=rs.getString("dwmc");
	
		int xjjds=0;
		int xjfkze=0;
		int xjlfdjkhs=0;
		int xjhddjkhs=0;
		int xjsjfkhs=0;
		int xjqths=0;

		String dmbh="";
		String dmmc="";
		ls_sql=" SELECT dwbh,dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwlx='F2' and cxbz='N'";
		ls_sql+=" and ssfgs='"+fgsbh+"'";
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  (dwbh='"+dwbh+"')";
		}
		ls_sql+=" order by dwbh";
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery();
		while (rs3.next())
		{
			dmbh=rs3.getString("dwbh");
			dmmc=rs3.getString("dwmc");

			String getsjs="";
			int jds=0;
			double fkze=0;

			ls_sql="SELECT count(distinct crm_zxkhxx.khbh) jds,sum(NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0)) fkze";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and (NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0))!=0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jds=rs1.getInt("jds");
				fkze=rs1.getDouble("fkze");
			}
			rs1.close();
			ps1.close();


			int lfdjkhs=0;
			int hddjkhs=0;
			int sjfkhs=0;
			int qths=0;


			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.lfdj>0";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				lfdjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.hddj>0";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				hddjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjf>0";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				sjfkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0)=0 ";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				qths=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

				
				
			xjjds+=jds;
			xjfkze+=fkze;
			xjlfdjkhs+=lfdjkhs;
			xjhddjkhs+=hddjkhs;
			xjsjfkhs+=sjfkhs;
			xjqths+=qths;
			
			zjjds+=jds;
			zjfkze+=fkze;
			zjlfdjkhs+=lfdjkhs;
			zjhddjkhs+=hddjkhs;
			zjsjfkhs+=sjfkhs;
			zjqths+=qths;
				
			%>
			<tr align="center">
				<td><%=dmmc%></td>
				<td><A HREF="SjsJdTj.jsp?dwbh=<%=dmbh%>&fgsbh=<%=fgsbh%>" target="_blank">设计师积单</A></td>
				<td><A HREF="KhjlJdTj.jsp?dwbh=<%=dmbh%>&fgsbh=<%=fgsbh%>" target="_blank">客户经理积单</A></td>
				<td><%=jds%></td>
				<td><%=fkze%></td>
				<td><%=lfdjkhs%></td>
				<td><%=hddjkhs%></td>
				<td><%=sjfkhs%></td>
			</tr>
			<%


		}
		rs3.close();
		ps3.close();

		%>
		<tr align="center" bgcolor="#CCCCCC" >
			<td><B><span class="STYLE1">[<%=fgsmc%>]小计</span></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=xjjds%></td>
			<td><%=xjfkze%></td>
			<td><%=xjlfdjkhs%></td>
			<td><%=xjhddjkhs%></td>
			<td><%=xjsjfkhs%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	

%>
<tr align="center" bgcolor="#CCCCCC" >
	<td><B>总 计</B></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=zjjds%></td>
	<td><%=zjfkze%></td>
	<td><%=zjlfdjkhs%></td>
	<td><%=zjhddjkhs%></td>
	<td><%=zjsjfkhs%></td>
</tr>

</table>
</body>

</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3!= null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

