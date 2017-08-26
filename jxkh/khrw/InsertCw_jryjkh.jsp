<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">

<div align="center">导入考核任务
</div>
<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2">
            
            <tr align="center">
              <td width="41%"  align="right"><span class="STYLE2">*</span>选择公司</td>
              <td width="59%" align="left"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
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
              </select></td>
            </tr>
            <tr align="center">
              <td height="49"   align="right">
                <span class="STYLE2">*</span>考核周期              </td>
              <td   align="left"><select name="khzq" style="FONT-SIZE:12PX;WIDTH:252PX">
                <option value=""></option>
              </select></td>
            </tr>
            <tr align="center"> 
              <td height="88"   colspan="2"> 
                    <input type="button"  value="导入考核任务" onClick="f_drgz(insertform)" name="drgz" >
                    <BR>
                    <BR> 
		       <input type="button"  value="导出模板" onClick="f_dc(insertform)" ></td>
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
function changeFgs(FormName)
{
	FormName.khzq.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}


	var sql;
	sql="select khzq c1,khzq||'('||TO_CHAR(khqssj,'YYYY-MM-DD')||'至'||TO_CHAR(khjzsj,'YYYY-MM-DD')||')' c2 from cw_jrkhzq where fgsbh='"+FormName.ssfgs.value+"' order by khzq desc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.khzq,ajaxRetStr);
}

function f_drgz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.khzq)=="") {
		alert("请选择[考核周期]！");
		FormName.khzq.focus();
		return false;
	}

	FormName.action="loadData.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.khzq)=="") {
		alert("请选择[考核周期]！");
		FormName.khzq.focus();
		return false;
	}

	FormName.action="Cw_jryjkhExpList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
