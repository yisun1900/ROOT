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
double hkze=0;
double zjhze=0;
String ddqrr=null;
String ddqrsj=null;
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
String htcxhdje=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;

String tzclsj=null;
String cltzr=null;
String sclsj=null;
String sclr=null;
String jhfcsj=null;
String tzfcsj=null;
String tzfclrr=null;
String fcsj=null;
String fclrr=null;
String fcsm=null;

try {
	conn=cf.getConnection();

	ls_sql="select ztjjgw,htcxhdje,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze,ddqrr,ddqrsj";
	ls_sql+=" ,tzclsj,cltzr,sclsj,sclr,jhfcsj,tzfcsj,tzfclrr,fcsj,fclrr,fcsm";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tzclsj=cf.fillNull(rs.getDate("tzclsj"));
		cltzr=cf.fillNull(rs.getString("cltzr"));
		sclsj=cf.fillNull(rs.getDate("sclsj"));
		sclr=cf.fillNull(rs.getString("sclr"));
		jhfcsj=cf.fillNull(rs.getDate("jhfcsj"));
		tzfclrr=cf.fillNull(rs.getString("tzfclrr"));
		tzfcsj=cf.fillNull(rs.getDate("tzfcsj"));
		fcsj=cf.fillNull(rs.getDate("fcsj"));
		fclrr=cf.fillNull(rs.getString("fclrr"));
		fcsm=cf.fillNull(rs.getString("fcsm"));

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
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
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

<html>
<head>
<title>通知复尺</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">入库（订单编号：<%=ddbh%>） 

</div>
<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right">发测量通知时间</td>
      <td><%=tzclsj%></td>
      <td align="right">测量通知录入人</td>
      <td><%=cltzr%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">实测量时间</td>
      <td><%=sclsj%></td>
      <td align="right">实测量人</td>
      <td><%=sclr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><span class="STYLE1">计划入库时间</span></td>
      <td width="32%"><%=jhfcsj%></td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">发复尺通知时间</span></td>
      <td><%=tzfcsj%></td>
      <td align="right"><span class="STYLE1">通知入库录入人</span></td>
      <td><%=tzfclrr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><span class="STYLE1">复尺时间</span></td>
      <td width="32%"><%=fcsj%></td>
      <td width="18%" align="right"><span class="STYLE1">复尺录入人</span></span></td>
      <td width="32%"><%=fclrr%></td>
    </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">复尺说明</span></td>
      <td colspan="3"><%=fcsm%></td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><span class="STYLE2">*</span><span class="STYLE1">入库时间</span></td>
      <td width="32%"><input type="text" name="rksj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
      <td width="18%" align="right"><span class="STYLE2">*<span class="STYLE1">入库录入人</span></span></td>
      <td width="32%"><input type="text" name="rklrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">入库说明</td>
      <td colspan="3"><textarea name="rksm" cols="71" rows="3"></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
          <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="button">
          <input type="reset"  value="重输" name="reset"></td>
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
    <td width="18%" align="right">客户姓名</td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right">质检</td>
    <td width="32%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="18%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="18%" bgcolor="#CCCCFF" align="right">签约店面</td>
    <td width="32%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="18%" bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td width="32%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="18%" align="right"> 
      施工队    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="18%" align="right"> 
      班长    </td>
    <td width="32%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="18%" align="right"> 
      家装签约日期    </td>
    <td width="32%"> <%=qyrq%> </td>
    <td width="18%" align="right"> 
      家装签约额    </td>
    <td width="32%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="18%" align="right">合同开工日期</td>
    <td width="32%"><%=kgrq%></td>
    <td width="18%" align="right">合同竣工日期</td>
    <td width="32%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">参加促销活动</td>
    <td width="32%"> <%=cxhdbm%> </td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" bgcolor="#FFFFFF" align="right">主材大类</td>
    <td width="32%"> <%=zcdlbm%> </td>
    <td width="18%" align="right">品牌</td>
    <td width="32%"> <%=ppbm%> </td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      驻店家居顾问    </td>
    <td width="32%"> <%=clgw%> </td>
    <td width="18%" align="right"> 
      展厅家居顾问    </td>
    <td width="32%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">项目专员</td>
    <td width="32%"><%=xmzy%></td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">产品类型</td>
    <td width="32%"><%
	cf.selectToken(out,"1+非定制式产品&2+定制式产品",xclbz,true);
%></td>
    <td width="18%" align="right">计划测量时间</td>
    <td width="32%"><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      等待送货通知    </td>
    <td width="32%">
<%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%>	</td>
    <td width="18%" align="right"> 
      合同送货时间    </td>
    <td width="32%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      签合同时间    </td>
    <td width="32%"><%=qhtsj%> </td>
    <td width="18%" align="right"> 
      可减项截止时间    </td>
    <td width="32%"><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      合同总额    </td>
    <td width="32%"> <%=hkze%> </td>
    <td width="18%" align="right"> 
      增减项金额    </td>
    <td width="32%"><%=zjhze%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      增减后总额    </td>
    <td width="32%"> <%=hkze+zjhze%></td>
    <td width="18%" align="right"> 
      计入促销活动金额    </td>
    <td width="32%"><%=htcxhdje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">订单确认人</td>
    <td width="32%"><%=ddqrr%></td>
    <td width="18%" align="right">订单确认时间</td>
    <td width="32%"><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">备注</td>
    <td colspan="3"><%=bz%></td>
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

	if(	javaTrim(FormName.rklrr)=="") {
		alert("请选择[入库录入人]！");
		FormName.rklrr.focus();
		return false;
	}
	if(	javaTrim(FormName.rksj)=="") {
		alert("请选择[入库时间]！");
		FormName.rksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rksj, "入库时间"))) {
		return false;
	}

	FormName.action="SaveRkJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
