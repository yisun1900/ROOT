
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
String ls_sql=null;

String bjjb=null;
String lx="";

String mark="";
String ysshbz="";
try {
	conn=cf.getConnection();

	//检查：是否可打印报价＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String ssfgs="";
	String bjdysq="";
	int bjdycs=0;
	ls_sql="SELECT ssfgs,ysshbz,bjdysq,bjdycs,bjjb";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//是否启用预算审核  B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印授权  0：未授权；1：可导出；2：可打印
		bjdycs=rs.getInt("bjdycs");//报价打印次数
		bjjb=cf.fillNull(rs.getString("bjjb"));//是否启用预算审核  B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权

	}
	rs.close();
	ps.close();
	
	//检查[预算审核]：是否允许打印＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String sfqyyssh="";
	String getbjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//是否启用预算审核  Y：启用；N：不启用
		getbjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印是否需授权  1：不需授权；2：只需一次授权；3：每次打印都需授权
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y"))//是否启用预算审核  Y：启用；N：不启用
	{
		if (!ysshbz.equals("Y"))//B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		{
			out.println("错误！[预算审核]未通过，不能打印报价");
			return;
		}
	}
	//检查[预算审核]：是否允许打印＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝开始

	//检查[打印授权]：是否可打印报价＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String sfkdybj="";
	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//是否可打印报价  Y：需授权打印；N：不需授权打印；M：不能打印
	}
	rs.close();
	ps.close();

	if (sfkdybj.equals("M"))//M：不能打印
	{
		out.println("错误！您无权打印报价");
		return;
	}
	else if (sfkdybj.equals("Y"))//Y：需授权打印
	{
		if (getbjdysq.equals("2"))//2：只需一次授权
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0：未授权；1：可导出；2：可打印
			{
				out.println("错误！您需授权才能打印报价，目前未授权");
				return;
			}
		}
		else if (getbjdysq.equals("3"))//3：每次打印都需授权
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0：未授权；1：可导出；2：可打印
			{
				out.println("错误！您需授权才能打印报价，目前未授权");
				return;
			}
			else{
				if (bjdycs>=2)
				{
					out.println("错误！每次授权只能打印两次，目前已超过限制："+bjdycs+"，需重新授权");
					return;
				}
			}
		}
		else{
			out.println("错误！需授权才能打印报价，在【电子报价参数－维护 】模块，参数【报价打印是否需授权】设置不正确");
			return;
		}
	}
	//检查[打印授权]：是否允许打印＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
 	//检查：是否可打印报价＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//精装
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>ls_sql=" + ls_sql);
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
	if (lx.equals("1"))//1：非精装；2：精装
	{
		%>

  <tr  align="center">
	<td height="46">
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy4.jsp?khbh=<%=khbh%>')"  value="打印4项电子报价"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy6.jsp?khbh=<%=khbh%>')"  value="打印6项电子报价"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy62.jsp?khbh=<%=khbh%>')"  value="打印6项电子报价(西安)"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy61.jsp?khbh=<%=khbh%>')"  value="打印6项电子报价(无小计)"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy7.jsp?khbh=<%=khbh%>')"  value="打印7项电子报价"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('Crm_khbjdy1.jsp?khbh=<%=khbh%>')"  value="打印1项电子报价"   />
	  </p>
	<p>
		<input type="button" onClick="window.open('Bj_khbjmxDyLsBjList.jsp?khbh=<%=khbh%>')"  value="打印临时报价"   />
	  </p>
			  <p>
			    <input type="button" <%=mark%> onClick="window.open('Bj_khbjmxDyAllList.jsp?khbh=<%=khbh%>')"  value="检查报价"   />
			  </p>
	</td>
  </tr>
		<%
	}
	else{
		%>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxTcDyKhList.jsp?khbh=<%=khbh%>')"  value="精装－打印工程报价（客户）"   /></td>
		  </tr>
		  <tr align="center" >
			<td height="36"><input type="button" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxTcDySgdList.jsp?khbh=<%=khbh%>')"  value="精装－打印工程报价（工长）"   /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="精装－主材清单" onClick="window.open('/dzbjseven/zxbjmx/Bj_khbjmxDyTcZcList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  

		  <tr align="center" >
			<td height="36">
			<input type="button" onClick="window.open('/dzbjseven/zxbjmx/BjDyList.jsp?khbh=<%=khbh%>')"  value="精装－总价"></td>
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


