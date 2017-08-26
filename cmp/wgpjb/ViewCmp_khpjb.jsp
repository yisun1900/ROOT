<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {font-family: "隶书"}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;

String yjdz="";
String yb="";
String sjr="";
String dh="";
String bz="";
String lrr="";
String lrsj="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));

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

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select yjdz,yb,sjr,dh,bz,lrr,lrsj ";
	ls_sql+=" from  crm_bdxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjdz=cf.fillNull(rs.getString("yjdz"));
		yb=cf.fillNull(rs.getString("yb"));
		sjr=cf.fillNull(rs.getString("sjr"));
		dh=cf.fillNull(rs.getString("dh"));
		bz=cf.fillNull(rs.getString("bz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();

%>


<body bgcolor="#FFFFFF">
  <div align="center">客户评价表</div>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"><font color="#000099">客户编号</font></td>
    <td width="33%"><%=khbh%></td>
    <td align="right" width="16%"><font color="#000099">合同号</font></td>
    <td width="34%"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"><font color="#000099">客户姓名</font></td>
    <td width="33%"><%=khxm%></td>
    <td align="right" width="16%"><font color="#000099">房屋地址</font></td>
    <td width="34%"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"><font color="#000099">设计师</font></td>
    <td width="33%"><%=sjs%></td>
    <td align="right" width="16%"><font color="#000099">质检员</font></td>
    <td width="34%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"><font color="#000099">施工队</font></td>
    <td width="33%"><%=sgdmc%></td>
    <td align="right" width="16%"><font color="#000099">施工班组</font></td>
    <td width="34%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%"><font color="#000099">签约日期</font></td>
    <td width="33%"><%=qyrq%></td>
    <td align="right" width="16%"><font color="#000099">签约店面</font></td>
    <td width="34%"><%=dwmc%></td>
  </tr>
</table>

<BR>
  <table width="100%" border="1" style="FONT-SIZE:18"  cellpadding="1" cellspacing="0" >
    <tr  align="center" height="30"> 
      <td width="20%" class="STYLE3"><strong>方面</strong></td>
      <td width="50%" class="STYLE3"><strong>内容事项</strong></td>
      <td width="10%" class="STYLE3"><strong>满意</strong></td>
      <td width="10%" class="STYLE3"><strong>一般</strong></td>
      <td width="10%" class="STYLE3"><strong>不满意</strong></td>
</tr>
    <%
	
int xmsl=0;
int wtsl=0;
	
	String xmflbm=null;
	String xmfl=null;

	ls_sql="select  xmflbm,xmfl";
	ls_sql+=" from  cmp_xmflbm";
	ls_sql+=" order by xmflbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		xmfl=cf.fillNull(rs.getString("xmfl"));

		int rowcount=0;
		ls_sql="select  count(*)";
		ls_sql+=" from  cmp_pjxmbm";
		ls_sql+=" where xmflbm='"+xmflbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rowcount=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();



		String pjxmbm=null;
		String pjxm=null;
		int xh=0;
		ls_sql="select pjxmbm,pjxm";
		ls_sql+=" from  cmp_pjxmbm";
		ls_sql+=" where xmflbm='"+xmflbm+"'";
		ls_sql+=" order by xh ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
			pjxm=cf.fillNull(rs1.getString("pjxm"));

			String pjjg=null;
			String pjjgbm=null;
			ls_sql="select pjjgbm,pjjg";
			ls_sql+=" from  cmp_khpjb";
			ls_sql+=" where khbh='"+khbh+"' and pjxmbm='"+pjxmbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				pjjgbm=cf.fillNull(rs2.getString("pjjgbm"));
				pjjg=cf.fillNull(rs2.getString("pjjg"));
			}
			rs2.close();
			ps2.close();




			xmsl++;
			xh++;

			%>
			<tr  align="center" height="27" > 
			  <td rowspan="<%=rowcount%>" class="STYLE3"><%=xmfl%></td>
			  <td align="left" class="STYLE3"><%=xmsl%>:<%=pjxm%>
				<input type="hidden" name="pjxmbm"  value="<%=pjxmbm%>" >			  
				<input type="hidden" name="pjxm"  value="<%=pjxm%>" >			  
			  </td>
				<%
				if (pjjgbm.equals("1"))
				{
					%>
					  <td align="center" class="STYLE3"><%=pjjg%> </td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					<%
				}
				else if (pjjgbm.equals("2"))
				{
					%>
					  <td>&nbsp;</td>
					  <td align="center" class="STYLE3"><%=pjjg%> </td>
					  <td>&nbsp;</td>
					<%
				}
				else if (pjjgbm.equals("3"))
				{
					%>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="center" class="STYLE3"><%=pjjg%> </td>
					<%
				}
				%>
			</tr>
			<%
		}

		while (rs1.next())
		{
			pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
			pjxm=cf.fillNull(rs1.getString("pjxm"));

			String pjjg=null;
			String pjjgbm=null;
			ls_sql="select pjjgbm,pjjg";
			ls_sql+=" from  cmp_khpjb";
			ls_sql+=" where khbh='"+khbh+"' and pjxmbm='"+pjxmbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				pjjgbm=cf.fillNull(rs2.getString("pjjgbm"));
				pjjg=cf.fillNull(rs2.getString("pjjg"));
			}
			rs2.close();
			ps2.close();

			xmsl++;
			xh++;

			%>
			<tr  align="center" height="27" > 
			  <td align="left" class="STYLE3"><%=xmsl%>:<%=pjxm%>
				<input type="hidden" name="pjxmbm"  value="<%=pjxmbm%>" >			  
				<input type="hidden" name="pjxm"  value="<%=pjxm%>" >			  
			  </td>
				<%
				if (pjjgbm.equals("1"))
				{
					%>
					  <td align="center" class="STYLE3"><%=pjjg%> </td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					<%
				}
				else if (pjjgbm.equals("2"))
				{
					%>
					  <td>&nbsp;</td>
					  <td align="center" class="STYLE3"><%=pjjg%> </td>
					  <td>&nbsp;</td>
					<%
				}
				else if (pjjgbm.equals("3"))
				{
					%>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td align="center" class="STYLE3"><%=pjjg%> </td>
					<%
				}
				%>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();
	
