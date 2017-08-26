<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

String khbh=null;
String clgw=null;
String ztjjgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String hkze=null;
String jhtzshsj=null;
String bz=null;
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
double jmje=0;

double zcyfk=0;
double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

String sqdj="";
String wdzje=null;
String htcxhdje=null;
String jjsjs="";

String lrsj=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String dzyy=null;

double khfdbl=0;
double fdbl=0;
double tcjrbl=0;
double tjpkhfdbl=0;
double tjpfdbl=0;
double tjptcjrbl=0;
double azfjsbl=0;
double ycfjsbl=0;

double zczkl=0;
String listSql="";

String djlrfs="";//主材订单单价录入方式  1：录入单价算折扣；2：录入折扣算单价；3：不可打折
String kgcxhdbl="";//主材订单是否可改促销活动比例  Y：可改；N：不可改
String dgkh=null;
String xshth=null;
String sfjs="";

try {
	conn=cf.getConnection();

	ls_sql="select sfjs,tcjrbl,khfdbl,fdbl,tjptcjrbl,tjpkhfdbl,tjpfdbl,xshth,jmje,dzyy,lrsj,sfyyh,yhkssj,yhjzsj,yhnr,zczkl,jjsjs,htcxhdje,wdzje,zcdlbm,zcxlbm,ppbm,khbh,clgw,ztjjgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,jhtzshsj ";
	ls_sql+=" ,azfjsbl,ycfjsbl";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfjs=cf.fillNull(rs.getString("sfjs"));
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		tcjrbl=rs.getDouble("tcjrbl");
		khfdbl=rs.getDouble("khfdbl");
		fdbl=rs.getDouble("fdbl");
		tjptcjrbl=rs.getDouble("tjptcjrbl");
		tjpkhfdbl=rs.getDouble("tjpkhfdbl");
		tjpfdbl=rs.getDouble("tjpfdbl");

		xshth=cf.fillNull(rs.getString("xshth"));
		jmje=rs.getDouble("jmje");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		zczkl=rs.getDouble("zczkl");

		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
		hkze=cf.fillNull(rs.getString("hkze"));
		jhtzshsj=cf.fillNull(rs.getDate("jhtzshsj"));
	}
	rs.close();
	ps.close();

	if (!sfjs.equals("N") && !sfjs.equals("C") && !sfjs.equals("P"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
	{
		out.println("错误！已结算，不能修改");
		return;
	}


	ls_sql="select dgkh,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dgkh=cf.fillNull(rs.getString("dgkh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
	}
	rs.close();
	ps.close();

	//预付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='63'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='64'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='65'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		%>
		<BR>
		<div align="center"><font color="#FF0033"><b>错误！本订单已发生过增减项，不能再修改</b></font> 
		
		<%
		return;
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
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
</head>

<body bgcolor="#FFFFFF">

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">维护结算比例（订单编号：<%=ddbh%>）</div> 
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="29%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="29%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">客户姓名</td>
              <td width="29%"><%=khxm%></td>
              <td width="21%" align="right">质检</td>
              <td width="29%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="29%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="21%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="29%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                施工队              </td>
              <td width="29%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="21%" align="right"> 
                班长              </td>
              <td width="29%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                家装签约日期              </td>
              <td width="29%"> <%=qyrq%> </td>
              <td width="21%" align="right"> 
                家装签约额              </td>
              <td width="29%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">合同开工日期</td>
              <td width="29%"><%=kgrq%></td>
              <td width="21%" align="right">合同竣工日期</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right">参加促销活动</td>
              <td width="29%"> <%=cxhdbm%> </td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right"><b>主材预付款</b></td>
              <td width="29%"><%=zcyfk%></td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#0000FF">主材大类</font></td>
              <td><%=zcdlbm%>             </td><td align="right"><font color="#0000FF">主材小类</font></td>
                <td><%=zcxlbm%>           </td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">子品牌</font></td>
              <td><%=ppbm%>            </td><td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">购买日期</font></td>
              <td bgcolor="#FFFFFF"><%=qhtsj%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">合同送货时间</font></td>
              <td bgcolor="#FFFFFF"><%=htshsj%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">代购卡号</font></td>
              <td bgcolor="#FFFFFF"><%=dgkh%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">销售合同号</font></td>
              <td bgcolor="#FFFFFF"><%=xshth%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">合同总额</font></td>
              <td bgcolor="#FFFFFF"><%=wdzje%></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">驻店家居顾问 </font></td>
              <td bgcolor="#FFFFFF"><%=clgw%></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>安装费结算比例</td>
              <td><input name="azfjsbl" type="text" value="<%=azfjsbl%>" size="10" maxlength="20"  >
                %</td>
              <td align="right"><font color="#FF0000">*</font>远程费结算比例</td>
              <td><input name="ycfjsbl" type="text" value="<%=ycfjsbl%>" size="10" maxlength="20"  >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>正常品厂商结算比例</td>
              <td><input type="text" name="fdbl" value="<%=fdbl%>" size="10" maxlength="20"  >
              %</td>
              <td align="right"><font color="#FF0000">*</font>特价品厂商结算比例</td>
              <td><input type="text" name="tjpfdbl" value="<%=tjpfdbl%>" size="10" maxlength="20"  >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>正常品客户返点比例</td>
              <td><input type="text" name="khfdbl" value="<%=khfdbl%>" size="10" maxlength="20" >
%</td>
              <td align="right"><font color="#FF0000">*</font>特价品客户返点比例</td>
              <td><input type="text" name="tjpkhfdbl" value="<%=tjpkhfdbl%>" size="10" maxlength="20" >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>正常品提成记入比例</td>
              <td><input type="text" name="tcjrbl" value="<%=tcjrbl%>" size="10" maxlength="20"  >
                %</td>
              <td align="right"><font color="#FF0000">*</font>特价品提成记入比例</td>
              <td><input type="text" name="tjptcjrbl" value="<%=tjptcjrbl%>" size="10" maxlength="20"  >
                %</td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="button" value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
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

	if(	javaTrim(FormName.fdbl)=="") {
		alert("请输入[正常品厂商结算比例]！");
		FormName.fdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fdbl, "正常品厂商结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.fdbl.value)<0 || parseFloat(FormName.fdbl.value)>100) {
		alert("错误！[正常品厂商结算比例]应在0与100之间");
		FormName.fdbl.select();
		return false;
	}

	if(	javaTrim(FormName.khfdbl)=="") {
		alert("请输入[正常品客户返点比例]！");
		FormName.khfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khfdbl, "正常品客户返点比例"))) {
		return false;
	}
	if(	parseFloat(FormName.khfdbl.value)<0 || parseFloat(FormName.khfdbl.value)>100) {
		alert("错误！[正常品客户返点比例]应在0与100之间");
		FormName.khfdbl.select();
		return false;
	}
	if(	javaTrim(FormName.tcjrbl)=="") {
		alert("请输入[正常品提成记入比例]！");
		FormName.tcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjrbl, "正常品提成记入比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tcjrbl.value)<0 || parseFloat(FormName.tcjrbl.value)>100) {
		alert("错误！[正常品提成记入比例]应在0与100之间");
		FormName.tcjrbl.select();
		return false;
	}

	if(	javaTrim(FormName.tjpfdbl)=="") {
		alert("请输入[特价品厂商结算比例]！");
		FormName.tjpfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjpfdbl, "特价品厂商结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tjpfdbl.value)<0 || parseFloat(FormName.tjpfdbl.value)>100) {
		alert("错误！[特价品厂商结算比例]应在0与100之间");
		FormName.tjpfdbl.select();
		return false;
	}

	if(	javaTrim(FormName.tjpkhfdbl)=="") {
		alert("请输入[特价品客户返点比例]！");
		FormName.tjpkhfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjpkhfdbl, "特价品客户返点比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tjpkhfdbl.value)<0 || parseFloat(FormName.tjpkhfdbl.value)>100) {
		alert("错误！[特价品客户返点比例]应在0与100之间");
		FormName.tjpkhfdbl.select();
		return false;
	}
	if(	javaTrim(FormName.tjptcjrbl)=="") {
		alert("请输入[特价品提成记入比例]！");
		FormName.tjptcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjptcjrbl, "特价品提成记入比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tjptcjrbl.value)<0 || parseFloat(FormName.tjptcjrbl.value)>100) {
		alert("错误！[特价品提成记入比例]应在0与100之间");
		FormName.tjptcjrbl.select();
		return false;
	}
	if(	javaTrim(FormName.azfjsbl)=="") {
		alert("请输入[安装费结算比例]！");
		FormName.azfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.azfjsbl, "安装费结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.azfjsbl.value)<0 || parseFloat(FormName.azfjsbl.value)>100) {
		alert("错误！[安装费结算比例]应在0与100之间");
		FormName.azfjsbl.select();
		return false;
	}

	if(	javaTrim(FormName.ycfjsbl)=="") {
		alert("请输入[远程费结算比例]！");
		FormName.ycfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfjsbl, "远程费结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.ycfjsbl.value)<0 || parseFloat(FormName.ycfjsbl.value)>100) {
		alert("错误！[远程费结算比例]应在0与100之间");
		FormName.ycfjsbl.select();
		return false;
	}


	FormName.action="SaveEditWhFdblJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
