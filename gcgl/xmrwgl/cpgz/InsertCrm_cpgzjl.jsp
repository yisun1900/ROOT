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
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;

try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
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
<form method="post" action="SaveInsertCrm_cpgzjl.jsp" name="insertform">
<div align="center">录入－－产品信息</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="18%">产品分类</td>
	<td  width="9%">产品状态</td>
	<td  width="7%">状态发生时间</td>
	<td  width="5%">供货方</td>
	<td  width="5%">交底后新订单</td>
	<td  width="5%">选型是否完成</td>
	<td  width="6%">产品设计师</td>
	<td  width="5%">是否需返补</td>
	<td  width="5%">是否有异常</td>
	<td  width="7%">提醒日期</td>
	<td  width="7%">最晚应进场日期</td>
	<td  width="7%">计划入库时间</td>
	<td  width="7%">计划送货时间</td>
	<td  width="7%">计划安装时间</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_cpgzjl.khbh,crm_cpgzjl.cpflbm,cpflmc,cpztmc,ztfssj,crm_cpgzjl.ghf";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxdd,'Y','是','N','否') sfxdd";
	ls_sql+=" ,DECODE(crm_cpgzjl.zxsfwz,'Y','是','N','否') zxsfwz,crm_cpgzjl.cpsjs";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxfb,'N','无返补','Y','等待返补','W','返补成功','S','返补失败') sfxfb ";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfyyc,'N','无异常','Y','等待处理','W','异常解决成功','S','异常解决失败') sfyyc";
	ls_sql+=" ,crm_cpgzjl.txrq,crm_cpgzjl.zwyjcrq ";
	ls_sql+=" ,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj";

	ls_sql+=" FROM crm_cpgzjl,dm_cpflbm,dm_cpztbm  ";
    ls_sql+=" where crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
    ls_sql+=" and crm_cpgzjl.khbh='"+khbh+"'  ";
    ls_sql+=" order by crm_cpgzjl.lrsj ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"cpflmc","cpztmc","ztfssj","ghf","sfxdd","zxsfwz","cpsjs","sfxfb","sfyyc","txrq","zwyjcrq","jhrksj","jhshsj","jhazsj"};
	pageObj.setDisColName(disColName);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh","cpflbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_cpgzjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cpflmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE3">客户编号</span></td>
      <td><%=khbh%></td>
      <td align="right"><span class="STYLE3">合同号</span></td>
      <td><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE3">客户姓名</span></td>
      <td><%=khxm%></td>
      <td align="right"><span class="STYLE3">房屋地址</span></td>
      <td><%=fwdz%></td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品分类</td> 
  <td width="32%"><select name="cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm not in(select cpflbm from crm_cpgzjl where khbh='"+khbh+"') order by cpflbm","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>产品类型</td> 
  <td width="32%"><input type="radio" name="cplx"  value="1">
定制品
  <input type="radio" name="cplx"  value="2">
成品</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品安装类型</td> 
  <td width="32%"><input type="radio" name="cpazlx"  value="1">
    施工类
      <input type="radio" name="cpazlx"  value="2">
      安装类 </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>供货方</td> 
  <td width="32%"><input type="radio" name="ghf"  value="甲供">
    甲供
      <input type="radio" name="ghf"  value="公司供">
      公司供
      <input type="radio" name="ghf"  value="未确认">
      未确认 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">甲供品牌</td> 
  <td colspan="3"><input type="text" name="jgpp" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供货方获知时间</td> 
  <td width="32%"> 
    <input type="text" name="ghfhzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否交底后新订单</td> 
  <td width="32%"> 
    <input type="radio" name="sfxdd"  value="Y">是
    <input name="sfxdd" type="radio"  value="N" checked>
    否  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需后续管理</td> 
  <td width="32%"> 
    <input name="sfxhxgl" type="radio"  value="Y" checked>
    是
    <input type="radio" name="sfxhxgl"  value="N">否  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>选型是否完成</td> 
  <td width="32%"> 
    <input type="radio" name="zxsfwz"  value="Y">是
    <input type="radio" name="zxsfwz"  value="N">否  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品设计师</td> 
  <td width="32%"> 
    <input type="text" name="cpsjs" value="" size="20" maxlength="30" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需提醒</td> 
  <td width="32%"><input type="radio" name="sfxtx"  value="Y">
需提醒
  <input type="radio" name="sfxtx"  value="N">
否 </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">提醒日期</td>
  <td><input type="text" name="txrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">提醒小时</td>
  <td><input type="text" name="txxs" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">提醒内容</td> 
  <td colspan="3"><textarea name="txnr" cols="71" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最晚应进场日期</td>
  <td><input type="text" name="zwyjcrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">计划入库时间</td>
  <td><input type="text" name="jhrksj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划送货时间</td>
  <td><input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">计划安装时间</td>
  <td><input type="text" name="jhazsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>  </td>
  </tr>

    <tr align="center"> 
      <td colspan="4"> 
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly>  
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("请选择[产品分类]！");
		FormName.cpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.cplx)) {
		alert("请选择[产品类型]！");
		FormName.cplx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cpazlx)) {
		alert("请选择[产品安装类型]！");
		FormName.cpazlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ghf)) {
		alert("请选择[供货方]！");
		FormName.ghf[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.ghfhzsj, "供货方获知时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxdd)) {
		alert("请选择[是否交底后新订单]！");
		FormName.sfxdd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxhxgl)) {
		alert("请选择[是否需后续管理]！");
		FormName.sfxhxgl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zxsfwz)) {
		alert("请选择[选型是否完成]！");
		FormName.zxsfwz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxtx)) {
		alert("请选择[是否需提醒]！");
		FormName.sfxtx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.txrq, "提醒日期"))) {
		return false;
	}
	if(!(isNumber(FormName.txxs, "提醒小时"))) {
		return false;
	}
	if(!(isDatetime(FormName.zwyjcrq, "最晚应进场日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhrksj, "计划入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "计划安装时间"))) {
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

	FormName.action="SaveInsertCrm_cpgzjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
