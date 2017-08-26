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
String yhyy=null;
double suijin=0;
double suijinbfb=0;
double zjxje=0;
double glftd=0;


String htshr=null;
String htshsj=null;
String htshdf=null;
String htshyj=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select crm_khxx.qtdh,crm_khxx.email,glftd,suijin,suijinbfb,zjxje,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd,htshr,htshsj,htshyj,htshbz,zjxm,qyrq,jyjdrq,wdzgce,zkl,sfyyh,cxhdbm,yhyy";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
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
		htshr=cf.fillNull(rs.getString("htshr"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		htshyj=cf.fillNull(rs.getString("htshyj"));
		htshbz=cf.fillNull(rs.getString("htshbz"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

	}
	rs.close();

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
</head>

<body bgcolor="#FFFFFF">
<div align="center">合同审核 </div>
  
<form method="post" action="" name="selectform" target='_blank'>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%"> 
        <div align="right">客户编号</div>
      </td>
      <td width="30%"><%=khbh%> </td>
      <td width="18%"> 
        <div align="right">合同号</div>
      </td>
      <td width="33%"><%=hth%> </td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">客户姓名</td>
      <td width="30%" bgcolor="#CCCCFF"> 
        <input type="text" name="khxm" size="20" maxlength="50" value="<%=khxm%>">
      </td>
      <td width="18%" bgcolor="#CCCCFF" align="right">&nbsp;</td>
      <td width="33%" bgcolor="#CCCCFF">&nbsp; </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">手机</td>
      <td colspan="3" bgcolor="#CCCCFF">
        <input type="text" name="lxfs" size="40" maxlength="50" value="<%=lxfs%>">
      </td>
    </tr>
    <tr>
      <td width="19%" align="right" bgcolor="#CCCCFF">其它电话</td>
      <td colspan="3" bgcolor="#CCCCFF">
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
      </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">电子邮件</td>
      <td colspan="3" bgcolor="#CCCCFF">
        <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">
      </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">房屋地址</td>
      <td colspan="3" bgcolor="#CCCCFF"> 
        <input type="text" name="fwdz" size="71" maxlength="50" value="<%=fwdz%>">
      </td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
      <td width="30%" bgcolor="#CCCCFF"><%=dwmc%></td>
      <td width="18%" bgcolor="#CCCCFF" align="right">装修设计师</td>
      <td width="33%" bgcolor="#CCCCFF"><%=sjs%></td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF"> 
        <div align="right">工程担当</div>
      </td>
      <td width="30%" bgcolor="#CCCCFF"><%=zjxm%> </td>
      <td width="18%" bgcolor="#CCCCFF"> 
        <div align="right">施工队</div>
      </td>
      <td width="33%" bgcolor="#CCCCFF"><%=sgd%> </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">签约日期</td>
      <td width="30%" bgcolor="#CCCCFF"><%=qyrq%></td>
      <td width="18%" align="right" bgcolor="#CCCCFF">建议交底日期</td>
      <td width="33%" bgcolor="#CCCCFF"><%=jyjdrq%></td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">合同开工日期</td>
      <td width="30%" bgcolor="#CCCCFF"><%=kgrq%></td>
      <td width="18%" align="right" bgcolor="#CCCCFF">合同竣工日期</td>
      <td width="33%" bgcolor="#CCCCFF"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">工程原报价</td>
      <td width="30%"><%=wdzgce%></td>
      <td width="18%" bgcolor="#E8E8FF" align="right">实际折扣率</td>
      <td width="33%"><%=zkl%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">工程签约额</td>
      <td width="30%"><%=qye%></td>
      <td width="18%" bgcolor="#E8E8FF" align="right"></td>
      <td width="33%"></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">是否有优惠</td>
      <td width="30%"><%
	cf.radioToken(out, "Y+是&N+否",sfyyh,true);
%></td>
      <td width="18%" bgcolor="#E8E8FF" align="right">参加促销活动</td>
      <td width="33%"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">优惠内容</td>
      <td colspan="3"><%=yhyy%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%"><b>税金</b></td>
      <td width="30%"><%=cf.formatDouble(suijin)%>（<%=suijinbfb%>％）</td>
      <td width="18%" bgcolor="#E8E8FF" align="right">管理费提点</td>
      <td width="33%"> 
        <input type="text" name="glftd" size="10" maxlength="20" value="<%=glftd%>" >
        % </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">审核时间</td>
      <td width="30%"> 
        <input type="text" name="htshsj" size="20" maxlength="10" value="<%=htshsj%>" readonly>
      </td>
      <td width="18%" bgcolor="#E8E8FF" align="right">审核人</td>
      <td width="33%"> 
        <input type="text" name="htshr" size="20" maxlength="20" value="<%=htshr%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">合同审核意见</td>
      <td colspan="3"> 
        <textarea name="htshyj" rows="3" cols="71"><%=htshyj%></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center"> 
          <input type="button"  value="可派单" onClick="f_do(selectform)" name="kpd" <%if (!htshbz.equals("N")) out.println("disabled");%>>
          <input type="button" value="录入不合格项目" onClick="f_lr(selectform)" name="lr" >
          <input type="button"  value="审核完成" onClick="f_wc(selectform)" name="wc" <%if (!htshbz.equals("P")) out.println("disabled");%>>
          <input type="button"  value="打印开工证" onClick="window.open('/gcgl/kgzgl/EditCrm_khxx.jsp?khbh=<%=khbh%>')" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
        </div>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("请输入[手机]或[其它电话]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "手机"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "其它电话"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.htshsj)=="") {
		alert("请输入[合同审核时间]！");
		FormName.htshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.htshr)=="") {
		alert("请输入[合同审核人]！");
		FormName.htshr.focus();
		return false;
	}
	if(	javaTrim(FormName.glftd)=="") {
		alert("请输入[管理费提点]！");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "管理费提点"))) {
		return false;
	}

	FormName.action="SaveKpdCrm_khxx.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.wc.disabled=false;
	FormName.kpd.disabled=true;
	return true;
}


function f_lr(FormName)//参数FormName:Form的名称
{

	FormName.action="InsertCrm_htshmx.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{

	FormName.action="Crm_htshmxList.jsp";
	FormName.submit();
	return true;
}

function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.htshyj)=="") {
		alert("请输入[合同审核意见]！");
		FormName.htshyj.focus();
		return false;
	}
	if(	javaTrim(FormName.glftd)=="") {
		alert("请输入[管理费提点]！");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "管理费提点"))) {
		return false;
	}

	FormName.action="SaveWcshCrm_khxx.jsp";
	FormName.submit();
	FormName.lr.disabled=true;
	FormName.ck.disabled=true;
	FormName.wc.disabled=true;
	return true;
}

//-->
</SCRIPT>
