<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"050271")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<html>
<head>
<title>客户合并</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="insertform" target='_blank'>


<%
String fgsbh=request.getParameter("fgsbh");
String khbh=request.getParameter("khbh");
String khbh2=request.getParameter("khbh2");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
%>


<CENTER >
  <B><font size="3">产品信息合并（<font color="#FF0000"><b>把两个客户【产品信息】合并在一起，家装信息不变</b></font>）</font></B>
</CENTER>

<%
	String khxm=null;
	String hth=null;
	String fwdz=null;
	String lxfs=null;
	String qtdh=null;
	String sjs=null;
	String ywy=null;
	String zjxm=null;

	String sgdmc=null;
	String cxhdbm=null;
	double zkl=0;

	String zt=null;
	String ztmc=null;

	String ysgcjdmc=null;
	String jzbz=null;

	String dwmc=null;
	String qyrq=null;
	String kgrq=null;
	String jgrq=null;
	double wdzgce=0;
	double qye=0;
	ls_sql="SELECT crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.lxfs,qtdh,crm_khxx.sjs,ywy,crm_khxx.zjxm";
	ls_sql+=" ,sgdmc,crm_khxx.cxhdbm,zkl";
	ls_sql+=" ,DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>') ztmc";
	ls_sql+=" ,ysgcjdmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装') jzbz";
	ls_sql+=" ,sq_dwxx.dwmc,crm_khxx.qyrq,crm_khxx.kgrq,jgrq,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.zt";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
    ls_sql+=" and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		qtdh=cf.fillHtml(rs.getString("qtdh"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		ywy=cf.fillHtml(rs.getString("ywy"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));

		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		zkl=rs.getDouble("zkl");

		ztmc=cf.fillHtml(rs.getString("ztmc"));
		zt=cf.fillNull(rs.getString("zt"));

		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));
		jzbz=cf.fillHtml(rs.getString("jzbz"));

		dwmc=cf.fillHtml(rs.getString("dwmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
	}
	else{
		out.println("错误！保留客户不存在");
		return;
	}
	rs.close();
	ps.close();

%>

  <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 13px'>
    <tr height="25" align="center" bgcolor="#E8E8FF"> 
      <td colspan="3"><b><font color="#990099" size="4">要保留客户信息（客户编号：<%=khbh%>）</font></b></td>
    </tr>
    <tr height="25" bgcolor="#E8E8FF"> 
      <td width="31%"><b>合同号</b>：<%=hth%></td>
      <td width="28%" bgcolor="#E8E8FF"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><b>客户姓名</b>：<%=khxm%></A></td>
      <td width="41%"><b>客户类型</b>：<%=ztmc%></td>
    </tr>
    <tr height="25" bgcolor="#E8E8FF"> 
      <td colspan="2"><b>客户房屋地址</b>：<%=fwdz%></td>
      <td width="41%"><b>联系方式</b>：<%=lxfs%>,<%=qtdh%></td>
    </tr>
    <tr height="25" bgcolor="#E8E8FF"> 
      <td colspan="2"><b>参加促销活动</b>：<%=cxhdbm%></td>
      <td width="41%"><b>折扣率</b>：<%=zkl%></td>
    </tr>
    <tr height="25" bgcolor="#E8E8FF"> 
      <td width="31%"><b>签约店面</b>：<%=dwmc%></td>
      <td width="28%"><b>设计师</b>：<%=sjs%></td>
      <td width="41%"><b>家装标志</b>：<%=jzbz%></td>
    </tr>
    <tr height="25" bgcolor="#E8E8FF"> 
      <td width="31%"><b>施工队</b>：<%=sgdmc%></td>
      <td width="28%"><b>工程担当</b>：<%=khxm%></td>
      <td width="41%"><b>业务员</b>：<%=ywy%></td>
    </tr>
    <tr height="25" bgcolor="#E8E8FF"> 
      <td width="31%"><b>工程原报价</b>：<%=wdzgce%></td>
      <td width="28%"><b>工程签约额</b>：<%=qye%></td>
      <td width="41%"><b>签约日期</b>：<%=qyrq%></td>
    </tr>
    <tr height="25" bgcolor="#E8E8FF"> 
      <td width="31%"><b>工程进度</b>：<%=ysgcjdmc%></td>
      <td width="28%"><b>合同开工日期</b>：<%=kgrq%></td>
      <td width="41%"><b>合同竣工日期</b>：<%=jgrq%></td>
    </tr>
  </table>

<%
	ls_sql="SELECT crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.lxfs,qtdh,crm_khxx.sjs,ywy,crm_khxx.zjxm";
	ls_sql+=" ,sgdmc,crm_khxx.cxhdbm,zkl";
	ls_sql+=" ,DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>') ztmc";
	ls_sql+=" ,ysgcjdmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装') jzbz";
	ls_sql+=" ,sq_dwxx.dwmc,crm_khxx.qyrq,crm_khxx.kgrq,jgrq,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.zt";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
    ls_sql+=" and crm_khxx.khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		qtdh=cf.fillHtml(rs.getString("qtdh"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		ywy=cf.fillHtml(rs.getString("ywy"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));

		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		zkl=rs.getDouble("zkl");

		ztmc=cf.fillHtml(rs.getString("ztmc"));
		zt=cf.fillNull(rs.getString("zt"));

		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));
		jzbz=cf.fillHtml(rs.getString("jzbz"));

		dwmc=cf.fillHtml(rs.getString("dwmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
	}
	else{
		out.println("<P>错误！删除客户不存在");
		return;
	}
	rs.close();
	ps.close();


%>
<P>
  <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 13px'>
    <tr height="25" align="center" bgcolor="#CCCCCC"> 
      <td colspan="3"><b><font color="#0000CC" size="4">要删除客户信息（客户编号：<%=khbh2%>）</font></b></td>
    </tr>
    <tr height="25" bgcolor="#CCCCCC"> 
      <td width="31%"><b>合同号</b>：<%=hth%></td>
      <td width="28%"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh2%>" target="_blank"><b>客户姓名</b>：<%=khxm%></A></td>
      <td width="41%"><b>客户类型</b>：<%=ztmc%></td>
    </tr>
    <tr height="25" bgcolor="#CCCCCC"> 
      <td colspan="2"><b>客户房屋地址</b>：<%=fwdz%></td>
      <td width="41%"><b>联系方式</b>：<%=lxfs%>,<%=qtdh%></td>
    </tr>
    <tr height="25" bgcolor="#CCCCCC"> 
      <td colspan="2"><b>参加促销活动</b>：<%=cxhdbm%></td>
      <td width="41%"><b>折扣率</b>：<%=zkl%></td>
    </tr>
    <tr height="25" bgcolor="#CCCCCC"> 
      <td width="31%"><b>签约店面</b>：<%=dwmc%></td>
      <td width="28%"><b>设计师</b>：<%=sjs%></td>
      <td width="41%"><b>家装标志</b>：<%=jzbz%></td>
    </tr>
    <tr height="25" bgcolor="#CCCCCC"> 
      <td width="31%"><b>施工队</b>：<%=sgdmc%></td>
      <td width="28%"><b>工程担当</b>：<%=khxm%></td>
      <td width="41%"><b>业务员</b>：<%=ywy%></td>
    </tr>
    <tr height="25" bgcolor="#CCCCCC"> 
      <td width="31%"><b>工程原报价</b>：<%=wdzgce%></td>
      <td width="28%"><b>工程签约额</b>：<%=qye%></td>
      <td width="41%"><b>签约日期</b>：<%=qyrq%></td>
    </tr>
    <tr height="25" bgcolor="#CCCCCC"> 
      <td width="31%"><b>工程进度</b>：<%=ysgcjdmc%></td>
      <td width="28%"><b>合同开工日期</b>：<%=kgrq%></td>
      <td width="41%"><b>合同竣工日期</b>：<%=jgrq%></td>
    </tr>
  </table>

<P>
  <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 13px'>
    <tr height="25" align="center" bgcolor="#CCCCCC"> 
      <td height="38" colspan="3" bgcolor="#FFFFCC"> 
        <input type="hidden" name="fgsbh" value="<%=fgsbh%>">
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="hidden" name="khbh2" value="<%=khbh2%>">
        <input type="button" value="开始合并产品信息" onClick="f_do(insertform)">
      <font color="#FF0000"><b>注意：请确认好，合并后将不可恢复</b></font> </td>
    </tr>
  </table>

</form>
</body>
</html>

<%

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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if ( !confirm("注意：请确认好，合并后将不可恢复，确实要继续吗？") )	
	{
		return;
	}

	FormName.action="hbCpXX.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