%> 
</table>
  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2">
	<tr > 
	  <td width="2%">&nbsp</td>
	  <td>
<%
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbsj=null;
	ls_sql="select wtbh,wtmc,sfkdx,yxbz,fbsj ";
	ls_sql+=" from  cmp_dcwt";
	ls_sql+=" where  yxbz='Y'";
	ls_sql+=" order by wtbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));//是否可多选 ,1：多选；2：单选；3：写说明
		yxbz=cf.fillNull(rs.getString("yxbz"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));

		wtsl++;

		%>
		<P><B><%=wtsl%>：<%=wtmc%></B>
		<input type="hidden" name="wtbh"  value="<%=wtbh%>" >			  
		<input type="hidden" name="wtmc"  value="<%=wtmc%>" >			  
		<%

		String dabh=null;
		String damc=null;
		ls_sql="select dabh,damc";
		ls_sql+=" from  cmp_dcwtda";
		ls_sql+=" where  wtbh="+wtbh;
		ls_sql+=" order by dabh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			dabh=cf.fillNull(rs1.getString("dabh"));
			damc=cf.fillNull(rs1.getString("damc"));
			
			if (sfkdx.equals("1"))//1：多选；2：单选
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
				<input type="checkbox" name="wtbh<%=wtsl%>" value="<%=dabh%>">
				<%=damc%>
				<%

			}
			else if (sfkdx.equals("2"))
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
				<input type="radio" name="wtbh<%=wtsl%>" value="<%=dabh%>">
				<%=damc%>
				<%
			}
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();
%>
  
	</td>
	</tr>
  </table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


