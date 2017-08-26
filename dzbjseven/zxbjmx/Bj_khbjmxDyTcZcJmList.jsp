<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
//把升级按空间、主材小类显示

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;


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
String dqbm=null;
String bjbbh=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj,bjbbh";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=cf.fillNull(rs.getString("fwmj"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();


%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>套餐－主材减免清单</B></td>
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
      <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >签约店面：&nbsp;</td>
    <td align="left" >材料顾问：&nbsp;</td>
	<td >套餐级别：&nbsp;</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="6%">序号</td>
    <td  width="20%">产品大类</td>
    <td  width="20%">产品类别</td>
    <td  width="12%">计量单位</td>
    <td  width="12%">减免单价</td>
    <td  width="12%">减免数量</td>
    <td  width="16%">减免金额</td>
  </tr>

	
<%
	String cldlmc=null;
	String tccplbmc=null;
	String jldw=null;
	double jmdj=0;
	double sjjmsl=0;
	double sjjmje=0;

	double allsl=0;
	double allje=0;

	ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
	ls_sql+=" FROM tc_csrjkhmmjmj,jxc_cldlbm,jxc_clxlbm ";
    ls_sql+=" where tc_csrjkhmmjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_csrjkhmmjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tc_csrjkhmmjmj.khbh='"+khbh+"' ";
    ls_sql+=" and tc_csrjkhmmjmj.sjjmsl>0";
	ls_sql+=" order by tc_csrjkhmmjmj.tccpdlbm,tc_csrjkhmmjmj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlmc=rs.getString("cldlmc");
		tccplbmc=rs.getString("clxlmc");
		jldw=rs.getString("jldw");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");

		allsl+=sjjmsl;
		allje+=sjjmje;

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td ><%=row%></td>
			<td ><%=cldlmc%></td>
			<td><%=tccplbmc%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(jmdj)%></td>
			<td><%=cf.formatDouble(sjjmsl)%></td>
			<td><%=cf.formatDouble(sjjmje)%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();



	ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
	ls_sql+=" FROM tc_csrjkhcgjmj,jxc_cldlbm,jxc_clxlbm ";
    ls_sql+=" where tc_csrjkhcgjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_csrjkhcgjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tc_csrjkhcgjmj.khbh='"+khbh+"' ";
    ls_sql+=" and tc_csrjkhcgjmj.sjjmsl>0";
	ls_sql+=" order by tc_csrjkhcgjmj.tccpdlbm,tc_csrjkhcgjmj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlmc=rs.getString("cldlmc");
		tccplbmc=rs.getString("clxlmc");
		jldw=rs.getString("jldw");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");

		allsl+=sjjmsl;
		allje+=sjjmje;

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td ><%=row%></td>
			<td ><%=cldlmc%></td>
			<td><%=tccplbmc%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(jmdj)%></td>
			<td><%=cf.formatDouble(sjjmsl)%></td>
			<td><%=cf.formatDouble(sjjmje)%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();


	ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
	ls_sql+=" FROM tc_csrjkhjjjmj,jxc_cldlbm,jxc_clxlbm ";
	ls_sql+=" where tc_csrjkhjjjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
	ls_sql+=" and tc_csrjkhjjjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and tc_csrjkhjjjmj.khbh='"+khbh+"' ";
	ls_sql+=" and tc_csrjkhjjjmj.sjjmsl>0";
	ls_sql+=" order by tc_csrjkhjjjmj.tccpdlbm,tc_csrjkhjjjmj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlmc=rs.getString("cldlmc");
		tccplbmc=rs.getString("clxlmc");
		jldw=rs.getString("jldw");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");

		allsl+=sjjmsl;
		allje+=sjjmje;

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td ><%=row%></td>
			<td ><%=cldlmc%></td>
			<td><%=tccplbmc%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(jmdj)%></td>
			<td><%=cf.formatDouble(sjjmsl)%></td>
			<td><%=cf.formatDouble(sjjmje)%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
	ls_sql+=" FROM tc_csrjkhczjmj,jxc_cldlbm,jxc_clxlbm ";
	ls_sql+=" where tc_csrjkhczjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
	ls_sql+=" and tc_csrjkhczjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and tc_csrjkhczjmj.khbh='"+khbh+"' ";
	ls_sql+=" and tc_csrjkhczjmj.sjjmsl>0";
	ls_sql+=" order by tc_csrjkhczjmj.tccpdlbm,tc_csrjkhczjmj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlmc=rs.getString("cldlmc");
		tccplbmc=rs.getString("clxlmc");
		jldw=rs.getString("jldw");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");

		allsl+=sjjmsl;
		allje+=sjjmje;

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td ><%=row%></td>
			<td ><%=cldlmc%></td>
			<td><%=tccplbmc%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(jmdj)%></td>
			<td><%=cf.formatDouble(sjjmsl)%></td>
			<td><%=cf.formatDouble(sjjmje)%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
	ls_sql+=" FROM tc_csrjkhlkbjmj,jxc_cldlbm,jxc_clxlbm ";
	ls_sql+=" where tc_csrjkhlkbjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
	ls_sql+=" and tc_csrjkhlkbjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and tc_csrjkhlkbjmj.khbh='"+khbh+"' ";
	ls_sql+=" and tc_csrjkhlkbjmj.sjjmsl>0";
	ls_sql+=" order by tc_csrjkhlkbjmj.tccpdlbm,tc_csrjkhlkbjmj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlmc=rs.getString("cldlmc");
		tccplbmc=rs.getString("clxlmc");
		jldw=rs.getString("jldw");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");

		allsl+=sjjmsl;
		allje+=sjjmje;

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td ><%=row%></td>
			<td ><%=cldlmc%></td>
			<td><%=tccplbmc%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(jmdj)%></td>
			<td><%=cf.formatDouble(sjjmsl)%></td>
			<td><%=cf.formatDouble(sjjmje)%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
	ls_sql+=" FROM tc_csrjkhdbjmj,jxc_cldlbm,jxc_clxlbm ";
	ls_sql+=" where tc_csrjkhdbjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
	ls_sql+=" and tc_csrjkhdbjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and tc_csrjkhdbjmj.khbh='"+khbh+"' ";
	ls_sql+=" and tc_csrjkhdbjmj.sjjmsl>0";
	ls_sql+=" order by tc_csrjkhdbjmj.tccpdlbm,tc_csrjkhdbjmj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlmc=rs.getString("cldlmc");
		tccplbmc=rs.getString("clxlmc");
		jldw=rs.getString("jldw");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");

		allsl+=sjjmsl;
		allje+=sjjmje;

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td ><%=row%></td>
			<td ><%=cldlmc%></td>
			<td><%=tccplbmc%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(jmdj)%></td>
			<td><%=cf.formatDouble(sjjmsl)%></td>
			<td><%=cf.formatDouble(sjjmje)%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF"  align="center"> 
	<td colspan="2">合计</td>

	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allsl)%></td>
	<td><%=cf.formatDouble(allje)%></td>
   </tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">客户签字：            </td>
    <td colspan="2" height="32">设计师签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">日期：</td>
    <td colspan="2" height="32">日期：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">材料员签字：</td>
    <td colspan="2" height="32">店面经理签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">日期：</td>
    <td colspan="2" height="32">日期：</td>
</table>

</td></tr>
</TBODY>

</table>


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






