<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

String sfkdybj="";
String bjjb=null;
String lx="";

String mark="";
try {
	conn=cf.getConnection();

	//检查：是否可打印报价＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String bjdysq="";
	sql="select bjjb,bjdysq";
	sql+=" from  crm_zxkhxx";
	sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//0：未授权；1：可导出；2：可打印
	}
	rs.close();
	ps.close();



	//初始化
	dzbj.Tzk tzk=new dzbj.Tzk();
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"csrj");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");

	//修改：电子报价总额
	sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	
	
	//套餐
	sql="select lx";
	sql+=" from  bdm_bjjbbm";
	sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>电子报价打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr  align="center">
    <td height="90"><span class="STYLE1">打印电子报价（客户编号：<%=khbh%>）</span></td>
  </tr>

<%
	if (lx.equals("1"))//1：非套餐；2：套餐
	{
		%>
		  <tr  align="center">
			<td height="46">
			  <p>
				<input type="button" <%=mark%> onClick="window.open('/dzbjseven/zxbjmx/Crm_khbjdy4.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')"  value="打印4项电子报价"   />
			  </p>
			  <p>
				<input type="button" <%=mark%> onClick="window.open('/dzbjseven/zxbjmx/Crm_khbjdy6.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')"  value="打印6项电子报价"   />
			  </p>
			  <p>
				<input type="button" <%=mark%> onClick="window.open('/dzbjseven/zxbjmx/Crm_khbjdy61.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')"  value="打印6项电子报价(无小计)"   />
			  </p>
			  <p>
				<input type="button" <%=mark%> onClick="window.open('/dzbjseven/zxbjmx/Crm_khbjdy7.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')"  value="打印7项电子报价"   />
			  </p>
			  <p>
				<input type="button" <%=mark%> onClick="window.open('/dzbjseven/zxbjmx/Crm_khbjdy1.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')"  value="打印1项电子报价"   />
			  </p>
			<p>
				<input type="button" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxDyLsBjList.jsp?khbh=<%=khbh%>')"  value="打印临时报价"   />
			  </p>
					  <p>
						<input type="button" <%=mark%> onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxDyAllList.jsp?khbh=<%=khbh%>')"  value="检查报价"   />
					  </p>			</td>
		  </tr>
		<%
	}
	else{
		%>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxTcDyKhList.jsp?khbh=<%=khbh%>')"  value="套餐－打印工程报价（客户）"   /></td>
		  </tr>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxTcDySgdList.jsp?khbh=<%=khbh%>')"  value="套餐－打印工程报价（工长）"   /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－主材清单" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxDyTcZcList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  

		  <tr align="center" >
			<td height="36">
			<input type="button" onClick="window.open('/dzbjseven/zxbjmx/BjDyList.jsp?khbh=<%=khbh%>')"  value="套餐－总价"></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="精装包含项目" onClick="window.open('/dzbjseven/zxbjmx/Tc_khbzxmList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		<%
	}
%>
</table>

</body>
</html>

