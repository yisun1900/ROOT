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

<body bgcolor="#FFFFFF" onLoad="selectform.hth.focus();">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">查询档案明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_gcdaCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
               分公司              </td>
              <td width="33%"> 
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
                </select>              </td>
              <td width="17%" align="right"> 
               签约店面              </td>
              <td width="34%"> 
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
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">合同号</td>
              <td width="33%"> 
                <input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">              </td>
              <td width="17%" align="right">客户编号</td>
              <td width="34%"> 
                <input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
               客户姓名              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">              </td>
              <td width="17%" align="right"> 
               联系方式              </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">档案明细</td>
              <td width="33%"> 
                <select name="damxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select damxbm,damxmc from dm_damxbm order by damxbm","");
%> 
                </select>              </td>
              <td width="17%" align="right">档案数量</td>
              <td width="34%"> 
                <input type="text" name="sl" size="20" maxlength="20" onKeyUp="keyGo(bgr)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">保管部门</td>
              <td width="33%">
			  <select name="bgrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
				if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
				{
					out.println("<option value=\"\"></option>");
				}
				else if (kfgssq.equals("1") )
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
				}
				else if (kfgssq.equals("3"))
				{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') ","");
				}
				else if (kfgssq.equals("4"))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
				}
				else{
					out.println("错误！未进行客户资料授权，请联系系统管理员");
					return;
				}
%>
              </select></td>
              <td width="17%" align="right">保管人</td>
              <td width="34%"><input name="bgr" type="text" id="bgr" onKeyUp="keyGo(lrr)" size="20" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入人</td>
              <td width="33%"><input name="lrr" type="text" id="lrr"  onKeyUp="keyGo(lrsj)" size="20" maxlength="50"></td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="34%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
               录入时间&nbsp;从              </td>
              <td width="33%"> 
                <input name="lrsj" type="text" id="lrsj" onKeyUp="keyGo(lrsj2)" size="20" maxlength="50">              </td>
              <td width="17%" align="right"> 
               到              </td>
              <td width="34%"> 
                <input name="lrsj2" type="text" id="lrsj2"  onKeyUp="keyGo(khbh)" size="20" maxlength="50">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">客户归档标志</td>
              <td colspan="3"><input type="radio" name="dalqbz" value="1">
                未建档案
                  <input type="radio" name="dalqbz" value="2">
                  已建档案
                  <input type="radio" name="dalqbz" value="3">
                  已归档
                  <input type="radio" name="dalqbz" value="4">
              借出 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">档案袋编号</td>
              <td><input name="dadbh" type="text" value="" size="20" maxlength="20"></td>
              <td align="right">档案借出标志</td>
              <td><input type="radio" name="gdbz" value="Y">
已归档
  <input type="radio" name="gdbz" value="N">
借出</td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="继续" onClick="f_do(selectform)">
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

var lx="";
function changeFgs(FormName) 
{
	FormName.dwbh.length=1;
	FormName.bgrdw.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	lx="1";

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

function getBgrdw(FormName) 
{
	FormName.bgrdw.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
		getBgrdw(selectform);
	}
	else
	{
		strToSelect(selectform.bgrdw,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{

	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
