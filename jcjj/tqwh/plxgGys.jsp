<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
String ssfgs=null;
String zcxlbm=null;
try {
	conn=cf.getConnection();

	stmt = conn.createStatement();

	ls_sql="select count(distinct fgsbh)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("错误！只能同一公司的订单，才能批量修改");
		return;
	}

	ls_sql="select count(distinct zcxlbm)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("错误！主材小类必须相同");
		return;
	}

	ls_sql="select fgsbh,zcxlbm";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh[0]+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
		zcxlbm=rs.getString("zcxlbm");
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">批量修改供应商（主材小类：<%=zcxlbm%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="37%" align="right" height="54">供应商</td>
              <td width="63%" height="54"> 
                <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:300PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select distinct jxc_gysxx.gysmc c1,jxc_gysxx.gysmc c2 from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppxx.pplb='1' and jxc_gysxx.cllx='1' and jxc_ppgysdzb.ssfgs='"+ssfgs+"' order by jxc_gysxx.gysmc","");
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
                  <input type="button"  value="批量修改供应商" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供应商]！");
		FormName.gysmc.focus();
		return false;
	}


	FormName.action="SavePlxgGys.jsp";
	FormName.submit();
	return true;
}

</SCRIPT>
