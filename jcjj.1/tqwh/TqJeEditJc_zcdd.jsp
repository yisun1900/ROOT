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
double wdzje=0;
double zqclf=0;
double qtf=0;
double ycf=0;
double zcpclf=0;
double tjpclf=0;
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
String htcxhdje=null;
String jjsjs="";

String lrsj=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String dzyy=null;

double zczkl=0;
String listSql="";

String djlrfs="";//主材订单单价录入方式  1：录入单价算折扣；2：录入折扣算单价；3：不可打折
String kgcxhdbl="";//主材订单是否可改促销活动比例  Y：可改；N：不可改
String dgkh=null;
String xshth=null;
String sftjp=null;

try {
	conn=cf.getConnection();

	ls_sql="select tjpclf,zcpclf,xshth,sftjp,jmje,dzyy,lrsj,sfyyh,yhkssj,yhjzsj,yhnr,zczkl,jjsjs,htcxhdje,wdzje,zqclf,ycf,qtf,zcdlbm,zcxlbm,ppbm,khbh,clgw,ztjjgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,jhtzshsj,clgw";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tjpclf=rs.getDouble("tjpclf");
		zcpclf=rs.getDouble("zcpclf");
		wdzje=rs.getDouble("wdzje");
		zqclf=rs.getDouble("zqclf");
		ycf=rs.getDouble("ycf");
		qtf=rs.getDouble("qtf");
		xshth=cf.fillNull(rs.getString("xshth"));
		sftjp=cf.fillNull(rs.getString("sftjp"));
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
		clgw=cf.fillNull(rs.getString("clgw"));
	}
	rs.close();
	ps.close();


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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">订单编号</td>
		<td  width="9%">处理状态</td>
		<td  width="14%">品牌</td>
		<td  width="6%">驻店家居顾问</td>
		<td  width="9%">销售合同号</td>
		<td  width="5%">是否特价品</td>
		<td  width="9%">材料费</td>
		<td  width="8%">安装辅料费</td>
		<td  width="8%">远程费</td>
		<td  width="9%">合同总额</td>
		<td  width="8%">录入时间</td>
		<td  width="6%">录入人</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xshth,DECODE(jc_zcdd.sftjp,'Y','特价','N','否'),jc_zcdd.zqclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.wdzje,jc_zcdd.lrsj,jc_zcdd.lrr";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"' ";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" and jc_zcdd.ddlx in('9','C','E')";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDateSum();


	%>
	</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改主材合同（订单编号：<%=ddbh%>）</div> 
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"><%=khxm%></td>
              <td width="18%" align="right">质检</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="32%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                施工队              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="18%" align="right"> 
                班长              </td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                家装签约日期              </td>
              <td width="31%"> <%=qyrq%> </td>
              <td width="18%" align="right"> 
                家装签约额              </td>
              <td width="32%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">合同开工日期</td>
              <td width="31%"><%=kgrq%></td>
              <td width="18%" align="right">合同竣工日期</td>
              <td width="32%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">参加促销活动</td>
              <td width="31%"> <%=cxhdbm%> </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"><b>主材预付款</b></td>
              <td width="31%"><%=zcyfk%></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font><font color="#0000FF">主材大类</font></td>
              <td><input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>              </td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">主材小类</font></td>
              <td><input type="text" name="zcxlbm" value="<%=zcxlbm%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">子品牌</font></td>
              <td><input type="text" name="ppbm" value="<%=ppbm%>" readonly>              </td>
			  <td align="right"><font color="#FF0000">*</font>材料顾问</td>
              <td><input type="text" name="clgw" value="<%=clgw%>" readonly></td>
              <%--<td align="right"><font color="#FF0000">*</font>代购卡号</td>
              <td><input type="text" name="dgkh" value="<%=dgkh%>" size="20" maxlength="20" ></td>--%>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>购买日期</td>
              <td><input type="text" name="qhtsj" size="20" maxlength="10"  value="<%=qhtsj%>" onDblClick="JSCalendar(this)"></td>
              <td align="right">合同送货时间</td>
              <td><input type="text" name="htshsj" size="20" maxlength="10"  value="<%=htshsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>主材合同号</td>
              <td><input type="text" name="xshth" value="<%=xshth%>" size="20" maxlength="20" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*<strong><font color="#FF00FF">正常品-材料费</font></strong></font></td>
              <td><input name="zcpclf" type="text"  onChange="f_jsjg(editform)" value="<%=zcpclf%>" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><strong><font color="#660099">特价品-材料费</font></strong></td>
              <td><input name="tjpclf" type="text" onChange="f_jsjg(editform)" value="<%=tjpclf%>" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>安装辅料加工费</td>
              <td><input name="qtf" type="text"  onChange="f_jsjg(editform)" value="<%=qtf%>" size="20" maxlength="20"></td>
              <td align="right"><font color="#FF0000">*</font>远程费</td>
              <td><input name="ycf" type="text" onChange="f_jsjg(editform)" value="<%=ycf%>" size="20" maxlength="20"></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">合同总额</font></td>
              <td colspan="3"><input type="text" name="wdzje" value="<%=wdzje%>" size="20" maxlength="20" readonly>
              合同总额＝正常品材料费＋特价品材料费＋安装辅料加工费＋远程费</td>
            </tr>
            
           <%-- <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>--%>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
                  <input name="zqclf" type="hidden" value="<%=zqclf%>" >
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="button" value="保存" onClick="f_do(editform)">
                  <input type="button" onClick="window.open('/jcjj/dygl/dgzcdy.jsp?khbh=<%=khbh%>')"  value="打印">
                  <input type="reset"  value="重输">
                  <input type="hidden" name="xmzy" value="<%=xmzy%>">
                  <input type="hidden" name="jjsjs" value="<%=jjsjs%>">
                  <input type="hidden" name="ztjjgw" value="<%=ztjjgw%>">
                  <input type="hidden" name="jhtzshsj" value="<%=jhtzshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
                  <input type="hidden" name="ddshbz" value="<%=ddshbz%>"  >
                  <input type="hidden" name="kjxsj" size="20" maxlength="10"  value="<%=kjxsj%>" onDblClick="JSCalendar(this)">
                  <input type="hidden" name="hkze" value="<%=hkze%>" size="20" maxlength="10" onChange="f_jsjg(editform)">
                  <input type="hidden" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly>
                  <input type="hidden" name="jmje" value="<%=jmje%>" size="20" maxlength="20" >
                  <input type="hidden" name="htcxhdje" value="<%=htcxhdje%>" size="20" maxlength="10" >
                  <input type="hidden" name="dzyy" value="<%=dzyy%>"  >
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
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var zqclf=0;
	zqclf=FormName.zcpclf.value*1.0+FormName.tjpclf.value*1.0;
	zqclf=round(zqclf,2);
	FormName.zqclf.value=zqclf;
	
	var wdzje=0;
	wdzje=FormName.zqclf.value*1.0+FormName.qtf.value*1.0+FormName.ycf.value*1.0;
	wdzje=round(wdzje,2);
	FormName.wdzje.value=wdzje;
	
	FormName.hkze.value=FormName.wdzje.value;
	FormName.zczkl.value=10;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	//if(	javaTrim(FormName.dgkh)=="") {
