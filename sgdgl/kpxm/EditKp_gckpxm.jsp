<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpxmbm=null;
String kpxmmc=null;
String kpdlbm=null;
String kpjg=null;
String kpjgdy=null;
double kf=0;
double sgdfk=0;
double kcjdebl=0;
String kpcfbm=null;
String cfbz=null;
String wherekpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
String wherekpjg=cf.GB2Uni(request.getParameter("kpjg"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kpxmbm,kpxmmc,kpdlbm,kpjg,kpjgdy,kf,kpcfbm,cfbz,sgdfk,kcjdebl ";
	ls_sql+=" from  kp_gckpxm";
	ls_sql+=" where  (kpxmbm='"+wherekpxmbm+"') and  (kpjg='"+wherekpjg+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpxmbm=cf.fillNull(rs.getString("kpxmbm"));
		kpxmmc=cf.fillNull(rs.getString("kpxmmc"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		kpjg=cf.fillNull(rs.getString("kpjg"));
		kpjgdy=cf.fillNull(rs.getString("kpjgdy"));
		kf=rs.getDouble("kf");
		kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
		cfbz=cf.fillNull(rs.getString("cfbz"));
		sgdfk=rs.getDouble("sgdfk");
		kcjdebl=rs.getDouble("kcjdebl");
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

<form method="post" action="SaveEditKp_gckpxm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>违规项目编码</td>
              <td width="32%"> 
                <input type="text" name="kpxmbm" size="20" maxlength="10"  value="<%=kpxmbm%>" >              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>项目大类</td>
              <td width="32%"><select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>违规项目名称</td>
              <td colspan="3"><input type="text" name="kpxmmc" size="73" maxlength="100"  value="<%=kpxmmc%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>违规分级 </td>
              <td width="32%"><select name="kpjg" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm order by yzcdbm",kpjg);
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">违规分级定义</td>
              <td colspan="3"><textarea name="kpjgdy" cols="71" rows="5"><%=kpjgdy%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">处罚分类</td>
              <td><select name="kpcfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm order by kpcfbm",kpcfbm);
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">处罚标准</td>
              <td colspan="3"><textarea name="cfbz" cols="71" rows="5"><%=cfbz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>扣分              </td>
              <td width="32%"> 
                <input type="text" name="kf" value="<%=kf%>" size="20" maxlength="16" >              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>罚款              </td>
              <td width="32%">
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="16" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>扣除接单额百分比</td>
              <td width="32%">
                <input type="text" name="kcjdebl" value="<%=kcjdebl%>" size="10" maxlength="16" >
              % </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <input type="hidden" name="wherekpxmbm"  value="<%=wherekpxmbm%>" >
            <input type="hidden" name="wherekpjg"  value="<%=wherekpjg%>" >
            <tr> 
              <td colspan="4" align="center">
                  <input type="button"  value="保存" onClick="f_do(editform)">
              <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("请输入[违规项目编码]！");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmmc)=="") {
		alert("请输入[违规项目名称]！");
		FormName.kpxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("请选择[违规分级]！");
		FormName.kpjg.focus();
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("请选择[扣分]！");
		FormName.kf.focus();
		return false;
	}
	if(!(isFloat(FormName.kf, "扣分"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("请选择[罚款]！");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.kcjdebl)=="") {
		alert("请选择[扣除接单额百分比]！");
		FormName.kcjdebl.focus();
		return false;
	}
	if(!(isFloat(FormName.kcjdebl, "扣除接单额百分比"))) {
		return false;
	}
	if (FormName.kcjdebl.value<0 || FormName.kcjdebl.value>100)
	{
		alert("错误！[扣除接单额百分比]应该在0和100之间！");
		FormName.kcjdebl.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
