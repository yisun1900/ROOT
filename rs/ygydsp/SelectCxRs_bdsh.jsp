<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%	
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
%>


<form method="post" action="Rs_bdshCxList.jsp" name="selectform">
<div align="center">人事变动--审批查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审批序号</td>
      <td width="32%"> 
        <input type="text" name="rs_bdsh_spxh" size="20" maxlength="16" >
      </td>
      <td align="right" width="18%">人事变动序号</td>
      <td width="32%"> 
        <input type="text" name="rs_bdsh_bdxh" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申报公司</td>
      <td width="32%"> 
        <select name="rs_ygbdsqb_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      <td align="right" width="18%">员工序号</td>
      <td width="32%"> 
        <input type="text" name="rs_ygbdsqb_ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">员工名称</td>
      <td width="32%"> 
        <input type="text" name="rs_ygbdsqb_yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="18%">性别</td>
      <td width="32%"> <%
	cf.radioToken(out, "rs_ygbdsqb_xb","M+男&W+女","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="rs_ygbdsqb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_ygbdsqb_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审核人</td>
      <td width="32%"> 
        <input type="text" name="rs_bdsh_shr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">审核结论</td>
      <td width="32%"> 
        <select name="rs_bdsh_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审核时间 从</td>
      <td width="32%"> 
        <input type="text" name="rs_bdsh_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_bdsh_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审核后处理状态</td>
      <td width="32%"> 
        <select name="rs_bdsh_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">不需审批</option>
          <option value="01">等待审批</option>
          <option value="02">正在审批</option>
          <option value="03">审批通过</option>
          <option value="04">审批取消</option>
        </select>
      </td>
      <td align="right" width="18%">审核后审批状态</td>
      <td width="32%"> 
        <select name="rs_bdsh_ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='03' order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">上次处理状态</td>
      <td width="32%"> 
        <select name="rs_bdsh_yclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">不需审批</option>
          <option value="01">等待审批</option>
          <option value="02">正在审批</option>
          <option value="03">审批通过</option>
          <option value="04">审批取消</option>
        </select>
      </td>
      <td align="right" width="18%">上次审批状态</td>
      <td width="32%"> 
        <select name="rs_bdsh_yztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='03' order by ztbm","");
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.rs_bdsh_spxh, "审批序号"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_ygbdsqb_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ygbdsqb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ygbdsqb_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_bdsh_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_bdsh_shsj2, "审核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
