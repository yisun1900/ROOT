<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String wtbh=null;
String wtflbm=null;
String wtsm=null;
String yqjjsj=null;
String slr=null;
String slsj=null;
String slbm=null;
String clzt=null;
String clr=null;
String clkssj=null;
String cljssj=null;
String clqk=null;
String bz=null;
String wherewtbh=cf.GB2Uni(request.getParameter("wtbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,wtbh,wtflbm,wtsm,yqjjsj,slr,slsj,slbm,clzt,clr,clkssj,cljssj,clqk,bz ";
	ls_sql+=" from  crm_khwtclgz";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtflbm=cf.fillNull(rs.getString("wtflbm"));
		wtsm=cf.fillNull(rs.getString("wtsm"));
		yqjjsj=cf.fillNull(rs.getDate("yqjjsj"));
		slr=cf.fillNull(rs.getString("slr"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slbm=cf.fillNull(rs.getString("slbm"));
		clzt=cf.fillNull(rs.getString("clzt"));
		clr=cf.fillNull(rs.getString("clr"));
		clkssj=cf.fillNull(rs.getDate("clkssj"));
		cljssj=cf.fillNull(rs.getDate("cljssj"));
		clqk=cf.fillNull(rs.getString("clqk"));
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

<form method="post" action="SaveEditCrm_khwtclgz.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">客户编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
  </td>
  <td width="15%"> 
    <div align="right">问题编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wtbh" size="20" maxlength="9"  value="<%=wtbh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">问题分类</div>
  </td>
  <td width="35%"> 
    <select name="wtflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select wtflbm,wtflmc from dm_wtflbm order by wtflbm",wtflbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">问题说明</div>
  </td>
  <td width="35%"> 
    <textarea name="wtsm" cols="29" rows="3"><%=wtsm%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">要求解决时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="yqjjsj" size="20" maxlength="10"  value="<%=yqjjsj%>" >
  </td>
  <td width="15%"> 
    <div align="right">受理人</div>
  </td>
  <td width="35%"> 
    <input type="text" name="slr" size="20" maxlength="20"  value="<%=slr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">受理时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="slsj" size="20" maxlength="10"  value="<%=slsj%>" >
  </td>
  <td width="15%"> 
    <div align="right">受理部门</div>
  </td>
  <td width="35%"> 
    <select name="slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh",slbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">处理状态</div>
  </td>
  <td width="35%"> 
    <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决",clzt);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">处理人</div>
  </td>
  <td width="35%"> 
    <input type="text" name="clr" size="20" maxlength="20"  value="<%=clr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">处理开始时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="clkssj" size="20" maxlength="10"  value="<%=clkssj%>" >
  </td>
  <td width="15%"> 
    <div align="right">处理结束时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cljssj" size="20" maxlength="10"  value="<%=cljssj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">处理情况</div>
  </td>
  <td width="35%"> 
    <textarea name="clqk" cols="29" rows="3"><%=clqk%></textarea>
  </td>
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="3"><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherewtbh"  value="<%=wherewtbh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.wtbh)=="") {
		alert("请输入[问题编号]！");
		FormName.wtbh.focus();
		return false;
	}
	if(	javaTrim(FormName.wtsm)=="") {
		alert("请输入[问题说明]！");
		FormName.wtsm.focus();
		return false;
	}
	if(!(isDatetime(FormName.yqjjsj, "要求解决时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请输入[受理人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("请输入[受理时间]！");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "受理时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slbm)=="") {
		alert("请选择[受理部门]！");
		FormName.slbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clzt)=="") {
		alert("请选择[处理状态]！");
		FormName.clzt.focus();
		return false;
	}
	if(!(isDatetime(FormName.clkssj, "处理开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cljssj, "处理结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
