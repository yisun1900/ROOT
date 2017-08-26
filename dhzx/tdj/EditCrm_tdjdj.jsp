<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tdjxh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String dh=null;
String sjs=null;
String tdjyybm=null;
String tdjyysm=null;
String ytje=null;
String stje=null;
String dwbh=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wheretdjxh=cf.GB2Uni(request.getParameter("tdjxh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select tdjxh,khbh,khxm,fwdz,dh,sjs,tdjyybm,tdjyysm,ytje,stje,dwbh,lrr,lrsj,bz ";
	ls_sql+=" from  crm_tdjdj";
	ls_sql+=" where  (tdjxh='"+wheretdjxh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tdjxh=cf.fillNull(rs.getString("tdjxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		dh=cf.fillNull(rs.getString("dh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		tdjyybm=cf.fillNull(rs.getString("tdjyybm"));
		tdjyysm=cf.fillNull(rs.getString("tdjyysm"));
		ytje=cf.fillNull(rs.getString("ytje"));
		stje=cf.fillNull(rs.getString("stje"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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

<form method="post" action="SaveEditCrm_tdjdj.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">退订金序号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="tdjxh" size="20" maxlength="9"  value="<%=tdjxh%>" >
  </td>
  <td width="15%"> 
    <div align="right">客户编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">客户姓名</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khxm" size="20" maxlength="20"  value="<%=khxm%>" >
  </td>
  <td width="15%"> 
    <div align="right">房屋地址</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fwdz" size="20" maxlength="100"  value="<%=fwdz%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">电话</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dh" size="20" maxlength="100"  value="<%=dh%>" >
  </td>
  <td width="15%"> 
    <div align="right">设计师</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">退订金原因</div>
  </td>
  <td width="35%"> 
    <select name="tdjyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select tdjyybm,tdjyymc from dm_tdjyybm order by tdjyybm",tdjyybm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">退订金原因说明</div>
  </td>
  <td width="35%"> 
    <textarea name="tdjyysm" cols="29" rows="3"><%=tdjyysm%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">应退金额</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ytje" size="20" maxlength="17"  value="<%=ytje%>" >
  </td>
  <td width="15%"> 
    <div align="right">实退金额</div>
  </td>
  <td width="35%"> 
    <input type="text" name="stje" size="20" maxlength="17"  value="<%=stje%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">录入单位</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2') order by dwbh",dwbh);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">录入人</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">录入时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="3"><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wheretdjxh"  value="<%=wheretdjxh%>" >
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
	if(	javaTrim(FormName.tdjxh)=="") {
		alert("请输入[退订金序号]！");
		FormName.tdjxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[电话]！");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.tdjyybm)=="") {
		alert("请选择[退订金原因]！");
		FormName.tdjyybm.focus();
		return false;
	}
	if(!(isFloat(FormName.ytje, "应退金额"))) {
		return false;
	}
	if(!(isFloat(FormName.stje, "实退金额"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入单位]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
