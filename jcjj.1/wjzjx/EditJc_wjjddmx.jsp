<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String xh=null;
String dj=null;
String sl=null;
String bz=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,xh,dj,sl,bz ";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		xh=cf.fillNull(rs.getString("xh"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
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
      <div align="center">五金件订单--修改增项 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_wjjddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right"><font color="#0000CC">预订单编号</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="yddbh" size="20" maxlength="9"  value="<%=yddbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">五金件序号</div>
              </td>
              <td width="41%"> 
                <select name="xh" style="FONT-SIZE:12PX;WIDTH:240PX" onChange="changelx(editform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,wjjmc||'('||xinghao||')'||'￥:'||dj from jc_wjjbj,jdm_wjjbm where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm order by xh",xh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right"><font color="#0000CC">单价</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">订购数量</div>
              </td>
              <td width="41%"> 
                <input type="text" name="sl" size="32" maxlength="8"  value="<%=sl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="78" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
            <tr> 
              <td width="14%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="41%" height="2"> 
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
function changelx(FormName)//参数FormName:Form的名称
{
	FormName.dj.value=FormName.xh.options[FormName.xh.selectedIndex].text.substring(FormName.xh.options[FormName.xh.selectedIndex].text.indexOf(":")+1);
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请选择[五金件序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "五金件序号"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订购数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "订购数量"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
