<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>报修通知</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>


<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbmCxcList.jsp" name="selectform">
          
        <div align="center">报修处理－出现场</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right" >责任部门处理状态</td>
      <td colspan="3" >
		<input type="radio" name="clzt" value="4" checked>已接收等待出现场
	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >分公司</td>
      <td width="32%" >
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
		</select>	  </td>
      <td width="18%"  align="right">报修部门</td>
      <td width="32%" > 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <%
			if (yhjs.equals("A0"))
			{
				out.println("<option value=\"\"></option>");
			}
			else if (yhjs.equals("F0"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
			}
			%> 
        </select>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC">合同号</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="hth" size="20" maxlength="20">      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">客户编号</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="khbh" size="20" maxlength="20">      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC">设计师</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="sjs" size="20" maxlength="20">      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">质检</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="zjxm" size="20" maxlength="20">      </td>
    </tr>
    <tr>
      <td width="18%" align="right" bgcolor="#FFFFCC">施工队</td>
      <td width="32%" bgcolor="#FFFFCC">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
          <option value=""></option>
        </select>      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">施工班组</td>
      <td width="32%" bgcolor="#FFFFCC">
        <input type="text" name="sgbz" size="20" maxlength="20" >      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>客户姓名</b></font></td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="khxm" size="20" maxlength="50">      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">客户姓名</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right"><font color="#0000CC"><b>联系方式</b></font></div>      </td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="lxfs" size="20" maxlength="50">      </td>
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right">联系方式</div>      </td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        （模糊查询） </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>房屋地址</b></font></td>
      <td colspan="3" bgcolor="#FFFFCC"> 
        <input type="text" name="fwdz" size="71" maxlength="100">      </td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right">房屋地址</div>      </td>
      <td colspan="3" bgcolor="#FFFFCC"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >报修大类</td>
      <td width="32%" > 
        <select name="crm_tsbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tslxbm')" onChange="tsxlbmMark=0;crm_tsbm_tsxlbm.length=1">
          <option value=""></option>
        </select>      </td>
      <td width="18%"  align="right">报修小类</td>
      <td width="32%" > 
        <select name="crm_tsbm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tsxlbm')">
          <option value=""></option>
        </select>      </td>
    </tr>
    <tr bgcolor="#999999"> 
      <td width="18%" bgcolor="#E8E8FF" align="right"><b><font color="#0000CC">报修报修品牌</font></b></td>
      <td width="32%" bgcolor="#E8E8FF"> 
        <input type="text" name="crm_tsbm_tspp" size="20" maxlength="50" >      </td>
      <td width="18%" bgcolor="#E8E8FF" align="right">报修报修品牌</td>
      <td width="32%" bgcolor="#E8E8FF"> 
        <input type="text" name="crm_tsbm_tspp2" size="14" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >客服受理时间 从</td>
      <td  width="32%"> 
        <input type="text" name="slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right" width="18%">到</td>
      <td  width="32%"> 
        <input type="text" name="slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >录入时间 从</td>
      <td  width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right" width="18%">到</td>
      <td  width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button" value="继续" onClick="f_do(selectform)">
        <input type="reset" value="重输">      </td>
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

var sgdMark=0;
var tslxbmMark=0;
var tsxlbmMark=0;

var fieldName="";

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="fgs";

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

function getThis(lx)
{
	var sql;
	fieldName=lx;

	if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属')||'）'||DECODE(sq_sgd.cxbz,'N','','Y','（撤销）') from sq_sgd where ssfgs='"+selectform.fgs.value+"' order by ssfgs,cxbz,sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}
	else if (lx=="tslxbm")
	{
		if (tslxbmMark==0)
		{
			var sql="select tslxbm,tslxmc from dm_tslxbm where tsdl='2' order by tslxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			tslxbmMark=1;
		}
	}
	else if (lx=="tsxlbm")
	{
		if (tsxlbmMark==0)
		{
			if (selectform.crm_tsbm_tslxbm.value=="")
			{
				selectform.crm_tsbm_tslxbm.focus();
				alert("请选择【报修报修大类】");
				return;
			}

			sql="select tsxlbm,tsxlmc from dm_tsxlbm where tslxbm='"+selectform.crm_tsbm_tslxbm.value+"'  order by tsxlbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			tsxlbmMark=1;
		}
		else{
			tsxlbmMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (fieldName=="fgs")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.sgd,ajaxRetStr);
	}
	else if (fieldName=="tslxbm")
	{
		strToSelect(selectform.crm_tsbm_tslxbm,ajaxRetStr);
	}
	else if (fieldName=="tsxlbm")
	{
		strToSelect(selectform.crm_tsbm_tsxlbm,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.slsj, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.slsj2, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
