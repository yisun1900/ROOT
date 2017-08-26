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
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">人工派单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right"> 
                分公司              </td>
              <td width="29%"> 
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
				</select>			  </td>
              <td width="19%" align="right"> 
                签约店面              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                客户编号              </td>
              <td width="29%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >              </td>
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">房屋地址 </td>
              <td width="29%"><input type="text" name="fwdz" size="20" maxlength="100" ></td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                联系方式              </td>
              <td width="29%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >              </td>
              <td width="19%" align="right"> 
                合同号              </td>
              <td width="31%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                签约日期 从              </td>
              <td width="29%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" >              </td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="31%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                应开工日期 从              </td>
              <td width="29%"> 
                <input type="text" name="kgrq" size="20" maxlength="10" >              </td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="31%"> 
                <input type="text" name="kgrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">建议交底日期 从</td>
              <td width="29%"> 
                <input type="text" name="jyjdrq" size="20" maxlength="10" >              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jyjdrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                回单标志              </td>
              <td width="29%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">非回单</option>
                  <option value="3">施工队回单</option>
                  <option value="2">设计师回单</option>
                  <option value="4">老客户回单</option>
                  <option value="5">员工回单</option>
                  <option value="6">班长回单</option>
                  <option value="7">售楼处</option>
                  <option value="8">材料商</option>
                  <option value="9">其他</option>
                </select>              </td>
              <td width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right" bgcolor="#FFFFCC">录入时间 从</td>
              <td width="29%" bgcolor="#FFFFCC"> 
                <input type="text" name="lrsj" size="20" maxlength="10" value="">              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">合同审核标志</td>
              <td width="29%"> 
                <select name="htshbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="P">可派单</option>
                </select>              </td>
              <td width="19%" align="right">超折扣审核标志</td>
              <td width="31%"> 
                <select name="czkbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未超折扣</option>
                  <option value="1">超折扣未审核</option>
                  <option value="2">超折扣已审核</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="派单" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq2, "建议交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq2, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	FormName.action="Crm_khxxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
