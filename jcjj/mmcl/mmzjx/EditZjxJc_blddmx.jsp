<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String blxhbm=null;
String dj=null;
String sl=null;
String zjhsl=null;
String bz=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String lx=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,blxhbm,dj,sl,zjhsl,bz ";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_mmydd,sq_dwxx ";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select lx";
	ls_sql+=" from  jc_blzjxmx";
	ls_sql+=" where  zjxxh='"+zjxxh+"' and lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lx=rs.getString(1);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">请修改增减数量（增减项序号：<%=zjxxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditZjxJc_blddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC">玻璃型号</font></td>
              <td colspan="3"><select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:520PX" >
                  <%
		cf.selectItem(out,"select blxhbm,blxh||'￥:'||jg from jc_blbj where blxhbm='"+blxhbm+"' order by blxhbm",blxhbm,false);
%>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">合同数量</font></td>
              <td width="35%"><input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" readonly></td>
              <td width="15%" align="right"><font color="#0000CC">单价</font></td>
              <td width="35%">
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=dj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">增减后数量</td>
              <td width="35%">
                <input type="text" name="zjhsl" size="20" maxlength="8"  value="<%=zjhsl%>" ></td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"><input type="hidden" name="lx"  value="<%=lx%>" >
                <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
                <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                <input type="hidden" name="yddbh" value="<%=yddbh%>"> 
                <input name="button" type="button" onClick="f_do(editform)"  value="保存">
              <input type="reset"  value="重输">              </td>
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
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.blxhbm)=="") {
		alert("请选择[玻璃型号]！");
		FormName.blxhbm.focus();
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
	if(	javaTrim(FormName.zjhsl)=="") {
		alert("请输入[增减后数量]！");
		FormName.zjhsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjhsl, "增减后数量"))) {
		return false;
	}
	if (parseFloat(FormName.zjhsl.value)<0)
	{
		alert("错误！[数量]不能小于0！");
		FormName.zjhsl.select();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
