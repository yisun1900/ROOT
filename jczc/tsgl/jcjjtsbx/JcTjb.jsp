<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String tsxlbm=request.getParameter("tsxlbm");
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.ddwbh='"+dwbh+"'";
	}


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>
<div align="center">施工队处罚统计表（录入时间：<%=kp_xjgdjl_lrsj%>---<%=kp_xjgdjl_lrsj2%>） </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr> 
    <td width="7%"> 
      <div align="center">排名</div>
    </td>
    <td width="22%"> 
      <div align="center">品牌</div>
    </td>
    <td width="13%"> 
      <div align="center">次数</div>
    </td>
    <td width="24%"> 
      <div align="center">原因</div>
    </td>
    <td width="34%"> 
      <div align="center">百分比</div>
    </td>
  </tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int row=0;

	ls_sql=" SELECT crm_khxx.sgd,sgdmc,count(distinct crm_tsjl.tsjlh)*1000 kfs,count(distinct crm_tsjl.tsjlh)*200 sgdfk";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd ";
    ls_sql+=" and crm_tsjl.lx='2'";//1：投诉；2：报修
    ls_sql+=" and crm_tsbm.tslxbm='11'";//11:工程报修
    ls_sql+=" and (crm_tsbm.jsxbm='03')";//Y：及时联系；N：未及时联系；W:情况未知
    ls_sql+=" and (crm_tsbm.zzjgbm!='3' or crm_tsbm.zzjgbm is null)";
    ls_sql+=" and crm_tsjl.clzt in('1','2','3')";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
    ls_sql+=wheresql;
 	ls_sql+=" and (crm_tsjl.slsj>=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
	ls_sql+=" and (crm_tsjl.slsj<=TO_DATE('"+kp_xjgdjl_lrsj2+"','YYYY/MM/DD'))";
    ls_sql+=" group by crm_khxx.sgd,sgdmc";

	ls_sql+=" order by kfs desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sgd=rs.getString("sgd");
		sgdmc=rs.getString("sgdmc");
		kfs=rs.getInt("kfs");
		sgdfk=rs.getInt("sgdfk");


		row++;

	
		%>  
		  <tr align="center"> 
			<td><%=row%></td>
			<td><%=row%></td>
			<td><%=row%></td>
			<td><%=row%></td>
			<td><%=row%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

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
  <tr> 
    <td width="7%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="24%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
</table>
</body>
</html>