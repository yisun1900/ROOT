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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Oa_bgypbmList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属公司</td>
              <td width="32%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
        out.println("        </select>");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办公用品编码</div>
              </td>
              <td width="32%"> 
                <input type="text" name="oa_bgypbm_bgypbm" size="20" maxlength="4" >
              </td>
              <td width="17%"> 
                <div align="right">办公用品名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="oa_bgypbm_bgypmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办公用品分类</div>
              </td>
              <td width="32%"> 
                <select name="oa_bgypbm_flbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select flbm,flmc from oa_flbm order by flbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">计量单位</div>
              </td>
              <td width="33%"> 
                <input type="text" name="oa_bgypbm_jldw" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">单价</div>
              </td>
              <td width="32%"> 
                <input type="text" name="oa_bgypbm_dj" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">品牌</div>
              </td>
              <td width="33%"> 
                <input type="text" name="oa_bgypbm_pp" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">型号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="oa_bgypbm_xh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">供货商</div>
              </td>
              <td width="33%"> 
                <input type="text" name="oa_bgypbm_ghs" size="20" maxlength="20" >
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属公司]！");
		FormName.fgsbh.focus();
		return false;
	}

	if(!(isFloat(FormName.oa_bgypbm_dj, "单价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
