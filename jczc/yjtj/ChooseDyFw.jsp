<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>



<%
String dwbh=(String)session.getAttribute("dwbh");
String jzbm=(String)session.getAttribute("jzbm");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面


%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">当月业绩统计</div>
      </td>
    </tr>
    <tr>
      <td align="right" height="42">公司类型</td>
      <td height="42" colspan="3"><input type="radio" name="sfjms" value="N" checked>
        直营公司
          <input type="radio" name="sfjms" value="Y">
          加盟公司
          <input type="radio" name="sfjms" value="Q">
      其它公司 </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">大区</td>
      <td height="42" colspan="3" width="70%"> 
        <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDq(this)">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">分公司</td>
      <td height="42" colspan="3" width="70%"> 
		<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
		</select>			  
</td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="44">签约店面</td>
      <td height="44" colspan="3" width="70%"> 
		<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
		  <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%> 
		</select>              
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46"><font color="#FF0000">*</font>业绩范围</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="jzbz" value="0" checked>
        全部 
        <input type="radio" name="jzbz" value="1">
        家装 
        <input type="radio" name="jzbz" value="2">
        公装 </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46">显示风格</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="button"  value="业绩统计" onClick="f_do(selectform,'jz')" name="jzcz">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

var lx;
function changeDq(fromID) 
{
	lx=1;
	selectform.fgs.length=1;
	selectform.dwbh.length=1;


	var sql;
	if ("<%=kfgssq%>"=="2")//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and ssdqbm='"+fromID.value+"' and dwbh in(select ssfgs from sq_sqfgs where ygbh='<%=ygbh%>') order by dwbh";
	}
	else if ("<%=kfgssq%>"=="5")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and ssdqbm='"+fromID.value+"' and dwbh in(select ssfgs from sq_sqbm where ygbh='<%=ygbh%>') order by dwbh";
	}
	else if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="3" || "<%=kfgssq%>"=="4")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and ssdqbm='"+fromID.value+"' and dwbh='<%=ssfgs%>'";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function changeFgs(FormName) 
{
	lx=2;
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx==1)
	{
		strToSelect(selectform.fgs,ajaxRetStr);
	}
	else if (lx==2)
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
}

function f_do(FormName,lx)//参数FormName:Form的名称
{

	FormName.action="dyyjtjb.jsp";
	FormName.target="";
	FormName.submit();
	FormName.jzcz.disabled=true;
	return true;
}


//-->
</SCRIPT>
