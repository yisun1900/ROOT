<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String cpbm=null;
String clgw=null;
String pp=null;
String gys=null;
String sjfy=null;
String yazrq=null;
String sl=null;
String bz=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherecpbm=cf.GB2Uni(request.getParameter("cpbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,cpbm,clgw,pp,gys,sjfy,yazrq,sl,bz ";
	ls_sql+=" from  crm_dgqk";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (cpbm='"+wherecpbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cpbm=cf.fillNull(rs.getString("cpbm"));
		clgw=cf.fillNull(rs.getString("clgw"));
		pp=cf.fillNull(rs.getString("pp"));
		gys=cf.fillNull(rs.getString("gys"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		yazrq=cf.fillNull(rs.getDate("yazrq"));
		sl=cf.fillNull(rs.getString("sl"));
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
      <div align="center"> 请修改信息（<font color="#FF0000">*</font>为必录字段）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_dgqk.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">驻店家居顾问</div>
              </td>
              <td width="35%"> 
                <input type="text" name="clgw" size="20" maxlength="20"  value="<%=clgw%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#FF0000">*</font>产品</td>
              <td width="35%"> 
                <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cpbm,cpmc from dm_cpbm order by cpbm",cpbm);
%> 
                </select>
              </td>
              <td width="15%" align="right">数量</td>
              <td width="35%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>品牌</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pp" size="20" maxlength="50"  value="<%=pp%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>供应商</div>
              </td>
              <td width="35%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='5' order by dwbh",gys);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>实际费用</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjfy" size="20" maxlength="8"  value="<%=sjfy%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>应安装日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yazrq" size="20" maxlength="10"  value="<%=yazrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wherecpbm"  value="<%=wherecpbm%>" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请选择[产品]！");
		FormName.cpbm.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.pp)=="") {
		alert("请输入[品牌]！");
		FormName.pp.focus();
		return false;
	}
	if(	javaTrim(FormName.gys)=="") {
		alert("请选择[供应商]！");
		FormName.gys.focus();
		return false;
	}
	if(	javaTrim(FormName.sjfy)=="") {
		alert("请选择[实际费用]！");
		FormName.sjfy.focus();
		return false;
	}
	if(!(isNumber(FormName.sjfy, "实际费用"))) {
		return false;
	}
	if(	javaTrim(FormName.yazrq)=="") {
		alert("请输入[应安装日期]！");
		FormName.yazrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yazrq, "应安装日期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
