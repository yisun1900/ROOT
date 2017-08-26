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
    <td width="12%"> 
      <div align="center">物料编码</div>
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
      <div align="center">项目编号</div>
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
String xmbh=null;

String getwlbm=null;
String getglmc=null;
String getxhgg=null;
String getpp=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	int row=0;
	int sbrow=0;
	ls_sql="SELECT glbxh,glmc,xhgg,pp,wlbm,xmbh";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glflbm='1'";
	ls_sql+=" order by wlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
	    glbxh=rs.getLong("glbxh");
	    glmc=cf.fillNull(rs.getString("glmc"));
	    xhgg=cf.fillNull(rs.getString("xhgg"));
	    pp=cf.fillNull(rs.getString("pp"));
	    wlbm=cf.fillNull(rs.getString("wlbm"));
	    xmbh=cf.fillNull(rs.getString("xmbh"));

		row++;

		getwlbm="";
		getglmc="";
		getxhgg="";
		getpp="";
		int count=0;
		ls_sql="SELECT wlbm,glmc,xhgg,pp";
		ls_sql+="  FROM bj_jzcljgb";
		ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+wlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			getwlbm=cf.fillNull(rs1.getString("wlbm"));
			getglmc=cf.fillNull(rs1.getString("glmc"));
			getxhgg=cf.fillNull(rs1.getString("xhgg"));
			getpp=cf.fillNull(rs1.getString("pp"));

			count=1;
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			ls_sql="update bj_jzglfxb set glmc='"+getglmc+"',xhgg='"+getxhgg+"',pp='"+getpp+"'";
			ls_sql+=" where glbxh="+glbxh;
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else{
			sbrow++;

			if (xhgg.equals(""))
			{
				xhgg="&nbsp;";
			}
			if (pp.equals(""))
			{
				pp="&nbsp;";
			}

			%>
			  <tr align="center"> 
				<td><%=sbrow%></td>
				<td><%=glbxh%></td>
				<td><%=wlbm%></td>
				<td><%=glmc%></td>
				<td><%=xhgg%></td>
				<td><%=pp%></td>
				<td><%=xmbh%></td>
			  </tr>
			<%
		}


	}
	rs.close();
	ps.close();

	conn.commit();

	out.println("更新完成，更新失败数："+sbrow);

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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
