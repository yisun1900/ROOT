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
String ddqrr=null;
String ddqrsj=null;
String cltzr=null;
String tzclsj=null;
String sclr=null;
String sclsj=null;
String jhshsj=null;
String shtzsm=null;
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
String ztjjgw=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;
String tzry=null;

String sxhtsfysh=null;
double wdzje=0;
double hkze=0;
double zczkl=0;
String dzyy=null;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;

double zcyfk=0;
double zcfk=0;
String sqdj="";

try {
	conn=cf.getConnection();

	ls_sql="select sxhtsfysh,wdzje,hkze,zczkl,dzyy,htcxhdje,zjxcxhdje,zqzjhze,zjhze   ,tzry,shtzsm,jhshsj,ztjjgw,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,ddqrr,ddqrsj,cltzr,tzclsj,sclr,sclsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		tzry=cf.fillNull(rs.getString("tzry"));
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
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
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		cltzr=cf.fillNull(rs.getString("cltzr"));
		tzclsj=cf.fillNull(rs.getDate("tzclsj"));
		sclr=cf.fillNull(rs.getString("sclr"));
		sclsj=cf.fillNull(rs.getDate("sclsj"));
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
	ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='23'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if ( zcfk < (hkze+zjhze-11))
	{
		out.println("<strong><font color=\"#FF0000\">提醒！付款不足</font></strong>");
		out.println("<BR>实付款＝￥"+zcfk);
		out.println("<BR>订单金额＝￥"+cf.round(hkze+zjhze,2)+"，应补交货款＝￥"+cf.round(hkze+zjhze-zcfk,2));
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
<title>送货通知</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">送货通知（订单编号：<%=ddbh%>） </div>

<form method="post" action="" name="editform" >
 
 
  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><b>订单折扣</b></td>
      <td><%=zczkl%> </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><b>打折原因</b></td>
      <td colspan="3"><%=dzyy%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><b>折前－合同额</b></td>
      <td><%=wdzje%></td>
      <td align="right"><b>折后－合同额</b></td>
      <td><%=hkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><b>折前－增减项金额</b></td>
      <td><%=zqzjhze%></td>
      <td align="right"><b>折后－增减项金额</b></td>
      <td><%=zjhze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><b>折前－增减后总额</b> </td>
      <td><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
      <td align="right"><b>折后－增减后总额</b> </td>
      <td><%=cf.formatDouble(hkze+zjhze)%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><b>合同计入促销活动金额</b></td>
      <td><%=htcxhdje%></td>
      <td align="right"><b>增减项计入促销活动金额</b></td>
      <td><%=zjxcxhdje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">主材预付款</font></b></td>
      <td><%=zcyfk%></td>
      <td align="right"><b><font color="#0000FF">订单已付款</font></b></td>
      <td><%=zcfk%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        计划送货时间      </td>
      <td width="31%"> <%=jhshsj%> </td>
      <td width="19%" align="right"> 
      合同送货时间      </td>
      <td width="31%"><%=htshsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">通知人员</td>
      <td width="31%"> <%=tzry%> </td>
      <td width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">送货通知说明</td>
      <td colspan="3"><%=shtzsm%></td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        发送货通知人      </td>
      <td width="31%"> 
      <input type="text" name="tzshr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="19%" align="right"> 
      发送货通知时间      </td>
      <td width="31%"> 
        <input type="text" name="tzshsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4" align="center"> &nbsp; 
          <input type="hidden" name="ddbh" value="<%=ddbh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="button">
          <input type="reset"  value="重输" name="reset">      </td>
    </tr>
  </table>
</form>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="32%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">客户姓名</td>
    <td ><%=khxm%>（
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
）</td>
    <td align="right">质检</td>
    <td ><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCCFF" align="right">签约店面</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      施工队    </td>
    <td > <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"> 
      班长    </td>
    <td ><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      家装签约日期    </td>
    <td > <%=qyrq%> </td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">合同开工日期</td>
    <td ><%=kgrq%></td>
    <td align="right">合同竣工日期</td>
    <td ><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td bgcolor="#FFFFFF" align="right">主材大类</td>
    <td > <%=zcdlbm%> </td>
    <td align="right">品牌</td>
    <td > <%=ppbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">客户交款性质</td>
    <td ><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%></td>
    <td align="right">交款地点</td>
    <td ><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      驻店家居顾问    </td>
    <td > <%=clgw%> </td>
    <td align="right"> 
      展厅家居顾问    </td>
    <td ><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">项目专员</td>
    <td ><%=xmzy%></td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">需测量标志</td>
    <td ><%
	cf.selectToken(out,"1+不需测量&2+等待测量通知&3+测量已通知&4+已测量",xclbz,true);
%></td>
    <td align="right">计划测量时间</td>
    <td ><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      等待送货通知    </td>
    <td ><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
    <td align="right"> 
      合同送货时间    </td>
    <td ><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      签合同时间    </td>
    <td ><%=qhtsj%> </td>
    <td align="right"> 
      可减项截止时间    </td>
    <td ><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">订单确认人</td>
    <td ><%=ddqrr%></td>
    <td align="right">订单确认时间</td>
    <td ><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCFFCC"> 
      测量通知录入人    </td>
    <td > <%=cltzr%></td>
    <td align="right"> 
      发测量通知时间    </td>
    <td ><%=tzclsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">类型</td>
	<td  width="12%">主材名称</td>
	<td  width="13%">系列</td>
	<td  width="10%">型号</td>
	<td  width="10%">规格</td>
	<td  width="6%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="6%" bgcolor="#CC99FF">颜色</td>
	<td  width="5%">单位</td>
	<td  width="6%">合同数量</td>
	<td  width="6%" bgcolor="#CC99FF">增减后数量</td>
	<td  width="5%">配件数</td>
	<td  width="16%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','合同项','2','增项') lx,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,jc_zcddmx.jldwbm,jc_zcddmx.sl,zjhsl";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.zcdlbm,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lx","1");//列参数对象加入Hash表
	spanColHash.put("zcmc","1");//列参数对象加入Hash表
	spanColHash.put("gysmc","1");//列参数对象加入Hash表
	spanColHash.put("zclbbm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
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

	if(	javaTrim(FormName.tzshr)=="") {
		alert("请选择[发送货通知人]！");
		FormName.tzshr.focus();
		return false;
	}
	if(	javaTrim(FormName.tzshsj)=="") {
		alert("请选择[发送货通知时间]！");
		FormName.tzshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tzshsj, "发送货通知时间"))) {
		return false;
	}

	FormName.action="SaveSkShtzJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

