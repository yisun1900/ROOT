<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #3300FF}
-->
</style>
</head>
<%
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

%>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="insertform" >
<center>《签单结算－－工地明细》</center>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="7%">签单类型</td>
	<td  width="6%">提成类型</td>
	<td  width="6%">提成基数</td>
	<td  width="6%">已提成比率</td>
	<td  width="6%">已提成金额</td>
	<td  width="6%">提成比率 </td>
	<td  width="6%">提成金额</td>
	<td  width="6%">其它费用</td>
	<td  width="6%">实际提成</td>
	<td  width="21%">备注</td>
</tr>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String fgsbh=null;
String dwbh=null;
String sjsbh=null;
String sjs=null;
String sjfw=null;
String sjfw2=null;
double xdsskbfb=0;
double tcze=0;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,sjsbh,sjs,sjfw,sjfw2,xdsskbfb,tcze ,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_sjsjsjl";
	ls_sql+=" where jsjlh='"+jsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjfw=cf.fillNull(rs.getDate("sjfw"));
		sjfw2=cf.fillNull(rs.getDate("sjfw2"));
		xdsskbfb=rs.getDouble("xdsskbfb");
		tcze=rs.getDouble("tcze");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sgdmc=null;
	String zjxm=null;
	String qyrq=null;
	double qye=0;
	double sfke=0;
	String ysgcjdmc=null;
	String sjsjsbz=null;

	String qdlx=null;
	String tclx=null;
	double sjfksbl=0;
	double tcjs=0;
	double ytcbl=0;
	double ytcje=0;
	double bctcbl=0;
	double bctcje=0;
	double zjqtfy=0;
	double sjtcje=0;
	String tcbz=null;

	double alltcjs=0;
	double allytcje=0;
	double allbctcje=0;
	double allzjqtfy=0;
	double allsjtcje=0;

	String bgcolor="#E8E8FF";

	int row=0;
	int row1=0;

	ls_sql="SELECT cw_sjsjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(sjsjsbz,'0','未结算','1','签单结算','2','完工结算') sjsjsbz";
	ls_sql+=" ,DECODE(cw_sjsjsmx.qdlx,'1','非市场部家装','2','市场部家装','3','工装') qdlx,DECODE(cw_sjsjsmx.tclx,'1','签单提成','2','完工提成','3','设计客户','4','退单') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_sjsjsmx.bz ";
	ls_sql+=" FROM cw_sjsjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_sjsjsmx.khbh=crm_khxx.khbh and cw_sjsjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_sjsjsmx.tclx='1'";//1：签单提成；2：完工提成；3：设计客户；4：退单
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ysgcjdmc=rs.getString("ysgcjdmc");
		sjsjsbz=rs.getString("sjsjsbz");

		qdlx=rs.getString("qdlx");
		tclx=rs.getString("tclx");
		sjfksbl=rs.getDouble("sjfksbl");
		tcjs=rs.getDouble("tcjs");
		ytcbl=rs.getDouble("ytcbl");
		ytcje=rs.getDouble("ytcje");
		bctcbl=rs.getDouble("bctcbl");
		bctcje=rs.getDouble("bctcje");
		zjqtfy=rs.getDouble("zjqtfy");
		sjtcje=rs.getDouble("sjtcje");
		tcbz=cf.fillHtml(rs.getString("bz"));

		alltcjs+=tcjs;
		allytcje+=ytcje;
		allbctcje+=bctcje;
		allzjqtfy+=zjqtfy;
		allsjtcje+=sjtcje;

		alltcjs=cf.doubleTrim(alltcjs);
		allytcje=cf.doubleTrim(allytcje);
		allbctcje=cf.doubleTrim(allbctcje);
		allzjqtfy=cf.doubleTrim(allzjqtfy);
		allsjtcje=cf.doubleTrim(allsjtcje);

		row++;
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A HREF="EditCw_sjsjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">扣款</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%>%</td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%>%</td>
			<td><%=bctcje%></td>
			<td><%=zjqtfy%></td>
			<td><%=sjtcje%></td>
			<td><%=tcbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();



