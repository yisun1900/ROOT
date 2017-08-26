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
.STYLE1 {color: #CC3399}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zdyhbz=(String)session.getAttribute("zdyhbz");
String zt=request.getParameter("zt");

String getddbh=cf.GB2Uni(request.getParameter("ddbh"));
String khbh=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String xshth=null;
double zcpclf=0;
double tjpclf=0;
double qtf=0;
double ycf=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;

String sqdj="";
String xmzy="";
String clgw="";

double zcyfk=0;
double zcdjj=0;
double zzczk=0;

double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

double zcfk=0;
double htze=0;
String txxx="";

String ddbh="";

String djqmc="";
double djqje=0;
String sjbh="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int dds=0;
String jjsjs="";


String zczkl="10";

String listSql="";
String jjwjbz="";

String djlrfs="";//主材订单单价录入方式  1：录入单价算折扣；2：录入折扣算单价；3：不可打折
String kgcxhdbl="";//主材订单是否可改促销活动比例  Y：可改；N：不可改
String dgkh=null;

String clzt="";

try {
	conn=cf.getConnection();


	ls_sql="select khbh,zcdlbm,zcxlbm,ppbm,xshth,zcpclf,tjpclf,qtf,ycf,djqmc,djqje,sjbh,clzt,xmzy,clgw";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+getddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		xshth=cf.fillNull(rs.getString("xshth"));
		zcpclf=rs.getDouble("zcpclf");
		tjpclf=rs.getDouble("tjpclf");
		qtf=rs.getDouble("qtf");
		ycf=rs.getDouble("ycf");
		djqmc=cf.fillNull(rs.getString("djqmc"));
		djqje=rs.getDouble("djqje");
		sjbh=cf.fillNull(rs.getString("sjbh"));
		clzt=cf.fillNull(rs.getString("clzt"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		clgw=cf.fillNull(rs.getString("clgw"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("09"))
	{
		out.println("错误!订单未确认，不能退货");
		return;
	}

	ls_sql="select dgkh,khxm,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dgkh=cf.fillNull(rs.getString("dgkh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		khjl=cf.fillNull(rs.getString("khjl"));
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
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
	}
	rs.close();
	ps.close();

	//检查客户结算＋＋＋＋＋＋＋＋＋＋＋＋开始
	String getkhjsbz="";
	ls_sql=" select khjsbz ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (!getkhjsbz.equals("N") && !getkhjsbz.equals("") && !getkhjsbz.equals("3"))//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	{
		out.println("<font color=\"#FF0000\">错误！客户已结算</font>:"+getkhjsbz);
		return;
	}
	//检查客户结算＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	if (jjsjs.equals(""))
	{
		ls_sql="select cgsjs";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("cgsjs"));
		}
		rs.close();
		ps.close();
	}

	if (jjsjs.equals(""))
	{
		ls_sql="select jjsjs";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("jjsjs"));
		}
		rs.close();
		ps.close();
	}



	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}



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


	//主材预付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and  fklxbm='23'";//55：主材代金券;62：主材预付款;23:主材
	ls_sql+=" and  ddbh='"+getddbh+"'";
	ls_sql+=" and zffs!='16'";//16：纸质材料券
	ls_sql+=" and scbz='N'";
	ls_sql+=" and (zckx is null OR (zckx not in('55','67')))";//62：主材预付款 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//主材代金券
	ls_sql="select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and  fklxbm='23'";//55：主材代金券;62：主材预付款;23:主材
	ls_sql+=" and  ddbh='"+getddbh+"'";
	ls_sql+=" and scbz='N'";
	ls_sql+=" and zckx='55'";//主材代金券 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcdjj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//主材代金券
	ls_sql="select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and  fklxbm='23'";//55：主材代金券;62：主材预付款;23:主材
	ls_sql+=" and  ddbh='"+getddbh+"'";
	ls_sql+=" and scbz='N'";
	ls_sql+=" and zckx='67'";//主材代金券 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zzczk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ddbh=khbh+cf.addZero(count+1,2);

	dds=count;
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

