<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="Cw_kqtkjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%">分公司</td>
              <td width="33%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
              <td align="right" width="19%"> 施工队</td>
              <td width="31%"> 
                <select name="cw_kqtkjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">客户编号</td>
              <td> 
                <input type="text" name="khbh" size="20" maxlength="20" >
              </td>
              <td align="right">合同号</td>
              <td> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">客户姓名</td>
              <td> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
              <td align="right">联系方式</td>
              <td> 
                <input type="text" name="lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"> 房屋地址</td>
              <td> 
                <input type="text" name="fwdz" size="20" maxlength="100" >
              </td>
              <td align="right">设计师</td>
              <td> 
                <input type="text" name="sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"> 质检</td>
              <td> 
                <input type="text" name="zjxm" size="20" maxlength="20" >
              </td>
              <td align="right">扣款记录号</td>
              <td> 
                <input type="text" name="cw_kqtkjl_kkjlh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">录入时间 从</td>
              <td width="32%"> 
                <input type="text" name="cw_kqtkjl_lrsj" size="20" maxlength="10" >
              </td>
              <td align="right" width="18%">到</td>
              <td width="32%"> 
                <input type="text" name="cw_kqtkjl_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_kqtkjl_lrr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="32%"> 
                <select name="cw_kqtkjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">结算标志</div>
              </td>
              <td width="32%"> 
                <INPUT type="radio" name="cw_kqtkjl_jsbz" value="N" checked>
                未结算 </td>
              <td width="18%"> 
                <div align="right">结算记录号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_kqtkjl_jsjlh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">扣款项目</td>
              <td width="32%"> 
                <select name="qtkkbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select qtkkbm,qtkkmc from dm_qtkkbm order by qtkkbm","");
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
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
	if(!(isDatetime(FormName.cw_kqtkjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_kqtkjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
