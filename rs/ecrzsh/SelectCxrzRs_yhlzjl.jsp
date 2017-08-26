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
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	String ssfgs=(String)session.getAttribute("ssfgs");

	//检查是否做期末结转
	//返回： -1:出错;0:当月已结转；1:上月已结转，当月未结转;2:上月未结转 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("上月没有进行『结转』！");
		return;
	}
	else if (count==-1)
	{
		out.println("出错！");
		return;
	}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_yhlzjlCxrzList.jsp" name="selectform">
  <div align="center">
  离职员工重新入职
  <P>
    <table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td width="42%" align="right" height="40"><font color="#CC0000">*</font>申请二次入职公司</td>
        <td width="58%" height="40">
          <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (kfgssq.equals("2"))//2：授权多个分公司
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
          </select>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="42%" align="right" height="40">员工名称</td>
        <td width="58%" height="40"> 
          <input type="text" name="yhmc" size="20" maxlength="50" >
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="42%" align="right" height="46">身份证号 </td>
        <td width="58%" height="46"> 
          <input type="text" name="sfzh" size="20" maxlength="20" >
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center" height="49"> 
          <input type="button"  value="查询" onClick="f_do(selectform)">
          <input type="reset"  value="重输">
        </td>
      </tr>
    </table>
  
  </div>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属公司]！");
		FormName.fgsbh.focus();
		return false;
	}

	if(FormName.yhmc.value==""  && FormName.sfzh.value=="") 
	{
		alert("请输入[员工名称]或[身份证号]！");
		FormName.sfzh.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
