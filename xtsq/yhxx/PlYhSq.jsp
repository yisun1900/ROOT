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
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">批量用户授权</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC">分公司</td>
              <td width="32%"> 
<%
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
%>              </td>
              <td width="18%" align="right">所属单位</td>
              <td width="32%"> 
                <select name="sq_yhxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">单位类型</td>
              <td><select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="A0">总部</option>
                <option value="A1">总部各部门</option>
                <option value="F0">分公司</option>
                <option value="F1">分公司各部门</option>
                <option value="F2">店面</option>
                <option value="F3">部门小组</option>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">员工序号</td>
              <td width="32%"> 
                <input type="text" name="ygbh" size="20" maxlength="8" >              </td>
              <td width="18%" align="right">工号</td>
              <td width="32%"> 
                <input type="text" name="bianhao" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">员工名称</td>
              <td width="32%"><input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" ></td>
              <td width="18%" align="right">用户角色</td>
              <td width="32%"><select name="sq_yhxx_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="A0">总部</option>
                <option value="A1">总部各部门</option>
                <option value="F0">分公司</option>
                <option value="F1">分公司各部门</option>
                <option value="F2">店面</option>
                <option value="F3">部门小组</option>
                <option value="J0">加盟商</option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">职务</td>
              <td width="32%"> 
                <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
                </select>              </td>
              <td width="18%" align="right">工种</td>
              <td width="32%"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">可登陆系统标志</td>
              <td>
				  <input type="radio" name="kdlxtbz" value="Y">可登陆
				  <input name="kdlxtbz" type="radio" value="N">
				  不可登陆			  </td>
              <td align="right">可拷贝标志</td>
              <td>
				  <input type="radio" name="kkbbz" value="Y">可拷贝
				  <input type="radio" name="kkbbz" value="N">不可拷贝			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">查看客户电话标志</td>
              <td>
				  <input type="radio" name="khdhbz" value="Y">可看
				  <input type="radio" name="khdhbz" value="N">不可看			  </td>
              <td align="right">客户资料授权范围</td>
              <td><select name="kfgssq" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="0">不授权</option>
                <option value="1">授权单个分公司</option>
                <option value="2">授权多个分公司</option>
                <option value="3">授权单个店面</option>
                <option value="4">授权某一分公司多个店面</option>
                <option value="5">授权多个分公司多个店面</option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                录入时间 从              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"> 
                到              </td>
              <td width="32%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="sq_yhxx.ssfgs">所属分公司</option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">员工序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.ssfgs">所属分公司</option>
                  <option value="sq_yhxx.dwbh" selected>所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">员工序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.ssfgs">所属分公司</option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc" selected>员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">员工序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"><input name="button" type="button" onClick="f_do(selectform)"  value="查询">
              <input type="reset"  value="重输">              </td>
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
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	FormName.action="PlYhSqList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
