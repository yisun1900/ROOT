<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String bgfjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String bfrq=null;
String lx=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;

double qye=0;
double zhhtzcbj=0;
double ssk=0;
double yfgf=0;
double bfbl=8;
double bfje=0;

String wherebgfjlh=cf.GB2Uni(request.getParameter("bgfjlh"));

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
String gdjsjd=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bgfjlh,khbh,sgd,sgbz,bfrq,bfbl,bfje,qye,zhhtzcbj,ssk,yfgf,lx,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_chbgfjl";
	ls_sql+=" where  (bgfjlh='"+wherebgfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bgfjlh=cf.fillNull(rs.getString("bgfjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		bfrq=cf.fillNull(rs.getDate("bfrq"));

		bfbl=rs.getDouble("bfbl");
		bfje=rs.getDouble("bfje");
		qye=rs.getDouble("qye");
		zhhtzcbj=rs.getDouble("zhhtzcbj");
		ssk=rs.getDouble("ssk");
		yfgf=rs.getDouble("yfgf");

		lx=cf.fillNull(rs.getString("lx"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
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
<title>修改信息</title>
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
<form method="post" action="SaveEditCw_chbgfjl.jsp" name="editform">
<div align="center">请修改信息</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">记录号</td>
	<td  width="9%">类型</td>
	<td  width="7%">拨付日期</td>
	<td  width="6%">拨付比例</td>
	<td  width="8%">拨付金额</td>
	<td  width="8%">合同额</td>
	<td  width="8%">橱柜木门金额</td>
	<td  width="8%">实收款</td>
	<td  width="8%">已付工费</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="20%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_chbgfjl.bgfjlh,gdjsjdmc,cw_chbgfjl.bfrq,cw_chbgfjl.bfbl||'%',cw_chbgfjl.bfje,TO_CHAR(cw_chbgfjl.qye),TO_CHAR(cw_chbgfjl.zhhtzcbj),TO_CHAR(cw_chbgfjl.ssk),TO_CHAR(cw_chbgfjl.yfgf),cw_chbgfjl.lrr,cw_chbgfjl.lrsj,cw_chbgfjl.bz  ";
	ls_sql+=" FROM cw_chbgfjl,dm_gdjsjd  ";
    ls_sql+=" where   cw_chbgfjl.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_chbgfjl.khbh='"+khbh+"'";
    ls_sql+=" order by cw_chbgfjl.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");

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
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">结算记录号</font></td> 
  <td width="32%"> 
    <input type="text" name="bgfjlh" size="20" maxlength="9"  value="<%=bgfjlh%>" readonly>  </td>
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
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">类型</font></td>
  <td><select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+lx+"'",lx);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">合同额</span></td>
  <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">橱柜木门金额</span></td>
  <td><input type="text" name="zhhtzcbj" value="<%=zhhtzcbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">家装实收款</span></td>
  <td><input type="text" name="ssk" value="<%=ssk%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">已付工费</span></td>
  <td><input type="text" name="yfgf" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>拨付比例</td>
  <td><input type="text" name="bfbl" value="<%=bfbl%>" size="10" maxlength="9" onChange="f_bfje(editform)">
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">拨付金额</span></td>
  <td colspan="3"><input type="text" name="bfje" value="<%=bfje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">拨付金额=(合同额-橱柜木门金额)×60％×拨付比例</span></td>
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
  <td width="32%"><input type="text" name="bfrq" size="20" maxlength="10"  value="<%=bfrq%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherebgfjlh"  value="<%=wherebgfjlh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
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
function f_bfje(FormName)//参数FormName:Form的名称
{
	var bfje=(FormName.qye.value*1.0-FormName.zhhtzcbj.value*1.0)*0.6*FormName.bfbl.value/100.0;
	bfje=round(bfje,2);
	FormName.bfje.value=bfje;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_bfje(FormName);

	if(	javaTrim(FormName.bgfjlh)=="") {
		alert("请输入[拨付记录号]！");
		FormName.bgfjlh.focus();
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
	if(	javaTrim(FormName.lx)=="") {
		alert("请输入[类型]！");
		FormName.lx.focus();
		return false;
	}
	if(	javaTrim(FormName.bfrq)=="") {
		alert("请输入[拨付日期]！");
		FormName.bfrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.bfrq, "拨付日期"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[合同金额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zhhtzcbj)=="") {
		alert("请输入[橱柜木门金额]！");
		FormName.zhhtzcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhhtzcbj, "橱柜木门金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("请输入[家装实收款]！");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "家装实收款"))) {
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


	if(	javaTrim(FormName.bfbl)=="") {
		alert("请输入[拨付比例]！");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "拨付比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bfje)=="") {
		alert("请输入[拨付金额]！");
		FormName.bfje.focus();
		return false;
	}
	if(!(isFloat(FormName.bfje, "拨付金额"))) {
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
