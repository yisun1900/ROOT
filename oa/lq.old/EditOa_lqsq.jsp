<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bgypbm=null;
String slr=null;
String sqrq=null;
String jhlqsl=null;
String jhlqrq=null;
String lqzt=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select bgypbm,slr,sqrq,jhlqsl,jhlqrq,lqzt,bz ";
	ls_sql+=" from  oa_lqsq";
	ls_sql+=" where  xh="+wherexh;
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bgypbm=cf.fillNull(rs.getString("bgypbm"));
		slr=cf.fillNull(rs.getString("slr"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		jhlqsl=cf.fillNull(rs.getString("jhlqsl"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		lqzt=cf.fillNull(rs.getString("lqzt"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditOa_lqsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办公用品</div>
              </td>
              <td width="32%"> 
                <select name="bgypbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bgypbm,bgypmc from oa_bgypbm order by bgypbm",bgypbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">计划领取数量</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jhlqsl" size="20" maxlength="8"  value="<%=jhlqsl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">申请日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">申领人</div>
              </td>
              <td width="32%">
                <input type="text" name="slr" size="20" maxlength="20"  value="<%=slr%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">计划领取日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jhlqrq" size="20" maxlength="10"  value="<%=jhlqrq%>" >
              </td>
              <td width="18%"> 
                <div align="right">领取状态</div>
              </td>
              <td width="32%"> 
                <select name="lqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"N+未领取&Y+已领取",lqzt,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <input type="reset"  value="重输">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bgypbm)=="") {
		alert("请选择[办公用品]！");
		FormName.bgypbm.focus();
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请选择[申领人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("请选择[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqsl)=="") {
		alert("请选择[计划领取数量]！");
		FormName.jhlqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.jhlqsl, "计划领取数量"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqrq)=="") {
		alert("请选择[计划领取日期]！");
		FormName.jhlqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "计划领取日期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
