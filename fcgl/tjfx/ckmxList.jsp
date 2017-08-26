<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String whereclbm=null;
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
String ssfgs=cf.GB2Uni(request.getParameter("dwbh"));
String wheretime=cf.GB2Uni(request.getParameter("wheretime"));
String wheretime2=cf.GB2Uni(request.getParameter("wheretime2"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrjsfs2=null;
String lrbfb=null;
String bz=null;
String jldwmc=null;
String cldlmc=null;
double cldj=0;
double fgsdj=0;
double qybfb=0;
double khqye=0;
double txje=0;
double sumrk=0;
double sumck=0;
double kcsl=0;
try {
	conn=cf.getConnection();

/***************************************************************\
|		查询库存													|
\***************************************************************/
	//查询：上期结转日期、上期库存数量
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+ssfgs+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();

	double sqkcsl=0;
	ls_sql="select kcsl ";
	ls_sql+=" from cl_ydjzmx ";
	ls_sql+=" where jzph='"+sqjzph+"' and clbm='"+whereclbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqkcsl=rs.getDouble("kcsl");
	}
	rs.close();
	ps.close();

	
	ls_sql="select nvl(sum(rksl),0)  ";
	ls_sql+=" from cl_rkmx,cl_rkd  ";
	ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph  ";
	ls_sql+=" and cl_rkd.dwbh='"+ssfgs+"'  ";
	ls_sql+=" and clbm='"+whereclbm+"' ";
	ls_sql+=" and cl_rkd.rkzt='2' and rksj>?";//注意起点不包括等于
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqjzrq);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumrk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select nvl(sum(cksl),0)  ";
	ls_sql+=" from cl_ckmx,cl_ckd  ";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
	ls_sql+=" and cl_ckd.dwbh='"+ssfgs+"' ";
	ls_sql+=" and cl_ckmx.clbm='"+whereclbm+"' and cl_ckmx.leixing='1' ";
	ls_sql+=" and cl_ckd.ckzt='2' and cksj>?";//注意起点不包括等于
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqjzrq);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	kcsl=sqkcsl+sumrk-sumck;


/***************************************************************\
|		查询辅材基本信息											|
\***************************************************************/
	ls_sql="SELECT cl_clbm.clbm clbm,clmc,clgg,cldj,jldwmc,DECODE(lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,lrjsfs lrjsfs2,lrbfb,bz,fgsdj,cldlmc ";
	ls_sql+=" FROM cl_clbm,cl_jgmx "; 
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm  ";
	ls_sql+=" and (cl_clbm.clbm='"+whereclbm+"') and cl_jgmx.dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
		lrjsfs2=cf.fillNull(rs.getString("lrjsfs2"));
		lrbfb=cf.fillNull(rs.getString("lrbfb"));
		bz=cf.fillNull(rs.getString("bz"));
		cldj=rs.getDouble("cldj");
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		fgsdj=rs.getDouble("fgsdj");
	}
	rs.close();
	ps.close();
%>
<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 材料明细：（<%=clmc%>） <font color="blue">库存量（<%=kcsl%>&nbsp;<%=jldwmc%>）</font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">材料编码</div></td>
	  <td width="35%"> <%=clbm%>&nbsp;</td>
	  <td width="15%"> <div align="right">材料名称</div></td>
	  <td width="35%"><%=clmc%>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">材料大类</div></td>
	  <td width="35%"> <%=cldlmc%>&nbsp;</td>
	  <td width="15%"> <div align="right">材料规格&nbsp;</div></td>
	  <td width="35%"><%=clgg%>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">入库价</div></td>
	  <td width="35%"><%=cldj%>&nbsp;元</td>
	  <td width="15%"> <div align="right">出库价</div></td>
	  <td width="35%"> <%=fgsdj%>&nbsp;元</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">计量单位</div></td>
	  <td width="35%"><%=jldwmc%>&nbsp;</td>
	  <td width="15%"> <div align="right">签约百分比</div></td>
	  <td width="35%"> <%=qybfb%>%&nbsp;</td>
	</tr>
	 <tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">利润计算方式</div></td>
	  <td width="35%"> <%=lrjsfs%>&nbsp;</td>
	  <td width="15%"> <div align="right">利润百分比</div></td>
	  <td width="35%"> <%=lrbfb%>%&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">备注</div></td>
	  <td colspan="3"><%=bz%> </td>
	</tr>
