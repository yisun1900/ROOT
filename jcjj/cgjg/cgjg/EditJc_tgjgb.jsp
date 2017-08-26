<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cgbm=null;
String tggdbm=null;
String tgjsbm=null;
String lsj=null;
String yhj=null;
String wherecgbm=cf.GB2Uni(request.getParameter("cgbm"));
String wheretggdbm=cf.GB2Uni(request.getParameter("tggdbm"));
String wheretgjsbm=cf.GB2Uni(request.getParameter("tgjsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cgbm,tggdbm,tgjsbm,lsj,yhj ";
	ls_sql+=" from  jc_tgjgb";
	ls_sql+=" where  (cgbm='"+wherecgbm+"') and  (tggdbm='"+wheretggdbm+"') and  (tgjsbm='"+wheretgjsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgbm=cf.fillNull(rs.getString("cgbm"));
		tggdbm=cf.fillNull(rs.getString("tggdbm"));
		tgjsbm=cf.fillNull(rs.getString("tgjsbm"));
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
      <div align="center">请修改地柜价格</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_tgjgb.jsp" name="editform">
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
                <div align="right">地柜高度区间</div>
  </td>
              <td width="35%">
                <select name="tggdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tggdbm,tggdmc from jdm_tggdbm order by tggdbm",tggdbm);
%> 
                </select>
              </td>
  <td width="15%"> 
                <div align="right">地柜进深区间</div>
  </td>
              <td width="35%">
                <select name="tgjsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tgjsbm,tgjsmc from jdm_tgjsbm order by tgjsbm",tgjsbm);
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
<input type="hidden" name="wheretggdbm"  value="<%=wheretggdbm%>" >
<input type="hidden" name="wheretgjsbm"  value="<%=wheretgjsbm%>" >
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
	if(	javaTrim(FormName.tggdbm)=="") {
		alert("请选择[地柜高度区间]！");
		FormName.tggdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tgjsbm)=="") {
		alert("请选择[地柜进深区间]！");
		FormName.tgjsbm.focus();
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
