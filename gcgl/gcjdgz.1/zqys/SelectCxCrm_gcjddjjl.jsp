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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	String zdyhbz=(String)session.getAttribute("zdyhbz");
	String yhdlm=(String)session.getAttribute("yhdlm");
	String yhmc=cf.executeQuery("select yhmc from sq_yhxx where zwbm='05' and yhdlm='"+yhdlm+"' ");
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">中期验收－－查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_gcjddjjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                分公司              </td>
              <td width="32%"> 
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
				</select>			  
			  </td>
              <td width="18%" align="right"> 
                签约店面              </td>
              <td width="32%"> 
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
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">客户编号</td>
              <td width="32%"> 
                <input type="text" name="crm_gcjddjjl_khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"> 
              <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                签约日期              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"> 
                设计师              </td>
              <td width="32%"> 
              <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">工程担当</td>
              <td width="32%"> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='05' order by yhmc","");
	}
	else
	{
		if (zdyhbz.equals("Y") || yhmc==null)
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc","");
		}
		else{
			cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc",yhmc,false);
		}
	}
%> 
                </select>              </td>
              <td width="18%" align="right">施工队</td>
              <td width="32%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
              （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#0000CC"><b>联系方式</b></font>              </td>
              <td width="32%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="18%" align="right"> 
                联系方式              </td>
              <td width="32%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
              （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                房屋地址              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                登记记录号              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcjddjjl_djjlh" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"> 
                工程进度              </td>
              <td width="32%"> 
                <select name="crm_gcjddjjl_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm where gcjdbm='3' order by gcjdbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">中期验收时间 从</td>
              <td width="32%"> 
                <input type="text" name="crm_gcjddjjl_djsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
              <input type="text" name="crm_gcjddjjl_djsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                录入时间 从              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcjddjjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                到              </td>
              <td width="32%"> 
              <input type="text" name="crm_gcjddjjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                录入人              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcjddjjl_lrr" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
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
	if(!(isDatetime(FormName.crm_gcjddjjl_djsj, "中期验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcjddjjl_djsj2, "中期验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcjddjjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcjddjjl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
