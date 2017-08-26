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
	String zt=request.getParameter("zt");
%>

<body bgcolor="#FFFFFF" onLoad="selectform.hth.focus();">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">直接录入合同</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">分公司</div>
              </td>
              <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' order by ssfgs,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="16%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">合同号</td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">
              </td>
              <td width="16%" align="right">客户编号</td>
              <td width="34%"> 
                <input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">客户类型</td>
              <td width="32%"> 
                <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xxlybm)">
                  <%
	cf.selectToken(out,"2+家装客户&3+退单客户&4+非家装客户&5+设计客户",zt,false);
%> 
                </select>
              </td>
              <td width="16%" align="right">参加促销活动</td>
              <td width="34%"> 
                <select name="cxhdmc" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(xxlybm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'(订金：'||dj||'￥)' c2 from jc_cxhd where jsbz='N' and fgsbh='"+ssfgs+"' order by cxhdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">
              </td>
              <td width="16%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  onKeyUp="keyGo(fwdz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="12" maxlength="50" onKeyUp="keyGo(lxfs)">
                （模糊查询） </td>
              <td width="16%" align="right">房屋地址</td>
              <td width="34%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" onKeyUp="keyGo(butt)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">家装签约日期 从</td>
              <td width="32%"> 
                <input type="text" name="qyrq1" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">家装录入时间 从</td>
              <td width="32%"> 
                <input type="text" name="lrsj1" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="继续" name="butt" onClick="f_do(selectform)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_khxxCxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
