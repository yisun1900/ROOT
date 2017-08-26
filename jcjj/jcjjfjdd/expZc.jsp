<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" cellspacing="0" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCFF" height="20" align="center"  >
  <td width="8%">结构位置</td>
  <td width="9%">品牌</td>
  <td width="12%">名称</td>
  <td width="12%">型号</td>
  <td width="12%">规格</td>
  <td width="5%">单位</td>
  <td width="6%">数量</td>
  <td width="6%">原价</td>
  <td width="6%">单价</td>
  <td width="6%">成本价</td>
  <td width="6%">远程费</td>
  <td width="6%">其它费项目</td>
  <td width="6%">其它费</td>
</tr>

<%

String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
int row=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khzcmxnew";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	String bgcolor="";

	//套餐升级分类编码:不为空
	String jgwzbm=null;
	String lrxh=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String zcbm=null;
	String zcmc=null;
	String ppmc=null;
	String jldwbm=null;
	String xinghao=null;
	String gg=null;
	double zqdj=0;
	double dpzk=0;
	double dj=0;
	double cbj=0;
	double sl=0;
	double ycf=0;
	String qtfy=null;
	double qtfyje=0;

	ls_sql="SELECT zcpzwzbm,xh,zcdlbm,zcxlbm,zcbm,zcmc,ppmc,xinghao,gg,zcysbm,jldwbm,zqdj,dpzk,zqdj,dpzk,dj,cbj,sl,ycf,DECODE(qtfy,'1','安装费','2','加工费','3','其它收费','W','无') qtfy,qtfyje";
	if (count>0)
	{
		ls_sql+=" FROM bj_khzcmxnew";
	}
	else{
		ls_sql+=" FROM bj_khzcmx";
	}
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zcpzwzbm,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		lrxh=rs.getString("xh");
		zcdlbm=rs.getString("zcdlbm");
		zcxlbm=rs.getString("zcxlbm");

		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));


		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		cbj=rs.getDouble("cbj");
		sl=rs.getDouble("sl");
		ycf=rs.getDouble("ycf");
		qtfy=cf.fillNull(rs.getString("qtfy"));
		qtfyje=rs.getDouble("qtfyje");


		row++;


		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//输出每行数据
		%>
		<tr bgcolor="<%=bgcolor%>" align="center"  >
		  <td><%=jgwzbm%>
		  </td>
		  <td><%=ppmc%></td>
		  <td><%=zcmc%></td>
		  <td><%=xinghao%></td>
		  <td><%=gg%></td>
		  <td><%=jldwbm%></td>
		  <td><%=sl%></td>
		  <td><%=zqdj%>
			</td>
		  <td><%=dj%>
			</td>
		  <td><%=cbj%>
		  </td>
		  <td><%=ycf%>
			</td>
		  <td><%=qtfy%></td>
		  <td><%=qtfyje%>
			</td>
		</tr>
		<%
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
</table>

</body>
</html>
