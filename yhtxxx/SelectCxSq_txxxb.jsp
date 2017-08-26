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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Sq_txxxbCxList.jsp" name="selectform">
<div align="center"> 查询提醒</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">所属公司</td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
    <td align="right">所属部门</td>
    <td>
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
					}
					else if (kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwlx,dwbh","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
					%> 
        </select>
    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">序号</td> 
  <td width="32%"> 
    <input type="text" name="sq_txxxb_xh" size="20" maxlength="16" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">员工序号</td> 
  <td width="32%"> 
    <input type="text" name="sq_txxxb_ygbh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">员工名称</td> 
  <td width="32%"> 
    <input type="text" name="sq_txxxb_yhmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">提醒方式</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "sq_txxxb_txfs","1+系统&2+电话&3+传真&4+短信&9+全部","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">提醒类型</td> 
  <td width="32%"><select name="sq_txxxb_txlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"01+咨询回访&02+在施工程回访&03+投诉报修回访&04+投诉报修","");
%>
  </select></td>
  <td align="right" width="18%">提醒关键字</td> 
  <td width="32%"><input type="text" name="sq_txxxb_txgjz" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">提醒内容</td>
  <td colspan="3"><input name="sq_txxxb_txnr" type="text" value="" size="73" maxlength="800"></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">开始提醒时间 从</td>
  <td><input type="text" name="sq_txxxb_kstxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="sq_txxxb_kstxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">提醒状态</td> 
  <td width="32%"><%
	cf.radioToken(out, "sq_txxxb_txzt","1+未提醒&2+提醒&3+处理","");
%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实际提醒时间 从</td>
  <td><input type="text" name="sq_txxxb_txsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="sq_txxxb_txsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="sq_txxxb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="sq_txxxb_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="sq_txxxb_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"><select name="sq_txxxb_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by ssfgs,dwbh","");
%>
  </select></td>
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
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwlx not in('F3','F4','F5') order by dwlx,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.sq_txxxb_xh, "序号"))) {
		return false;
	}
	if(!(isNumber(FormName.sq_txxxb_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_txxxb_kstxsj, "开始提醒时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_txxxb_kstxsj2, "开始提醒时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_txxxb_txsj, "提醒时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_txxxb_txsj2, "提醒时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_txxxb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_txxxb_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
