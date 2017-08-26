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
String wjzjxyybm=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,xh,dj,sl,bz,wjzjxyybm ";
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
		wjzjxyybm=cf.fillNull(rs.getString("wjzjxyybm"));
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
<title>五金件减项</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">五金件减项</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveJxc_wjjddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right"><font color="#0000CC">预订单编号</font></div>
              </td>
              <td width="30%"> <%=yddbh%> </td>
              <td width="15%"> 
                <div align="right">五金件序号</div>
              </td>
              <td width="41%"> 
                  <%
	cf.selectItem(out,"select xh,wjjmc||'('||xinghao||')'||'￥:'||dj from jc_wjjbj,jdm_wjjbm where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm order by xh",xh,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right"><font color="#0000CC">单价</font></div>
              </td>
              <td width="30%"> <%=dj%> </td>
              <td width="15%"> 
                <div align="right">订购数量</div>
              </td>
              <td width="41%"> <%=sl%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">备注</td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%"> 
                <div align="right">减项标志</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="lx" value="3">
                减项 
                <input type="radio" name="lx" value="1">
                合同项</td>
              <td width="18%"> 
                <div align="right">五金增减项原因</div>
              </td>
              <td width="32%"> 
                <select name="wjzjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjzjxyybm,wjzjxyymc from jdm_wjzjxyybm order by wjzjxyybm",wjzjxyybm);
%> 
                </select>
              </td>
            </tr>
            <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[减项标志]！");
		FormName.lx[0].focus();
		return false;
	}
	if (FormName.lx[0].checked)
	{
		if(	javaTrim(FormName.wjzjxyybm)=="") {
			alert("请输入[五金增减项原因]！");
			FormName.wjzjxyybm.focus();
			return false;
		}
	}
	else{
		FormName.mmzjxyybm.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
