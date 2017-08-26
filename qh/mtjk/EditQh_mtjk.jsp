<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dqbm=(String)session.getAttribute("dqbm");

%>
<%

String jkbbh=null;
String bjkgsbh=null;
String xxlybm=null;
String bcsj=null;
String gggs=null;
String yjjg=null;
String bz=null;
String dwbh=null;
String wherejkbbh=cf.GB2Uni(request.getParameter("jkbbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="SELECT qh_mtjk.jkbbh,qh_mtjk.bjkgsbh,qh_mtjk.xxlybm,qh_mtjk.bcsj,qh_mtjk.gggs,qh_mtjk.yjjg,qh_mtjk.bz, qh_mtjk.dwbh ";
	ls_sql+=" FROM qh_mtjk,sq_dwxx  ";
    ls_sql+=" where (sq_dwxx.dwbh=qh_mtjk.dwbh) and  (jkbbh='"+wherejkbbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jkbbh=cf.fillNull(rs.getString("jkbbh"));
		bjkgsbh=cf.fillNull(rs.getString("bjkgsbh"));
		xxlybm=cf.fillNull(rs.getString("xxlybm"));
		bcsj=cf.fillNull(rs.getDate("bcsj"));
		gggs=cf.fillNull(rs.getString("gggs"));
		yjjg=cf.fillNull(rs.getString("yjjg"));
		bz=cf.fillNull(rs.getString("bz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
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

<form method="post" action="SaveEditQh_mtjk.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">监控表编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jkbbh" size="20" maxlength="6"  value="<%=jkbbh%>" >
              </td>
              <td width="15%"> 
                <div align="right">被监控公司名称</div>
              </td>
              <td width="35%"> 
                <select name="bjkgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bjkgsbh,bjkgsmc from qh_bjkgsdm where dqbm='"+dqbm+"' order by bjkgsbh",bjkgsbh);
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">广告形式</div>
              </td>
              <td width="35%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm",xxlybm);
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">播出时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bcsj" size="20" maxlength="10"  value="<%=bcsj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">广告公司</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gggs" size="20" maxlength="30"  value="<%=gggs%>" >
              </td>
              <td width="15%"> 
                <div align="right">预计价格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yjjg" size="20" maxlength="6"  value="<%=yjjg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">监控单位名称</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh",dwbh);
%>
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="81" rows="10"  ><%=bz%></textarea>
                <div align="right"></div>
              </td>
            </tr>
            <input type="hidden" name="wherejkbbh"  value="<%=wherejkbbh%>" >
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
	if(	javaTrim(FormName.jkbbh)=="") {
		alert("请输入[监控表编号]！");
		FormName.jkbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bjkgsbh)=="") {
		alert("请输入[被监控公司名称]！");
		FormName.bjkgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xxlybm)=="") {
		alert("请选择[广告形式]！");
		FormName.xxlybm.focus();
		return false;
	}
	if(!(isDatetime(FormName.bcsj, "播出时间"))) {
		return false;
	}
	if(!(isFloat(FormName.yjjg, "预计价格"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
