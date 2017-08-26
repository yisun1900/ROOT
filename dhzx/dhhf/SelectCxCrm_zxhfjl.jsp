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
<form method="post" action="Crm_zxhfjlCxList.jsp" name="selectform">
  <div align="center">回访查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">客户所属分公司</td>
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
        </select>      </td>
      <td align="right" width="18%">咨询店面</td>
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
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">客户编号</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_khbh" size="20" maxlength="7" >      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">客户姓名</font></b></td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >      </td>
      <td width="18%"> 
        <div align="right">客户姓名</div>      </td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">联系方式</font></b></td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="50" >      </td>
      <td width="18%" align="right">联系方式</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_lxfs2" size="10" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">房屋地址</font></b></td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >      </td>
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
      <td align="right" width="18%">设计师</td>
      <td width="32%"> 
        <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="30">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">回访记录号</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_hfjlh" size="20" maxlength="9" >      </td>
      <td align="right" width="18%">回访次数</td>
      <td width="32%"> 
        <select name="hfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+第1次&2+第2次&3+第3次&4+第4次&5+第5次&6+第6次&7+第7次&8+第8次&9+第9次&10+第10次&11+第11次&12+第12次&13+第13次&14+第14次","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">量房标志</td>
      <td width="32%"><%
	cf.radioToken(out, "crm_zxhfjl_lfbz","N+未量房&Y+已量房","");
%> </td>
      <td align="right" width="18%">量房时间</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_lfsj" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">出平面图标志</td>
      <td width="32%"><%
	cf.radioToken(out, "crm_zxhfjl_ctbz","N+未出图&Y+已出图","");
%> </td>
      <td align="right" width="18%">出平面图时间</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_ctsj" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">要求更换店面</td>
      <td width="32%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghdm","N+不要求&Y+要求更换","");
%> </td>
      <td align="right" width="18%">要求更换设计师</td>
      <td width="32%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghsjs","N+不要求&Y+要求更换","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">设计师专业水平</td>
      <td width="32%"> 
        <select name="crm_zxhfjl_sjszysp" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='3' order by hfjgbm","");
%> 
        </select>      </td>
      <td align="right" width="18%">设计师服务</td>
      <td width="32%"> 
        <select name="crm_zxhfjl_sjsfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='4' order by hfjgbm","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">其它人员服务</td>
      <td width="32%"> 
        <select name="crm_zxhfjl_qtryfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='5' order by hfjgbm","");
%> 
        </select>      </td>
      <td align="right" width="18%">工程报价</td>
      <td width="32%"> 
        <select name="crm_zxhfjl_gcbj" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='6' order by hfjgbm","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">公司总体印象</td>
      <td width="32%"> 
        <select name="crm_zxhfjl_gsztyx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='7' order by hfjgbm","");
%> 
        </select>      </td>
      <td align="right" width="18%">希望改进方面</td>
      <td width="32%"> 
        <select name="crm_zxhfjl_xwgjfm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='8' order by hfjgbm","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">是否继续回访</td>
      <td width="32%"><%
	cf.radioToken(out, "crm_zxhfjl_sfjxhf","Y+继续回访&N+回访结束","");
%> </td>
      <td align="right" width="18%">下次回访日期</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_xchfrq" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">回访时间 从</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_hfsj" size="20" maxlength="10" >      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_hfsj2" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">回访人</td>
      <td width="32%"> 
        <input type="text" name="crm_zxhfjl_hfr" size="20" maxlength="20" >      </td>
      <td align="right" width="18%">回访部门</td>
      <td width="32%"> 
        <select name="crm_zxhfjl_hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">是否提醒责任人</td>
      <td colspan="3"> 
        <input type="radio" name="crm_zxhfjl_clfs" value="0">
        不提醒 
        <input type="radio" name="crm_zxhfjl_clfs" value="1">
        提醒店面 
        <input type="radio" name="crm_zxhfjl_clfs" value="2">
        提醒设计师 </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
    </tr>
  </table>
</form>
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
	if(!(isDatetime(FormName.crm_zxhfjl_lfsj, "量房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_ctsj, "出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_xchfrq, "下次回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_hfsj, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_hfsj2, "回访时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
