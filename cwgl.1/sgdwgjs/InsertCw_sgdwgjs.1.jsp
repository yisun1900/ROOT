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
.STYLE3 {
	color: #0000CC;
	font-weight: bold;
}
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

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;

double zqje=0;

double htjcbj=0;
double zjxjcbj=0;
double ljqyf=0;
double djazf=0;
double jsjs=0;


double jsbl=60;
double sdljsbl=80;

double sdlje=0;
double jsje=0;


double clf=0;
double gdyp=0;
double sjbk=0;



double clyf=0;
double yfgck=0;
double kzbjbl=5;

double kzbj=0;
double clfk=0;
double jfje=0;
double yfje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htjcbj=rs.getDouble("wdzgce");

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

	if (!gdjsjd.equals("X"))//1:交齐中期结算资料
	{
		out.println("<BR>！！！错误，结算进度不正确");
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

	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=2";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//工地用品领用记录
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jsbz='0'";//0：未结算；1：已结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdyp=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//材料单
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"' and psdzt in('2','3','5')";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clf=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//已付工程款
	ls_sql="select sum(sjbk)";
	ls_sql+=" from  cw_sgdzqjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfgck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ljqyf=100;
	djazf=200;
	jsjs=htjcbj+zjxjcbj+ljqyf+djazf;
	jsjs=cf.round(jsjs,2);

	sdlje=8200;
	jsje=jsjs*jsbl/100+sdlje*sdljsbl/100;
	jsje=cf.round(jsje,2);

	kzbj=jsjs*kzbjbl/100;
	kzbj=cf.round(kzbj,2);


	yfje=jsje-clf-clyf-gdyp-yfgck-kzbj-clfk-jfje;
	yfje=cf.round(yfje,2);

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdwgjs";
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
<form method="post" action="SaveInsertCw_sgdwgjs.jsp" name="insertform" >
<div align="center">请录入数据</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">结算记录号</td>
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

	ls_sql="SELECT cw_sgdzqjs.jsjlh,gdjsjdmc,cw_sgdzqjs.jsrq,cw_sgdzqjs.htje,cw_sgdzqjs.zjxje, DECODE(cw_sgdzqjs.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','工程施工成本价','A','工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),cw_sgdzqjs.jsjsze,cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,cw_sgdzqjs.clf,cw_sgdzqjs.gdyp,cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdzqjs.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdzqjsCxList.jsp","","","");

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
  <td align="right" width="18%"><span class="STYLE1">*</span>合同工程基础报价</td> 
  <td width="32%"> 
    <input type="text" name="htjcbj" value="<%=htjcbj%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>增减项工程基础报价</td> 
  <td width="32%"> 
    <input type="text" name="zjxjcbj" value="<%=zjxjcbj%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>垃圾清运费</td> 
  <td width="32%"> 
    <input type="text" name="ljqyf" value="<%=ljqyf%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>灯具安装费</td> 
  <td width="32%"> 
    <input type="text" name="djazf" value="<%=djazf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>结算基数</td> 
  <td colspan="3"> 
    <input type="text" name="jsjs" value="<%=jsjs%>" size="20" maxlength="17" >
    <span class="STYLE3">结算基数＝合同工程基础报价＋增减项工程基础报价＋垃圾清运费＋ 灯具安装费</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>结算比例</td> 
  <td width="32%"><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" >
% </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>调整结算比例</td> 
  <td width="32%"><input type="text" name="tzjsbl" value="0" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>水电路金额</td>
  <td><input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>水电路结算比例</td>
  <td><input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>结算总额</td> 
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" >
    <span class="STYLE3">结算总额＝结算基数×（结算比例＋调整结算比例）＋水电路金额×水电路结算比例</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>材料费</td> 
  <td width="32%"> 
    <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>材料运费</td> 
  <td width="32%"> 
    <input type="text" name="clyf" value="<%=clyf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>工地用品</td> 
  <td width="32%"> 
    <input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>已付工程款</td> 
  <td width="32%"> 
    <input type="text" name="yfgck" value="<%=yfgck%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>应扣质保金比例</td> 
  <td width="32%"> 
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="17" >
    ％  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>扣质保金</td> 
  <td width="32%"> 
    <input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>材料罚款</td> 
  <td width="32%"> 
    <input type="text" name="clfk" value="<%=clfk%>" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>奖罚金额</td> 
  <td width="32%"> 
    <input type="text" name="jfje" value="<%=jfje%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>应付金额</td> 
  <td colspan="3"> 
    <input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" >
    <span class="STYLE3">应付金额＝结算总额－材料费－材料运费－工地用品－已付工程款－扣质保金－材料罚款＋奖罚金额</span></td>
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
  <td align="right">结算日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
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
	if(!(isFloat(FormName.htjcbj, "合同工程基础报价"))) {
		return false;
	}
	if(!(isFloat(FormName.zjxjcbj, "增减项工程基础报价"))) {
		return false;
	}
	if(!(isFloat(FormName.ljqyf, "垃圾清运费"))) {
		return false;
	}
	if(!(isFloat(FormName.djazf, "灯具安装费"))) {
		return false;
	}
	if(!(isFloat(FormName.jsjs, "结算基数"))) {
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.tzjsbl, "调整结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.sdlje, "水电路金额"))) {
		return false;
	}
	if(!(isFloat(FormName.sdljsbl, "水电路结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算总额"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.clyf, "材料运费"))) {
		return false;
	}
	if(!(isFloat(FormName.gdyp, "工地用品"))) {
		return false;
	}
	if(!(isFloat(FormName.yfgck, "已付工程款"))) {
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "应扣质保金比例"))) {
		return false;
	}
	if(!(isFloat(FormName.kzbj, "扣质保金"))) {
		return false;
	}
	if(!(isFloat(FormName.clfk, "材料罚款"))) {
		return false;
	}
	if(!(isFloat(FormName.jfje, "奖罚金额"))) {
		return false;
	}
	if(!(isFloat(FormName.yfje, "应付金额"))) {
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
