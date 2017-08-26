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
	String yhmc=(String)session.getAttribute("yhmc");
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面


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
<form method="post" action="" name="insertform" target="_blank">
  <div align="center"> <b>入职</b> <BR>
	<BR>
    <table width="50%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
    <td width="100%" height="83" >所属公司 
      <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	
	
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
            
  <tr bgcolor="#FFFFFF" align="center"> 
        <td width="100%" height="113" > 
          <p>
          <input type="button" value="新员工入职" onClick="f_do(insertform,'xrz')">
        </p>
        <p>
          <input type="button" value="离职员工重新入职" onClick="f_do(insertform,'cxrz')">
        </p>
        <p>
          <input type="button" value="导入员工信息" onClick="f_do(insertform,'dr')">
        </p>
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
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if (lx=="xrz")
	{
		FormName.target="_blank";
		FormName.action="InsertSq_yhxx.jsp";
	}
	else if (lx=="dr")
	{
		FormName.target="_blank";
		FormName.action="ImpAddData.jsp";
	}
	else{
		FormName.target="";
		FormName.action="/rs/cxrz/SelectCxRs_ecrzsqd.jsp";
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>

