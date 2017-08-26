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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_sgdwgjstyCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"> 分公司 </td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
      </select>    </td>
    <td align="right"> 签约店面 </td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">签约日期 从</td>
    <td><input type="text" name="qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同号</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">质检</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">客户姓名</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>联系方式</b></font> </td>
    <td><input type="text" name="lxfs" size="20" maxlength="50">    </td>
    <td align="right"> 联系方式 </td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 房屋地址 </td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      （模糊查询） </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算记录号</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_jsjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <select name="cw_sgdwgjsty_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>  </td>
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">现场负责人</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_sgbz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">合同工程基础报价</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_htjcbj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">增减项工程基础报价</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_zjxjcbj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">垃圾清运费</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_ljqyf" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">灯具安装费</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_djazf" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">结算基数</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_jsjs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算比例</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_jsbl" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">调整结算比例</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_tzjsbl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">水电路金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_sdlje" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">水电路结算比例</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_sdljsbl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算总额</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_jsje" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">材料费</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_clf" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料运费</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_clyf" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">工地用品</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_gdyp" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">已付工程款</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_yfgck" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">应扣质保金比例</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_kzbjjbl" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">扣质保金</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_kzbj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">材料罚款</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_clfk" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">奖罚金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_jfje" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">应付金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_yfje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算日期</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdwgjsty_jsrq" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">处理状态</td> 
  <td width="32%"> 
    <select name="cw_sgdwgjsty_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+未审批&2+审批","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从 </td> 
  <td width="32%"><input type="text" name="cw_sgdwgjsty_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="cw_sgdwgjsty_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="cw_sgdwgjsty_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">录入部门 </td>
  <td width="32%"><select name="cw_sgdwgjsty_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" >显示风格</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    网页
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;每页显示数量
    <input type="text" name="myxssl" size="7" maxlength="13" value="30">  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isFloat(FormName.cw_sgdwgjsty_htjcbj, "合同工程基础报价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_zjxjcbj, "增减项工程基础报价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_ljqyf, "垃圾清运费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_djazf, "灯具安装费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_jsjs, "结算基数"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_jsbl, "结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_tzjsbl, "调整结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_sdlje, "水电路金额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_sdljsbl, "水电路结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_jsje, "结算总额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_clf, "材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_clyf, "材料运费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_gdyp, "工地用品"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_yfgck, "已付工程款"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_kzbjjbl, "应扣质保金比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_kzbj, "扣质保金"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_clfk, "材料罚款"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_jfje, "奖罚金额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdwgjsty_yfje, "应付金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdwgjsty_jsrq, "结算日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdwgjsty_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdwgjsty_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