<body bgcolor="#FFFFFF">
<table width="100%" style='FONT-SIZE: 14px'>
  <tr>
    <td width="100%"> 
      <div align="center">部分退货（订单编号：<%=ddbh%>）
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform"  >
<%
if (dds>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">订单编号</td>
		<td  width="9%">处理状态</td>
		<td  width="11%">品牌</td>
		<td  width="6%">家居顾问</td>
		<td  width="9%">销售合同号</td>
		<td  width="9%">正常品材料费</td>
		<td  width="9%">特价品材料费</td>
		<td  width="8%">安装辅料加工费</td>
		<td  width="8%">远程费</td>
		<td  width="9%">合同总额</td>
		<td  width="8%">录入时间</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xshth,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.wdzje,jc_zcdd.lrsj";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"' ";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" and jc_zcdd.ddlx in('9','E')";//9:集成家居主材
		ls_sql+=" and jc_zcdd.clzt!='99'";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDateSum();


	%>
	</table>
	<%
}
%>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">客户姓名</td>
              <td width="32%" bgcolor="#CCCCFF"><%=khxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">&nbsp;</td>
              <td width="32%" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>主材大类</td>
              <td><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                  <option value="<%=zcdlbm%>"><%=zcdlbm%></option>
              </select></td>
              <td align="right">主材小类</td>
              <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value="<%=zcxlbm%>"><%=zcxlbm%></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>品牌</td>
              <td colspan="3">
			  <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX" >
                  <option value="<%=ppbm%>"><%=ppbm%></option>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>退货日期</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qhtsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)" ></td>
              <td align="right" bgcolor="#FFFFFF">合同送货时间</td>
              <td bgcolor="#FFFFFF"><input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>主材合同号</td>
              <td bgcolor="#FFFFFF"><input type="text" name="xshth" value="<%=xshth%>" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>驻店家居顾问</td>
              <td bgcolor="#FFFFFF">
			  <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="<%=clgw%>"><%=clgw%></option>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*<strong><font color="#FF00FF">退货正常品-材料费</font></strong></font></td>
              <td>
			  <input name="zcpclf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20">
			  订货:<%=zcpclf%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><strong><font color="#660099">退货特价品-材料费</font></strong></td>
              <td>
			  <input name="tjpclf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20">
			  订货:<%=tjpclf%>			  </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>退货安装辅料加工费</td>
              <td><input name="qtf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20">
			  订货:<%=qtf%>			  </td>
              <td align="right"><font color="#FF0000">*</font>退货远程费</td>
              <td><input name="ycf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20" >
			  订货:<%=ycf%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">合同总额</font></td>
              <td colspan="3"><input type="text" name="wdzje" value="" size="20" maxlength="20"  readonly>
              合同总额＝正常品材料费＋特价品材料费＋安装辅料加工费＋远程费</td>
            </tr>



            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入部门</font>              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入人</font>              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入时间</font>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="zqclf" value="0" >
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="getddbh" value="<%=getddbh%>" >
                <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                <input type="hidden" name="qddm" value="<%=dmbh%>" >
                <input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="zt" value="<%=zt%>">

				<input type="button"  value="存盘" onClick="f_do(insertform)">
				<input name="button" type="button" onClick="window.open('/jcjj/dygl/dgzcdy.jsp?khbh=<%=khbh%>')"  value="打印">
				<input type="reset"  value="重输" name="reset">
				<input type="hidden" name="xmzy" value="<%=xmzy%>" >
                <input type="hidden" name="jjsjs" value="<%=jjsjs%>" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddshbz" value="1" >
                <input type="hidden" name="jhtzshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" >
                <input type="hidden" name="dzyy" value="" >
                <input type="hidden" name="kjxsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
                <input type="hidden" name="hkze" value="" size="20" maxlength="20" >
                <input type="hidden" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly>
                <input type="hidden" name="htcxhdje" value="0" size="20" maxlength="10" >
                <input type="hidden" name="jmje" value="0" size="20" maxlength="20" ></td>
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

<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;



function changeDl(FormName)
{
	czlx=2;

	FormName.zcxlbm.length=1;
	insertform.ycf.readOnly=false;
	insertform.qtf.readOnly=false;

	var sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.zcdlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
//	window.open(actionStr);
}



function getPp(FormName)
{
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select distinct jxc_ppxx.ppmc c1,jxc_ppxx.ppmc c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
		getPp(insertform);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
}


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
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌]！");
		FormName.ppbm.focus();
		return false;
	}

	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[退货日期]！");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "退货日期"))) {
		return false;
	}


	if(	javaTrim(FormName.xshth)=="") {
		alert("请输入[主材合同号]！");
		FormName.xshth.focus();
		return false;
	}

	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[驻店家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	
	
	if(	javaTrim(FormName.zcpclf)=="") {
		alert("请输入[正常品-材料费]！");
		FormName.zcpclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcpclf, "正常品-材料费"))) {
		return false;
	}

	if (parseFloat(FormName.zcpclf.value)>0)
	{
		alert("错误！[退货正常品-材料费]应小于0");
		FormName.zcpclf.select();
		return false;
	}
	if (parseFloat(FormName.zcpclf.value) < -1*<%=zcpclf%>)
	{
		alert("错误！[退货正常品-材料费]不能超过订货数【<%=zcpclf%>】");
		FormName.zcpclf.select();
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

	if (parseFloat(FormName.tjpclf.value)>0)
	{
		alert("错误！[退货特价品-材料费]应小于0");
		FormName.tjpclf.select();
		return false;
	}
	if (parseFloat(FormName.tjpclf.value) < -1*<%=tjpclf%>)
	{
		alert("错误！[退货特价品-材料费]不能超过订货数【<%=tjpclf%>】");
		FormName.tjpclf.select();
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

	if (parseFloat(FormName.qtf.value)>0)
	{
		alert("错误！[退货安装辅料加工费]应小于0");
		FormName.qtf.select();
		return false;
	}
	if (parseFloat(FormName.qtf.value) < -1*<%=qtf%>)
	{
		alert("错误！[退货安装辅料加工费]不能超过订货数【<%=qtf%>】");
		FormName.qtf.select();
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

	if (parseFloat(FormName.ycf.value)>0)
	{
		alert("错误！[退货远程费]应小于0");
		FormName.ycf.select();
		return false;
	}
	if (parseFloat(FormName.ycf.value) < -1*<%=ycf%>)
	{
		alert("错误！[退货远程费]不能超过订货数【<%=ycf%>】");
		FormName.ycf.select();
		return false;
	}


	
	
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[合同总额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "合同总额"))) {
		return false;
	}

	if (parseFloat(FormName.wdzje.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.zqclf.select();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}




	FormName.action="SaveInsertJc_zcddTh2.jsp";
	FormName.submit();
	FormName.dy.disabled=false;
	return true;

}



//-->
</SCRIPT>
