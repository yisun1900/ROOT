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
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));


String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
		out.println("<BR>！！！错误，客户已完工");
		return;
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
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
<form method="post" action="SaveInsertCrm_xmycgl.jsp" name="insertform"  >
<div align="center"><strong>项目异常－录入</strong></div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">登记编号</td>
	<td  width="5%">状态</td>
	<td  width="5%">解决</td>
	<td  width="7%">问题时间</td>
	<td  width="5%">当事人</td>
	<td  width="22%">出现问题</td>
	<td  width="22%">解决方案</td>
	<td  width="7%">处理时间</td>
	<td  width="20%">实际处理情况</td>
	
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT crm_xmycgl.djbh, DECODE(crm_xmycgl.zt,'1','录入','2','制订方案','3','方案审核','4','已处理'), DECODE(crm_xmycgl.wtsfjj,'Y','解决','N','未解决'),crm_xmycgl.cxwtsj,crm_xmycgl.dsr,crm_xmycgl.cxwt,crm_xmycgl.jjfa,crm_xmycgl.clsj,crm_xmycgl.sjclqk ";
	ls_sql+=" FROM crm_xmycgl,sq_dwxx  ";
    ls_sql+=" where crm_xmycgl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_xmycgl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_xmycgl.lrsj desc";
	pageObj.sql=ls_sql;
//进行对象初始化

	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">工程担当</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">管家</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">调度</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>异常分类</td>
  <td><select name="ycflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select ycflbm,ycflmc from dm_ycflbm order by ycflbm","");
%>
  </select></td>
  <td align="right"><span class="STYLE2"><span class="STYLE1">*</span></span>出现问题时间</td>
  <td><input type="text" name="cxwtsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2"><span class="STYLE1">*</span></span>当事人</td> 
  <td width="32%"><input type="text" name="dsr" value="" size="20" maxlength="20" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2"><span class="STYLE1">*</span></span>出现问题</td> 
  <td colspan="3"> 
    <textarea name="cxwt" cols="75" rows="6"></textarea>  </td>
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
    <textarea name="bz" cols="75" rows="2"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	    <input type="hidden" name="khbh" value="<%=khbh%>"  >
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
	if(	javaTrim(FormName.cxwtsj)=="") {
		alert("请输入[出现问题时间]！");
		FormName.cxwtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxwtsj, "出现问题时间"))) {
		return false;
	}
	if(	javaTrim(FormName.dsr)=="") {
		alert("请输入[当事人]！");
		FormName.dsr.focus();
		return false;
	}
	if(	javaTrim(FormName.ycflbm)=="") {
		alert("请选择[异常分类]！");
		FormName.ycflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cxwt)=="") {
		alert("请输入[出现问题]！");
		FormName.cxwt.focus();
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
