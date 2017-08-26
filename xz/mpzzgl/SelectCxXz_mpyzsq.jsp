<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">名片制作申请查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Xz_mpyzsqCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">分公司</td>
              <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,xz_mpyzsq_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
              <td width="18%" align="right">申请部门</td>
              <td width="32%"> 
                <select name="xz_mpyzsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F2") || yhjs.equals("F1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_xm" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">职务</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_zw" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">申请日期 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_sqrq" size="20" value="" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_sqrq2" size="20"  value=""  maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">完成时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_wcsj" size="20" value="" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_wcsj2" size="20"  value=""  maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">名片版本</td>
              <td width="32%"> 
                <select name="mpbb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mpbb c1,mpbb c2 from xz_mpbb ","");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">单价</td>
              <td width="32%"> 
                <input type="text" name="dj" size="20"  value=""  maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">是否已完成</div>
              </td>
              <td width="32%"> 
                <input type="radio" name="xz_mpyzsq_sfywc" value="Y">
                完成 
                <input type="radio" name="xz_mpyzsq_sfywc" value="N">
                否 </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">申请序号</td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_sqxh" size="20" maxlength="7" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="xz_mpyzsq.sqrq desc">申请日期</option>
                  <option value="xz_mpyzsq.dwbh">申请部门</option>
                  <option value="xz_mpyzsq.xm">姓名</option>
                  <option value="xz_mpyzsq.zw">职务</option>
                  <option value="xz_mpyzsq.mpbb">名片版本</option>
                  <option value="xz_mpyzsq.yqsl">要求数量</option>
                  <option value="xz_mpyzsq.yqjfrq">要求交付日期</option>
                  <option value="xz_mpyzsq.wcsj">完成时间</option>
                  <option value="xz_mpyzsq.wcsl">完成数量</option>
                  <option value="xz_mpyzsq.dj">单价</option>
                  <option value="xz_mpyzsq.sfywc">是否已完成</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="xz_mpyzsq.sqrq desc">申请日期</option>
                  <option value="xz_mpyzsq.dwbh">申请部门</option>
                  <option value="xz_mpyzsq.xm">姓名</option>
                  <option value="xz_mpyzsq.zw">职务</option>
                  <option value="xz_mpyzsq.mpbb">名片版本</option>
                  <option value="xz_mpyzsq.yqsl">要求数量</option>
                  <option value="xz_mpyzsq.yqjfrq">要求交付日期</option>
                  <option value="xz_mpyzsq.wcsj">完成时间</option>
                  <option value="xz_mpyzsq.wcsl">完成数量</option>
                  <option value="xz_mpyzsq.dj">单价</option>
                  <option value="xz_mpyzsq.sfywc">是否已完成</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="xz_mpyzsq.sqrq desc">申请日期</option>
                  <option value="xz_mpyzsq.dwbh">申请部门</option>
                  <option value="xz_mpyzsq.xm">姓名</option>
                  <option value="xz_mpyzsq.zw">职务</option>
                  <option value="xz_mpyzsq.mpbb">名片版本</option>
                  <option value="xz_mpyzsq.yqsl">要求数量</option>
                  <option value="xz_mpyzsq.yqjfrq">要求交付日期</option>
                  <option value="xz_mpyzsq.wcsj">完成时间</option>
                  <option value="xz_mpyzsq.wcsl">完成数量</option>
                  <option value="xz_mpyzsq.dj">单价</option>
                  <option value="xz_mpyzsq.sfywc">是否已完成</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
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
	if(!(isDatetime(FormName.xz_mpyzsq_sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_mpyzsq_sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_mpyzsq_wcsj, "完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_mpyzsq_wcsj2, "完成时间"))) {
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>

