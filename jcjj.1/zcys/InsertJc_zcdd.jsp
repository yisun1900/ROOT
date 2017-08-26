<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zdyhbz=(String)session.getAttribute("zdyhbz");
String zt=request.getParameter("zt");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

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
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;

String sqdj="";
String xmzy="";


String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int dds=0;


String listSql="";
String jjwjbz="";

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:家装客户;4:非家装客户
	{
		ls_sql="select khxm,crm_khxx.xmzy,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xmzy=cf.fillNull(rs.getString("xmzy"));
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
			jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		}
		rs.close();
		ps.close();
	}
	else{
		ls_sql="select khxm,fwdz,lxfs,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			sjs=cf.fillNull(rs.getString("sjs"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dmbh=cf.fillNull(rs.getString("zxdm"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		}
		rs.close();
		ps.close();

		if (dmbh.equals(""))
		{
			ls_sql="select dwbh,dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+zxdjbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dmbh=cf.fillNull(rs.getString("dwbh"));
				dwmc=cf.fillNull(rs.getString("dwmc"));
			}
			rs.close();
			ps.close();
		}
	}



	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}



	int count=0;
	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_zcysd";
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
      <div align="center">请录入主材预算单（订单编号：<%=ddbh%>）
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
<%
if (dds>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%">订单编号</td>
		<td  width="10%">处理状态</td>
		<td  width="20%">品牌供应商</td>
		<td  width="12%">总额</td>
		<td  width="10%">录入时间</td>
		<td  width="8%">录入人</td>
		<td  width="30%">备注</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcysd.ddbh,DECODE(jc_zcysd.clzt,'00','录入预算单','01','预算单完成','02','转为正式订单'),ppbm,jc_zcysd.hkze,jc_zcysd.lrsj,jc_zcysd.lrr,jc_zcysd.bz";
		ls_sql+=" FROM jc_zcysd";
		ls_sql+=" where jc_zcysd.khbh='"+khbh+"'";
		ls_sql+=" order by jc_zcysd.zcdlbm,jc_zcysd.ppbm,jc_zcysd.ddbh";
		pageObj.sql=ls_sql;

		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
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
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"><%=khxm%></td>
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"><%=fwdz%></td>
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
%>
              (<%=sgbz%>)</td>
              <td width="18%" align="right">家装签约日期</td>
              <td width="32%"><%=qyrq%></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">合同工期</td>
              <td width="31%"><%=kgrq%>－－<%=jgrq%></td>
              <td width="18%" align="right">质检</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">参加促销活动</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"><font color="#0000FF">折后总额</font></td>
              <td width="31%"> 
                <input type="text" name="hkze" value="0" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#0000FF">折前总额</font></td>
              <td width="32%"> 
                <input type="text" name="wdzje" value="0" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"><font color="#0000FF">计入促销活动金额</font></td>
              <td width="31%"> 
                <input type="text" name="htcxhdje" value="0" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>主材大类</td>
              <td width="31%"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlbm","");
%>
              </select></td>
              <td width="18%" align="right"><font color="#FF0000">*</font>主材小类</td>
              <td width="32%"><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXl(insertform)">
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>品牌供应商</td>
              <td width="31%"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
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
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="zt" value="<%=zt%>">

				<input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="完成" onClick="f_wc(insertform)" name="wc" disabled>
                <input type="button"  value="打印" onClick="window.open('zcfj.jsp?ddbh=<%=ddbh%>')" name="dy" disabled>
                <BR>
                <BR>
                <input type="button"  value="录入－输入型号" onClick="f_srxh(insertform)" name="srxh" disabled>
                <input type="button"  value="录入－查询型号" onClick="f_cxxh(insertform)" name="cxxh" disabled>
                <input type="button"  value="录入手写项目" onClick="f_xzwc(insertform)" name="xzwc" disabled>
                <input type="button"  value="修改明细" onClick="f_ck(insertform)" name="ck" disabled>              </td>
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
	FormName.ppbm.length=1;

	var sql="select zcxlmc from jdm_zcxlbm where zcdlmc='"+FormName.zcdlbm.value+"' order by zcxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
//	window.open(actionStr);
}

function changeXl(FormName)
{
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select sq_gysxx.gysmc c1,sq_gysxx.gysmc||NVL2(yhkssj,'（'||TO_CHAR(yhkssj,'YYYY-MM-DD')||'至'||TO_CHAR(yhjzsj,'YYYY-MM-DD')||'）','') c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+FormName.fgsbh.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+FormName.zcxlbm.value+"' order by sq_gysxx.gysmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}

}


function f_do(FormName)//参数FormName:Form的名称
{
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
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌供应商]！");
		FormName.ppbm.focus();
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

	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[未打折合同额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折合同额"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.hkze.value))
	{
		alert("[未打折合同额]不能小于[合同总额]！");
		FormName.hkze.select();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请选择[未打折合同额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折合同额"))) {
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


	FormName.action="SaveInsertJc_zcdd.jsp";
	FormName.submit();

	FormName.srxh.disabled=false;
	FormName.cxxh.disabled=false;
	<%
	if (zdyhbz.equals("Y"))//Y：重点用户；N：非重点用户
	{
		%>
		FormName.xzwc.disabled=false;
		<%
	}
	%>
	FormName.ck.disabled=false;
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;
	return true;

}
function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_zcdd.jsp";
	FormName.submit();
	return true;
}
function f_srxh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertAjaxMain.jsp";
	FormName.submit();
	return true;
}
function f_cxxh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxJc_zcjgb.jsp";
	FormName.submit();
	return true;
}

function f_xzwc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_zcddmxSxht.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_zcddmxList.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>
