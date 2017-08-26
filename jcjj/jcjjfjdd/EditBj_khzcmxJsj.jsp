<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcbm=null;
String zcmc=null;
double dj=0;
String sl=null;
double jsbl=0;
double cbj=0;
String xinghao=null;
String gg=null;
String jsfs =null;
String sxbz =null;
String sxhtyy =null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select zcbm,xsxh,zcmc,xinghao,gg,jsfs,jsbl,cbj,dj,DECODE(sxbz,'1','非手写','2','手写') sxbz,sxhtyy";
	ls_sql+=" from  bj_khzcmx";
	ls_sql+=" where xh="+xh;
	ls_sql+=" and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));
		jsfs=cf.fillNull(rs.getString("jsfs"));
		jsbl=rs.getDouble("jsbl");
		cbj=rs.getDouble("cbj");
		dj=rs.getDouble("dj");
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxhtyy=cf.fillNull(rs.getString("sxhtyy"));
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
      <div align="center">审核</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBj_khzcmxJsj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">主材编码</font></td>
              <td width="31%"><%=zcbm%></td>
              <td width="19%" align="right"><font color="#0000CC">主材名称</font></td>
              <td width="31%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">型号</font></td>
              <td width="31%"><%=xinghao%></td>
              <td width="19%" align="right"><font color="#0000CC">规格</font></td>
              <td width="31%"><%=gg%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">手写标志</td>
              <td width="31%"><%=sxbz%></td> 
              <td width="19%" align="right">手写合同原因</td>
              <td width="31%"><%=sxhtyy%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>结算价</td>
              <td><input type="text" name="cbj" size="17" maxlength="9"  value="<%=cbj%>"  >
元</td>
              <td align="right"><font color="#0000CC">实销单价</font></td>
              <td><%=dj%>元
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input name="jsbl" type="hidden" value="<%=jsbl%>" size="10" maxlength="9"  >
				<input type="hidden" name="jsfs"  value="<%=jsfs%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
				<input type="hidden" name="xh"  value="<%=xh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
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

	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[结算价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "结算价"))) {
		return false;
	}

	if (parseFloat(FormName.cbj.value)<0 )
	{
		alert("[结算价]必须大于等于0！");
		FormName.cbj.select();
		return false;
	}

	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}

	if (parseFloat(FormName.jsbl.value)<0 || parseFloat(FormName.jsbl.value)>100)
	{
		alert("[结算比例]只能在0到100之间！");
		FormName.jsbl.select();
		return false;
	}

		if (parseFloat(FormName.cbj.value) > <%=dj%>)
		{
			alert("提醒！[实销单价:<%=dj%>]小于[结算价:"+FormName.cbj.value+"]");
		}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
