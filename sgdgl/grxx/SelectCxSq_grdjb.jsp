<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Sq_grdjbCxList.jsp" name="selectform">
<div align="center">查询－工人</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">分公司</td>
    <td>
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
      </select>
	
	</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right">所属队长</td> 
  <td width="32%"><select name="sq_grdjb_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeSgd(selectform)">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc||'（'||DECODE(sq_sgd.cxbz,'Y','撤销,')||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
%>
  </select></td>
  <td width="18%" align="right">所属班长</td> 
  <td width="32%"> 
    <select name="sq_grdjb_bzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">姓名</td> 
  <td width="32%"> 
    <input type="text" name="sq_grdjb_xm" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">性别</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sq_grdjb_xb","男+男&女+女","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">籍贯</td> 
  <td width="32%"> 
    <input type="text" name="sq_grdjb_jg" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">住址</td> 
  <td width="32%"><input type="text" name="sq_grdjb_zz" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">工种</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "sq_grdjb_gz","木工+木工&水电工+水电工&油漆工+油漆工&瓦工+瓦工&杂工+杂工","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">上岗证编号</td>
  <td><input name="sgzbh" type="text" id="sgzbh" value="" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">出生日期 从 </td>
  <td><input type="text" name="sq_grdjb_csrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="sq_grdjb_csrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">入职时间 从</td>
  <td><input type="text" name="sq_grdjb_rzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="sq_grdjb_rzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">等级</td> 
  <td width="32%"> 
    <input type="text" name="sq_grdjb_dj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">类型</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sq_grdjb_lx","临时+临时&长期+长期","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">身份证号</td> 
  <td width="32%"> 
    <input type="text" name="sq_grdjb_sfzh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">电话</td> 
  <td width="32%"><input type="text" name="sq_grdjb_dh" size="20" maxlength="20" ></td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

var fieldName="";

<%
	//启用Ajax
	cf.ajax(out);
%>
function changeFgs(FormName) 
{
	FormName.sq_grdjb_sgd.length=1;
	FormName.sq_grdjb_bzmc.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="fgs";

	var sql;
	sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.cxbz,'Y','撤销,')||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+FormName.fgs.value+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeSgd(FormName) 
{
	FormName.sq_grdjb_bzmc.length=1;

	if (FormName.sq_grdjb_sgd.value=="")
	{
		return;
	}

	fieldName="sgd";


	var sql;
	sql="select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+FormName.sq_grdjb_sgd.value+"' order by bzmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="fgs")
	{
		strToSelect(selectform.sq_grdjb_sgd,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.sq_grdjb_bzmc,ajaxRetStr);
	}
}



function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.sq_grdjb_csrq, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_grdjb_csrq2, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_grdjb_rzsj, "入职时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_grdjb_rzsj2, "入职时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
