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

	String sql=null;
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">查询随机回访记录</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_hfjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)" >
                <input type="reset"  value="重输">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"> 
                分公司              </td>
              <td width="30%"> 
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
              <td width="19%" align="right"> 
                签约店面              </td>
              <td width="31%">
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
              <td width="20%" align="right"> 
                回访时间 从              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                回访记录号              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfjlh" size="20" maxlength="9" >              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                客户编号              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_khbh" size="20" maxlength="20" >              </td>
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                房屋地址              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="19%" align="right"> 
                联系方式              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">设计师</td>
              <td width="30%">
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">工程担当</td>
              <td width="31%">
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right">施工队</td>
              <td width="30%">
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
%> 
                </select>              </td>
              <td width="19%" align="right">回访结果</td>
              <td width="31%">
                <select name="jglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jglxbm,jglxmc from dm_jglxbm order by jglxbm","");
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">回访人 </td>
              <td width="30%"><input type="text" name="crm_hfjl_hfr" size="20" maxlength="20" ></td>
              <td width="19%" align="right"> 
                回访部门              </td>
              <td width="31%">
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1') and ssdw='"+ssfgs+"'";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";

		out.println("<option value=\"\"></option>");
		cf.selectItem(out,sql,"");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                处理方式              </td>
              <td width="30%"> 
                <select name="crm_hfjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+不需处理&1+反馈相关部门","");
%> 
                </select>              </td>
              <td width="19%" align="right"> 
                反馈部门              </td>
              <td width="31%"> 
                <select name="crm_hfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	out.println("<option value=\"\"></option>");
	sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and ssdw='"+ssfgs+"' ";
	sql+=" union ";
	sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	cf.selectItem(out,sql,"");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">处理状态</td>
              <td width="30%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="Y">相关部门已处理</option>
                  <option value="N">相关部门未处理</option>
                </select>              </td>
              <td width="19%" align="right">项目专员</td>
              <td width="31%">
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)" >
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

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_hfjl_hfsj, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj2, "回访时间"))) {
		return false;
	}
	FormName.action="Crm_hfjlCxList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
