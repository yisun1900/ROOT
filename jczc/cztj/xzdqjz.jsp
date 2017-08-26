<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=cf.fillNull(request.getParameter("ssdqbm"));
String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String jzbz=request.getParameter("jzbz");
String tjsj=request.getParameter("tjsj");
String sfjms=request.getParameter("sfjms");

String wheresql="";
String wheresql1="";


if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

if (tjsj.equals("1"))
{
	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("2"))
{
	wheresql+=" and jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("3"))
{
	wheresql+=" and cwjzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and cwjzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("4"))
{
	wheresql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}



%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>大区家装统计(<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>



<form method="post" action="" name="selectform" target="_blank">
        <input type="hidden" name="wheresql" value="<%=wheresql%>" >
        <input type="hidden" name="wheresql1" value="<%=wheresql1%>" >
        <input type="hidden" name="ssdqbm" value="<%=ssdqbm%>" >
        <input type="hidden" name="sjfw" value="<%=sjfw%>" >
        <input type="hidden" name="sjfw2" value="<%=sjfw2%>" >
        <input type="hidden" name="jzbz" value="<%=jzbz%>" >
        <input type="hidden" name="sfjms" value="<%=sfjms%>" >

<CENTER>
  <p>
    <%
if (dwbh.equals(""))
{
	if ( fgs.equals(""))
	{

		%>
	<P>
	  <input type="button"  value="大区产值-表格" onClick="f_dq(selectform,'bg')">
	  </p>
		<P>
		  <input type="button"  value="大区产值-饼图" onClick="f_dq(selectform,'bt')">
	</p>
		<P>
		  <input type="button"  value="大区产值-柱状图" onClick="f_dq(selectform,'zzt')">
		  <%
	}
}	
%>
	          </p>
</CENTER>

</form>



</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_dq(FormName,lx)//参数FormName:Form的名称
{
	if (lx=="bg")
	{
		FormName.action="dqcztjb.jsp";
	}
	else if (lx=="bt")
	{
		FormName.action="ViewDqczBt.jsp";
	}
	else if (lx=="zzt")
	{
		FormName.action="ViewDqczZzt.jsp";
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
