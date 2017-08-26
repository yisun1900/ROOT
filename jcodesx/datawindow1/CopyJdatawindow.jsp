<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%

String dw_name=null;
String dw_note=null;
String dw_sql=null;
String dw_fromsql=null;
String dw_wheresql=null;
String dw_ordersql=null;
String dw_pritable=null;
String wheredw_name=request.getParameter("dw_name");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select dw_name,dw_note,dw_sql,dw_fromsql,dw_wheresql,dw_ordersql,dw_pritable ";
	ls_sql+=" from  jdatawindow_note";
	ls_sql+=" where  (dw_name='"+wheredw_name+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dw_name=cf.fillNull(rs.getString("dw_name"));
		dw_note=cf.fillNull(rs.getString("dw_note"));
		dw_sql=cf.fillNull(rs.getString("dw_sql"));
		dw_fromsql=cf.fillNull(rs.getString("dw_fromsql"));
		dw_wheresql=cf.fillNull(rs.getString("dw_wheresql"));
		dw_ordersql=cf.fillNull(rs.getString("dw_ordersql"));
		dw_pritable=cf.fillNull(rs.getString("dw_pritable"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 查看数据窗口信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="19%"> 
              <div align="right">DataWindow名称</div>
            </td>
            <td width="22%"> <%=dw_name%> </td>
            <td width="19%"> 
              <div align="right">主表</div>
            </td>
            <td width="40%"><%=dw_pritable%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="19%" align="right">DataWindow说明</td>
            <td colspan="3"><%=dw_note%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="19%"> 
              <div align="right">DataWindow SQL</div>
            </td>
            <td colspan="3"> <%=dw_sql%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="19%" align="right">FromSQL</td>
            <td colspan="3"><%=dw_fromsql%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="19%" align="right">WhereSQL</td>
            <td colspan="3"><%=dw_wheresql%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="19%"> 
              <div align="right">OrderSQL</div>
            </td>
            <td colspan="3"><%=dw_ordersql%> </td>
          </tr>
          <input type="hidden" name="wheredw_name"  value="<%=wheredw_name%>" >
        </table>

<%
	ybl.common.PageObject pageObject=new ybl.common.PageObject();

	ls_sql="SELECT column_id,dw_name,table_name,column_name,column_china,data_type,data_length,nullable,data_default,DECODE(column_type,'E','编辑框','ME','多行编辑框','S','下拉列表框','SDB','数据库下拉列表框','R','单选钮','RDB','数据库单选钮'),type_date,iskey  ";
	ls_sql+=" FROM jdatawindow  ";
    ls_sql+=" WHERE dw_name='"+dw_name+"' order by column_id";
   
	pageObject.sql=ls_sql;

	pageObject.initPage("","","","");
	pageObject.setPageRow(20000);
%>

<%
	pageObject.out=out;
	pageObject.getDate(1);
	pageObject.printPageLink(100,false);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="4%">DataWindow名称</td>
	<td  width="8%">表名</td>
	<td  width="8%">字段名</td>
	<td  width="12%">字段中文名</td>
	<td  width="6%">字段类型</td>
	<td  width="6%">长度</td>
	<td  width="4%">可空</td>
	<td  width="4%">缺省值</td>
	<td  width="10%">字段编辑类型</td>
	<td  width="30%">编辑类型数据</td>
	<td  width="4%">主键列</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

	  </div>
    </td>
  </tr>
</table>
</body>
</html>
