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
String dwbh=(String)session.getAttribute("dwbh");
String sjsbh=(String)session.getAttribute("sjsbh");
String ygbh=(String)session.getAttribute("ygbh");
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");
String sjs=yhmc;
if (!zwbm.equals("04"))//家装设计师
{
	sjs="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">设置定期回访周期</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_zxkhxxSzDqList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                客户所属分公司              </td>
              <td width="32%"> 
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
                </select>              </td>
              <td width="18%" align="right"> 
                咨询店面              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="18%" align="right"> 
                客户编号              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >              </td>
              <td width="18%" align="right">信息录入人</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                客户资料录入时间 从              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                到              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">客户姓名</font></b></td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >              </td>
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">联系方式</font></b></td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="50" >              </td>
              <td width="18%" align="right">联系方式</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lxfs2" size="10" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">房屋地址</font></b></td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_fwdz2" size="10" maxlength="100" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">业务员部门</td>
              <td bgcolor="#FFFFCC"><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				//19：业务员；24：市场部组长；25：市场部经理；26：市场部总监
				if (zwbm.equals("19") || zwbm.equals("24") || zwbm.equals("25"))
				{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
				}
				else{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='07' and ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");//07：市场部
				}
		%>
              </select></td>
              <td align="right" bgcolor="#FFFFCC">业务员所属小组</td>
              <td bgcolor="#FFFFCC"><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
				//19：业务员；24：市场部组长；25：市场部经理；26：市场部总监
				if (zwbm.equals("19"))
				{
					out.println("<option value=\"\"></option>");
				}
				else if (zwbm.equals("24"))
				{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"' order by dwbh",sjsbh);
				}
				else if (zwbm.equals("25"))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and ssdw='"+dwbh+"' and dwlx='F4' and cxbz='N' order by dwbh","");
				}
				else{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx='F4' and cxbz='N' order by dwbh","");
				}
		%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">业务员</td>
              <td bgcolor="#FFFFCC"><select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
				//19：业务员；24：市场部组长；25：市场部经理；26：市场部总监
				if (zwbm.equals("19"))
				{
					out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
				}
				else if (zwbm.equals("24"))
				{
					out.println("<option value=\"\"></option>");
					String ywysql="";
					ywysql =" select yhmc c1,yhmc c2";
					ywysql+=" from sq_yhxx ";
					ywysql+=" where dwbh='"+dwbh+"' and sjsbh='"+sjsbh+"'";
					ywysql+=" and sq_yhxx.zwbm in('19','24','25','26') and sq_yhxx.sfzszg in('Y','N') ";
					ywysql+=" ORDER BY yhmc";

					cf.selectItem(out,ywysql,"");
				}
				else if (zwbm.equals("25"))
				{
					out.println("<option value=\"\"></option>");
					String ywysql="";
					ywysql =" select yhmc c1,yhmc c2";
					ywysql+=" from sq_yhxx ";
					ywysql+=" where dwbh='"+dwbh+"'";
					ywysql+=" and sq_yhxx.zwbm in('19','24','25','26') and sq_yhxx.sfzszg in('Y','N') ";
					ywysql+=" ORDER BY yhmc";

					cf.selectItem(out,ywysql,"");
				}
				else{
					out.println("<option value=\"\"></option>");
					String ywysql="";
					ywysql =" select yhmc c1,yhmc c2";
					ywysql+=" from sq_yhxx ";
					ywysql+=" where ssfgs='"+ssfgs+"'";
					ywysql+=" and sq_yhxx.zwbm in('19','24','25','26') and sq_yhxx.sfzszg in('Y','N') ";
					ywysql+=" ORDER BY yhmc";

					cf.selectItem(out,ywysql,"");
				}
%>
              </select></td>
              <td align="right" bgcolor="#FFFFCC">业务员</td>
              <td bgcolor="#FFFFCC"><input type="text" name="ywy1" value="" size="20" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
              <td width="18%" align="right">设计师</td>
              <td width="32%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">回访日期 从</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">小区类型</td>
              <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
              </select></td>
              <td align="right">客户资源性质</td>
              <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" >每页显示数量</td>
              <td colspan="3" ><input type="text" name="myxssl" size="7" maxlength="13" value="19">              </td></tr>
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
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.crm_zxkhxx_zxdm.length=1;

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
	strToSelect(selectform.crm_zxkhxx_zxdm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "回访日期"))) {
		return false;
	}
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
