<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
    <td width="7%"> 
      <div align="center">序号</div>
    </td>
    <td width="10%"> 
      <div align="center">工料表序号</div>
    </td>
    <td width="19%"> 
      <div align="center">工料名称</div>
    </td>
    <td width="19%"> 
      <div align="center">型号规格</div>
    </td>
    <td width="22%"> 
      <div align="center">品牌</div>
    </td>
    <td width="12%"> 
      <div align="center">新编码</div>
    </td>
    <td width="11%"> 
      <div align="center">原编码</div>
    </td>
  </tr>


<%

String dqbm=request.getParameter("dqbm");
String xzfw=request.getParameter("xzfw");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

long glbxh=0;
String glmc=null;
String xhgg=null;
String pp=null;
String wlbm=null;

String getwlbm=null;
String getxhgg=null;
String getpp=null;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="SELECT glbxh,glmc,xhgg,pp,wlbm";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glflbm='1'";
	if (xzfw.equals("2"))//更新【物料编码】为空记录
	{
		ls_sql+=" and wlbm is null";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
	    glbxh=rs.getLong("glbxh");
	    glmc=cf.fillNull(rs.getString("glmc"));
	    xhgg=cf.fillNull(rs.getString("xhgg"));
	    pp=cf.fillNull(rs.getString("pp"));
	    wlbm=cf.fillNull(rs.getString("wlbm"));

		getwlbm="";
		getxhgg="";
		getpp="";
		ls_sql="SELECT wlbm,xhgg,pp";
		ls_sql+="  FROM bj_jzcljgb";
		ls_sql+=" where dqbm='"+dqbm+"' and glmc='"+glmc+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			getwlbm=cf.fillNull(rs1.getString("wlbm"));
			getxhgg=cf.fillNull(rs1.getString("xhgg"));
			getpp=cf.fillNull(rs1.getString("pp"));
		}
		rs1.close();
		ps1.close();

		if (!getwlbm.equals(""))
		{
			row++;

			ls_sql="update bj_jzglfxb set wlbm='"+getwlbm+"'";
			ls_sql+=" where glbxh="+glbxh;
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			if (xhgg.equals(""))
			{
				xhgg="&nbsp;";
			}
			if (pp.equals(""))
			{
				pp="&nbsp;";
			}
			if (wlbm.equals(""))
			{
				wlbm="&nbsp;";
			}

			%>
			  <tr align="center"> 
				<td><%=row%></td>
				<td><%=glbxh%></td>
				<td><%=glmc%></td>
				<td><%=xhgg%></td>
				<td><%=pp%></td>
				<td><%=getwlbm%></td>
				<td><%=wlbm%></td>
			  </tr>
			<%
		}
	}
	rs.close();
	ps.close();

	out.println("更新完成，共更新记录数："+row);

}
catch (Exception e) {
	out.print("Exception: " + e);
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


</table>
</body>
</html>
