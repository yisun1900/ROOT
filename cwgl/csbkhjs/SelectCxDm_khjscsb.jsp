<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_khjscsbCxList.jsp" name="selectform"  onChange="changeFgs(selectform)">
<div align="center">客户结算参数表－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
  <td align="right" width="18%">允许结算调折扣</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sftzk","1+是&3+否","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有返券</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyfq","1+手工录入&2+自动获取&3+无","");
%>
  </td>
  <td align="right" width="18%">是否有订金折现</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydjfx","1+手工录入&2+自动获取&3+无","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有抵用券</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydyq","1+手工录入&2+自动获取&3+无","");
%>
  </td>
  <td align="right" width="18%">是否有代销品主材</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydxpzc","1+手工录入&2+自动获取&3+无","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有代购主材</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydgzc","1+手工录入&2+自动获取&3+无","");
%>
  </td>
  <td align="right" width="18%">是否有主材返款</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyzcfk","1+手工录入&2+自动获取&3+无","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有客户赔偿款</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfykhpc","1+手工录入&2+自动获取&3+无","");
%>
  </td>
  <td align="right" width="18%">是否有结算工程优惠</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyjsgcyh","1+手工录入&2+自动获取&3+无","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有延期费</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyyqf","1+手工录入&2+自动获取&3+无","");
%>
  </td>
  <td align="right" width="18%">其它收费项目1</td> 
  <td width="32%"> 
    <select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">其它收费项目2</td> 
  <td width="32%"> 
    <select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
    </select>
  </td>
  <td align="right" width="18%">其它收费项目3</td> 
  <td width="32%"> 
    <select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有其它项1</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx1","1+是&3+否","");
%>
  </td>
  <td align="right" width="18%">其它项1名称</td> 
  <td width="32%"> 
    <input type="text" name="qtx1mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有其它项2</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx2","1+是&3+否","");
%>
  </td>
  <td align="right" width="18%">其它项2名称</td> 
  <td width="32%"> 
    <input type="text" name="qtx2mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有其它项3</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx3","1+是&3+否","");
%>
  </td>
  <td align="right" width="18%">其它项3名称</td> 
  <td width="32%"> 
    <input type="text" name="qtx3mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否需审批</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsp","1+是&3+否","");
%>
  </td>
  <td align="right" width="18%">是否需结算授权</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsq","1+是&3+否","");
%>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.sfxmbm1.length=1;
	FormName.sfxmbm2.length=1;
	FormName.sfxmbm3.length=1;

	if (FormName.fgsbh.value=="")
	{
		return;
	}

	var sql;
	sql="select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm in(select dqbm from sq_dwxx where dwbh='"+FormName.fgsbh.value+"') order by sfxmmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.sfxmbm1,ajaxRetStr);
	strToSelect(selectform.sfxmbm2,ajaxRetStr);
	strToSelect(selectform.sfxmbm3,ajaxRetStr);
}
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
