<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
//String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
%>
<%

String dwbh=null;
String sqrq=null;
String sqr=null;
String fymc=null;
String sxje=null;
String pzje=null;
String bz=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,sqrq,sqr,fymc,sxje,pzje,bz ";
	ls_sql+=" from  xz_bgfysbb";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqr=cf.fillNull(rs.getString("sqr"));
		fymc=cf.fillNull(rs.getString("fymc"));
		sxje=cf.fillNull(rs.getString("sxje"));
		pzje=cf.fillNull(rs.getString("pzje"));
		bz=cf.fillNull(rs.getString("bz"));
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

<form method="post" action="SaveEditXz_bgfysbb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">申请部门</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">申请日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">申请人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sqr" size="20" maxlength="8"  value="<%=sqr%>" >
              </td>
              <td width="15%"> 
                <div align="right">费用名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fymc" size="20" maxlength="20"  value="<%=fymc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">所需金额</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxje" size="20" maxlength="9"  value="<%=sxje%>" >
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="81" rows="3"><%=bz%></textarea>
                <div align="right"></div>
              </td>
            </tr>
            <input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申请部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.fymc)=="") {
		alert("请输入[费用名称]！");
		FormName.fymc.focus();
		return false;
	}
	if(!(isFloat(FormName.sxje, "所需金额"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
