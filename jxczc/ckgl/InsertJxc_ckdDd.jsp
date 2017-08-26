<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
String ddbh=request.getParameter("ddbh");
String cklx=request.getParameter("cklx");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;

String dqbm=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;
String gcjdbm=null;

String ckbh=null;
String ckjxz="3";//出库价选择,1：取价格表；2：取入库时销售价；3：取材料单价格
try {
	conn=cf.getConnection();

	ls_sql="select jc_zcdd.khbh ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh,gcjdbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
	}
	rs.close();
	ps.close();


	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<form method="post" action="" name="insertform" >
<div align="center">主材订单<strong>[<%=ddbh%>]</strong>出库记录</div>

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

	ls_sql="SELECT jxc_ckd.ckph,DECODE(jxc_ckd.ckdzt,'0','未提交','1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','已结算','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','审核通过','9','出库完成'), jxc_ckd.ckzsl,jxc_ckd.ckzje,jxc_ckd.ckr,jxc_ckd.cksj, DECODE(jxc_ckd.sfyfkc,'1','无负库存','2','负库存未入库','3','负库存入库'),ckmc,jxc_ckd.bz  ";
	ls_sql+=" FROM jxc_ckd,jxc_ckmc  ";
    ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+)";
    ls_sql+=" and jxc_ckd.lydh='"+ddbh+"' and jxc_ckd.cklx='"+cklx+"'";
    ls_sql+=" order by jxc_ckd.ckph";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ckph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_ckd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ckph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<div align="center"><strong>请录入出库单</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000CC">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000CC">质检员</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">签约店面</font></td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
    <td align="right"><font color="#0000CC">设计师</font></td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">施工队</font> </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>    </td>
    <td align="right"><font color="#0000CC">施工班组</font> </td>
    <td><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">合同开工日期</font></td>
    <td bgcolor="#FFFFFF"><%=kgrq%> </td>
    <td align="right"><font color="#0000CC">合同交工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>

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
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"' order by dwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">出库类型</span></td>
  <td><select name="cklx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"D+主材订单出库&B+报废出库&T+退货出库&S+申购出库&P+材料单出库&J+代金券出库&X+销售出库&R+调拨出库",cklx,false);
%>
  </select></td>
  <td align="right" class="STYLE2"><span class="STYLE1">*</span>来源单号</td>
  <td><input type="text" name="lydh" value="<%=ddbh%>" size="20" maxlength="13" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>出库仓库</td> 
  <td width="32%"><p>
    <select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy,jxc_ckssfgs where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_ckmc.ckbh=jxc_ckssfgs.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and jxc_ckssfgs.ssfgs='"+fgs+"'  order by ckmc","");
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
%>
  </td>
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
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="button" onClick="f_sgd(insertform)"  value="订单转申购单">
	<input type="reset"  value="重输" name="reset">
	<input type="button" onClick="window.open('/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>')"  value="查看来源单信息"></td>
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

	FormName.target="";
	FormName.action="SaveInsertJxc_ckdDd.jsp";
	FormName.submit();
	return true;
}

function f_sgd(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lydh)=="") {
		alert("请输入[来源单号]！");
		FormName.lydh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="/jxczc/sgdgl/DdToSgd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
