<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String ssfgs=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(distinct fgsbh)";
	ls_sql+=" from jc_cgdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>1)
	{
		out.println("错误！只有同一分公司订单可批量修改");
		return;
	}

	ls_sql="select count(*)";
	ls_sql+=" from jc_cgdd";
	ls_sql+=" where clzt not in('00','01','03','05','07','09','11','13','15','98','99') and "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count!=ddbh.length)
	{
		out.println("错误！只有[已派单、未退单]的订单可批量修改");
		return;
	}

	ls_sql="select fgsbh";
	ls_sql+=" from jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString(1);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">批量修改供应商</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="37%" align="right" height="54">橱柜工厂</td>
              <td width="63%" height="54"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:300PX">
                  <option value=""></option>
<%
	String listSql="select sq_gysxx.gysbh,sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+ssfgs+"' and sq_gysxx.gyslb='2' order by sq_gysxx.gysmc";
	cf.selectItem(out,listSql,"");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center"> 
<%
	for (int i=0;i<ddbh.length ;i++ )
	{
		%>
		  <input type="hidden" name="ddbh" value="<%=ddbh[i]%>" >
		<%
	}
%>
                  <input type="button"  value="批量修改工厂" onClick="f_do(editform)">
                </div>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.pdgc)=="") {
		alert("请输入[橱柜工厂]！");
		FormName.pdgc.focus();
		return false;
	}


	FormName.action="SavePlxgGys.jsp";
	FormName.submit();
	return true;
}

</SCRIPT>
