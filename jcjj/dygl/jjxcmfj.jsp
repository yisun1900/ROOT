<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String ddbh=request.getParameter("ddbh");
String khxm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double htze=0;
double jjje=0;
double xcmje=0;
try {
	conn=cf.getConnection();
	ls_sql="select khxm,htze,jjje,xcmje";
	ls_sql+=" from  jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		htze=rs.getDouble("htze");
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>松下亿达家具附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr align="right"> 
    <td colspan="3"> 
      <div align="center"><strong>家具合同附件－－型材门部分（姓名：<%=khxm%>；订单号：<%=ddbh%>）</strong></div>
    </td>
  </tr>
</table> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">型材门名称</td>
	<td  width="8%">安装位置</td>
	<td  width="9%">规格（mm）</td>
	<td  width="15%">边框型号</td>
	<td  width="8%">边框颜色</td>
	<td  width="11%">面板材料1 </td>
	<td  width="11%">面板材料2</td>
	<td  width="8%">总价</td>
	<td  width="21%">备注</td>
</tr>
<%
	ls_sql="SELECT xcmmc,azwz,gd||'*'||kd,bklxxh,bkys,mbcl1,mbcl2,zj,bz  ";
	ls_sql+=" FROM jc_jjxcmmx";
	ls_sql+=" where jc_jjxcmmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table> 

累计金额（小写）：<%=cf.doubleTrim(xcmje)%>元
<br>
累计金额（大写）：<%=cf.NumToRMBStr(cf.doubleTrim(xcmje))%>
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
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
