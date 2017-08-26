<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsrq=null;
double htje=0;
double suijin=0;
double glf=0;
double gczxzq=0;
double gcjxzq=0;
double gcjse=0;
double jsbl=0;
double jsje=0;

double kzbjbl=0;
double kzb=0;
double gcglfk=0;
double gcqtfk=0;
double jsyfje=0;

double clfk=0;//材料评审处罚
double llje=0;//库房领料金额
double yfgck=0;//已付工程款
double ykgccf=0;
double qtkk=0;
double xcyxfy=0;//现场营销费用
double clyf=0;//材料运费
double gcsfje=0;//工程实付金额


String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;


double gcze=0;


String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gdjsjd=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,jsrq,htje,suijin,glf,gczxzq,gcjxzq,gcjse,jsbl,jsje   ,kzbjbl,kzb,gcglfk,gcqtfk,jsyfje   ,clfk,llje,yfgck,ykgccf,qtkk,xcyxfy,clyf,gcsfje   ,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_sgdwgjsjlkb";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfk=rs.getDouble("clfk");
		llje=rs.getDouble("llje");
		yfgck=rs.getDouble("yfgck");
		ykgccf=rs.getDouble("ykgccf");
		qtkk=rs.getDouble("qtkk");
		xcyxfy=rs.getDouble("xcyxfy");
		clyf=rs.getDouble("clyf");
		gcsfje=rs.getDouble("gcsfje");

		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));

		htje=rs.getDouble("htje");
		suijin=rs.getDouble("suijin");
		glf=rs.getDouble("glf");
		gczxzq=rs.getDouble("gczxzq");
		gcjxzq=rs.getDouble("gcjxzq");
		gcjse=rs.getDouble("gcjse");
		jsbl=rs.getDouble("jsbl");
		jsje=rs.getDouble("jsje");

		kzbjbl=rs.getDouble("kzbjbl");
		kzb=rs.getDouble("kzb");
		gcglfk=rs.getDouble("gcglfk");
		gcqtfk=rs.getDouble("gcqtfk");
		jsyfje=rs.getDouble("jsyfje");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	gcze=htje-suijin-glf;
	gcze=cf.round(gcze,2);

	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("8"))//8:完工结算
	{
		conn.rollback();
		out.println("错误！结算进度不正确");
		return;
	}
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
.STYLE5 {color: #000099; font-weight: bold; }
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_sgdwgjsjlkb.jsp" name="insertform" target="_blank">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE2">结算记录号</span></td>
    <td width="31%" bgcolor="#E8E8FF"><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE2">客户编号</span></td>
    <td width="31%" bgcolor="#E8E8FF"><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE2">施工队</span></td>
    <td bgcolor="#E8E8FF"><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE2">现场负责人</span></td>
    <td bgcolor="#E8E8FF"><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>合同金额</td>
    <td bgcolor="#E8E8FF"><input type="text" name="htje" value="<%=htje%>" size="20" maxlength="17" readonly></td>
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>扣除税金管理费工程额</td>
    <td bgcolor="#E8E8FF"><input name="gcze" type="text" value="<%=gcze%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>税金</td>
    <td bgcolor="#E8E8FF"><input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="17" readonly>    </td>
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>管理费</td>
    <td bgcolor="#E8E8FF"><input type="text" name="glf" value="<%=glf%>" size="20" maxlength="17" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>折前工程增项金额</td>
    <td bgcolor="#E8E8FF"><input name="gczxzq" type="text" value="<%=gczxzq%>" size="20" maxlength="17" readonly></td>
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>折前工程减项金额</td>
    <td bgcolor="#E8E8FF"><input name="gcjxzq" type="text"  value="<%=gcjxzq%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE5">工程结算额</span></td>
    <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="gcjse" value="<%=gcjse%>" size="20" maxlength="17" readonly>
        <span class="STYLE5">工程结算额＝扣除税金管理费工程额＋折前工程增项金额―折前工程减项金额</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>承包结算比例</td>
    <td bgcolor="#E8E8FF"><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
      %</td>
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE5">结算总额</span></td>
    <td bgcolor="#E8E8FF"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
    <td colspan="3" bgcolor="#E8E8FF"><span class="STYLE5">结算金额＝工程结算额×承包结算比例</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">应扣质保金比例</td>
  <td bgcolor="#FFFFCC"><input type="text" name="kzbjbl" size="10" maxlength="17"  value="<%=kzbjbl%>" onChange="f_jsje(insertform)">
    %</td>
  <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
  <td bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">扣质保金</td>
  <td colspan="3" bgcolor="#FFFFCC"><input type="text" name="kzb" size="20" maxlength="17"  value="<%=kzb%>" >
      <span class="STYLE5">扣质保金=工程结算额×应扣质保金比例</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">工程管理处罚</td>
  <td bgcolor="#FFFFCC"><input type="text" name="gcglfk" size="20" maxlength="17"  value="<%=gcglfk%>" ></td>
  <td align="right" bgcolor="#FFFFCC">工程其它处罚</td>
  <td bgcolor="#FFFFCC"><input type="text" name="gcqtfk" size="20" maxlength="17"  value="<%=gcqtfk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">结算应付金额</td>
  <td colspan="3" bgcolor="#FFFFCC"><input type="text" name="jsyfje" size="20" maxlength="17"  value="<%=jsyfje%>" >
      <span class="STYLE5">结算应付金额＝结算金额－扣质保金－工程管理处罚－工程其它处罚</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>材料评审处罚</td>
  <td bgcolor="#FFFFCC"><input type="text" name="clfk" size="20" maxlength="17"  value="<%=clfk%>" onChange="f_jsje(insertform)"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>库房领料金额</td>
  <td bgcolor="#FFFFCC"><input type="text" name="llje" size="20" maxlength="17"  value="<%=llje%>" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>已付工程款</td>
  <td bgcolor="#FFFFCC"><input type="text" name="yfgck" size="20" maxlength="17"  value="<%=yfgck%>" onChange="f_jsje(insertform)"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>已扣工程处罚</td>
  <td bgcolor="#FFFFCC"><input name="ykgccf" type="text" value="<%=ykgccf%>" onChange="f_jsje(insertform)" size="20" maxlength="17"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>其它扣款</td>
  <td bgcolor="#FFFFCC"><input name="qtkk" type="text" value="<%=qtkk%>" onChange="f_jsje(insertform)" size="20" maxlength="17"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>现场营销费用</td>
  <td bgcolor="#FFFFCC"><input type="text" name="xcyxfy" size="20" maxlength="17"  value="<%=xcyxfy%>" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>材料运费</td>
  <td bgcolor="#FFFFCC"><input type="text" name="clyf" size="20" maxlength="17"  value="<%=clyf%>" onChange="f_jsje(insertform)"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE5"><span class="STYLE1">*</span>工程实付金额</span></td>
  <td bgcolor="#FFFFCC"><input type="text" name="gcsfje" size="20" maxlength="17"  value="<%=gcsfje%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#FFFFCC"><span class="STYLE5">工程实付金额＝结算应付金额－材料评审处罚－库房领料金额－已付工程款＋已扣工程处罚-其它扣款-现场营销费用-材料运费</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td> 
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
  <td align="right"><span class="STYLE1">*</span>结算日期</td>
  <td><input type="text" name="jsrq" value="<%=jsrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>    </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
<input type="hidden" name="wherejsjlh"  value="<%=wherejsjlh%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="reset"  value="重输">
	  <input name="button" type="button" onClick="window.open('ViewCw_sgdwgjsjlkb.jsp?jsjlh=<%=jsjlh%>')"  value="打印">
	  <input name="button2" type="button" onClick="window.open('ViewExcelCw_sgdwgjsjlkb.jsp?jsjlh=<%=jsjlh%>')"  value="Excel">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)
{
	var jsje=0;
	jsje=FormName.gcjse.value*FormName.jsbl.value/100;
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;
	
	var kzb=0;
	kzb=FormName.gcjse.value*FormName.kzbjbl.value/100;
	kzb=round(kzb,2);
	FormName.kzb.value=kzb;
	
	//结算应付金额＝结算总额－扣质保金－工程管理处罚－工程其它处罚
	var jsyfje=0;
	jsyfje=FormName.jsje.value*1.0-FormName.kzb.value*1.0-FormName.gcglfk.value*1.0-FormName.gcqtfk.value*1.0;
	jsyfje=round(jsyfje,2);
	FormName.jsyfje.value=jsyfje;

	//工程实付金额＝结算应付金额－材料评审处罚－库房领料金额－已付工程款+已扣工程处罚-其它扣款-现场营销费用-材料运费
	var gcsfje=0;
	gcsfje=FormName.jsyfje.value*1.0-FormName.clfk.value*1.0-FormName.llje.value*1.0-FormName.yfgck.value*1.0+FormName.ykgccf.value*1.0-FormName.qtkk.value*1.0-FormName.xcyxfy.value*1.0-FormName.clyf.value*1.0;
	gcsfje=round(gcsfje,2);
	FormName.gcsfje.value=gcsfje;

}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

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
		alert("请输入[结算日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "结算日期"))) {
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
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[税金]！");
		FormName.suijin.focus();
		return false;
	}
	if(!(isFloat(FormName.suijin, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[管理费]！");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.gczxzq)=="") {
		alert("请输入[工程增项]！");
		FormName.gczxzq.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzq, "工程增项"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxzq)=="") {
		alert("请输入[工程减项]！");
		FormName.gcjxzq.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxzq, "工程减项"))) {
		return false;
	}

	if(	javaTrim(FormName.gcjse)=="") {
		alert("请输入[工程结算额]！");
		FormName.gcjse.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjse, "工程结算额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[承包结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "承包结算比例"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请输入[结算金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算金额"))) {
		return false;
	}


	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("请输入[应扣质保金比例]！");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "应扣质保金比例"))) {
		return false;
	}
	if(	javaTrim(FormName.kzb)=="") {
		alert("请输入[扣质保金]！");
		FormName.kzb.focus();
		return false;
	}
	if(!(isFloat(FormName.kzb, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.gcglfk)=="") {
		alert("请输入[工程管理处罚]！");
		FormName.gcglfk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcglfk, "工程管理处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.gcqtfk)=="") {
		alert("请输入[工程其它处罚]！");
		FormName.gcqtfk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcqtfk, "工程其它处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.jsyfje)=="") {
		alert("请输入[结算应付金额]！");
		FormName.jsyfje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsyfje, "结算应付金额"))) {
		return false;
	}


	if(	javaTrim(FormName.clfk)=="") {
		alert("请输入[材料评审处罚]！");
		FormName.clfk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfk, "材料评审处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.llje)=="") {
		alert("请输入[库房领料金额]！");
		FormName.llje.focus();
		return false;
	}
	if(!(isFloat(FormName.llje, "库房领料金额"))) {
		return false;
	}
	if(	javaTrim(FormName.yfgck)=="") {
		alert("请输入[已付工程款]！");
		FormName.yfgck.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgck, "已付工程款"))) {
		return false;
	}

	if(	javaTrim(FormName.ykgccf)=="") {
		alert("请输入[已扣工程处罚]！");
		FormName.ykgccf.focus();
		return false;
	}
	if(!(isFloat(FormName.ykgccf, "已扣工程处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.qtkk)=="") {
		alert("请输入[其它扣款]！");
		FormName.qtkk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtkk, "其它扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.xcyxfy)=="") {
		alert("请输入[现场营销费用]！");
		FormName.xcyxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.xcyxfy, "现场营销费用"))) {
		return false;
	}
	if(	javaTrim(FormName.clyf)=="") {
		alert("请输入[材料运费]！");
		FormName.clyf.focus();
		return false;
	}
	if(!(isFloat(FormName.clyf, "材料运费"))) {
		return false;
	}

	if(	javaTrim(FormName.gcsfje)=="") {
		alert("请输入[工程实付金额]！");
		FormName.gcsfje.focus();
		return false;
	}
	if(!(isFloat(FormName.gcsfje, "工程实付金额"))) {
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
