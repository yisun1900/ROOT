<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "����";
}
-->
</style>
</head>


<%
String khbh=request.getParameter("khbh");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String xmbh=null;
String wybh=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
double dj=0;
String bz=null;
String fjzcxq=null;

int fjsl=0;
double fjmj=0;
double fjg=0;
double zdyxmmj=0;
double zdybzmj=0;
int xuhao=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<center>
    <span class="STYLE2">������Ϣ</span>
</center>
  <table border="1" cellspacing="0" cellpadding="1" width="130%" style='FONT-SIZE: 12px' >
    
  <tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="4%"><font color="#0000FF"><b>�������</b></font></td>
	  <td  width="9%">��������</td>
	  <td  width="5%"><font color="#0000FF"><b>����������O��</b></font></td>
	  <td  width="5%"><font color="#0000FF"><b>����ߣ��ף�</b></font></td>
	  <td  width="5%"><font color="#0000FF"><b>�Զ���ľ��������O��)</b></font></td>
	  <td  width="5%"><font color="#0000FF"><b>�Զ����ֽ������O��)</b></font></td>
      <td  width="38%" ><b><font color="#0000FF">������������</font></b></td>
      <td  width="29%" ><b><font color="#0000FF">��ע</font></b></td>
    </tr>

<%
	ls_sql="SELECT jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,xuhao,bz,fjzcxq";
	ls_sql+=" FROM bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by xuhao";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		fjmj=rs.getDouble("fjmj");
		fjg=rs.getDouble("fjg");
		zdyxmmj=rs.getDouble("zdyxmmj");
		zdybzmj=rs.getDouble("zdybzmj");
		xuhao=rs.getInt("xuhao");
		bz=cf.fillHtml(rs.getString("bz"));
		fjzcxq=cf.fillHtml(rs.getString("fjzcxq"));

		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//���ÿ������
		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
	<td><%=xuhao%></td>
	<td><%=jgwzbm%></td>
	<td><%=fjmj%></td>
	<td><%=fjg%></td>
	<td><%=zdyxmmj%></td>
	<td><%=zdybzmj%></td>
	<td align="left"><%=fjzcxq%></td>
	<td align="left"><%=bz%></td>
  </tr>

	<%
		row++;
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("��������: " + e);
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

