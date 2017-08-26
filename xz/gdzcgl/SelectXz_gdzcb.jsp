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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_gdzcbList.jsp" name="selectform">
  <div align="center">固定资产维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">当前保管分公司</td>
      <td width="32%"> <%

        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_gdzcb_fgsbh,xz_gdzcb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");

%> </td>
      <td align="right" width="19%">当前保管部门</td>
      <td width="31%"> 
        <select name="xz_gdzcb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">固定资产编号</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_gsbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">固定资产名称</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_gdzcmc" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">部门内部编号</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_bmbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">固定资产分类</td>
      <td width="31%"> 
        <select name="xz_gdzcb_gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">型号</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_xh" size="20" maxlength="30" >
      </td>
      <td align="right" width="19%">品牌</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_pp" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">配置(CPU)</td>
      <td width="32%"> 
        <input type="text" name="pz1" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(内存)</td>
      <td width="31%"> 
        <input type="text" name="pz2" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">配置(硬盘)</td>
      <td width="32%"> 
        <input type="text" name="pz3" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(主板)</td>
      <td width="31%"> 
        <input type="text" name="pz4" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">配置(显卡)</td>
      <td width="32%"> 
        <input type="text" name="pz5" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(显示器)</td>
      <td width="31%"> 
        <input type="text" name="pz6" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">购入时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_grsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_grsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">是否已报废</td>
      <td width="32%"> <%
	cf.radioToken(out, "xz_gdzcb_sfybf","Y+是&N+否","");
%> </td>
      <td align="right" width="19%">保管人</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_bgr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">移交时间 从</td>
      <td width="32%"> 
        <input type="text" name="yjsj" value="" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="yjsj2" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%">
        <input type="text" name="xz_gdzcb_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">录入人</td>
      <td width="32%">
        <input type="text" name="xz_gdzcb_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入部门</td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
%> 
        </select>
      </td>
      <td align="right" width="19%">资产所属分公司</td>
      <td width="31%"> 
        <select name="ssfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.xz_gdzcb_grsj, "购入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_grsj2, "购入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj2, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
