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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");

	
	String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
%>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">家装报价明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxJyList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC">
              <td align="right"> 分公司 </td>
              <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
              <td align="right"> 签约店面 </td>
              <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
              <td align="right">签约日期 从</td>
              <td><input type="text" name="qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
              <td align="right">到</td>
              <td><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">合同号</td>
              <td><input type="text" name="hth" size="20" maxlength="20">              </td>
              <td align="right">客户编号</td>
              <td><input type="text" name="khbh" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">设计师</td>
              <td><input type="text" name="sjs" size="20" maxlength="20">              </td>
              <td align="right">质检</td>
              <td><input type="text" name="zjxm" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td><input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td align="right">客户姓名</td>
              <td><input type="text" name="khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>联系方式</b></font> </td>
              <td><input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td align="right"> 联系方式 </td>
              <td><input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 房屋地址 </td>
              <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                项目大类              </td>
              <td width="32%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
              </select>              </td>
              <td width="18%" align="right"> 
                项目小类              </td>
              <td width="32%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                项目编号              </td>
              <td width="32%"> 
              <input type="text" name="xmbh" size="20" maxlength="16" >              </td>
              <td align="right">报价级别</td>
              <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm  order by bjjbbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">项目名称</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                结构位置              </td>
              <td width="32%"> 
                <select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgwzbm,jgwzmc from bdm_jgwzbm order by jgwzbm","");
%> 
              </select>              </td>
              <td width="18%" align="right">报价类型</td>
              <td width="32%">
                <input type="radio" name="bjlx" value="1">标准项目
                <input type="radio" name="bjlx" value="2">自定义项目
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;每页显示数量
                <input type="text" name="myxssl" size="7" maxlength="13" value="30"></td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="报价项目统计" onClick="f_do(selectform,'tj')">
                <input type="button" onClick="f_do(selectform,'mx')"  value="报价项目明细">
                <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
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

function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}


	if (lx=='tj')
	{
		FormName.action="BjxmTjList.jsp";
	}
	else{
		FormName.action="BjxmList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
