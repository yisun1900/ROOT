<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改增减项</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jgrq=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String qyrq=null;
String qydm=null;
String ssfgs=null;
String cxhdbm=null;


String cgsjs=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
double gtbfje=0;
double tmbfje=0;
double wjhtze=0;
double dqhtze=0;
double htze=0;

double gtzjje=0;
double tmzjje=0;
double wjzjje=0;
double dqzjje=0;
double zjhze=0;
String qhtr=null;
String qhtsj=null;
String jhazrq=null;
String kjxsj=null;
String htbz=null;
String clztmc=null;

String fkje=null;
String sqdj="";

double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;
String dzyy=null;

String ddbh=null;
String cgzjxyybm=null;
String jhazsj=null;
String zjxlrr=null;
String zjxlrsj=null;
String zjxbz=null;
String zjxfssj=null;

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="select ddbh,cgzjxyybm,jhazsj,lrr,lrsj,bz,zjxfssj ";
	ls_sql+=" ,jc_cgzjx.cgzkl,jc_cgzjx.tmzkl,jc_cgzjx.wjzkl,jc_cgzjx.dqzkl,jc_cgzjx.dzyy ";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		cgzjxyybm=cf.fillNull(rs.getString("cgzjxyybm"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		zjxlrr=cf.fillNull(rs.getString("lrr"));
		zjxlrsj=cf.fillNull(rs.getDate("lrsj"));
		zjxbz=cf.fillNull(rs.getString("bz"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));

		cgzkl=rs.getDouble("cgzkl");
		tmzkl=rs.getDouble("tmzkl");
		wjzkl=rs.getDouble("wjzkl");
		dqzkl=rs.getDouble("dqzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();

	ls_sql="select jc_cgdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.sgd,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.dwbh,cxhdbm,jc_cgdd.fgsbh";
	ls_sql+=" ,jc_cgdd.cgsjs,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.lrr,jc_cgdd.lrsj,jc_cgdd.bz,dwmc,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.htze";
	ls_sql+=" ,jc_cgdd.gtzjje,jc_cgdd.tmzjje,jc_cgdd.wjzjje,jc_cgdd.dqzjje,jc_cgdd.zjhze,jc_cgdd.qhtr,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.kjxsj,jc_cgdd.htbz,clztmc";
	ls_sql+=" from  crm_khxx,jc_cgdd,sq_dwxx,jdm_cgddzt";
	ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh and jc_cgdd.khbh=crm_khxx.khbh(+) and  (jc_cgdd.ddbh='"+ddbh+"')  ";
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qydm=cf.fillNull(rs.getString("dwbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
		bz=cf.fillNull(rs.getString("bz"));
		gtbfje=rs.getDouble("gtbfje");
		tmbfje=rs.getDouble("tmbfje");
		wjhtze=rs.getDouble("wjhtze");
		dqhtze=rs.getDouble("dqhtze");
		htze=rs.getDouble("htze");

		gtzjje=rs.getDouble("gtzjje");
		tmzjje=rs.getDouble("tmzjje");
		wjzjje=rs.getDouble("wjzjje");
		dqzjje=rs.getDouble("dqzjje");
		zjhze=rs.getDouble("zjhze");
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">修改增减项（增减项序号：<%=zjxxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#CCCCFF">
      <td align="right">客户编号</td>
      <td><%=khbh%></td>
      <td align="right">合同号</td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">客户姓名</td>
      <td><%=khxm%></td>
      <td align="right">参加促销活动</td>
      <td><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">房屋地址</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#CCCCFF">签约店面</td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qydm+"'",qydm,true);
%></td>
      <td align="right">家装设计师</td>
      <td><%=sjs%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">施工队</td>
      <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
      <td align="right">班长</td>
      <td><%=sgbz%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">家装签约日期</td>
      <td><%=qyrq%> </td>
      <td align="right">质检</td>
      <td><%=zjxm%></td>
    </tr>
    <tr bgcolor="#CCFFCC">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right"> 签合同时间</td>
      <td><%=qhtsj%></td>
      <td align="right">可减项截止时间</td>
      <td><%=kjxsj%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#CCCCFF">合同备注</td>
      <td colspan="3"><%=htbz%></td>
    </tr>
    <tr bgcolor="#CCFFCC">
      <td align="right">项目专员</td>
      <td><%=xmzy%></td>
      <td align="right">家居设计师</td>
      <td><%=cgsjs%></td>
    </tr>
    <tr bgcolor="#CCFFCC">
      <td align="right">驻店家居顾问</td>
      <td><%=clgw%> </td>
      <td align="right">展厅家居顾问</td>
      <td><%=ztjjgw%> </td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">柜体合同金额</td>
      <td><%=gtbfje %></td>
      <td align="right">柜体增减后金额</td>
      <td><%=gtzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">台面合同金额</td>
      <td><%=tmbfje %></td>
      <td align="right">台面增减后金额</td>
      <td><%=tmzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">五金合同总额 </td>
      <td><%=wjhtze%> </td>
      <td align="right">五金增减后金额</td>
      <td><%=wjzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">电器合同总额</td>
      <td><%=dqhtze%></td>
      <td align="right">电器增减后金额</td>
      <td><%=dqzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">合同总额</td>
      <td><%=htze%></td>
      <td align="right">增减后总额</td>
      <td><%=zjhze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>增减项发生时间</td>
      <td><input type="text" name="zjxfssj" value="<%=zjxfssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>柜体折扣率</td>
      <td><input type="text" name="cgzkl" size="8" maxlength="8" value="<%=cgzkl%>" readonly>
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>台面折扣率</td>
      <td><input type="text" name="tmzkl" size="8" maxlength="8" value="<%=tmzkl%>" readonly>
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">五金折扣率</font></td>
      <td><input type="text" name="wjzkl" size="8" maxlength="8" value="<%=wjzkl%>" readonly >
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">电器折扣率</font></td>
      <td><input type="text" name="dqzkl" size="8" maxlength="8" value="<%=dqzkl%>" readonly >
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">增减项打折原因</td>
      <td colspan="3"><textarea name="dzyy" cols="75" rows="2" readonly><%=dzyy%></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>增减项原因</td>
      <td width="31%"> 
        <select name="cgzjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm",cgzjxyybm);
%> 
        </select>      </td>
      <td align="right" width="17%">计划安装时间</td>
      <td width="33%"> 
        <input type="text" name="jhazsj" size="20" maxlength="10"  value="<%=jhazsj%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=zjxlrr%>" readonly>      </td>
      <td align="right" width="17%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=zjxlrsj%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="2"><%=zjxbz%></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4" > 
        <input type="hidden" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="8">
        <input type="hidden" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" >
        <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >
        <input name="button" type="button" onClick="f_do(insertform)"  value="存盘">
        <input type="reset"  value="重输" name="reset">
        <input type="button"  value="录入增减明细" onClick="f_lrmx(insertform)" name="lrmx" >
        <input type="button"  value="查看增减明细" onClick="f_ckmx(insertform)" name="ckmx" >
        <input type="button"  value="完成" onClick="f_end(insertform)" name="wc" ></td>
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
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.cgzjxyybm)=="") {
		alert("请选择[增减项原因]！");
		FormName.cgzjxyybm.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhazsj, "计划安装时间"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("请输入[增减项发生时间]！");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "增减项发生时间"))) {
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


	if(	javaTrim(FormName.cgzkl)=="") {
		alert("请输入[柜体折扣率]！");
		FormName.cgzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.cgzkl, "柜体折扣率"))) {
		return false;
	}
	if (FormName.cgzkl.value<=0 || FormName.cgzkl.value>10)
	{
		alert("错误！[柜体折扣率]应该在0和10之间！");
		FormName.cgzkl.select();
		return false;
	}

	if(	javaTrim(FormName.tmzkl)=="") {
		alert("请输入[台面折扣率]！");
		FormName.tmzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.tmzkl, "台面折扣率"))) {
		return false;
	}
	if (FormName.tmzkl.value<=0 || FormName.tmzkl.value>10)
	{
		alert("错误！[台面折扣率]应该在0和10之间！");
		FormName.tmzkl.select();
		return false;
	}

	if(	javaTrim(FormName.wjzkl)=="") {
		alert("请输入[五金折扣率]！");
		FormName.wjzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.wjzkl, "五金折扣率"))) {
		return false;
	}
	if (FormName.wjzkl.value<=0 || FormName.wjzkl.value>10)
	{
		alert("错误！[五金折扣率]应该在0和10之间！");
		FormName.wjzkl.select();
		return false;
	}

	if(	javaTrim(FormName.dqzkl)=="") {
		alert("请输入[电器折扣率]！");
		FormName.dqzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.dqzkl, "电器折扣率"))) {
		return false;
	}
	if (FormName.dqzkl.value<=0 || FormName.dqzkl.value>10)
	{
		alert("错误！[电器折扣率]应该在0和10之间！");
		FormName.dqzkl.select();
		return false;
	}

	
	if (FormName.cgzkl.value!=10 || FormName.tmzkl.value!=10 || FormName.wjzkl.value!=10 || FormName.dqzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveEditJc_cgzjx.jsp";
	FormName.submit();
	return true;
}
function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	FormName.action="EndJc_cgzjx.jsp";
	FormName.submit();
	return true;
}

function f_lrmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	
	FormName.action="InsertJc_cgzjxmx.jsp";
	FormName.submit();
	return true;
}
function f_ckmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_cgzjxmxList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
