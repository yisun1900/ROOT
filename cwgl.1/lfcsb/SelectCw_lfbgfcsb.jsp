<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_lfbgfcsbList.jsp" name="selectform">
<div align="center">拨工费参数表－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="cw_lfbgfcsb_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select>  </td>
  <td align="right" width="18%">拨付次数</td> 
  <td width="32%"> 
    <input type="text" name="cw_lfbgfcsb_bfcs" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">拨付基数</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "cw_lfbgfcsb_bfjs","1+折前工程费&2+折后工程费&9+由打折力度决定折前折后","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">打折力度</td> 
  <td width="32%"> 
    <input type="text" name="cw_lfbgfcsb_dzld" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">拨付比例  </td>
  <td width="32%"><input type="text" name="cw_lfbgfcsb_bfbl" size="20" maxlength="9" ></td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.cw_lfbgfcsb_bfcs, "拨付次数"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_lfbgfcsb_bfbl, "拨付比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_lfbgfcsb_dzld, "打折力度"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
