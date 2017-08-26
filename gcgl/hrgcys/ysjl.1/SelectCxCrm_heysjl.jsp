<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	
	String zwbm=(String)session.getAttribute("zwbm");
	String yhmc=(String)session.getAttribute("yhmc");
	String zjxm=yhmc;
	if (!zwbm.equals("05"))
	{
		zjxm="";
	}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_heysjlCxList.jsp" name="selectform">
<div align="center">工程验收记录－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right" >显示风格</td>
	  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
		网页
		<input type="radio" name="xsfg" value="2">
		EXCEL &nbsp;&nbsp;&nbsp;每页显示数量
		<input type="text" name="myxssl" size="7" maxlength="13" value="25">              </td>
	</tr>
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
    <td align="right">合同号</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">施工队</td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%>
    </select></td>
    <td align="right">监理</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20" value="<%=zjxm%>" <% if (!zjxm.equals("")) out.println("readonly");%>></td>
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
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">验收记录号</td> 
  <td width="32%"> 
    <input type="text" name="ysjlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">验收次数记录号</td> 
  <td width="32%"> 
    <input type="text" name="yscsjlh" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">验收版本号</td> 
  <td width="32%"> 
	<select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<%
		cf.selectItem(out,"select gcysbbh,gcysbbmc||'('||DECODE(sfzybb,'1','未启用','2','当前版','3','可用版','4','已停用')||')' from dm_hegcysbb order by gcysbbh","");
	%>
    </select>  </td>
  <td align="right" width="18%">整改处理状态</td> 
  <td width="32%"><select name="clbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"9+录入未完成&0+没问题&1+整改未接收&2+接收&3+已处理&4+已解决&5+验收通过&6+验收未通过","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收项目</td>
  <td><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm where gcysbbh in(select gcysbbh from dm_hegcysbb where sfzybb='2') order by gcysxmbm","");
%>
  </select></td>
  <td align="right">验收项目名称</td>
  <td><input type="text" name="gcysxmmc" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">项目验收时间从</td> 
  <td width="32%"><input type="text" name="yssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="yssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">项目验收人</td> 
  <td width="32%"> 
    <input type="text" name="ysr" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">项目验收结果</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sjysjg","0+合格&1+需整改","");
%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">计划解决时间 从</td>
  <td><input type="text" name="jhjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jhjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">整改处理记录号</td> 
  <td width="32%"><input type="text" name="zgcljlh" size="20" maxlength="25" ></td>
  <td align="right" width="18%">整改接收人</td> 
  <td width="32%"> 
    <input type="text" name="jsr" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">整改接收时间 从</td>
  <td><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">处理结果</td> 
  <td width="32%"><%
	cf.radioToken(out, "cljg","3+在处理&4+已解决","");
%></td>
  <td align="right" width="18%">整改处理人</td> 
  <td width="32%"><input type="text" name="jjr" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">整改处理时间从</td> 
  <td width="32%"><input type="text" name="jjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">整改验收结果</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "zgysjg","5+合格&6+不合格","");
%>  </td>
  <td align="right" width="18%">整改验收人</td> 
  <td width="32%"> 
    <input type="text" name="zgysr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">整改验收时间从</td>
  <td><input type="text" name="zgyssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="zgyssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否设置回访</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfszhf","Y+是&N+否","");
%></td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">照片数量 从</td>
  <td><input type="text" name="zpsl" size="20" maxlength="10"  ></td>
  <td align="right">到</td>
  <td><input type="text" name="zpsl2" size="20" maxlength="10"  ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户可看照片数量 从</td>
  <td><input type="text" name="khkkzpsl" size="20" maxlength="10"  ></td>
  <td align="right">到</td>
  <td><input type="text" name="khkkzpsl2" size="20" maxlength="10"  ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">不合格照片数量 从</td>
  <td><input type="text" name="bhgzpsl" size="20" maxlength="10"  ></td>
  <td align="right">到</td>
  <td><input type="text" name="bhgzpsl2" size="20" maxlength="10"  ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户端录入标志</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "padlrbz","0+电脑&1+客户端","");
%>  </td>
  <td align="right" width="18%">发短信标志 </td>
  <td width="32%"><%
	cf.radioToken(out, "fdxbz","1+未发送&2+发送","");
%></td>
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
	if(!(isDatetime(FormName.yssj, "项目验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yssj2, "项目验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "计划解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj2, "计划解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "整改接收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "整改接收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jjsj, "整改处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jjsj2, "整改处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgyssj, "整改验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgyssj2, "整改验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	if(!(isNumber(FormName.zpsl, "照片数量"))) {
		return false;
	}
	if(!(isNumber(FormName.zpsl2, "照片数量"))) {
		return false;
	}
	if(!(isNumber(FormName.khkkzpsl, "客户可看照片数量"))) {
		return false;
	}
	if(!(isNumber(FormName.khkkzpsl2, "客户可看照片数量"))) {
		return false;
	}
	if(!(isNumber(FormName.bhgzpsl, "不合格照片数量"))) {
		return false;
	}
	if(!(isNumber(FormName.bhgzpsl2, "不合格照片数量"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
