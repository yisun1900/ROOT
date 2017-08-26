<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>增加新的主材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql =" select count(*)";
	ls_sql+=" from jc_zcjgb";
	ls_sql+=" where dqbm='"+dqbm+"' and zcdlbm='"+zcdlbm+"' and zcxlbm='"+zcxlbm+"' and dwbh='"+dwbh+"'";
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
        <td colspan="2" height="52"><b>请选择主材报价TXT文件</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"><b><font color="#FF0000">
		  
          <BR>『<%=dwbh%>』共有单品数：<%=count%>
		  <BR>注意：首先人工<input type="button"  value="删除『<%=dwbh%>』全部报价" onClick="window.open('ChooseDel1.jsp?dqbm=<%=dqbm%>&zcdlbm=<%=zcdlbm%>&zcxlbm=<%=zcxlbm%>&dwbh=<%=dwbh%>')">，系统不会自动删除<BR>
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
 			<input name="zcdlbm" type="hidden" value="<%=zcdlbm%>" >
			<input name="zcxlbm" type="hidden" value="<%=zcxlbm%>" >
			<input name="dwbh" type="hidden" value="<%=dwbh%>" >
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

function f_del(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要－删除[品牌供应商]报价?") )	
	{
		if(	javaTrim(FormName.dqbm)=="") {
			alert("请选择[所属地区]！");
			FormName.dqbm.focus();
			return false;
		}
		if(	javaTrim(FormName.zcdlbm)=="") {
			alert("请选择[主材大类]！");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.zcxlbm)=="") {
			alert("请选择[主材小类]！");
			FormName.zcxlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dwbh)=="") {
			alert("请选择[品牌供应商]！");
			FormName.dwbh.focus();
			return false;
		}

		FormName.target="_blank";
		FormName.action="ChooseDel.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</script>