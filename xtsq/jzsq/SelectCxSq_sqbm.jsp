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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

	String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'（'||b.dwmc||'）',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by a.ssdw,a.dwbh");

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">跨部门授权查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_sqbmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="22%" align="right" bgcolor="#FFFFCC">分公司</td>
              <td width="28%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,sq_yhxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="20%" align="right">所属单位</td>
              <td width="30%"> 
                <select name="sq_yhxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(sq_yhxx_dwbh,sjsbh,<%=sjsstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0') order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0') and cxbz='N' and ssdw='"+ssfgs+"' order by dwbh","");
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
              <td width="22%" align="right">员工序号</td>
              <td width="28%"> 
                <input type="text" name="ygbh" size="20" maxlength="8" >
              </td>
              <td width="20%" align="right">工号</td>
              <td width="30%"> 
                <input type="text" name="bianhao" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">所属部门小组</td>
              <td width="28%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by dwbh","");
%> 
                </select>
              </td>
              <td width="20%" align="right">员工名称</td>
              <td width="30%"> 
                <input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">职务</td>
              <td width="28%"> 
                <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
                </select>
              </td>
              <td width="20%" align="right">工种</td>
              <td width="30%"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">授权部门</td>
              <td colspan="3"> 
                <select name="sqbm" style="FONT-SIZE:12PX;WIDTH:252PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）'||DECODE(a.cxbz,'N','','Y','『撤销』') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","");
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
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}


	FormName.submit();
	return true;
}

//-->
</SCRIPT>
