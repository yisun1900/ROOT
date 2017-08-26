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
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
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
      <tr  >
        <td align="right" ><font color="#FF0000">*</font>所属地区</td>
        <td><select name="dqbm" size="15" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
%>
        </select></td>
      </tr>
      <tr valign="bottom"  > 
        <td width="44%" height="49" align="right" ><font color="#FF0000">*</font>主材编码生成方式：</td>
        <td width="56%">
          <input name="zcbmfs" type="radio" value="1" checked>
          系统自动生成
        <input type="radio" name="zcbmfs" value="2">导入</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
          <input type="button"  value="继续" onClick="f_onclick(loadform)">        </td>
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
	if(	!selectChecked(FormName.dqbm)) {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.zcbmfs)) {
		alert("请选择[主材编码生成方式]！");
		FormName.zcbmfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.loadName)=="") {
		alert("请选择[EXECEL文件]！");
		FormName.loadName.focus();
		return false;
	}


	FormName.action="DisImpAddData.jsp";

	FormName.submit();
	return true;
} 

//-->
</script>