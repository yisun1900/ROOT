<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String hth=null;
String sjs=null;
double qye=0;
String kgrq=null;
String jgrq=null;
String dwmc=null;
String sgd=null;
String htshbz=null;
String zjxm =null;
String qyrq =null;
String jyjdrq =null;
double wdzgce =0;
double zkl=0;
String sfyyh=null;
String cxhdbm=null;
String cxhdbmxq=null;
String yhyy=null;
double zqsuijin=0;
double suijin=0;
double suijinbfb=0;
double zjxje=0;
double glftd=0;
double zqguanlif=0;
double guanlif=0;
double zqgczjf=0;
double zhgczjf=0;
double sfke=0;
double cwsfke=0;
double sskbfb=0;


String xxshr=null;
String xxshsj=null;
String htshdf=null;
String xxshyj=null;
String sfyrz=null;
String rzsc=null;
String htshsj=null;
String htshr=null;
String htshyj=null;
String yjjzsj=null;
String tdyjjzsj=null;
String tdsj=null;
String zt="";

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select tdyjjzsj,zt,sfke,cwsfke,yjjzsj,crm_khxx.guanlif,zqsuijin,crm_khxx.qtdh,crm_khxx.email,htshsj,htshr,htshyj,rzsc,sfyrz,glftd,suijin,suijinbfb,zjxje,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd,xxshr,xxshsj,xxshyj,htshbz,zjxm,qyrq,jyjdrq,wdzgce,zkl,sfyyh,cxhdbm,yhyy,cxhdbmxq";
	ls_sql+=" ,zqgczjf,zhgczjf,zqguanlif,tdsj";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		zt=cf.fillNull(rs.getString("zt"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		sfke=rs.getDouble("sfke");
		cwsfke=rs.getDouble("cwsfke");
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zqguanlif=rs.getDouble("zqguanlif");
		zqsuijin=rs.getDouble("zqsuijin");

		guanlif=rs.getDouble("guanlif");
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		htshr=cf.fillNull(rs.getString("htshr"));
		htshyj=cf.fillNull(rs.getString("htshyj"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		glftd=rs.getDouble("glftd");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxje=rs.getDouble("zjxje");
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=rs.getDouble("qye");
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		xxshr=cf.fillNull(rs.getString("xxshr"));
		xxshsj=cf.fillNull(rs.getDate("xxshsj"));
		xxshyj=cf.fillNull(rs.getString("xxshyj"));
		htshbz=cf.fillNull(rs.getString("htshbz"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));

	}
	rs.close();

	double yfkje=0;//应付款总金额
	cwgl.Cwgl cwgl=new cwgl.Cwgl();
	yfkje=cwgl.getAllFkje(khbh);

	if (yfkje!=0)
	{
		sskbfb=cf.round(cwsfke*100/yfkje,2);
	}
	else{
		sskbfb=0;
	}

	if (htshr.equals(""))
	{
		htshr=yhmc;
	}
	if (htshsj.equals(""))
	{
		htshsj=cf.today();
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
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>合同审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
.STYLE3 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
  
<form method="post" action="" name="selectform" >
<div align="center">合同审核 </div>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        客户编号      </td>
      <td width="31%"><%=khbh%> </td>
      <td width="19%" align="right"> 合同号        </td>
      <td width="31%"><%=hth%> </td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">客户姓名</td>
      <td width="31%" bgcolor="#CCCCFF"><%=khxm%> </td>
      <td width="19%" bgcolor="#CCCCFF" align="right">房屋地址</td>
      <td width="31%" bgcolor="#CCCCFF"><%=fwdz%> </td>
    </tr>
    
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
      <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
      <td width="19%" bgcolor="#CCCCFF" align="right">装修设计师</td>
      <td width="31%" bgcolor="#CCCCFF"><%=sjs%></td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF"> 
         客户经理    </td>
      <td width="31%" bgcolor="#CCCCFF"><%=zjxm%> </td>
      <td width="19%" align="right" bgcolor="#CCCCFF"> 
        施工队   </td>
      <td width="31%" bgcolor="#CCCCFF"><%=sgd%> </td>
    </tr>
    
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">合同开工日期</td>
      <td width="31%" bgcolor="#CCCCFF"><%=kgrq%></td>
      <td width="19%" align="right" bgcolor="#CCCCFF">合同竣工日期</td>
      <td width="31%" bgcolor="#CCCCFF"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right">综合折扣率</td>
      <td><%=zkl%></td>
      <td bgcolor="#E8E8FF" align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">工料合计（折前）</td>
      <td width="31%"><%=zqgczjf%></td>
      <td width="19%" bgcolor="#E8E8FF" align="right">工料合计（折后）</td>
      <td width="31%"><%=zhgczjf%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right">管理费（折前）</td>
      <td><%=cf.formatDouble(zqguanlif)%></td>
      <td bgcolor="#E8E8FF" align="right">管理费（折后）</td>
      <td><%=cf.formatDouble(guanlif)%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">税金（折前）</td>
      <td width="31%"><%=cf.formatDouble(zqsuijin)%>（<%=suijinbfb%>％）</td>
      <td width="19%" bgcolor="#E8E8FF" align="right">税金（折后）</td>
      <td width="31%"><%=cf.formatDouble(suijin)%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right">合同总额（折前）</td>
      <td><%=wdzgce%></td>
      <td bgcolor="#E8E8FF" align="right">合同总额（折后）</td>
      <td><%=qye%>（工料＋管理费＋税金）</td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right"><span class="STYLE3">实收款</span></td>
      <td><span class="STYLE3"><%=sfke%></span></td>
      <td bgcolor="#E8E8FF" align="right"><span class="STYLE3">财务审核后收款</span></td>
      <td><span class="STYLE3"><%=cwsfke%></span></td>
    </tr>
    
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">参加促销活动</td>
      <td><%=cxhdbm%>、<%=cxhdbmxq%></td>
      <td align="right"><span class="STYLE3">财务审核收款比例</span></td>
      <td><span class="STYLE3"><%=sskbfb%>％</span></td>
    </tr>
    
    
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%"><span class="STYLE1"><span class="STYLE2">*</span>审核时间</span></td>
      <td width="31%"> 
        <input type="text" name="htshsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>      </td>
      <td width="19%" bgcolor="#E8E8FF" align="right"><span class="STYLE1"><span class="STYLE2">*</span>审核人</span></td>
      <td width="31%"> 
        <input type="text" name="htshr" size="20" maxlength="20" value="<%=yhmc%>" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right"><strong>签约时间</strong></td>
      <td><strong><%=qyrq%></strong></td>
      <td bgcolor="#E8E8FF" align="right"><span class="STYLE2"><strong>退单时间</strong></span></td>
      <td><span class="STYLE2"><strong><%=tdsj%></strong></span></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right"><span class="STYLE1"><span class="STYLE2">*</span></span>签单记入业绩时间</td>
      <td><input name="yjjzsj" type="text" value="<%=yjjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td bgcolor="#E8E8FF" align="right">退单记入业绩时间</td>
      <td><input name="tdyjjzsj" type="text" value="<%=tdyjjzsj%>" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">合同审核意见</td>
      <td colspan="3"> 
        <textarea name="htshyj" rows="6" cols="71"><%=htshyj%></textarea>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td height="39" colspan="4" align="center"> 
           <input type="button" value="录入不合格项目" onClick="f_lr(selectform)"  >
          <input type="button"  value="审核完成" onClick="f_wc(selectform)"  >
          <input name="button" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
          <input type="hidden" name="khbh"  value="<%=khbh%>" >      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_lr(FormName)//参数FormName:Form的名称
{
	FormName.target="_blank";
	FormName.action="InsertCrm_htshmx.jsp";
	FormName.submit();
	return true;
}


function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yjjzsj)=="") {
		alert("请输入[签单记入业绩时间]！");
		FormName.yjjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjjzsj, "签单记入业绩时间"))) {
		return false;
	}

	if (FormName.yjjzsj.value>FormName.htshsj.value)
	{
		alert("[签单记入业绩时间]不能大于[审核时间]！");
		FormName.yjjzsj.select();
		return false;
	}

	if ("<%=zt%>"=="3")
	{
		if(	javaTrim(FormName.tdyjjzsj)=="") {
			alert("请输入[退单记入业绩时间]！");
			FormName.tdyjjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.tdyjjzsj, "退单记入业绩时间"))) {
			return false;
		}

		if (FormName.tdyjjzsj.value>FormName.htshsj.value)
		{
			alert("[退单记入业绩时间]不能大于[审核时间]！");
			FormName.tdyjjzsj.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.tdyjjzsj)!="") {
			alert("未退单,不能输入[退单记入业绩时间]！");
			FormName.tdyjjzsj.select();
			return false;
		}
	}


	FormName.target="";
	FormName.action="SaveWcshCrm_khxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
