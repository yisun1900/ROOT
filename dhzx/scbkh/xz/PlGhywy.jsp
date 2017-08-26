<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] scbkhbh=request.getParameterValues("scbkhbh");

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
String ssfgs=null;
String ywybm=null;
String zxdm=null;
String ywyssxz=null;

try {
	conn=cf.getConnection();

	stmt = conn.createStatement();

	ls_sql="select count(distinct ssfgs)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where "+cf.arrayToInSQL(scbkhbh,"scbkhbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("错误！只能同一个分公司的客户，才能批量替换");
		return;
	}

	ls_sql="select count(distinct ywybm)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where "+cf.arrayToInSQL(scbkhbh,"scbkhbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("错误！只能同一业务员部门的客户，才能批量替换");
		return;
	}

	ls_sql="select count(distinct ywyssxz)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where "+cf.arrayToInSQL(scbkhbh,"scbkhbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("错误！只能同一小组客户，才能批量替换");
		return;
	}

	ls_sql="select ssfgs,ywybm,ywyssxz";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where scbkhbh='"+scbkhbh[0]+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		ywybm=rs.getString("ywybm");
		ywyssxz=rs.getString("ywyssxz");
	}
	rs.close();

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
<title>批量修改业务员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="SavePlGhywy.jsp" name="editform">
		  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td colspan="2" align="center" height="41"><b><font color="#000066">批量修改业务员</font></b></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="38%" align="right" height="52"><span class="STYLE2">*</span><span class="STYLE1">分公司</span></td>
      <td width="62%" height="52"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' order by dwbh",ssfgs);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" height="45"><span class="STYLE2">*</span><span class="STYLE1">业务员部门</span></td>
      <td height="45"><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywybm+"'",ywybm);
	%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" height="45">业务员所属小组</td>
      <td height="45"><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXz(editform)">
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"'",ywyssxz);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="38%" align="right" height="45"><span class="STYLE2">*</span>新业务员</td>
      <td width="62%" height="45"> 
        <select name="newywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <option value=""></option>
          <%
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where sfzszg in('Y','N') and sjsbh='"+ywyssxz+"' and zwbm='19' order by yhmc","");

%> 
        </select>      </td>
    </tr>
    <tr> 
      <td colspan="2" height="2"> 
        <div align="center"> <%
	for (int i=0;i<scbkhbh.length ;i++ )
	{
		%> 
          <input type="hidden" name="scbkhbh" value="<%=scbkhbh[i]%>" >
          <%
	}

%> 
          <input type="button"  value="开始更换" onClick="f_do(editform)">
        </div>      </td>
    </tr>
  </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

function changeXz(FormName)
{
	var sql ="";
	FormName.newywy.length=1;

	if (FormName.ywyssxz.value=="")
	{
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx ";
		sql+=" where sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";

		sql+=" ORDER BY c1";
	}
	else{
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx ";
		sql+=" where sq_yhxx.zwbm='19' and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.dwbh='"+FormName.ywybm.value+"'";
		sql+=" and sq_yhxx.sjsbh='"+FormName.ywyssxz.value+"'";

		sql+=" ORDER BY c1";
	}


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(editform.newywy,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ywybm)=="") {
		alert("请输入[业务员部门]！");
		FormName.ywybm.focus();
		return false;
	}
	if(	javaTrim(FormName.newywy)=="") {
		alert("请输入[新业务员]！");
		FormName.newywy.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
