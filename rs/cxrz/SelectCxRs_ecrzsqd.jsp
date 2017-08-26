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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

	//检查是否做期末结转
	//返回： -1:出错;0:当月已结转；1:上月已结转，当月未结转;2:上月未结转 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("上月没有进行『结转』！");
		return;
	}
	else if (count==-1)
	{
		out.println("出错！");
		return;
	}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_ecrzsqdCxList.jsp" name="selectform">
  <div align="center">
    离职员工重新入职
    <BR>
    <b><font color="#000099">（注意：重新入职请先做『重新入职申请、审批』） <BR>
    位置：人事管理－>员工管理－>重新入职申请</font></b> </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">员工序号</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">员工名称</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_yhmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">性别</td>
      <td width="33%"> <%
	cf.radioToken(out, "rs_ecrzsqd_xb","M+男&W+女","");
%> </td>
      <td align="right" width="18%">原分公司</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_yfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">原部门</td>
      <td width="33%"> 
        <select name="rs_ecrzsqd_ydwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
	else{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
%> 
        </select>
      </td>
      <td align="right" width="18%">原职位</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_yxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">上次入职日期</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_yrzsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">离职日期</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_ylzrq" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="31">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">申请序号</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_sqxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">申报公司</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">申请二次入职部门</td>
      <td width="33%"> 
        <select name="rs_ecrzsqd_xdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
%> 
        </select>
      </td>
      <td align="right" width="18%">申请二次入职职位</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_xxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">录入部门</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入时间 从</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">申请日期 从</td>
      <td width="33%"> 
        <input type="text" name="sqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="sqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="32">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">处理状态</td>
      <td width="33%"> 
        <select name="rs_ecrzsqd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">不需审批</option>
          <option value="03">审批通过</option>
        </select>
      </td>
      <td align="right" width="18%">审批状态</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='06' order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审批序号</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_spxh" size="20" maxlength="16" >
      </td>
      <td align="right" width="18%">审核结论</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审核时间 从</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审核人</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_shr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.rs_ecrzsqd_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_yrzsj, "上次入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_ylzrq, "离职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_ecrzsqd_spxh, "审批序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_shsj2, "审核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
