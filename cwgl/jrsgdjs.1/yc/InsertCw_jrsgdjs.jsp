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
.STYLE2 {color: #0000FF}
.STYLE6 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=0;
String zjxxh=null;

double zqgczjf=0;
double zjxje=0;

double rgfbfb=7;
double bcrgf=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm";
	ls_sql+=" ,zqgczjf,zjxje,crm_khxx.bjjb,bjjbmc,clf,sgebfb,zjxxh";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		clf=rs.getDouble("clf");
		sgebfb=rs.getDouble("sgebfb");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("0"))//A:可以第一次拨工费
	{
		out.println("<BR>！！！错误，已付第一次工费");
		return;
	}

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		ls_sql="select tcsgze ";
		ls_sql+=" from  crm_tckhqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("tcsgze");
		}
		rs.close();
		ps.close();
	}



	bcrgf=cf.round(zqgczjf*rgfbfb/100,0);


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


	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_jrbgf";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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
<div align="center">施工队拨工费(开工、充值)</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">结算记录号</td>
	<td  width="8%">预算工料款</td>
	<td  width="5%">人工费百分比</td>
	<td  width="8%">已付人工费</td>
	<td  width="8%">本次应付人工费</td>
	<td  width="7%">类型</td>
	<td  width="5%">处理状态</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="40%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_jrbgf.jsjlh,TO_CHAR(cw_jrbgf.ysglk),cw_jrbgf.rgfbfb||'%',TO_CHAR(cw_jrbgf.yfrgf),cw_jrbgf.bcrgf,gdjsjdmc, DECODE(cw_jrbgf.clzt,'1','结算','2','审批同意','3','审批不同意'),cw_jrbgf.lrr,cw_jrbgf.lrsj,cw_jrbgf.bz ";
	ls_sql+=" FROM cw_jrbgf,dm_gdjsjd  ";
    ls_sql+=" where cw_jrbgf.lx=dm_gdjsjd.gdjsjd(+) and cw_jrbgf.khbh='"+khbh+"'";
	ls_sql+=" order by cw_jrbgf.jsjlh ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();

%>
</table>

<form method="post" action="SaveInsertCw_jrsgdjs.jsp" name="insertform" target="_blank">
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
    <td align="right"><font color="#0000FF">质检姓名</font></td>
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
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><span class="STYLE1">报价级别</span></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">实际开工日期</font></td>
    <td><%=sjkgrq%> </td>
    <td align="right"><font color="#0000FF">实际竣工日期</font></td>
    <td><%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">结算记录号</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">客户编号</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">施工队</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">现场负责人</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">预算工料款</span></td> 
  <td width="32%"><input type="text" name="ysglk" value="<%=zqgczjf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>人工费百分比</td> 
  <td width="32%"><input type="text" name="rgfbfb" value="<%=rgfbfb%>" size="10" maxlength="9" onChange="calValue(insertform)">
%</td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">本次应付人工费</span></td> 
  <td width="32%"><input type="text" name="bcrgf" value="<%=bcrgf%>" size="20" maxlength="17" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right"><font color="#FF0000">*</font>拨付日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
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
function calValue(FormName)
{  
	var bcrgf=FormName.ysglk.value/100*FormName.rgfbfb.value;
	FormName.bcrgf.value=round(bcrgf,0);
}    


function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[拨付日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "拨付日期"))) {
		return false;
	}
	if(	javaTrim(FormName.ysglk)=="") {
		alert("请输入[预算工料款]！");
		FormName.ysglk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysglk, "预算工料款"))) {
		return false;
	}

	if(	javaTrim(FormName.rgfbfb)=="") {
		alert("请输入[人工费百分比]！");
		FormName.rgfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfbfb, "人工费百分比"))) {
		return false;
	}

	if(	javaTrim(FormName.bcrgf)=="") {
		alert("请输入[本次应付人工费]！");
		FormName.bcrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.bcrgf, "本次应付人工费"))) {
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
