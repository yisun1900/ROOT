<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hfjlh=null;
String jglxmc=null;
String khbh=null;

String hfsm=null;

String clfs=null;
String dwmc=null;
String hfsj=null;
String hfr=null;

String khxm=null;
String bz=null;
String fwdz=null;


String wherehfjlh=null;
wherehfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_sjhfjl.bz,khxm,fwdz,crm_sjhfjl.hfjlh,jglxmc,dwmc,crm_sjhfjl.khbh,hfsm,crm_sjhfjl.clfs,crm_sjhfjl.hfsj,crm_sjhfjl.hfr";
	ls_sql+=" from  crm_sjhfjl,dm_jglxbm,crm_khxx,sq_dwxx";
	ls_sql+=" where crm_sjhfjl.jglxbm=dm_jglxbm.jglxbm and crm_sjhfjl.hfbm=sq_dwxx.dwbh and  (crm_sjhfjl.hfjlh="+wherehfjlh+")  ";
	ls_sql+=" and crm_sjhfjl.khbh=crm_khxx.khbh";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bz=cf.fillNull(rs.getString("bz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		jglxmc=cf.fillNull(rs.getString("jglxmc"));
		khbh=cf.fillNull(rs.getString("khbh"));

		dwmc=cf.fillNull(rs.getString("dwmc"));
		hfsm=cf.fillNull(rs.getString("hfsm"));

		clfs=cf.fillNull(rs.getString("clfs"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
	}
	rs.close();
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
<div align="center">回访记录</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      回访记录号    </td>
    <td width="31%"> <%=hfjlh%> </td>
    <td width="17%" align="right">回访结果</td>
    <td width="34%"><%=jglxmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      客户编号    </td>
    <td width="31%"> <%=khbh%> </td>
    <td width="17%" align="right"> 
      客户姓名    </td>
    <td width="34%"><%=khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">回访说明</td>
    <td colspan="3"><%=hfsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">回访人</td>
    <td width="31%"><%=hfr%></td>
    <td width="17%" align="right">回访部门</td>
    <td width="34%"><%=dwmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      处理方式    </td>
    <td width="31%"><%
	cf.selectToken(out,"0+不需处理&1+反馈相关部门",clfs,true);
%> </td>
    <td width="17%" align="right">回访时间</td>
    <td width="34%"><%=hfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" height="18">备注</td>
    <td colspan="3" height="18"><%=bz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">反馈部门</td>
	<td  width="8%">处理状态</td>
	<td  width="52%">相关部门对新问题处理</td>
	<td  width="8%">处理人</td>
	<td  width="12%">处理时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT dwmc,DECODE(clzt,'Y','已处理','N','未处理'),xwtclqk,clr,clsj";
	ls_sql+=" FROM crm_sjhffkbm,sq_dwxx  ";
    ls_sql+=" where crm_sjhffkbm.dwbh=sq_dwxx.dwbh";
    ls_sql+=" and  hfjlh="+wherehfjlh;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>
