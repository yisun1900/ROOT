<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
String dbph=request.getParameter("dbph");
String cklx=request.getParameter("cklx");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String dqbm=null;
String ssfgs=null;

String ckbh=null;
String ckjxz="1";//出库价选择,1：取价格表；2：取入库时销售价；3：取调拨单价格
try {
	conn=cf.getConnection();


	ls_sql="select dcdq,dcgs";
	ls_sql+=" from  jxc_db";
	ls_sql+=" where dbph='"+dbph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dcdq"));
		ssfgs=cf.fillNull(rs.getString("dcgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select csz";
	ls_sql+=" from  sq_xtcsb";
	ls_sql+=" where csbm='ckjxz'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckjxz=cf.fillNull(rs.getString("csz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="SaveInsertJxc_ckdDbd.jsp" name="insertform" >
<div align="center">调拨单<strong>[<%=dbph%>]</strong>出库记录</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">出库批号</td>
	<td  width="8%">出库单状态</td>
	<td  width="10%">出库总数量</td>
	<td  width="10%">出库总金额</td>
	<td  width="8%">出库人</td>
	<td  width="10%">出库时间</td>
	<td  width="10%">是否有负库存</td>
	<td  width="14%">出库仓库</td>
	<td  width="20%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jxc_ckd.dbph,DECODE(jxc_ckd.ckdzt,'0','未提交','1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','已结算','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','审核通过','9','出库完成'), jxc_ckd.ckzsl,jxc_ckd.ckzje,jxc_ckd.ckr,jxc_ckd.cksj, DECODE(jxc_ckd.sfyfkc,'1','无负库存','2','负库存未入库','3','负库存入库'),ckmc,jxc_ckd.bz  ";
	ls_sql+=" FROM jxc_ckd,jxc_ckmc  ";
    ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+)";
    ls_sql+=" and jxc_ckd.lydh='"+dbph+"' and jxc_ckd.cklx='R'";
    ls_sql+=" order by jxc_ckd.dbph";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dbph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_ckd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("dbph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<div align="center"><strong>请录入出库单</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">地区</span></td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">分公司</span></td>
  <td><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' order by dwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">出库类型</span></td>
  <td><select name="cklx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"D+订单出库&B+报废出库&T+退货出库&S+申购出库&P+调拨单出库&J+代金券出库&X+销售出库&R+调拨出库",cklx,false);
%>
  </select></td>
  <td align="right" class="STYLE2"><span class="STYLE1">*</span>来源单号</td>
  <td><input type="text" name="lydh" value="<%=dbph%>" size="20" maxlength="13" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>出库仓库</td> 
  <td width="32%"><p>
    <select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and dqbm='"+dqbm+"'  order by ckmc","");
%>
    </select>
  </p>    </td>
  <td align="right" width="15%">经手人</td> 
  <td width="35%"><input type="text" name="jsr" value="" size="20" maxlength="20" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>出库方式</td>
  <td colspan="3">
    <input name="ckfs" type="radio"  value="1" checked>
    自动出库（先生产先出库） 
    <input type="radio" name="ckfs"  value="2">自动出库（先入库先出库））
	<input type="radio" name="ckfs"  value="3">手工出库  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>出库价选择</td>
  <td colspan="3">
<%
	cf.radioToken(out, "ckjxz","1+取价格表&2+取入库时定价&3+取开单价格&4+人工录入",ckjxz,true);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">配送方式</td> 
  <td width="32%"> 
    <input type="radio" name="psfs"  value="0">厂家配送
    <input type="radio" name="psfs"  value="1">公司送货
    <input type="radio" name="psfs"  value="2">自取  </td>
  <td align="right" width="15%">计划送货时间</td> 
  <td width="35%"> 
    <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>出库人</td> 
  <td width="32%"> 
    <input type="text" name="ckr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>出库时间</td> 
  <td width="35%"> 
    <input type="text" name="cksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td>
	<input type="text" name="lrr" value="<%=yhmc%>" size="20"  readonly>  </td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td>
	<input type="text" name="lrsj" value="<%=cf.today()%>" size="20"  readonly>  </td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td>
   <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'  order by dwbh","");
   %>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="button" onClick="window.open('/jxcfc/dbd/ViewJxc_db.jsp?dbph=<%=dbph%>')"  value="查看来源单信息"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cklx)=="") {
		alert("请选择[出库类型]！");
		FormName.cklx.focus();
		return false;
	}
	if(	javaTrim(FormName.lydh)=="") {
		alert("请输入[来源单号]！");
		FormName.lydh.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请选择[出库仓库]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ckfs)) {
		alert("请选择[出库方式]！");
		FormName.ckfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ckjxz)=="") {
		alert("请选择[出库价选择]！");
		FormName.ckjxz.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ckr)=="") {
		alert("请输入[出库人]！");
		FormName.ckr.focus();
		return false;
	}
	if(	javaTrim(FormName.cksj)=="") {
		alert("请输入[出库时间]！");
		FormName.cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj, "出库时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
