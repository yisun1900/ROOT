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
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">更换店面</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="319" > 
      <div align="center">

<form method="post" action="Crm_zxkhxxGhList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">客户所属分公司</div>
              </td>
              <td width="32%"> 
				<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeFgs(selectform)">
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
              <td width="16%"> 
                <div align="right">咨询店面</div>
              </td>
              <td width="34%"> 
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
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >
              </td>
              <td width="16%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="16%" align="right">客户姓名</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">性别</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "crm_zxkhxx_xb","M+男&W+女","");
%> </td>
              <td width="16%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属城区</td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="16%" align="right"><b><font color="#0000CC">设计师</font></b></td>
              <td width="34%">
                <input type="text" name="sjs"  size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">房屋类型</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">装修预算</div>
              </td>
              <td width="34%"> 
                <select name="crm_zxkhxx_zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">户型</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">套内建筑面积</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_fwmj" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">风格要求</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right"></div>
              </td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">关系客户</td>
              <td width="32%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="16%" align="right">业务员</td>
              <td width="34%"> 
                <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">是否需回访</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "crm_zxkhxx_sfxhf","Y+需回访&N+不需回访","");
%> </td>
              <td width="16%"> 
                <div align="right">最新回访时间</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">回访日期 从</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>
              </td>
              <td width="16%"> 
                <div align="right">回单装修地址</div>
              </td>
              <td width="34%"> 
                <input type="text" name="cgdz" value="" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">回单人</div>
              </td>
              <td width="32%"> 
                <input name="hdr" type="text" value="" maxlength="20" size="20">
              </td>
              <td width="16%"> 
                <div align="right">咨询状态</div>
              </td>
              <td width="34%"> 
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">分配店面</option>
                  <option value="2">设计师提交飞单</option>
                  <option value="5">飞单审核未通过</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">咨询登记部门</td>
              <td width="32%"> 
                <select name="crm_zxkhxx_zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
              <td width="16%" align="right">信息录入人</td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "套内建筑面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "最新回访时间"))) {
		return false;
	}
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
