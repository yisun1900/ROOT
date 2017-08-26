<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 合同号申请</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="InsertCrm_hthxx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" height="85">所属分公司 </td>
              <td height="85"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
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
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="50%" align="right" height="85">签单店面</td>
              <td width="50%" height="85"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>              </td>
            </tr>
            <tr> 
              <td colspan="2" align="center"> 
                <input type="button"  value="继续" onClick="f_do(insertform)">              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
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
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[选择签单部门]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
