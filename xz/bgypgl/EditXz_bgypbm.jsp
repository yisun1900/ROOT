<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bgypbh=null;
String bgypmc=null;
String gg=null;
String pp=null;
String jg=null;
String ghr=null;
String bz=null;
String ssfgs=null;
String wherebgypbh=cf.GB2Uni(request.getParameter("bgypbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bgypbh,bgypmc,gg,pp,jg,ghr,bz,ssfgs ";
	ls_sql+=" from  xz_bgypbm";
	ls_sql+=" where  (bgypbh='"+wherebgypbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bgypbh=cf.fillNull(rs.getString("bgypbh"));
		bgypmc=cf.fillNull(rs.getString("bgypmc"));
		gg=cf.fillNull(rs.getString("gg"));
		pp=cf.fillNull(rs.getString("pp"));
		jg=cf.fillNull(rs.getString("jg"));
		ghr=cf.fillNull(rs.getString("ghr"));
		bz=cf.fillNull(rs.getString("bz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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

<form method="post" action="SaveEditXz_bgypbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">办公用品编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bgypbh" size="20" maxlength="5"  value="<%=bgypbh%>" >
              </td>
              <td width="15%"> 
                <div align="right">办公用品名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bgypmc" size="20" maxlength="20"  value="<%=bgypmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">规格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" size="20" maxlength="20"  value="<%=gg%>" >
              </td>
              <td width="15%"> 
                <div align="right">品牌</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pp" size="20" maxlength="20"  value="<%=pp%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">价格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jg" size="20" maxlength="9"  value="<%=jg%>" >
              </td>
              <td width="15%"> 
                <div align="right">供货人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ghr" size="20" maxlength="40"  value="<%=ghr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">所属分公司</div>
              </td>
              <td width="35%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
				%>
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="81" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherebgypbh"  value="<%=wherebgypbh%>" >
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
	if(	javaTrim(FormName.bgypbh)=="") {
		alert("请输入[办公用品编号]！");
		FormName.bgypbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bgypmc)=="") {
		alert("请输入[办公用品名称]！");
		FormName.bgypmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("请输入[价格]！");
		FormName.jg.focus();
		return false;
	}
	if(!(isFloat(FormName.jg, "价格"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