%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=alltcjs%></td>
		<td>&nbsp;</td>
		<td><%=allytcje%></td>
		<td>&nbsp;</td>
		<td><%=allbctcje%></td>
		<td><%=allzjqtfy%></td>
		<td><%=allsjtcje%></td>
		<td>&nbsp;</td>
	</tr>
</table>


<center>《完工结算－－工地明细》</center>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="7%">签单类型</td>
	<td  width="6%">提成类型</td>
	<td  width="6%">提成基数</td>
	<td  width="6%">已提成比率</td>
	<td  width="6%">已提成金额</td>
	<td  width="6%">提成比率 </td>
	<td  width="6%">提成金额</td>
	<td  width="6%">其它费用</td>
	<td  width="6%">实际提成</td>
	<td  width="21%">备注</td>
</tr>

<%
	alltcjs=0;
	allytcje=0;
	allbctcje=0;
	allzjqtfy=0;
	allsjtcje=0;

	ls_sql="SELECT cw_sjsjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(sjsjsbz,'0','未结算','1','签单结算','2','完工结算') sjsjsbz";
	ls_sql+=" ,DECODE(cw_sjsjsmx.qdlx,'1','非市场部家装','2','市场部家装','3','工装') qdlx,DECODE(cw_sjsjsmx.tclx,'1','签单提成','2','完工提成','3','设计客户','4','退单') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_sjsjsmx.bz ";
	ls_sql+=" FROM cw_sjsjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_sjsjsmx.khbh=crm_khxx.khbh and cw_sjsjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_sjsjsmx.tclx='2'";//1：签单提成；2：完工提成；3：设计客户；4：退单
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ysgcjdmc=rs.getString("ysgcjdmc");
		sjsjsbz=rs.getString("sjsjsbz");

		qdlx=rs.getString("qdlx");
		tclx=rs.getString("tclx");
		sjfksbl=rs.getDouble("sjfksbl");
		tcjs=rs.getDouble("tcjs");
		ytcbl=rs.getDouble("ytcbl");
		ytcje=rs.getDouble("ytcje");
		bctcbl=rs.getDouble("bctcbl");
		bctcje=rs.getDouble("bctcje");
		zjqtfy=rs.getDouble("zjqtfy");
		sjtcje=rs.getDouble("sjtcje");
		tcbz=cf.fillHtml(rs.getString("bz"));

		alltcjs+=tcjs;
		allytcje+=ytcje;
		allbctcje+=bctcje;
		allzjqtfy+=zjqtfy;
		allsjtcje+=sjtcje;

		alltcjs=cf.doubleTrim(alltcjs);
		allytcje=cf.doubleTrim(allytcje);
		allbctcje=cf.doubleTrim(allbctcje);
		allzjqtfy=cf.doubleTrim(allzjqtfy);
		allsjtcje=cf.doubleTrim(allsjtcje);

		row1++;
		if (row1%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A HREF="EditCw_sjsjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">扣款</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%>%</td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%>%</td>
			<td><%=bctcje%></td>
			<td><%=zjqtfy%></td>
			<td><%=sjtcje%></td>
			<td><%=tcbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=alltcjs%></td>
		<td>&nbsp;</td>
		<td><%=allytcje%></td>
		<td>&nbsp;</td>
		<td><%=allbctcje%></td>
		<td><%=allzjqtfy%></td>
		<td><%=allsjtcje%></td>
		<td>&nbsp;</td>
	</tr>
</table>


<center>《退单结算－－工地明细》</center>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="7%">签单类型</td>
	<td  width="6%">提成类型</td>
	<td  width="6%">提成基数</td>
	<td  width="6%">已提成比率</td>
	<td  width="6%">已提成金额</td>
	<td  width="6%">提成比率 </td>
	<td  width="6%">提成金额</td>
	<td  width="6%">其它费用</td>
	<td  width="6%">实际提成</td>
	<td  width="21%">备注</td>
</tr>

<%
	alltcjs=0;
	allytcje=0;
	allbctcje=0;
	allzjqtfy=0;
	allsjtcje=0;

	ls_sql="SELECT cw_sjsjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(sjsjsbz,'0','未结算','1','签单结算','2','完工结算') sjsjsbz";
	ls_sql+=" ,DECODE(cw_sjsjsmx.qdlx,'1','非市场部家装','2','市场部家装','3','工装') qdlx,DECODE(cw_sjsjsmx.tclx,'1','签单提成','2','完工提成','3','设计客户','4','退单') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_sjsjsmx.bz ";
	ls_sql+=" FROM cw_sjsjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_sjsjsmx.khbh=crm_khxx.khbh and cw_sjsjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_sjsjsmx.tclx='4'";//1：签单提成；2：完工提成；3：设计客户；4：退单
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ysgcjdmc=rs.getString("ysgcjdmc");
		sjsjsbz=rs.getString("sjsjsbz");

		qdlx=rs.getString("qdlx");
		tclx=rs.getString("tclx");
		sjfksbl=rs.getDouble("sjfksbl");
		tcjs=rs.getDouble("tcjs");
		ytcbl=rs.getDouble("ytcbl");
		ytcje=rs.getDouble("ytcje");
		bctcbl=rs.getDouble("bctcbl");
		bctcje=rs.getDouble("bctcje");
		zjqtfy=rs.getDouble("zjqtfy");
		sjtcje=rs.getDouble("sjtcje");
		tcbz=cf.fillHtml(rs.getString("bz"));

		alltcjs+=tcjs;
		allytcje+=ytcje;
		allbctcje+=bctcje;
		allzjqtfy+=zjqtfy;
		allsjtcje+=sjtcje;

		alltcjs=cf.doubleTrim(alltcjs);
		allytcje=cf.doubleTrim(allytcje);
		allbctcje=cf.doubleTrim(allbctcje);
		allzjqtfy=cf.doubleTrim(allzjqtfy);
		allsjtcje=cf.doubleTrim(allsjtcje);

		row1++;
		if (row1%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A HREF="EditCw_sjsjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">扣款</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%>%</td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%>%</td>
			<td><%=bctcje%></td>
			<td><%=zjqtfy%></td>
			<td><%=sjtcje%></td>
			<td><%=tcbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=alltcjs%></td>
		<td>&nbsp;</td>
		<td><%=allytcje%></td>
		<td>&nbsp;</td>
		<td><%=allbctcje%></td>
		<td><%=allzjqtfy%></td>
		<td><%=allsjtcje%></td>
		<td>&nbsp;</td>
	</tr>
</table>


<DIV align="center">设计师结算（结算记录号：<%=jsjlh%>）</DIV>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">分公司</td>
    <td width="30%"> 
      <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
      </select>
    </td>
      <td width="22%" align="right">店面</td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
      </select>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">设计师</td>
    <td width="30%"> 
      <input type="text" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" readonly>
      <td width="22%" align="right">限定实收款百分比（&gt;＝）</td>
      <td width="30%"> 
        <input type="text" name="xdsskbfb" size="8" maxlength="10" value="<%=xdsskbfb%>" readonly>
      % </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">时间范围 从</td>
    <td width="30%"> 
      <input type="text" name="sjfw" size="20" maxlength="10"  value="<%=sjfw%>" readonly>
    </td>
      <td align="right" width="22%">时间范围 到</td>
      <td width="30%"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=sjfw2%>" readonly>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">录入人</td>
    <td width="30%"> 
      <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
    </td>
      <td align="right" width="22%">录入时间</td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">录入部门 </td>
    <td width="30%"> 
      <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
      </select>
    </td>
      <td width="22%" align="right"><font color="#0000CC">提成总额</font></td>
      <td width="30%"><%=tcze%>￥</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">备注</div>
    </td>
    <td colspan="3"> 
      <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>
    </td>
  </tr>
  <tr align="center"> 
    <td colspan="4"> 
      <input type="hidden" name="jsjlh" value="<%=jsjlh%>" >
      <input type="button"  value="修改备注" onClick="f_do(insertform)" >
        <input type="button"  value="完成结算" onClick="f_tlsbl(insertform)">
        <input type="reset"  value="重输" name="reset">
    </td>
  </tr>
</table>
</form>



</body>
</html>



<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveEditCw_sjsjsjl.jsp";
	FormName.submit();
	return true;
}


function f_tlsbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="EndCw_sjsjsjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
