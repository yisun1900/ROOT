<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>增加新的主材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
	String clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
	String ppmc=cf.GB2Uni(request.getParameter("ppmc"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql =" select count(*)";
	ls_sql+=" from jxc_clbm,jxc_cljgb";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.cldlbm='"+cldlbm+"' and jxc_clbm.clxlbm='"+clxlbm+"' and jxc_clbm.ppmc='"+ppmc+"'";
    ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
    ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);

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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <B>增加新的主材报价</B><BR>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择主材报价EXECEL文件</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"><b><font color="#FF0000">
		  
          <BR>『<%=ppmc%>』共有单品数：<%=count%>
		  <BR>注意：首先人工<input type="button"  value="删除『<%=ppmc%>』全部报价" onClick="window.open('ChooseDel1.jsp?dqbm=<%=dqbm%>&cldlbm=<%=cldlbm%>&clxlbm=<%=clxlbm%>&ppmc=<%=ppmc%>')">，系统不会自动删除<BR>
          否则新、旧报价都会保存在系统中</font></b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
			<input name="dqbm" type="hidden" value="<%=dqbm%>" >
			<input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
			<input name="clxlbm" type="hidden" value="<%=clxlbm%>" >
			<input name="ppmc" type="hidden" value="<%=ppmc%>" >
          <input type="button"  value="继续" onClick="f_onclick(loadform)">
        </td>
	  </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	FormName.action="DisImpAddDataTxt.jsp";

	FormName.submit();
	return true;
} 

//-->
</script>