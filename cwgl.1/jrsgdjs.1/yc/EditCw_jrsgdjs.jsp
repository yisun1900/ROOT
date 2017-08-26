<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsrq=null;
String ysglk=null;
String rgfbfb=null;
String bcrgf=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,jsrq,ysglk,rgfbfb,bcrgf,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_jrbgf";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		ysglk=cf.fillNull(rs.getString("ysglk"));
		rgfbfb=cf.fillNull(rs.getString("rgfbfb"));
		bcrgf=cf.fillNull(rs.getString("bcrgf"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jrsgdjs.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算记录号</td> 
  <td width="32%"> 
    <input type="text" name="jsjlh" size="20" maxlength="9"  value="<%=jsjlh%>" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",sgd);
%>
    </select>  </td>
  <td align="right" width="18%">施工班长</td> 
  <td width="32%"> 
    <input type="text" name="sgbz" size="20" maxlength="20"  value="<%=sgbz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">拨付日期</td> 
  <td width="32%"> 
    <input type="text" name="jsrq" size="20" maxlength="10"  value="<%=jsrq%>" >  </td>
  <td align="right" width="18%">预算工料款</td> 
  <td width="32%"> 
    <input type="text" name="ysglk" size="20" maxlength="17"  value="<%=ysglk%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">人工费百分比</td> 
  <td width="32%"> 
    <input type="text" name="rgfbfb" size="20" maxlength="9"  value="<%=rgfbfb%>" >  </td>
  <td align="right" width="18%">本次应付人工费</td> 
  <td width="32%"> 
    <input type="text" name="bcrgf" size="20" maxlength="17"  value="<%=bcrgf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >  </td>
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门</td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wherejsjlh"  value="<%=wherejsjlh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[拨付日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "拨付日期"))) {
		return false;
	}
	if(	javaTrim(FormName.ysglk)=="") {
		alert("请输入[预算工料款]！");
		FormName.ysglk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysglk, "预算工料款"))) {
		return false;
	}
	if(	javaTrim(FormName.rgfbfb)=="") {
		alert("请输入[人工费百分比]！");
		FormName.rgfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfbfb, "人工费百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.bcrgf)=="") {
		alert("请输入[本次应付人工费]！");
		FormName.bcrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.bcrgf, "本次应付人工费"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
