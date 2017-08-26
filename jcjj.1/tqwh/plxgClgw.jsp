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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">批量修改材料员</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="37%" align="right" height="54">材料员</td>
              <td width="63%" height="54"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	String listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqfgs ";
	listSql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";

	listSql+=" UNION ALL ";

	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqbm ";
	listSql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";

	listSql+=" ORDER BY sfzszg desc,c2 ";

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
                  <input type="button"  value="存盘" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[材料员]！");
		FormName.clgw.focus();
		return false;
	}


	FormName.action="SavePlxgClgw.jsp";
	FormName.submit();
	return true;
}

</SCRIPT>
