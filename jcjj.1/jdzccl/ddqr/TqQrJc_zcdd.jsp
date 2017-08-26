<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;

double wdzje=0;
double hkze=0;
double zczkl=0;
String dzyy=null;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;



String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
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
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;
String ztjjgw=null;


double zcyfk=0;
double zcfk=0;
String sqdj="";

try {
	conn=cf.getConnection();

	ls_sql="select wdzje,hkze,zczkl,dzyy,htcxhdje,zjxcxhdje,zqzjhze,zjhze   ,ztjjgw,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
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
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	//预付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (zcfk < (hkze-1))
	{
		out.println("<B><font color=\"#FF0000\">提醒！付款不足，实付款＝『"+zcfk+"』，合同总额＝『"+hkze+"』</B></font><P>");
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
<title>订单确认</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">特权确认（订单编号：<%=ddbh%>） </div>

<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><b>订单折扣</b></td>
      <td width="29%"><%=zczkl%> </td>
      <td width="21%" align="right">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>打折原因</b></td>
      <td colspan="3"><%=dzyy%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>折前－合同额</b></td>
      <td width="29%"><%=wdzje%></td>
      <td width="21%" align="right"><b>折后－合同额</b></td>
      <td width="29%"><%=hkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>折前－增减项金额</b></td>
      <td width="29%"><%=zqzjhze%></td>
      <td width="21%" align="right"><b>折后－增减项金额</b></td>
      <td width="29%"><%=zjhze%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <div align="right"><b>折前－增减后总额</b></div>
      </td>
      <td width="29%"><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
      <td width="21%" align="right"> 
        <div align="right"><b>折后－增减后总额</b></div>
      </td>
      <td width="29%"><%=cf.formatDouble(hkze+zjhze)%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>合同计入促销活动金额</b></td>
      <td width="29%"><%=htcxhdje%></td>
      <td width="21%" align="right"><b>增减项计入促销活动金额</b></td>
      <td width="29%"><%=zjxcxhdje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">主材预付款</font></b></td>
      <td width="29%"><%=zcyfk%></td>
      <td width="21%" align="right"><b><font color="#0000FF">[<%=ppbm%>]付款</font></b></td>
      <td width="29%"><%=zcfk%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%"> 
        <div align="right">订单确认人</div>
      </td>
      <td width="29%"> 
        <input type="text" name="ddqrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="21%"> 
        <div align="right">订单确认时间</div>
      </td>
      <td width="29%"> 
        <input type="text" name="ddqrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2">
        <div align="center"> 
          <input type="hidden" name="ddbh" value="<%=ddbh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输" name="reset">
          <input type="button" value="查看客户电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')">
        </div>
      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">客户编号</div>
    </td>
    <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">合同号</div>
    </td>
    <td width="31%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">客户姓名</td>
    <td width="31%"><%=khxm%></td>
    <td width="19%" align="right">质检</td>
    <td width="31%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
    <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="19%" bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td width="31%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%"> 
      <div align="right">施工队</div>
    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="19%"> 
      <div align="right">班长</div>
    </td>
    <td width="31%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%"> 
      <div align="right">家装签约日期</div>
    </td>
    <td width="31%"> <%=qyrq%> </td>
    <td width="19%"> 
      <div align="right">家装签约额</div>
    </td>
    <td width="31%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">合同开工日期</td>
    <td width="31%"><%=kgrq%></td>
    <td width="19%" align="right">合同竣工日期</td>
    <td width="31%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">参加促销活动</td>
    <td width="31%"> <%=cxhdbm%> </td>
    <td width="19%" align="right">品牌</td>
    <td width="31%"><%=ppbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">客户交款性质</td>
    <td width="31%"><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%></td>
    <td width="19%" align="right">交款地点</td>
    <td width="31%"><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">驻店家居顾问</div>
    </td>
    <td width="31%"> <%=clgw%> </td>
    <td width="19%"> 
      <div align="right">展厅家居顾问</div>
    </td>
    <td width="31%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">项目专员</td>
    <td width="31%"><%=xmzy%></td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">需测量标志</td>
    <td width="31%"><%
	cf.selectToken(out,"1+不需测量&2+等待测量通知&3+测量已通知&4+已测量",xclbz,true);
%></td>
    <td width="19%" align="right">计划测量时间</td>
    <td width="31%"><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">等待送货通知</div>
    </td>
    <td width="31%"><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
    <td width="19%"> 
      <div align="right">合同送货时间</div>
    </td>
    <td width="31%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">签合同时间</div>
    </td>
    <td width="31%"><%=qhtsj%> </td>
    <td width="19%"> 
      <div align="right">可减项截止时间</div>
    </td>
    <td width="31%"><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">类型</td>
	<td  width="5%">主材名称</td>
	<td  width="6%">系列</td>
	<td  width="5%">型号</td>
	<td  width="7%">规格</td>
	<td  width="5%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="5%" bgcolor="#CC99FF">颜色</td>
	<td  width="5%" bgcolor="#CC99FF">选择价格</td>
	<td  width="3%">单价</td>
	<td  width="3%">单位</td>
	<td  width="4%">合同数量</td>
	<td  width="5%">合同材料费</td>
	<td  width="4%">合同远程费</td>
	<td  width="4%">合同其它费</td>
	<td  width="5%" bgcolor="#CC99FF">增减后数量</td>
	<td  width="5%" bgcolor="#CC99FF">增减后材料费</td>
	<td  width="4%" bgcolor="#CC99FF">增减后远程费</td>
	<td  width="4%" bgcolor="#CC99FF">增减后其它费</td>
	<td  width="4%">配件数</td>
	<td  width="4%" bgcolor="#CC99FF">计入活动比率</td>
	<td  width="5%">计入活动金额</td>
	<td  width="5%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','合同项','2','增项') lx,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj";
	ls_sql+=" ,jldwbm,jc_zcddmx.sl,jc_zcddmx.je,ycf,qtfyje,zjhsl,zjhje,zjhycf,zjhqtfy";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs";
	ls_sql+=" ,cxhdbl||'%' cxhdbl,cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
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

	if(	javaTrim(FormName.ddqrr)=="") {
		alert("请选择[订单确认人]！");
		FormName.ddqrr.focus();
		return false;
	}
	if(	javaTrim(FormName.ddqrsj)=="") {
		alert("请选择[订单确认时间]！");
		FormName.ddqrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj, "订单确认时间"))) {
		return false;
	}


	FormName.action="SaveQrJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
