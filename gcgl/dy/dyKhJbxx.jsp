<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String zjxm=null;
String qyrq=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String bzdh=null;
String cxhdbm=null;
double wdzgce=0;
double qye=0;
double suijin=0;
double zkl=0;
double zhzjxje=0;
double zhwgzj=0;
double glf=0;
double glftd=0;


double hddj=0;
double lfdj=0;
double sqk=0;
double zqk=0;
double wqk=0;
double gcjkhj=0;
double fk=0;
double sjf=0;
double gcycf=0;
double jxglf=0;
double gcddf=0;
double hjjk=0;


try {
	conn=cf.getConnection();

	ls_sql="SELECT glftd,zhzjxje,zkl,cxhdbm,crm_khxx.sgd,sgdmc,sgbz,crm_khxx.dwbh,dwmc,khxm,lxfs,fwdz,hth,sjs,zjxm,qyrq,kgrq,jyjdrq,jgrq,wdzgce,qye,suijin,DECODE(bjjb,'A','普通','B','精品','C','乐华梅兰') bjjb";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		glftd=rs.getDouble("glftd");
		zhzjxje=rs.getDouble("zhzjxje");
		zkl=rs.getDouble("zkl");
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>客户基本信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b><font size="4">客户基本信息</font></b></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
  <tr height="29"> 
    <td width="14%" align="center"><b>客户编号</b></td>
    <td colspan="2"><%=khbh%></td>
    <td width="14%" align="center"><b>合 同 号</b></td>
    <td colspan="2" width="36%"><%=hth%></td>
  </tr>
  <tr height="29"> 
    <td width="14%" align="center"><b>客户姓名</b></td>
    <td colspan="2"><%=khxm%>（<%=lxfs%>）</td>
    <td width="14%" align="center"><b>工程担当</b></td>
    <td colspan="2" width="36%"><%=zjxm%></td>
  </tr>
  <tr height="29"> 
    <td width="14%" align="center"><b>房屋地址</b></td>
    <td colspan="5"><%=fwdz%></td>
  </tr>
  <tr height="29"> 
    <td width="14%" align="center"><b>设 计 师</b></td>
    <td colspan="2"><%=sjs%></td>
    <td width="14%" align="center"><b>签约日期</b></td>
    <td colspan="2" width="36%"><%=qyrq%></td>
  </tr>
  <tr height="29"> 
    <td width="14%" align="center"><b>合同开工日期</b></td>
    <td colspan="2"><%=kgrq%></td>
    <td width="14%" align="center"><b>合同竣工日期</b></td>
    <td colspan="2" width="36%"><%=jgrq%></td>
  </tr>
  <tr height="29"> 
    <td width="14%" align="center"><b>施 工 队</b></td>
    <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="14%" align="center"><b>班 &nbsp;长</b></td>
    <td colspan="2" width="36%"><%=sgbz%>（<%=bzdh%>）</td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
