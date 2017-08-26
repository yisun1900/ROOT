<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String bjjbbm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
 
	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_khzcxmTcwXp.jsp" name="insertform">
<div align="center">录入－套餐选配主材</div>

<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="2%">序号</td>
	<td  width="3%"><span class="STYLE2"><span class="STYLE1">*</span>报价级别</span></td>
	<td  width="2%"><span class="STYLE2"><span class="STYLE1">*</span>数量</span></td>
	<td  width="3%">单价</td>
	<td  width="4%">收费</td>
	<td  width="12%"><span class="STYLE2">配套产品说明</span></td>
	<td  width="5%">产品编码</td>
	<td  width="7%">产品名称</td>
	<td  width="6%">品牌</td>
	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">损耗</td>
	<td  width="5%">产品类别</td>
	<td  width="10%">供应商</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT TO_CHAR(bj_khzcxm.sxh) sxh,bjjbmc,bj_khzcxm.sl,TO_CHAR(bj_khzcxm.dj),ROUND(bj_khzcxm.sl*bj_khzcxm.dj,2),bj_khzcxm.ptcpsm,bj_khzcxm.cpbm,bj_khzcxm.cpmc,bj_khzcxm.ppmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.jldw,bj_khzcxm.sh||'%',clxlmc,bj_khzcxm.gysmc ";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_khzcxm  ";
    ls_sql+=" where bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.khbh='"+khbh+"'  ";
    ls_sql+=" and bj_khzcxm.zclx in('4')";//主材类型 1：套餐内；2：套餐外；3：升级大店；4：大店外
    ls_sql+=" and bj_khzcxm.ddcljjfs in('3')";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
    ls_sql+=" order by bj_khzcxm.cpbm,bj_khzcxm.sxh";


    pageObj.sql=ls_sql;
	pageObj.initPage("","","DeleteBj_khzcxmTcwXp.jsp?khbh="+khbh,"EditBj_khzcxmTcwXp.jsp?khbh="+khbh);

//设置主键
	String[] keyName={"sxh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("删除");
	pageObj.setViewBolt("");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">客户编号</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">报价级别</span></td> 
  <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>品牌</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
	String sql="";
	sql="select distinct  ppmc c1,ppmc c2 from bj_tcwzck where jjfs='3' and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE))) order by ppmc";
	cf.selectItem(out,sql,"");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>产品</td>
  <td colspan="3"><select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX">
    <option value=""></option>
    <option value="0">请先选择品牌</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>结构位置</td>
  <td>
  <select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"'  order by jgwzbm","");
%>
  </select>  </td>
  <td align="right"><span class="STYLE1">*</span>数量</td>
  <td><input type="text" name="sl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">配套产品说明</td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="" size="73" maxlength="200"  >  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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

function changePp(FormName)
{
	FormName.cpbm.length=1;

	if (FormName.ppmc.value=="")
	{
		return;
	}

	var sql;
	sql="select cpbm,cpmc||'（'||xh||'）（'||gg||'）'||'（￥'||dj||'/'||jldw||'）' from bj_tcwzck where ppmc='"+FormName.ppmc.value+"' and jjfs='3' and cpbm not in(select cpbm from bj_khzcxm where khbh='<%=khbh%>' and zclx in('3','4')) and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)))  order by cpmc,xh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.cpbm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("请选择[产品]！");
		FormName.cpbm.focus();
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
