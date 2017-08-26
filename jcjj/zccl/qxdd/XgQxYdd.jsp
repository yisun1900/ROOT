<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


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
String cltzr=null;
String tzclsj=null;
String sclr=null;
String sclsj=null;
String tzshr=null;
String tzshsj=null;
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
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;
String ztjjgw=null;
String htcxhdje=null;
String kclf=null;
String jctdyybm=null;
String tdsm=null;
String tdblr=null;
String tdsj=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;

try {
	conn=cf.getConnection();

	ls_sql="select jctdyybm,tdsm,kclf,tdblr,tdsj,ztjjgw,htcxhdje,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze,ddqrr,ddqrsj,cltzr,tzclsj,sclr,sclsj,tzshr,tzshsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jctdyybm=cf.fillNull(rs.getString("jctdyybm"));
		tdsm=cf.fillNull(rs.getString("tdsm"));
		kclf=cf.fillNull(rs.getString("kclf"));
		tdblr=cf.fillNull(rs.getString("tdblr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
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
		cltzr=cf.fillNull(rs.getString("cltzr"));
		tzclsj=cf.fillNull(rs.getDate("tzclsj"));
		sclr=cf.fillNull(rs.getString("sclr"));
		sclsj=cf.fillNull(rs.getDate("sclsj"));
		tzshr=cf.fillNull(rs.getString("tzshr"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
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
<title>修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">修改取消预订单（订单编号：<%=ddbh%>）</div> 

<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"><font color="#FF0000">*</font>扣测量费</td>
      <td width="35%"> 
        <input type="text" name="kclf" value="<%=kclf%>" size="20" maxlength="16" >
      </td>
      <td width="15%" align="right"><font color="#FF0000">*</font>退单原因</td>
      <td width="35%"> 
        <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm",jctdyybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"> 
        <font color="#FF0000">*</font><font color="#0000CC">退单办理人</font> </td>
      <td width="35%"> 
        <input type="text" name="tdblr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="15%" align="right"> 
        <font color="#FF0000">*</font><font color="#0000CC">退单时间      </font></td>
      <td width="35%"> 
        <input type="text" name="tdsj" value="<%=tdsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right"><font color="#FF0000">*</font>退单说明</td>
      <td colspan="3"> 
        <textarea name="tdsm" rows="4" cols="72"><%=tdsm%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4">
          <div align="center">
            <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
            <input type="button"  value="存盘" onClick="f_do(editform)">
            <input type="reset"  value="重输" name="reset">
            
          </div></td>
    </tr>
  </table>
</form>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="35%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="16%" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="34%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right">客户姓名</td>
    <td width="35%"><%=khxm%></td>
    <td width="16%" align="right">质检</td>
    <td width="34%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="15%" bgcolor="#CCCCFF" align="right">签约店面</td>
    <td width="35%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="16%" bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td width="34%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right"> 
      施工队    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="16%" align="right"> 
      班长    </td>
    <td width="34%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right"> 
      家装签约日期    </td>
    <td width="35%"> <%=qyrq%> </td>
    <td width="16%" align="right"> 
      家装签约额    </td>
    <td width="34%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="15%" align="right">合同开工日期</td>
    <td width="35%"><%=kgrq%></td>
    <td width="16%" align="right">合同竣工日期</td>
    <td width="34%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">参加促销活动</td>
    <td width="35%"> <%=cxhdbm%> </td>
    <td width="16%" align="right">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" bgcolor="#FFFFFF" align="right">主材大类</td>
    <td width="35%"> <%=zcdlbm%> </td>
    <td width="16%" align="right">品牌</td>
    <td width="34%"> <%=ppbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">客户交款性质</td>
    <td width="35%"><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%></td>
    <td width="16%" align="right">交款地点</td>
    <td width="34%"><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      驻店家居顾问    </td>
    <td width="35%"> <%=clgw%> </td>
    <td width="16%" align="right"> 
      展厅家居顾问    </td>
    <td width="34%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="15%" align="right">项目专员</td>
    <td width="35%"><%=xmzy%></td>
    <td width="16%" align="right">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">需测量标志</td>
    <td width="35%"><%
	cf.selectToken(out,"1+不需测量&2+等待测量通知&3+测量已通知&4+已测量",xclbz,true);
%></td>
    <td width="16%" align="right">计划测量时间</td>
    <td width="34%"><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      等待送货通知    </td>
    <td width="35%"><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
    <td width="16%" align="right"> 
      合同送货时间    </td>
    <td width="34%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      签合同时间    </td>
    <td width="35%"><%=qhtsj%> </td>
    <td width="16%" align="right"> 
      可减项截止时间    </td>
    <td width="34%"><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      合同总额    </td>
    <td width="35%"> <%=hkze%> </td>
    <td width="16%" align="right"> 
      主材增项金额    </td>
    <td width="34%"> <%=zjhze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right"> 
      增减后总额    </td>
    <td width="35%"><%=hkze+zjhze%> </td>
    <td width="16%" align="right"> 
      计入促销活动金额    </td>
    <td width="34%"><%=htcxhdje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">订单确认人</td>
    <td width="35%"><%=ddqrr%></td>
    <td width="16%" align="right">订单确认时间</td>
    <td width="34%"><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right" bgcolor="#CCFFCC"> 
      测量通知录入人    </td>
    <td width="35%"> <%=cltzr%></td>
    <td width="16%" align="right"> 
      发测量通知时间    </td>
    <td width="34%"><%=tzclsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right"> 
      实测量人    </td>
    <td width="35%"> <%=sclr%></td>
    <td width="16%" align="right"> 
      实测量时间    </td>
    <td width="34%"><%=sclsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right"> 
      发送货通知人    </td>
    <td width="35%"><%=tzshr%> </td>
    <td width="16%" align="right"> 
      发送货通知时间    </td>
    <td width="34%"><%=tzshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">备注</td>
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

	if(	javaTrim(FormName.kclf)=="") {
		alert("请选择[扣测量费]！");
		FormName.kclf.focus();
		return false;
	}
	if(!(isFloat(FormName.kclf, "扣测量费"))) {
		return false;
	}
	if(	javaTrim(FormName.jctdyybm)=="") {
		alert("请选择[退单原因]！");
		FormName.jctdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tdblr)=="") {
		alert("请选择[退单办理人]！");
		FormName.tdblr.focus();
		return false;
	}
	if(	javaTrim(FormName.tdsj)=="") {
		alert("请选择[退单时间]！");
		FormName.tdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdsj, "退单时间"))) {
		return false;
	}
	if(	javaTrim(FormName.tdsm)=="") {
		alert("请选择[退单说明]！");
		FormName.tdsm.focus();
		return false;
	}

	FormName.action="SaveXgQxYdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
