<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String zjxwcbz="";
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsrq=null;
String jsbl=null;
String jsje=null;
String clf=null;
String gdyp=null;
String sjbk=null;
String gdjsjd=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String jsjs=null;
String htje=null;
String zjxje=null;
String jsjsze=null;

String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String jzssk=null;
String yfgf=null;
double lkhjbfb=0;

String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

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
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

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
	ls_sql="select jsjlh,khbh,sgd,sgbz,jsrq,jsbl,jsje,clf,gdyp,sjbk,gdjsjd,lrr,lrsj,lrbm,bz,jsjs,htje,zjxje,jsjsze ";
	ls_sql+=" ,sfkclk,sfkgdyp,sfkyfgf,jzssk,yfgf,lkhjbfb";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		jzssk=cf.fillNull(rs.getString("jzssk"));
		yfgf=cf.fillNull(rs.getString("yfgf"));
		lkhjbfb=rs.getDouble("lkhjbfb");

		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		jsbl=cf.fillNull(rs.getString("jsbl"));
		jsje=cf.fillNull(rs.getString("jsje"));
		clf=cf.fillNull(rs.getString("clf"));
		gdyp=cf.fillNull(rs.getString("gdyp"));
		sjbk=cf.fillNull(rs.getString("sjbk"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jsjs=cf.fillNull(rs.getString("jsjs"));
		htje=cf.fillNull(rs.getString("htje"));
		zjxje=cf.fillNull(rs.getString("zjxje"));
		jsjsze=cf.fillNull(rs.getString("jsjsze"));
	}
	rs.close();
	ps.close();

	ls_sql="select zjxwcbz,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
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


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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

<html>
<head>
<title>拨工费－审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE5 {color: #CC0033; font-weight: bold; }
.STYLE6 {color: #0000CC}
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveShCw_sgdbgfty.jsp" name="editform">
<div align="center">拨工费－审核</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">拨工费记录号</td>
	<td  width="8%">类型</td>
	<td  width="7%">结算日期</td>
	<td  width="7%">合同金额</td>
	<td  width="6%">增减项金额</td>
	<td  width="8%">结算基数</td>
	<td  width="7%">结算基数总额</td>
	<td  width="4%">结算比例</td>
	<td  width="7%">结算金额</td>
	<td  width="5%">材料费</td>
	<td  width="5%">工地用品</td>
	<td  width="7%">实际拨款</td>
	<td  width="5%">录入人</td>
	<td  width="54%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdbgfty.jsjlh,gdjsjdmc,cw_sgdbgfty.jsrq,TO_CHAR(cw_sgdbgfty.htje),TO_CHAR(cw_sgdbgfty.zjxje), DECODE(cw_sgdbgfty.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','最新工程施工成本价','A','最新工程施工成本价＋其它费施工成本','D','合同工程施工成本价','E','合同工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),TO_CHAR(cw_sgdbgfty.jsjsze),cw_sgdbgfty.jsbl||'%',TO_CHAR(cw_sgdbgfty.jsje),TO_CHAR(cw_sgdbgfty.clf),TO_CHAR(cw_sgdbgfty.gdyp),cw_sgdbgfty.sjbk,cw_sgdbgfty.lrr,cw_sgdbgfty.bz  ";
	ls_sql+=" FROM cw_sgdbgfty,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdbgfty.gdjsjd=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdbgfty.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdbgfty.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdbgftyCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
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
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="电子报价">
        <input name="button4" type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
        <input name="button5" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
        <input name="button6" type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="领料单"></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">拨工费记录号</font></td> 
  <td width="32%"> 
    <input type="text" name="jsjlh" size="20" maxlength="9"  value="<%=jsjlh%>" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">客户编号</font></td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">施工队</font></td> 
  <td width="32%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd);
%>
    </select>  </td>
  <td align="right" width="18%"><font color="#0000CC">现场负责人</font></td> 
  <td width="32%"> 
    <input type="text" name="sgbz" size="20" maxlength="20"  value="<%=sgbz%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">结算基数</font></td>
  <td colspan="3"><select name="jsjs" style="FONT-SIZE:12PX;WIDTH:512PX">
    <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm where jsjsbm='"+jsjs+"'",jsjs);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">合同拨付基数</span></td>
  <td><input type="text" name="htje" size="20" maxlength="17"  value="<%=htje%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">增减项拨付基数</span></td>
  <td><input type="text" name="zjxje" size="20" maxlength="17"  value="<%=zjxje%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">拨工费次数</span></td>
  <td><select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+gdjsjd+"'",gdjsjd);
%>
  </select></td>
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>最大领款合计百分比</span></td>
  <td><input type="text" name="lkhjbfb" value="<%=lkhjbfb%>" size="10" maxlength="17" readonly>
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2 STYLE6">家装实收款</span></td>
  <td><input type="text" name="jzssk" value="<%=jzssk%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">结算基数总额</span></td>
  <td><input type="text" name="jsjsze" size="20" maxlength="17"  value="<%=jsjsze%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font>结算比例</td>
  <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9"  onchange="f_jsje(editform)">
%</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">结算金额</span></td> 
  <td colspan="3"> 
    <input type="text" name="jsje" size="20" maxlength="17"  value="<%=jsje%>" readonly>
    <span class="STYLE5">拨付金额=拨付基数总额×拨付比例</span> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">是否扣材料款</font></span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk,true);
%>  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6"><span class="STYLE2">已领</span>材料费</span></td>
  <td><input type="text" name="clf" size="20" maxlength="17"  value="<%=clf%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">是否扣工地用品</font></span></td>
  <td><%
	cf.radioToken(out, "sfkgdyp","Y+是&N+否",sfkgdyp,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6"><span class="STYLE2">已领</span>工地用品</span></td>
  <td><input type="text" name="gdyp" size="20" maxlength="17"  value="<%=gdyp%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">是否扣已付工费</font></span></td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+是&N+否",sfkyfgf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">已领取工费</span></td>
  <td><input type="text" name="yfgf" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">实际拨款</span></td>
  <td><input type="text" name="sjbk" size="20" maxlength="17"  value="<%=sjbk%>" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付日期</td> 
  <td width="32%"><input type="text" name="jsrq" size="20" maxlength="10"  value="<%=jsrq%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherejsjlh"  value="<%=wherejsjlh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input name="bx" type="button" onClick="window.open('SaveZjxbz.jsp?khbh=<%=khbh%>');this.disabled=true;yx.disabled=false;"  value="不许录入增减项" <%if (zjxwcbz.equals("3")) out.print("disabled");%>>
	  <input type="reset"  value="重输">
	  <input name="yx" type="button" onClick="window.open('SaveYxZjxbz.jsp?khbh=<%=khbh%>');this.disabled=true;bx.disabled=false;"  value="允许录入增减项" <%if (!zjxwcbz.equals("3")) out.print("disabled");%>>
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)//参数FormName:Form的名称
{
	var jsje=FormName.jsjsze.value*1.0*FormName.jsbl.value/100.0;
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	var sjbk=FormName.jsje.value*1.0;

	if ("<%=sfkclk%>"=="Y")//是否扣材料款
	{
		sjbk=sjbk-FormName.clf.value*1.0;
	}
	if ("<%=sfkgdyp%>"=="Y")//是否扣工地用品
	{
		sjbk=sjbk-FormName.gdyp.value*1.0;
	}
	if ("<%=sfkyfgf%>"=="Y")//是否扣已付工费
	{
		sjbk=sjbk-FormName.yfgf.value*1.0;
	}

	sjbk=sjbk-sjbk%100;

	sjbk=round(sjbk,0);

	FormName.sjbk.value=sjbk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[拨付记录号]！");
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
	if(	javaTrim(FormName.htje)=="") {
		alert("请输入[合同金额]！");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jzssk)=="") {
		alert("请输入[家装实收款]！");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "家装实收款"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.gdyp)=="") {
		alert("请输入[工地用品]！");
		FormName.gdyp.focus();
		return false;
	}
	if(!(isFloat(FormName.gdyp, "工地用品"))) {
		return false;
	}
	if(	javaTrim(FormName.yfgf)=="") {
		alert("请输入[已付工费]！");
		FormName.yfgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgf, "已付工费"))) {
		return false;
	}


	if(	javaTrim(FormName.jsjsze)=="") {
		alert("请输入[结算基数总额]！");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "结算基数总额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[拨付比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "拨付比例"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请输入[拨付金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "拨付金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sjbk)=="") {
		alert("请输入[实际拨款]！");
		FormName.sjbk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjbk, "实际拨款"))) {
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
