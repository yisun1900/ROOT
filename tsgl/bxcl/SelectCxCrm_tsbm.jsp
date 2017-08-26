<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>投诉通知</title>
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
<form method="post" action="Crm_tsbmCxList.jsp" name="selectform">
          
        <div align="center">查询投诉</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFCC"> 
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
      <td width="18%"  align="right">投诉部门</td>
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
      <td width="18%" align="right" bgcolor="#FFFFFF">合同号</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="hth" size="20" maxlength="20">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">客户编号</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="khbh" size="20" maxlength="20">      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF">设计师</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="sjs" size="20" maxlength="20">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">质检</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="zjxm" size="20" maxlength="20">      </td>
    </tr>
    <tr>
      <td width="18%" align="right" bgcolor="#FFFFFF">施工队</td>
      <td width="32%" bgcolor="#FFFFFF">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
          <option value=""></option>
        </select>      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">施工班组</td>
      <td width="32%" bgcolor="#FFFFFF">
        <input type="text" name="sgbz" size="20" maxlength="20" >      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000CC"><b>客户姓名</b></font></td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="khxm" size="20" maxlength="50">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF">客户姓名</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"> 
        <font color="#0000CC"><b>联系方式</b></font>      </td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="lxfs" size="20" maxlength="50">      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF"> 
        联系方式     </td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        （模糊查询） </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000CC"><b>房屋地址</b></font></td>
      <td colspan="3" bgcolor="#FFFFFF"> 
        <input type="text" name="fwdz" size="71" maxlength="100">      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFFF"> 
        房屋地址 </td>
      <td colspan="3" bgcolor="#FFFFFF"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF" >&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >投诉记录号</td>
      <td ><input type="text" name="tsjlh" size="20" maxlength="10"  ></td>
      <td  align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >投诉处理状态</td>
      <td >
	  <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <option value="0">未受理</option>
        <option value="1">已受理</option>
        <option value="4">已接收</option>
        <option value="5">已出现场</option>
        <option value="6">已出方案</option>
        <option value="7">方案审核通过</option>
        <option value="2">在处理</option>
        <option value="3">结案</option>
      </select>	  </td>
      <td  align="right" bgcolor="#FFFFFF">投诉是否结案</td>
      <td >
        <input type="radio" name="sfja" value="Y">结案
        <input type="radio" name="sfja" value="N">未结案      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >责任部门处理状态</td>
      <td ><select name="zrbmclzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <option value="1">未接收</option>
        <option value="2">已接收等待出方案</option>
        <option value="4">已接收等待出现场</option>
        <option value="6">已出现场等待方案</option>
        <option value="7">已出方案等待审核</option>
        <option value="8">已出方案不需审核</option>
        <option value="9">方案审核通过</option>
        <option value="A">方案审核未通过</option>
        <option value="B">在处理</option>
        <option value="3">已解决</option>
        <option value="C">回访未解决</option>
        <option value="5">结案</option>
      </select></td>
      <td  align="right" bgcolor="#FFFFFF">责任部门是否解决</td>
      <td >
		<input type="radio" name="sfjj" value="Y">解决
        <input type="radio" name="sfjj" value="N">未解决	</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >投诉大类</td>
      <td width="32%" > 
        <select name="crm_tsbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tslxbm')" onChange="tsxlbmMark=0;crm_tsbm_tsxlbm.length=1">
          <option value=""></option>
        </select>      </td>
      <td width="18%"  align="right" bgcolor="#FFFFFF">投诉小类</td>
      <td width="32%" > 
        <select name="crm_tsbm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tsxlbm')">
          <option value=""></option>
        </select>      </td>
    </tr>
    <tr bgcolor="#999999"> 
      <td width="18%" bgcolor="#FFFFFF" align="right">投诉报修品牌</td>
      <td width="32%" bgcolor="#FFFFFF"> 
        <input type="text" name="crm_tsbm_tspp" size="20" maxlength="50" >      </td>
      <td width="18%" bgcolor="#FFFFFF" align="right">投诉报修品牌</td>
      <td width="32%" bgcolor="#FFFFFF"> 
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
    
    <tr bgcolor="#FFFFFF">
      <td align="right" >接收时间 从</td>
      <td><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >计划出现场时间 从</td>
      <td><input type="text" name="jhcxcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="jhcxcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >实际出现场时间 从</td>
      <td><input type="text" name="sjcxcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="sjcxcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >计划出方案时间 从</td>
      <td><input type="text" name="jhcfasj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="jhcfasj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >实际出方案时间 从</td>
      <td><input type="text" name="sjcfasj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="sjcfasj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >方案审核时间 从</td>
      <td><input type="text" name="shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >计划解决时间 从</td>
      <td><input type="text" name="jhjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="jhjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >最新处理时间 从</td>
      <td><input type="text" name="clsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="clsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >实际解决时间 从</td>
      <td><input type="text" name="sjjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td  align="right">到</td>
      <td><input type="text" name="sjjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" >确认解决时间 从</td>
      <td><input type="text" name="qrjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td  align="right">到</td>
      <td><input type="text" name="qrjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
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
				alert("请选择【投诉报修大类】");
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
	if(!(isDatetime(FormName.sjcfasj, "出方案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjcfasj2, "出方案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "计划解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj2, "计划解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.clsj, "处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.clsj2, "处理时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
