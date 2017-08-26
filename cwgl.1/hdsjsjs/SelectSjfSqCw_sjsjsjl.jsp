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
%>

<body bgcolor="#FFFFFF" onLoad="selectform.hth.focus();">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">设计费结算申请</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="173" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
              <td><div align="right">客户姓名</div></td>
              <td><input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">
              </td>
              <td><div align="right">联系方式</div></td>
              <td><input type="text" name="lxfs" size="20" maxlength="50"  onkeyup="keyGo(fwdz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"><div align="right">房屋地址</div></td>
              <td width="32%"><input type="text" name="fwdz" size="30" maxlength="50" onKeyUp="keyGo(butt)" ></td>
              <td><div align="right">设计师</div></td>
              <td><input name="sjs" type="text" id="sjs" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">签约日期 从</td>
              <td><input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" >
              </td>
              <td align="right">到</td>
              <td><input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">分公司</div>
              </td>
              <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" > 
                <p> 
                  <input type="button"  value="继续" onClick="f_do(selectform)">
                  <input type="reset"  value="重输">
                </p>
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
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="Cw_sjsjsjlSjfSqList.jsp";


	FormName.submit();
	return true;
}

//-->
</SCRIPT>
