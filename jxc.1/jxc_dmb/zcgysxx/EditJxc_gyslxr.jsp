<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String lxrxm=null;
String zw=null;
String sj=null;
String bgdh=null;
String cz=null;
String sflz=null;
String bz=null;
String gysbm=null;
String xh=request.getParameter("xh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gysbm,lxrxm,zw,sj,bgdh,cz,sflz,bz ";
	ls_sql+=" from  jxc_gyslxr";
	ls_sql+=" where  xh='"+xh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysbm=cf.fillNull(rs.getString("gysbm"));
		lxrxm=cf.fillNull(rs.getString("lxrxm"));
		zw=cf.fillNull(rs.getString("zw"));
		sj=cf.fillNull(rs.getString("sj"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		cz=cf.fillNull(rs.getString("cz"));
		sflz=cf.fillNull(rs.getString("sflz"));
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
      <div align="center"> 请修改联系人信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJxc_gyslxr.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#FF0000">*</font>所属供应商</td>
              <td width="35%"> 
                <select name="gysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx where gysbm='"+gysbm+"'","");
%> 
                </select>
              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font>联系人姓名</td>
              <td width="35%"> 
                <input type="text" name="lxrxm" size="20" maxlength="20"  value="<%=lxrxm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>职务</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zw" size="20" maxlength="50"  value="<%=zw%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>手机</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sj" size="20" maxlength="50"  value="<%=sj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#FF0000">*</font>办公电话</td>
              <td colspan="3"> 
                <input type="text" name="bgdh" size="73" maxlength="50"  value="<%=bgdh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>是否离职</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "sflz","Y+是&N+否",sflz);
%> </td>
              <td width="15%"> 
                <div align="right">传真</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cz" size="20" maxlength="50"  value="<%=cz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="hidden" name="xh"  value="<%=xh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商名称]！");
		FormName.gysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxrxm)=="") {
		alert("请输入[联系人姓名]！");
		FormName.lxrxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("请输入[职务]！");
		FormName.zw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sflz)) {
		alert("请选择[是否离职]！");
		FormName.sflz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
