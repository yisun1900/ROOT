<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
int sxjlh=0;
int gdsl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(sxjlh),1)";
	ls_sql+=" from  kp_sxgdjl";
	ls_sql+=" where yhdlm='"+yhdlm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxjlh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  kp_sxgdjl";
	ls_sql+=" where yhdlm='"+yhdlm+"'  and sxjlh="+sxjlh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 随机筛选工地</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="139" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="48%" align="right" height="52">分公司</td>
              <td width="52%" height="52">
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
                 </select>
              </td>
           </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="48%" align="right" height="52">筛选批号</td>
              <td width="52%" height="52"> 
                <input type="text" name="sxjlh" size="20" maxlength="20" value="<%=sxjlh%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="48%" align="right" height="45">已筛选工地数量</td>
              <td width="52%" height="45"> 
                <input type="text" name="sl" size="20" maxlength="20" value="<%=gdsl%>" readonly>
              </td>
            </tr>
            <tr> 
              <td colspan="2" align="center" height="47"> 
                <input type="button"  value="继续筛选" onClick="f_do(insertform,'old')">
                <input type="button"  value="使用新批号" onClick="f_do(insertform,'new')">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[分公司]！");
		FormName.fgs.focus();
		return false;
	}

	FormName.action="EnterSxtj.jsp?sx="+lx;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