//		alert("请输入[代购卡号]！");
//		FormName.dgkh.focus();
//		return false;
//	}


	if(	javaTrim(FormName.zcpclf)=="") {
		alert("请输入[正常品-材料费]！");
		FormName.zcpclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcpclf, "正常品-材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.tjpclf)=="") {
		alert("请输入[特价品-材料费]！");
		FormName.tjpclf.focus();
		return false;
	}

	if(!(isFloat(FormName.tjpclf, "特价品-材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.zqclf)=="") {
		alert("请输入[材料费]！");
		FormName.zqclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqclf, "材料费"))) {
		return false;
	}


	if(	javaTrim(FormName.qtf)=="") {
		alert("请输入[安装辅料加工费]！");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "安装辅料加工费"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	if(	javaTrim(FormName.hkze)=="") {
		alert("请选择[合同总额]！");
		FormName.hkze.focus();
		return false;
	}
	if(!(isFloat(FormName.hkze, "合同总额"))) {
		return false;
	}

	if (parseFloat(FormName.hkze.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.hkze.select();
		return false;
	}

	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[未打折金额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折金额"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.hkze.value))
	{
		alert("[未打折金额]不能小于[合同总额]！");
		FormName.htze.select();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请选择[未打折金额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折金额"))) {
		return false;
	}
	if(	javaTrim(FormName.htcxhdje)=="") {
		alert("请选择[计入促销活动金额]！");
		FormName.htcxhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.htcxhdje, "计入促销活动金额"))) {
		return false;
	}

	if(!(isDatetime(FormName.jhtzshsj, "计划通知送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[购买日期]！");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "购买日期"))) {
		return false;
	}

	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xshth)=="") {
		alert("请输入[主材合同号]！");
		FormName.xshth.focus();
		return false;
	}
	if(	javaTrim(FormName.zczkl)=="") {
		alert("请输入[订单折扣]！");
		FormName.zczkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zczkl, "订单折扣"))) {
		return false;
	}
	if (FormName.zczkl.value<=0 || FormName.zczkl.value>10)
	{
		alert("错误！[订单折扣]应该在0和10之间！");
		FormName.zczkl.select();
		return false;
	}

	if(	javaTrim(FormName.jmje)=="") {
		alert("请输入[减免金额]！");
		FormName.jmje.focus();
		return false;
	}
	if(!(isFloat(FormName.jmje, "减免金额"))) {
		return false;
	}


	if(	javaTrim(FormName.bz)=="") {
		alert("请录入[备注]，说明原因！");
		FormName.bz.focus();
		return false;
	}

	FormName.action="SaveTqJeEditJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
