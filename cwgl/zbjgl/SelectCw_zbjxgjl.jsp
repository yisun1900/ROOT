<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


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
<form method="post" action="Cw_zbjxgjlList.jsp" name="selectform">
<div align="center">修改质保金修改记录</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">所属分公司</td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      </select>    </td>
    <td align="right">撤销标志</td>
    <td><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <option value="N">未撤销</option>
        <option value="Y">已撤销</option>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><div align="right">
      施工队编号 </td>
    <td><input type="text" name="sq_sgd_sgd" size="20" maxlength="5" >    </td>
    <td align="right"><div align="right">
      施工队名称 </td>
    <td><input type="text" name="sq_sgd_sgdmc" size="20" maxlength="100" >    </td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">质保金减少原因</td> 
  <td width="32%"> 
    <select name="cw_zbjxgjl_zbjjsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zbjjsyybm,zbjjsyymc from dm_zbjjsyybm order by zbjjsyybm","");
%>
    </select>  </td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="cw_zbjxgjl_lrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从 </td> 
  <td width="32%"><input type="text" name="cw_zbjxgjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="cw_zbjxgjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算记录号</td>
  <td><input type="text" name="jsjlh" size="20" maxlength="9" ></td>
  <td align="right">投诉报修记录号</td>
  <td><input type="text" name="tsjlh" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">删除标志</td>
  <td><label>
    <input name="scbz" type="radio" value="N" checked>
    未删除
  </label></td>
  <td align="right">类型</td>
  <td><input type="radio" name="lx" value="1" checked>手工录入
	</td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cw_zbjxgjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zbjxgjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
