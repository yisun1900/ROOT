<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>


<%
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
String jsy=yhmc;
if (!zwbm.equals("22"))//22:价审员
{
	jsy="";
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">预算审核</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="Crm_zxkhxxShList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC"> 
                客户所属分公司              </td>
              <td width="30%">
				<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
				</select>			  </td>
              <td width="20%" align="right"> 
                咨询店面              </td>
              <td width="30%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">咨询状态</td>
              <td><select name="zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="0">未分配店面</option>
                <option value="1">分配店面</option>
                <option value="2">设计师提交飞单</option>
                <option value="3">已签约</option>
                <option value="4">飞单</option>
                <option value="5">飞单审核未通过</option>
              </select></td>
              <td align="right">家装标志</td>
              <td>
				  <input type="radio" name="jzbz" value="1">家装
				  <input type="radio" name="jzbz" value="2">公装			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 客户编号 </td>
              <td><input type="text" name="khbh" size="20" maxlength="7" >              </td>
              <td align="right">性别</td>
              <td><INPUT type="radio" name="xb" value="M">
                男
                <INPUT type="radio" name="xb" value="W">
                女</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3">客户姓名</span></td>
              <td><input type="text" name="khxm" size="20" maxlength="20" >              </td>
              <td align="right">客户姓名</td>
              <td><input type="text" name="khxm2" size="14" maxlength="20" >
                （模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3">房屋地址 </span></td>
              <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
              <td align="right">房屋地址</td>
              <td><input type="text" name="fwdz2" size="14" maxlength="100" >
                （模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3">联系方式 </span></td>
              <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
              <td align="right">联系方式</td>
              <td><input type="text" name="lxfs2" size="14" maxlength="50" >
                （模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">客户经理</td>
              <td><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
              <td align="right">设计师</td>
              <td><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">签设计合同标志</td>
              <td bgcolor="#FFFFFF"><input type="radio" name="qsjhtbz" value="N">
未签
<input type="radio" name="qsjhtbz" value="Y">
签合同</td>
              <td align="right">业务员</td>
              <td><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">签设计合同时间 从</td>
              <td><input type="text" name="qsjhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">到</td>
              <td><input type="text" name="qsjhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否做电子报价</td>
              <td><input type="radio" name="sfzdzbj" value="N">
                未做报价
                <input type="radio" name="sfzdzbj" value="Y">
                已做 </td>
              <td align="right">报价级别</td>
              <td>
			  <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
				<option value=""></option>
				<%
					cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm ","");
				%> 
			  </select>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">做电子报价时间 从 </td>
              <td><input type="text" name="zjzbjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="zjzbjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"> 录入时间 从 </td>
              <td><input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">录入人</td>
              <td><input type="text" name="lrr" size="20" maxlength="20" ></td>
              <td align="right">受理人</td>
              <td><input type="text" name="slr" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 受理时间 从 </td>
              <td><input type="text" name="slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">价审员</td>
              <td>
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		%>
	  <select name="jsy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
		<option value=""></option>
		<%
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_dwxx.dwmc||'）' c2";
		sql+=" from sq_yhxx,sq_dwxx ";
		sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh ";
		sql+=" and sq_yhxx.zwbm='22' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" ORDER BY sq_yhxx.ssfgs,sq_yhxx.yhmc";

		cf.selectItem(out,sql,"");
		%>
	  </select>
		<%
	}
	else if (!jsy.equals(""))
	{
		%>
		<input type="text" name="jsy" value="<%=jsy%>" size="20" maxlength="20" readonly>
		<%
	}
	else{
		%>
	  <select name="jsy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
		<option value=""></option>
                <%
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm='22' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,"");
		%>
	  </select>
		<%
	}

%>
			  </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);

}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qsjhtsj, "签设计合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj2, "签设计合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjzbjsj, "做电子报价时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjzbjsj2, "做电子报价时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.slsj, "受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.slsj2, "受理时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
