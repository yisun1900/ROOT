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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_gdzcyjjlList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">目前保管分公司</td>
      <td width="32%"> 
<%
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_gdzcb_fgsbh,xz_gdzcb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
%>		
      </td>
      <td align="right" width="18%">目前保管单位</td>
      <td width="32%"> 
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
        <input type="text" name="xz_gdzcyjjl_gsbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">目前保管人</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_bgr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">固定资产名称</td>
      <td colspan="3"> 
        <input type="text" name="xz_gdzcyjjl_gdzcmc" size="73" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">移交时间从</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_yjsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_yjsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">接收人</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_jsr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">移交人</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_yjr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入部门</td>
      <td width="32%"> 
        <select name="xz_gdzcyjjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
      </td>
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_lrr" size="20" maxlength="20" >
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
	if(!(isDatetime(FormName.xz_gdzcyjjl_yjsj, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcyjjl_yjsj2, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcyjjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcyjjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
