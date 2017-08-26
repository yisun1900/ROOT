<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>各部门投诉汇总表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0">
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">精益工程统计</div>      </td>
    </tr>
    <tr> 
      <td align="right" width="18%" height="39">分公司</td>
      <td width="32%" height="39"> 
		<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
		</select>	</td>
      <td width="18%" align="right">签单店面</td>
      <td width="32%">
	  <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(selectform)">
        <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>
      </select></td>
    </tr>
    <tr>
      <td align="right" height="39">设计师</td>
      <td height="39">
	  <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
      </select>	  </td>
      <td height="39" align="right">施工组长</td>
      <td height="39">
	  <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
      </select>	  </td>
    </tr>
    <tr> 
      <td align="right" width="18%" height="39">被处罚人部门</td>
      <td width="32%" height="39">
	  <select name="zrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZrbm(selectform)">
        <option value=""></option>
        <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%>
      </select>	  </td>
      <td width="18%" height="39" align="right">被处罚人</td>
      <td width="32%" height="39">
	  <select name="zrr" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
      </select>	  </td>
    </tr>
    <tr>
      <td align="right" height="39">录入部门</td>
      <td height="39"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeLrbm(selectform)">
          <option value=""></option>
          <%
	sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%>
        </select>
      </td>
      <td height="39" align="right">录入人</td>
      <td height="39">
	  <select name="lrr" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="18%" height="39">统计时间 从</td>
      <td width="32%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="<%=cf.yearStart()%>">      </td>
      <td width="18%" height="39" align="right">到</td>
      <td width="32%" height="39"><input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>"></td>
    </tr>
    <tr> 
      <td align="right" width="18%" height="40">问题来源</td>
      <td height="40" colspan="3">
	  <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select xxlybm,xxlymc from gdm_xxlybm order by xxlybm","");
%>
      </select></td>
    </tr>
    
    <tr> 
      <td align="right" width="18%" height="37">显示风格</td>
      <td height="37" colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="button"  value="统计" onClick="f_hz(selectform,'hz')"></td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	czlx=1;

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx='F2' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx='F2' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getZrbm(FormName)
{
	FormName.zrbm.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	czlx=2;

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getSgd(FormName)
{
	FormName.sgd.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	czlx=3;

	var sql;
	sql="select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by sgdmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	if (FormName.dwbh.value=='')
	{
		return;
	}

	FormName.sjs.length=1;

	czlx=4;

	var sql="select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+FormName.dwbh.value+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc" ;
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}

function changeZrbm(FormName)
{
	if (FormName.zrbm.value=='')
	{
		return;
	}

	FormName.zrr.length=1;

	czlx=5;

	var sql="select yhmc,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.zrbm.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}

function getLrbm(FormName)
{
	FormName.lrbm.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	czlx=6;

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeLrbm(FormName)
{
	if (FormName.lrbm.value=='')
	{
		return;
	}

	FormName.lrr.length=1;

	czlx=7;

	var sql="select yhmc,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.lrbm.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
		getZrbm(selectform);
	}
	else if (czlx==2)
	{
		strToSelect(selectform.zrbm,ajaxRetStr);
		getSgd(selectform);
	}
	else if (czlx==3)
	{
		strToSelect(selectform.sgd,ajaxRetStr);
		getLrbm(selectform);
	}
	else if (czlx==4)
	{
		strToSelect(selectform.sjs,ajaxRetStr);
	}
	else if (czlx==5)
	{
		strToSelect(selectform.zrr,ajaxRetStr);
	}
	else if (czlx==6)
	{
		strToSelect(selectform.lrbm,ajaxRetStr);
	}
	else if (czlx==7)
	{
		strToSelect(selectform.lrr,ajaxRetStr);
	}
}

function f_hz(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围 "))) {
		return false;
	}

	FormName.action="JygcTj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
