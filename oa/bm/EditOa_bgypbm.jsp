<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bgypbm=null;
String bgypmc=null;
String flbm=null;
String jldw=null;
String dj=null;
String pp=null;
String xh=null;
String ghs=null;
String wherebgypbm=cf.GB2Uni(request.getParameter("bgypbm"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select bgypbm,bgypmc,flbm,jldw,dj,pp,xh,ghs ";
	ls_sql+=" from  oa_bgypbm";
	ls_sql+=" where bgypbm='"+wherebgypbm+"' and fgsbh='"+fgsbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bgypbm=cf.fillNull(rs.getString("bgypbm"));
		bgypmc=cf.fillNull(rs.getString("bgypmc"));
		flbm=cf.fillNull(rs.getString("flbm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=cf.fillNull(rs.getString("dj"));
		pp=cf.fillNull(rs.getString("pp"));
		xh=cf.fillNull(rs.getString("xh"));
		ghs=cf.fillNull(rs.getString("ghs"));
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

<form method="post" action="SaveEditOa_bgypbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属公司</td>
              <td width="32%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办公用品编码(4位)</div>
              </td>
              <td width="32%"> 
                <input type="text" name="bgypbm" size="20" maxlength="4"  value="<%=bgypbm%>" >
              </td>
              <td width="18%"> 
                <div align="right">办公用品名称</div>
              </td>
              <td width="32%"> 
                <input type="text" name="bgypmc" size="20" maxlength="50"  value="<%=bgypmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办公用品分类</div>
              </td>
              <td width="32%"> 
                <select name="flbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select flbm,flmc from oa_flbm order by flbm",flbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">计量单位</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">单价</div>
              </td>
              <td width="32%"> 
                <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >
              </td>
              <td width="18%"> 
                <div align="right">品牌</div>
              </td>
              <td width="32%"> 
                <input type="text" name="pp" size="20" maxlength="20"  value="<%=pp%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">型号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xh" size="20" maxlength="20"  value="<%=xh%>" >
              </td>
              <td width="18%"> 
                <div align="right">供货商</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ghs" size="20" maxlength="20"  value="<%=ghs%>" >
              </td>
            </tr>
            <input type="hidden" name="wherebgypbm"  value="<%=wherebgypbm%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="保存" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bgypbm)=="") {
		alert("请输入[办公用品编码]！");
		FormName.bgypbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bgypmc)=="") {
		alert("请输入[办公用品名称]！");
		FormName.bgypmc.focus();
		return false;
	}
	if(	javaTrim(FormName.flbm)=="") {
		alert("请选择[办公用品分类]！");
		FormName.flbm.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
