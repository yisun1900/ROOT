<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>更换预算员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">更换预算员</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="Crm_zxkhxxGhList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                所属分公司              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
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
				</select>			  </td>
              <td width="18%" align="right"> 
                咨询店面              </td>
              <td width="32%"> 
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
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">设计师</td>
              <td width="32%"><input type="text" name="sjs" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
              <td width="18%" align="right">客户经理</td>
              <td width="32%"><input type="text" name="khjl" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">预算员</td>
              <td><input name="ysy" type="text" size="20" maxlength="20" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                客户编号              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >              </td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"><input type="text" name="crm_zxkhxx_hth" size="20" maxlength="7" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3">客户姓名</span></td>
              <td><input type="text" name="khxm" size="20" maxlength="20" >              </td>
              <td align="right">客户姓名</td>
              <td><input type="text" name="khxm2" size="14" maxlength="20" >
                （模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3">房屋地址 </span></td>
              <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
              <td align="right">房屋地址</td>
              <td><input type="text" name="fwdz2" size="14" maxlength="100" >
                （模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3">联系方式 </span></td>
              <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
              <td align="right">联系方式</td>
              <td><input type="text" name="lxfs2" size="14" maxlength="50" >
                （模糊查询）</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                房屋类型              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                装修预算              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                户型              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">风格要求</td>
              <td width="32%"><select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">套内建筑面积 从 </td>
              <td><input type="text" name="crm_zxkhxx_fwmj" size="20" maxlength="8" ></td>
              <td align="right">到</td>
              <td><input type="text" name="crm_zxkhxx_fwmj2" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">业务员</td>
              <td width="32%">
			  <input type="text" name="ywy" value="" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>></td>
              <td width="18%" align="right"> 
                关系客户              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
              </select>              </td>
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
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "套内建筑面积"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_zxkhxx_fwmj2, "套内建筑面积"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
