<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

String bjbbh=null;
String ssfgs=null;
String hxbm=null;
String dqbm=null;

String dxpzcsq="";//代销品主材授权
try {
	conn=cf.getConnection();

	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	ls_sql="select dxpzcsq,dqbm";
	ls_sql+=" from sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dxpzcsq=cf.fillNull(rs.getString("dxpzcsq"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<form method="POST" name="listform" action="" target="_blank">

  <table border="0" cellspacing="2" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	
	<tr bgcolor="#FFFF99"    >
	  <td width="25%" ><span class="STYLE1">结构位置</span>	    
	    <select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:118PX" >
          <option value=""></option>
          <%
				cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' order by xuhao","");
			%>
      </select></td>
	  <td width="25%" ><span class="STYLE1">主材大类</span>	    
	    <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:118PX" onChange="changeDl(listform)">
          <option value=""></option>
          <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
			%>
      </select></td>
	  <td width="25%"><span class="STYLE1">品&nbsp;&nbsp;&nbsp;&nbsp;牌</span>	    
	  <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:118PX" >
          <option value=""></option>
      </select></td>
	  <td width="25%" bgcolor="#CCCCCC" ><input type="button" value='查  询' onClick="f_cx(listform)" >
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value='存  盘' onClick="f_do(listform)"  >
	  
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		<input type="hidden" name="dxpzcsq" value="<%=dxpzcsq%>" >
	  <input type="hidden" name="dqbm" value="<%=dqbm%>" >	  </td>
    </tr>
	<tr bgcolor="#FFFF99"    >
	  <td bgcolor="#FFFF99" ><strong>名&nbsp;&nbsp;&nbsp;&nbsp;称</strong>
      <input type="text" name="clmc" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
	  <td ><strong>型&nbsp;&nbsp;&nbsp;&nbsp;号</strong>
      <input type="text" name="xh" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
	  <td ><strong>规&nbsp;&nbsp;&nbsp;&nbsp;格</strong>
      <input type="text" name="gg" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
	  <td ><strong>系&nbsp;&nbsp;列</strong>
      <input type="text" name="cllbbm" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  onChange="changeXh(listform)"></td>
    </tr>
	<tr bgcolor="#FFFFFF"    >
	  <td colspan="3" ><span class="STYLE1">主材编码</span>	    
	    <select name="zcbm" style="FONT-SIZE:12PX;WIDTH:525PX" onChange="changeBm(listform)">
	      <option value=""></option>
	      <option value="0">请输入【名称、型号、规格或系列】点查询按钮模糊查询</option>
      </select></td>
	  <td ><span class="STYLE1">单&nbsp;&nbsp;价</span>
      <input type="text" name="dj" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
    </tr>
	<tr bgcolor="#FFFFFF"    >
	  <td ><span class="STYLE1">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>
      <input type="text" name="sl" size="15" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
	  <td ><span class="STYLE1">远&nbsp;程&nbsp;费</span>
      <input type="text" name="ycf" size="15" value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
	  <td ><span class="STYLE1">其它费项</span>	    
	    <select name="qtfy" style="FONT-SIZE:12PX;WIDTH:118PX"  >
          <option value=""></option>
          <%
					cf.selectToken(out,"1+安装费&2+加工费&3+其它收费&W+无","W");
				%>
      </select></td>
	  <td ><span class="STYLE1">其它费</span>
      <input type="text" name="qtfyje" size="15" value="0" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
    </tr>
  </table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--


<%
	//启用Ajax
	cf.ajax(out);
%>

var fieldName="";
function changeDl(FormName)
{
	FormName.ppmc.length=1;
	fieldName="ppmc";

	if (FormName.zcdlbm.value=="")
	{
		return;
	}

	var sql;
	sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='<%=ssfgs%>' and jxc_ppxx.cldl='"+listform.zcdlbm.value+"' order by jxc_ppxx.ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}


function changeBm(FormName)
{
	FormName.dj.value="";

	if (FormName.zcbm.value=="")
	{
		return;
	}

	fieldName="dj";

	
//	var actionStr="GetCpxxByAjax.jsp?dqbm=<%=dqbm%>&clbm="+listform.zcbm.value;
	var actionStr="GetCpxxByAjax.jsp?ssfgs=<%=dxpzcsq%>&clbm="+listform.zcbm.value;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="ppmc")
	{
		strToItem2(listform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="cpbm")
	{
		strToSelect(listform.zcbm,ajaxRetStr);
	}
	else if (fieldName=="dj")
	{
		listform.dj.value=ajaxRetStr;
	}
}





function f_cx(FormName)
{
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}

	FormName.zcbm.length=1;


	fieldName="cpbm";

	var sql;

	sql="select jxc_clbm.clbm,clmc||'（'||xh||'）（'||gg||'）（'||cllbbm||'）'||'（'||xsj||'/'||jldwbm||'）' ";
	sql+=" FROM jxc_clbm,jxc_cljgb";
	sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
	sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
//	sql+=" and jxc_cljgb.sfyh='Y'";//Y：有货；N：无货
//	sql+=" and jxc_cljgb.xsfs in('1')";//1：代销品；2：现货销售；3：库存无货可销售
//	sql+=" and jxc_clbm.ppmc='"+trim(listform.ppmc.value)+"' and jxc_cljgb.dqbm='<%=dqbm%>'";
	sql+=" and jxc_clbm.ppmc='"+trim(listform.ppmc.value)+"' and jxc_cljgb.ssfgs='<%=dxpzcsq%>'";

	if (trim(FormName.clmc.value)!="")
	{
		sql+=" and jxc_clbm.clmc like '%"+trim(FormName.clmc.value)+"%'";
	}
	if (trim(FormName.xh.value)!="")
	{
		sql+=" and jxc_clbm.xh like '%"+trim(FormName.xh.value)+"%'";
	}
	if (trim(FormName.gg.value)!="")
	{
		sql+=" and jxc_clbm.gg like '%"+trim(FormName.gg.value)+"%'";
	}
	if (trim(FormName.cllbbm.value)!="")
	{
		sql+=" and jxc_clbm.cllbbm like '%"+trim(FormName.cllbbm.value)+"%'";
	}

	sql+=" order by jxc_clbm.clmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

} 



function f_do(FormName)
{
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请输入[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}

	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}



	if(	javaTrim(FormName.zcbm)=="") {
		alert("请输入[主材编码]！");
		FormName.zcbm.focus();
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
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	if(	javaTrim(FormName.qtfy)=="") {
		alert("请输入[其它费项]！");
		FormName.qtfy.focus();
		return false;
	}

	if(FormName.qtfy.value!="W") 
	{
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("请输入[其它费]！");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "其它费"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[其它费]不能为0！");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}



	FormName.target="xg";
	FormName.action="SaveInsertBj_khzcmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

