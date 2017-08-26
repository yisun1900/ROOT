<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String lfjlh=request.getParameter("lfjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String lflxbm=null;
String smmb=null;
java.util.Date jhsmsj=null;
String jhsmry=null;
String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();


	ls_sql="select lfjlh,crm_lfjl.khbh,khxm,lflxbm,smmb,jhsmsj,jhsmry";
	ls_sql+=" from  crm_lfjl,crm_zxkhxx ";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
	ls_sql+=" and  crm_lfjl.khbh=crm_zxkhxx.khbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lflxbm=rs.getString("lflxbm");
		smmb=rs.getString("smmb");
		jhsmsj=rs.getDate("jhsmsj");
		jhsmry=rs.getString("jhsmry");
		khxm=rs.getString("khxm");
		khbh=rs.getString("khbh");
	}
	ps.close();
	rs.close();

%>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "宋体";
}
-->
</style>
<body>
<form name="form1" action="lfgcjh_save.jsp" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">量房计划</div></td>
  </tr>
   <tr>
   
 
    <td bgcolor="#FFFFFF" height=25><div align="right">客户编号</div></td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="20%" bgcolor="#FFFFFF"><div align="right">客户姓名       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td width="20%" bgcolor="#FFFFFF" height=25><div align="right">量房类型       </div></td>
    <td width="30%" bgcolor="#FFFFFF">     
	  <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm where lflxbm='"+lflxbm+"'","");
	  %> 
    </td>
   
  
 
    <td bgcolor="#FFFFFF"><div align="right">计划上门时间</div></td>
    <td bgcolor="#FFFFFF"><%=jhsmsj%></td>
   </tr>
   <tr>
    <td bgcolor="#FFFFFF" height=25><div align="right">计划上门人员</div></td>
    <td bgcolor="#FFFFFF" colspan=3><%=jhsmry%></td>
   
  </tr>
 
  <tr>
	 <td width="20%" bgcolor="#FFFFFF" height=25><div align="right">上门目标</div></td>
    <td width="28%" bgcolor="#FFFFFF" colspan=3> <%=smmb%></td> 
	</tr>
	
   
</table>
</form>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//参数FormName:Form的名称
{
	if(javaTrim(FormName.lflxbm)=="")
	{
	alert("量房类型不能为空");
	return flase();
	}
	if(javaTrim(FormName.jhsmry)=="")
	{
	alert("计划上门人员不能为空");
	return flase();
	}
	
	if(javaTrim(FormName.smmb)=="")
	{
	alert("上门目标不能为空");
	return flase();
	}
	
	if(javaTrim(FormName.jhsmsj)=="")
	{
	alert("计划上门时间不能为空");
	return flase();
	}
	if(!(isDatetime(FormName.jhsmsj, "录入时间"))) {
		return false;
	}
	
	FormName.submit();
	return true;
	
}

</SCRIPT>
