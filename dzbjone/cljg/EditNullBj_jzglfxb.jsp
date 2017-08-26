<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="SaveEditNullBj_jzglfxb.jsp" name="editform" target="_blank">
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
    <td width="7%"> 
      <div align="center">序号</div>
    </td>
    <td width="10%"> 
      <div align="center">工料表序号</div>
    </td>
    <td width="11%"> 
      <div align="center">物料编码</div>
    </td>
    <td width="19%"> 
      <div align="center">工料名称</div>
    </td>
    <td width="19%"> 
      <div align="center">型号规格</div>
    </td>
    <td width="22%"> 
      <div align="center">品牌</div>
    </td>
    <td width="22%"> 
      <div align="center">项目编号</div>
    </td>
  </tr>

<%

String dqbm=request.getParameter("dqbm");
String xzfw=request.getParameter("xzfw");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

long glbxh=0;
String glmc=null;
String xhgg=null;
String pp=null;
String wlbm=null;
String xmbh=null;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="SELECT glbxh,glmc,xhgg,pp,wlbm,xmbh";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glflbm='1'";
	ls_sql+=" and wlbm is null";
	ls_sql+=" order by xmbh,glmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
	    glbxh=rs.getLong("glbxh");
	    glmc=cf.fillNull(rs.getString("glmc"));
	    xhgg=cf.fillHtml(rs.getString("xhgg"));
	    pp=cf.fillHtml(rs.getString("pp"));
	    wlbm=cf.fillNull(rs.getString("wlbm"));
	    xmbh=cf.fillNull(rs.getString("xmbh"));

		row++;


		%>
		  <tr align="center"> 
			<td><%=row%></td>
			<td><%=glbxh%>
				<input name="glbxh" type="hidden" value="<%=glbxh%>" >
			</td>
			<td><%=wlbm%>
				<input type="text" name="wlbm" size="16" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(wlbm[<%=row%>])">
			</td>
			<td><%=glmc%></td>
			<td><%=xhgg%></td>
			<td><%=pp%></td>
			<td><%=xmbh%></td>
		  </tr>
		<%
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

    <tr> 
      <td colspan="8" height="47" > 
        <div align="center"> 
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
