<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cgbm=null;
String dggdbm=null;
String dgjsbm=null;
String lsj=null;
String yhj=null;
String wherecgbm=cf.GB2Uni(request.getParameter("cgbm"));
String wheredggdbm=cf.GB2Uni(request.getParameter("dggdbm"));
String wheredgjsbm=cf.GB2Uni(request.getParameter("dgjsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cgbm,dggdbm,dgjsbm,lsj,yhj ";
	ls_sql+=" from  jc_dgjgb";
	ls_sql+=" where  (cgbm='"+wherecgbm+"') and  (dggdbm='"+wheredggdbm+"') and  (dgjsbm='"+wheredgjsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgbm=cf.fillNull(rs.getString("cgbm"));
		dggdbm=cf.fillNull(rs.getString("dggdbm"));
		dgjsbm=cf.fillNull(rs.getString("dgjsbm"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
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
      <div align="center"> 请修改吊柜价格</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_dgjgb.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">橱柜编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cgbm" size="20" maxlength="5"  value="<%=cgbm%>" readonly>
  </td>
  <td width="15%"> 
                <div align="right"></div>
  </td>
              <td width="35%">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">吊柜高度区间</div>
  </td>
              <td width="35%">
                <select name="dggdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dggdbm,dggdmc from jdm_dggdbm order by dggdbm",dggdbm);
%> 
                </select>
              </td>
  <td width="15%"> 
                <div align="right">吊柜进深区间</div>
  </td>
              <td width="35%">
                <select name="dgjsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dgjsbm,dgjsmc from jdm_dgjsbm order by dgjsbm",dgjsbm);
%> 
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">零售价</div>
  </td>
              <td width="35%">
                <input type="text" name="lsj" size="20" maxlength="9"  value="<%=lsj%>" >
              </td>
  <td width="15%"> 
                <div align="right">优惠价</div>
  </td>
  <td width="35%">
                <input type="text" name="yhj" size="20" maxlength="9"  value="<%=yhj%>" >
              </td>
</tr>
<input type="hidden" name="wherecgbm"  value="<%=wherecgbm%>" >
<input type="hidden" name="wheredggdbm"  value="<%=wheredggdbm%>" >
<input type="hidden" name="wheredgjsbm"  value="<%=wheredgjsbm%>" >
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
	if(	javaTrim(FormName.cgbm)=="") {
		alert("请输入[橱柜编码]！");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dggdbm)=="") {
		alert("请选择[吊柜高度区间]！");
		FormName.dggdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dgjsbm)=="") {
		alert("请选择[吊柜进深区间]！");
		FormName.dgjsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("请输入[零售价]！");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("请输入[优惠价]！");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "优惠价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