</table>

&nbsp;<br><center><DIV><font color="blue" size="=2"><b>材料出库明细</b></font></DIV></center>&nbsp;<br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#cccccc" align="center" >
	<td width="5%">序号</td>
	  <td width="12%">出库批号</td>
	  <td width="12%">出库单位</td>
	  <td width="10%">客户编号</td>
	  <td width="5%">出库数量</td>
	  <td width="8%">出库金额</td>
	  <td width="12%">送货日期</td>
	  <td width="6%">是否减免</td>
	  <td width="20%">减免原因</td>
	</tr>
<%
/*******************************************************************\
|		辅材出库明细													|
\*******************************************************************/
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
String mxckph=null;
String mxkhbh=null;
double mxshsl=0;
double mxshje=0;
double summxshsl=0;
double summxshje=0;
String mxshqrsj=null;
String mxsfjm=null;
String mxjmyy=null;
String mxdwmc=null;
	ls_sql="select cl_ckmx.ckph ckph,khbh,shsl,to_char(shqrsj,'YYYY-MM-DD') shqrsj,shje,DECODE(sfjm,'0','正常','1','<font color=blue>减项</font>','2','<font color=red>免项</font>') sfjm,jmyy ,dwmc";
	ls_sql+=" from cl_ckmx,cl_ckd,sq_dwxx  ";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and cl_ckd.dwbh='"+ssfgs+"'  ";
	ls_sql+=" and ckzt='2' and clbm='"+whereclbm+"' ";
	if (!wheretime.equals(""))
	{
		ls_sql+=" and cksj>=to_date('"+wheretime+"','YYYY-MM-DD') ";
	}
	if (!wheretime2.equals(""))
	{
		ls_sql+=" and cksj<=to_date('"+wheretime2+"','YYYY-MM-DD') ";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
		{ 
		i+=1;
		mxckph=cf.fillNull(rs.getString("ckph"));
		mxkhbh=cf.fillNull(rs.getString("khbh"));
		mxshsl=rs.getDouble("shsl");
		mxshje=rs.getDouble("shje");
		mxshqrsj=cf.fillNull(rs.getString("shqrsj"));
		mxsfjm=cf.fillNull(rs.getString("sfjm"));
		mxjmyy=cf.fillNull(rs.getString("jmyy"));
		mxdwmc=cf.fillNull(rs.getString("dwmc"));
		summxshsl+=mxshsl;
		summxshje+=mxshje;
			%>
			<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center"><%=i%></div>
		</td>
		<td> 
			<div align="center"><%=mxckph%></div>
		</td>
		<td> 
			<div align="center"><%=mxdwmc%></div>
		</td>
		<td> 
			<div align="center"><a href="/khxx/ViewCrm_khxx.jsp?khbh=<%=mxkhbh%>" target="_back"><%=mxkhbh%></a></div>
		</td>
		<td> 
			<div align="center"><%=mxshsl%></div>
		</td>
		<td> 
			<div align="center"><%=mxshje%></div>
		</td>
		<td> 
			<div align="center"><%=mxshqrsj%></div>
		</td>
		<td> 
			<div align="center"><%=mxsfjm%></div>
		</td>
		<td> 
			<div align="center"><%=mxjmyy%></div>
		</td>
		</tr>
			<%
		}
			%>
			<tr bgcolor="#cccccc">
		<td> 
			<div align="center">合计</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=summxshsl%></div>
		</td>
		<td> 
			<div align="center"><%=summxshje%></div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		</tr>
			<%
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print(ls_sql+"<br>");
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
</table>