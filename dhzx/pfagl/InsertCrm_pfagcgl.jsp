<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>碰方案计划录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String khxm=null;
String smmb=null;
java.util.Date ysmsj=null;
String ysmry=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select khxm";
	ls_sql+=" from  crm_zxkhxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
	}
	ps.close();
	rs.close();
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
<form name="form1" action="SaveInsertCrm_pfagcgl.jsp" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">碰方案计划录入</div></td>
  </tr>
   <tr>
   
 
    <td bgcolor="#FFFFFF" height=25><div align="right">客户编号</div></td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="20%" bgcolor="#FFFFFF"><div align="right">客户姓名       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
   
    <td bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>计划碰方案时间</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="jhsj" ondblclick="JSCalendar(this)"/></td>

	 <td width="20%" bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>碰方案类型       </div></td>
    <td width="30%" bgcolor="#FFFFFF">      <select name="pfalxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option></option>
	  <%
		cf.selectItem(out,"select pfalxbm,pfalxmc from dm_pfalxbm ","");
	%> 
    </select></td>
   </tr>
   <tr>
    <td bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>计划参加人员</div></td>
    <td bgcolor="#FFFFFF" colspan=3><input type="text" name="jhry" /></td>
   
  </tr>
 
  <tr>
	 <td width="20%" bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>碰方案内容</div></td>
    <td width="28%" bgcolor="#FFFFFF" colspan=3> <textarea name="pfanr" style="width:70%" rows="6"></textarea></td> 
	</tr>
	<tr>
    <td colspan="4" bgcolor="#FFFFFF">      <div align="center">
        <input type="button" name="Submit" value="提交" onclick="f_do(form1)"/>
		 <input type="hidden" name="khbh" value="<%=khbh%>" />
      </div></td></tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//参数FormName:Form的名称
{
	if(javaTrim(FormName.pfalxbm)=="")
	{
	alert("碰方案类型不能为空");
	return flase();
	}
	if(javaTrim(FormName.jhry)=="")
	{
	alert("计划参加人员不能为空");
	return flase();
	}
	
	if(javaTrim(FormName.pfanr)=="")
	{
	alert("碰方案内容不能为空");
	return flase();
	}
	
	if(javaTrim(FormName.jhsj)=="")
	{
	alert("计划碰方案时间不能为空");
	return flase();
	}
	if(!(isDatetime(FormName.jhsj, "录入时间"))) {
		return false;
	}
	
	FormName.submit();
	return true;
	
}

</SCRIPT>
