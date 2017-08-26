<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
.STYLE2 {font-size: 18px}
</style>

</head>


<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String fwmj=null;
String fjtcbz="";

String mark="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc,fgsbh,fwmj,fjtcbz";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjbmc"));
		ssfgs=rs.getString("fgsbh");
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))//Y：分解；N：未分解；M：非套餐
	{
		out.println("<font color=\"#FF0000\">错误！已分解订单</font>");
		return;
	}
	else if (fjtcbz.equals("M"))//Y：分解；N：未分解；M：非套餐
	{
		out.println("<font color=\"#FF0000\">错误！非套餐客户</font>");
		return;
	}

%>
<body >


<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="8" class="STYLE2" ><B>全装修套餐主材明细
      <label>
      <input type="button" value="生成订单" <%=mark%> onClick="window.open('SaveInsertJc_zcdd.jsp?khbh=<%=khbh%>')">
      </label>
    </B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >工程负责人：</td>
    <td width="27%" >设 计 师：<%=sjs%></td>
	<td width="21%" >制单日期：<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="12"  >客户地址：<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >客户电话：<%=lxfs%></td>
    <td align="left" >竣工时间：</td>
	<td >建筑面积：<%=fwmj%></td>
  </tr>
</table>

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="6%">空间</td>
    <td  width="6%">级别</td>
    <td  width="8%">产品类别</td>
    <td  width="8%">型号</td>
	<td  width="8%">规格</td>
    <td  width="4%">单位</td>
    <td  width="5%">报价数量</td>
    <td  width="4%">下单计量单位</td>
    <td  width="4%">下单比</td>
    <td  width="4%">损耗</td>
    <td  width="5%">是否需处理小数</td>
    <td  width="5%">下单数量</td>
    <td  width="8%">品牌</td>
    <td  width="15%">供应商</td>
    <td  width="25%">配套产品说明</td>
  </tr>

	
<%
	int i=0;
	ls_sql="SELECT distinct jgwzbm";
	ls_sql+=" FROM bj_khzcxm ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by jgwzbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxm,jxc_clxlbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"'";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		allsl+=xjsl;
		allqye+=xjqye;
		

		//输出项目明细
		String tccplbmc=null;
		String ppmc=null;
		String gysmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		double xdsl=0;
		double sh=0;
		String ptcpsm=null;
		String bjjbmc=null;
		String xdjldw=null;
		double xdb=0;
		String sfxclxs=null;
		ls_sql="SELECT clxlmc,ppmc,gysmc,xh,gg,jldw,sl,xdsl,sh,ptcpsm,bjjbmc,xdjldw,xdb,DECODE(sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs";
		ls_sql+=" FROM bj_khzcxm,jxc_clxlbm,bdm_bjjbbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm";
		ls_sql+=" and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" order by jxc_clxlbm.clxlmc,xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbmc=rs.getString("clxlmc");
			ppmc=rs.getString("ppmc");
			gysmc=rs.getString("gysmc");
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=rs.getString("jldw");
			sl=rs.getDouble("sl");
			xdsl=rs.getDouble("xdsl");
			sh=rs.getDouble("sh");
			ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
			bjjbmc=rs.getString("bjjbmc");
			xdjldw=rs.getString("xdjldw");
			xdb=rs.getDouble("xdb");
			sfxclxs=rs.getString("sfxclxs");

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td rowspan="<%=count%>"><%=jgwzmc%></td>
			
				<td><%=bjjbmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=xdjldw%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=sfxclxs%></td>
				<td><%=cf.formatDouble(xdsl)%></td>
				<td><%=ppmc%></td>
				<td><%=gysmc%></td>
				<td align="left" ><%=ptcpsm%></td>
			  </tr>
			  
		
			<%
		}

		while (rs.next())
		{
			tccplbmc=rs.getString("clxlmc");
			ppmc=rs.getString("ppmc");
			gysmc=rs.getString("gysmc");
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=rs.getString("jldw");
			sl=rs.getDouble("sl");
			xdsl=rs.getDouble("xdsl");
			sh=rs.getDouble("sh");
			ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
			bjjbmc=rs.getString("bjjbmc");
			xdjldw=rs.getString("xdjldw");
			xdb=rs.getDouble("xdb");
			sfxclxs=rs.getString("sfxclxs");

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=bjjbmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=xdjldw%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=sfxclxs%></td>
				<td><%=cf.formatDouble(xdsl)%></td>
				<td><%=ppmc%></td>
				<td><%=gysmc%></td>
				<td align="left" ><%=ptcpsm%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();
	}
	
	rs1.close();
	ps1.close();
%> 
  		

</table>
<tr bgcolor="#FFFFFF" align="center"> 
<td>&nbsp;</td>
</tr>
<p>&nbsp;</p>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






