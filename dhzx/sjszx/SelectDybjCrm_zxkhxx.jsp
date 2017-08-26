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
String kfgssq=(String)session.getAttribute("kfgssq");

String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ysy=yhmc;
if (!zwbm.equals("20"))
{
	ysy="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">打印报价</div>
	      <tr> 
      <td colspan="2" height="74"> 
        <div align="center">------------------------------------------------------------------------------</div>
        <div align="center">* 请先填写查询条件，以便查询到相关客户 *</div>
      </td>
	</tr>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_zxkhxxDybjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">所属公司</td>
              <td width="30%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
              <td width="17%" align="right">咨询店面</td>
              <td width="33%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">设计师</td>
              <td width="30%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>>
              </td>
              <td width="17%" align="right">预算员</td>
              <td width="33%"> 
                <input name="ysy" type="text" value="<%=ysy%>" size="20" maxlength="20" <% if (!ysy.equals("")) out.println("readonly");%>>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">客户姓名</font></b></td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">联系方式</font></b></td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="50" >
              </td>
              <td width="17%" align="right">联系方式</td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lxfs2" size="10" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">房屋地址</font></b></td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right">房屋地址</td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_fwdz2" size="10" maxlength="100" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >
              </td>
              <td width="17%" align="right">信息录入人</td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户资料录入时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

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
	strToSelect(selectform.zxdm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
