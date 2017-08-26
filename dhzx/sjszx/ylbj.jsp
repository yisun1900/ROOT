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
	//检查：是否可打印报价＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//初始化
	dzbj.Tzk tzk=new dzbj.Tzk();
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		%>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxTcDyKhList.jsp?khbh=<%=khbh%>')"  value="套餐－打印工程报价（客户）"   /></td>
		  </tr>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxTcDySgdList.jsp?khbh=<%=khbh%>')"  value="套餐－打印工程报价（工长）"   /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－主材清单" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－主材升级清单" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcSjList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－主材超量加价清单" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcClList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－需收费主材清单" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcSfList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="主材减免清单" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcZcJmList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="顶配主材清单" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyTcBcjList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="套餐－工长主材（充值）" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyGzClList_cz.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="家具套餐" onClick="window.open('/dzbjone/zxbjmx/Bj_zctcmcDyList.jsp?khbh=<%=khbh%>&lx=1')"  />
			<input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khwntcmcDyList.jsp?khbh=<%=khbh%>&lx=1')"  value="二次装修"  /></td>
		  </tr>

		  <tr align="center" >
			<td height="36">
			<input type="button" onClick="window.open('/dzbjone/zxbjmx/BjDyList.jsp?khbh=<%=khbh%>')"  value="套餐－总价"></td>
		  </tr>
		<%
	}
	else{
		%>
		  <tr  align="center">
			<td height="36">
			  <p>
			    <input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>')"  value="预览打印临时报价"   />
			  </p>
			  <p>
			    <input type="button" <%=mark%> onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyAllList.jsp?khbh=<%=khbh%>')"  value="检查报价"   />
			  </p>
		    </td>
		  </tr>
		<%
	}
%>

</table>

</body>
</html>

