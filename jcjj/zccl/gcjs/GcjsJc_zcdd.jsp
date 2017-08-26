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
String ddqrr=null;
String ddqrsj=null;
String bz=null;
double hkze=0;
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
String bzdh="";
String dzdh=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;
String ztjjgw=null;
String htcxhdje=null;

String fkje=null;
String sqdj="";

try {
	conn=cf.getConnection();

	ls_sql="select ddqrsj,ddqrr,ztjjgw,htcxhdje,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
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
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
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

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
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
<title>供应商接收</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">供应商接收（订单编号：<%=ddbh%>） </div>

<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="15%"> 
        <div align="right">供应商接收录入人</div>
      </td>
      <td width="35%"> 
        <input type="text" name="gysjslrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="15%"> 
        <div align="right">供应商接收录入时间</div>
      </td>
      <td width="35%"> 
        <input type="text" name="gysjslrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
          <input type="button"  value="接收" onClick="f_do(editform)" >
          <input type="reset"  value="重输" name="reset">
          <input type="button"  value="接收并打印合同" onClick="f_do1(editform)" >
          <input name="button" type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看客户电话">
        </div>
      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">客户编号</div>    </td>
    <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">合同号</div>    </td>
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
    <td width="19%" bgcolor="#CCCCFF" align="right">家装签约日期</td>
    <td width="31%" bgcolor="#CCCCFF"><%=qyrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%"> 
      <div align="right">施工队</div>    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=dzdh%>） </td>
    <td width="19%"> 
      <div align="right">班长</div>    </td>
    <td width="31%"><%=sgbz%>（<%=bzdh%>） </td>
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
    <td width="19%" align="right">订金</td>
    <td width="31%"><%=fkje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" bgcolor="#FFFFFF" align="right">主材大类</td>
    <td width="31%"> <%=zcdlbm%> </td>
    <td width="19%" align="right">品牌</td>
    <td width="31%"> <%=ppbm%> </td>
  </tr>
  <!--<tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">客户交款性质</td>
    <td width="31%"><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%></td>
    <td width="19%" align="right">交款地点</td>
    <td width="31%"><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
  </tr>-->
  <!--<tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">驻店家居顾问</div>    </td>
    <td width="31%"> <%=clgw%> </td>
    <td width="19%"> 
      <div align="right">展厅家居顾问</div>    </td>
    <td width="31%"><%=ztjjgw%> </td>
  </tr>-->
    <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"> 
      材料顾问    </td>
    <td width="30%"> <%=clgw%> </td>
    <td width="290" align="right">&nbsp; 
          </td>
    <td width="29%">&nbsp;</td>
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
      <div align="right">等待送货通知</div>    </td>
    <td width="31%"><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
    <td width="19%"> 
      <div align="right">合同送货时间</div>    </td>
    <td width="31%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">签合同时间</div>    </td>
    <td width="31%"><%=qhtsj%> </td>
    <td width="19%"> 
      <div align="right">可减项截止时间</div>    </td>
    <td width="31%"><%=kjxsj%> </td>
  </tr>
  <!--<tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">合同总额</div>    </td>
    <td width="31%"> <%=hkze%> </td>
    <td width="19%"> 
      <div align="right">增减项金额</div>    </td>
    <td width="31%"><%=zjhze%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">增减后总额</div>    </td>
    <td width="31%"> <%=hkze+zjhze%></td>
    <td width="19%"> 
      <div align="right">计入促销活动金额</div>    </td>
    <td width="31%"><%=htcxhdje%> </td>
  </tr>-->
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">订单确认人</td>
    <td width="31%"><%=ddqrr%></td>
    <td width="19%" align="right">订单确认时间</td>
    <td width="31%"><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">类型</td>
	<td  width="10%">主材名称</td>
	<td  width="14%">系列</td>
	<td  width="9%">型号</td>
	<td  width="8%">规格</td>
	<td  width="7%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="5%" bgcolor="#CC99FF">颜色</td>
	<td  width="5%">单位</td>
	<td  width="6%">合同数量</td>
	<td  width="6%" bgcolor="#CC99FF">增减后数量</td>
	<td  width="5%">配件数</td>
	<td  width="19%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','合同项','2','增项') lx,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,jldwbm,jc_zcddmx.sl,zjhsl";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs,jc_zcddmx.bz  ";
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

	if(	javaTrim(FormName.gysjslrr)=="") {
		alert("请选择[供应商接收录入人]！");
		FormName.gysjslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.gysjslrsj)=="") {
		alert("请选择[供应商接收录入时间]！");
		FormName.gysjslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.gysjslrsj, "供应商接收录入时间"))) {
		return false;
	}

	FormName.action="SaveGcjsJc_zcdd.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.gysjslrr)=="") {
		alert("请选择[供应商接收录入人]！");
		FormName.gysjslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.gysjslrsj)=="") {
		alert("请选择[供应商接收录入时间]！");
		FormName.gysjslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.gysjslrsj, "供应商接收录入时间"))) {
		return false;
	}

	FormName.action="/jcjj/dygl/GcjsDyJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
