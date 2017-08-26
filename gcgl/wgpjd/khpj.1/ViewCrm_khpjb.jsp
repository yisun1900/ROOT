<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
    <td align="right" width="16%"><font color="#000099">工程担当</font></td>
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
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="4"><b>保单邮寄地址</b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">邮寄地址</td>
    <td colspan="3"><%=yjdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">邮编</td>
    <td width="33%"><%=yb%> </td>
    <td align="right" width="16%">&nbsp;</td>
    <td width="34%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">收件人</td>
    <td width="33%"><%=sjr%> </td>
    <td align="right" width="16%">电话</td>
    <td width="34%"><%=dh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="17%">备注</td>
    <td colspan="3"><%=bz%> </td>
  </tr>
</table>

<%
	int allxskd=0;
	ls_sql="select sum(xskd)";
	ls_sql+=" from  crm_xmflbm";
	ls_sql+=" order by xmflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		allxskd=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	allxskd+=50*4+50+60;
%>
  <table width="<%=allxskd%>px" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td width="50px">&nbsp;</td>
      <%

	String xmflbm=null;
	String xmfl=null;
	int xskd=0;
	ls_sql="select xmflbm,xmfl,xskd,xskd";
	ls_sql+=" from  crm_xmflbm";
	ls_sql+=" order by xmflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmfl=cf.fillNull(rs1.getString("xmfl"));
		xskd=rs1.getInt("xskd");

		%> 
      <td width="<%=(xskd+50)%>px"><%=xmfl%></td>
      <%
	}
	rs1.close();
	ps1.close();

	%> </tr>
    <%
	
	
	String spjrybm=null;
	String spjry=null;
	ls_sql="select spjrybm,spjry";
	ls_sql+=" from  crm_spjrybm";
	ls_sql+=" order by spjrybm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));

		int rowcount=0;
		ls_sql="select  max(count(*))";
		ls_sql+=" from  crm_pjxmbm";
		ls_sql+=" where spjrybm='"+spjrybm+"'";
		ls_sql+=" group by xmflbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rowcount=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		%> 
    <tr bgcolor="#FFFFFF" align="center"> 
      <td ><%=spjry%></td>
      <%

		ls_sql="select  xmflbm,xmfl,xskd";
		ls_sql+=" from  crm_xmflbm";
		ls_sql+=" order by xmflbm ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmflbm=cf.fillNull(rs1.getString("xmflbm"));
			xmfl=cf.fillNull(rs1.getString("xmfl"));
			xskd=rs1.getInt("xskd");

			%> 
      <td valign="top"> 
		  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="0" cellspacing="0">
			<%

			String pjxmbm=null;
			String pjxm=null;
			String xsfs=null;
			int xh=0;
			ls_sql="select pjxmbm,pjxm,xsfs,xh";
			ls_sql+=" from  crm_pjxmbm";
			ls_sql+=" where spjrybm='"+spjrybm+"' and xmflbm='"+xmflbm+"' ";
			ls_sql+=" order by xh ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				pjxmbm=cf.fillNull(rs2.getString("pjxmbm"));
				pjxm=cf.fillNull(rs2.getString("pjxm"));
				xsfs=cf.fillNull(rs2.getString("xsfs"));
				xh=rs2.getInt("xh");


				String pjjgbm="";
				String pjjg="";
				ls_sql="select pjjgbm,pjjg";
				ls_sql+=" from crm_khpjb";
				ls_sql+=" where khbh='"+khbh+"' and spjrybm='"+spjrybm+"' and xmflbm='"+xmflbm+"' and pjxmbm='"+pjxmbm+"'";
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					pjjgbm=cf.fillNull(rs3.getString("pjjgbm"));
					pjjg=cf.fillNull(rs3.getString("pjjg"));
				}
				rs3.close();
				ps3.close();


				if (xsfs.equals("1"))//1：项目分类多选；2：项目分类单选
				{
					%>
					<tr > 
					  <td width="<%=xskd%>px"><%=pjxm%></td>
					  <td width="50px"><B><%=pjjg%></B></td>
					</tr>
					<%
				}
				else{
					if (pjjgbm.equals("1"))
					{
						%>
						<tr > 
						  <td width="<%=(xskd+90)%>px"><%=pjxm%>
						  </td>
						</tr>
						<%
					}
					else{
						%>
						<tr > 
						  <td width="<%=(xskd+90)%>px">&nbsp;</td>
						</tr>
						<%
					}
				}

			}
			rs2.close();
			ps2.close();

			%> 
		  </table>
		</td>
      <%
		
		
		}
		rs1.close();
		ps1.close();

		%> </tr>
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
		if (rs3 != null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

