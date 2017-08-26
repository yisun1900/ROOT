<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gtxh=null;
String ddbh=null;
String jjlbbm=null;
String jjgtmcbm=null;
String gtcd=null;
String gtkd=null;
String gtgd=null;
String gtbcysbm=null;
String zj=null;
String bz=null;
String wheregtxh=cf.GB2Uni(request.getParameter("gtxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gtxh,ddbh,jjlbbm,jjgtmcbm,gtcd,gtkd,gtgd,gtbcysbm,zj,bz ";
	ls_sql+=" from  jc_ddgtmx";
	ls_sql+=" where  (gtxh="+wheregtxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		jjlbbm=cf.fillNull(rs.getString("jjlbbm"));
		jjgtmcbm=cf.fillNull(rs.getString("jjgtmcbm"));
		gtcd=cf.fillNull(rs.getString("gtcd"));
		gtkd=cf.fillNull(rs.getString("gtkd"));
		gtgd=cf.fillNull(rs.getString("gtgd"));
		gtbcysbm=cf.fillNull(rs.getString("gtbcysbm"));
		zj=cf.fillNull(rs.getString("zj"));
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
      <div align="center"> 请修改柜体明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">总价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zj" size="20" maxlength="8"  value="<%=zj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">家具类别</div>
              </td>
              <td width="35%"> 
                <select name="jjlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjlbbm,jjlbmc from jdm_jjlbbm order by jjlbbm",jjlbbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">柜体名称</div>
              </td>
              <td width="35%"> 
                <select name="jjgtmcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjgtmcbm,jjgtmc from jdm_jjgtmcbm order by jjgtmcbm",jjgtmcbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">柜体长度</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gtcd" size="20" maxlength="8"  value="<%=gtcd%>" >
              </td>
              <td width="15%"> 
                <div align="right">柜体宽度</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gtkd" size="20" maxlength="8"  value="<%=gtkd%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">柜体高度</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gtgd" size="20" maxlength="8"  value="<%=gtgd%>" >
              </td>
              <td width="15%"> 
                <div align="right">板材颜色</div>
              </td>
              <td width="35%"> 
                <select name="gtbcysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gtbcysbm,gtbcysmc from jdm_gtbcysbm order by gtbcysbm",gtbcysbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheregtxh"  value="<%=wheregtxh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="hidden" name="gtxh" size="20" maxlength="8"  value="<%=gtxh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <p> 
                    <input type="button"  value="录入柜体板件" onClick="f_lrbj(editform)" name="lrmm" >
                    <input type="button"  value="查看柜体板件" onClick="f_ckbj(editform)" name="ckmm" >
                  </p>
                  <p> 
                    <input type="button"  value="录入柜体配件" onClick="f_lrpj(editform)" name="lrbgmmm" >
                    <input type="button"  value="查看柜体配件" onClick="f_ckpj(editform)" name="ckbgmmm" >
                  </p>
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
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(!(isNumber(FormName.gtxh, "柜体序号"))) {
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlbbm)=="") {
		alert("请选择[家具类别]！");
		FormName.jjlbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jjgtmcbm)=="") {
		alert("请选择[柜体名称]！");
		FormName.jjgtmcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gtcd, "柜体长度"))) {
		return false;
	}
	if(!(isNumber(FormName.gtkd, "柜体宽度"))) {
		return false;
	}
	if(!(isNumber(FormName.gtgd, "柜体高度"))) {
		return false;
	}
	if(!(isNumber(FormName.gtbcysbm, "板材颜色"))) {
		return false;
	}
	if(!(isNumber(FormName.zj, "总价"))) {
		return false;
	}

	FormName.action="SaveEditJc_ddgtmx.jsp";
	FormName.submit();
	return true;
}
function f_lrbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_ddbjmx.jsp";
	FormName.submit();
	return true;
}

function f_ckbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_ddbjmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrpj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_ddpjmx.jsp";
	FormName.submit();
	return true;
}

function f_ckpj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_ddpjmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
