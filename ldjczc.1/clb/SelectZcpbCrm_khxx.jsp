<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面


%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">个性化主材配比查询</div>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" width="18%"> 分公司 </td>
      <td width="32%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
          <%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
				%>
      </select>      </td>
      <td width="18%" align="right"> 签约店面 </td>
      <td width="32%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
					%>
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"> 客户编号 </td>
      <td><input type="text" name="khbh" size="20" maxlength="7" >      </td>
      <td align="right"> 合同号 </td>
      <td><input type="text" name="hth" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
      <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >      </td>
      <td align="right">客户姓名</td>
      <td><input type="text" name="crm_khxx_khxm2" size="14" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC"><b>联系方式</b></font></td>
      <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >      </td>
      <td align="right">联系方式</td>
      <td><input type="text" name="crm_khxx_lxfs2" size="14" maxlength="20" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
      <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >      </td>
      <td align="right">房屋地址</td>
      <td><input type="text" name="crm_khxx_fwdz2" size="14" maxlength="100" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">材料员</td>
      <td><input name="clgw" type="text" id="clgw" value="" size="20" maxlength="20" ></td>
      <td align="right"> 客户经理 </td>
      <td><input name="zjxm" type="text" id="zjxm" value="" size="20" maxlength="20" >      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">店面业务</td>
      <td><input type="text" name="khjl" value="" size="20" maxlength="20" ></td>
      <td align="right"> 设计师 </td>
      <td><input type="text" name="sjs" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"> 签约日期 从 </td>
      <td><input type="text" name="qyrq" size="20" maxlength="10" value='<%=cf.firstDay()%>' onDblClick="JSCalendar(this)">      </td>
      <td align="right"> 到 </td>
      <td><input type="text" name="qyrq2" size="20" maxlength="10" value='<%=cf.lastDay()%>' onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"> 录入时间 从 </td>
      <td><input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right"> 到 </td>
      <td><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">记入业绩时间</td>
      <td><input type="text" name="yjjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right">到</td>
      <td><input type="text" name="yjjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">施工队是否结算</td>
      <td><select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd","");
%>
      </select></td>
      <td align="right">客户是否结算</td>
      <td><input type="radio" name="khjsbz" value="Y">
结算
  <input type="radio" name="khjsbz" value="N">
未结算</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">信息录入人</td>
      <td><input type="text" name="lrr" size="20" maxlength="20" ></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right">查询结果排序</td>
      <td colspan="3"> 第一列
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
            <option value="qyrq desc">签约日期</option>
            <option value="sjs" >设计师</option>
            <option value="clgw">材料员</option>
            <option value="zjxm">客户经理</option>
            <option value="khjl">店面业务</option>
            <option value="crm_khxx.dwbh" selected>店面</option>
          </select>
        第二列
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
            <option value="qyrq desc">签约日期</option>
            <option value="sjs" selected>设计师</option>
            <option value="clgw">材料员</option>
            <option value="zjxm">客户经理</option>
            <option value="khjl">店面业务</option>
            <option value="crm_khxx.dwbh">店面</option>
        </select>
        第三列
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
            <option value="qyrq desc">签约日期</option>
            <option value="sjs">设计师</option>
            <option value="clgw">材料员</option>
            <option value="zjxm">客户经理</option>
            <option value="khjl">店面业务</option>
            <option value="crm_khxx.dwbh">店面</option>
        </select>
      </td>
    </tr>
    
    <tr> 
      <td align="right" width="18%" >显示风格</td>
      <td  colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td  colspan="4"> 
          <input type="button"  value="统计" onClick="f_do(selectform)"  name="tj" >
          <input type="reset"  value="重输">        </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.yjjzsj, "记入业绩时间 "))) {
		return false;
	}
	if(!(isDatetime(FormName.yjjzsj2, "记入业绩时间 "))) {
		return false;
	}

	FormName.action="Crm_khxxZcpbList.jsp";
	FormName.target="";
	FormName.submit();
	FormName.tj.disabled=true;
	return true;
}


//-->
</SCRIPT>
