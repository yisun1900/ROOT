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
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String dwbh=(String)session.getAttribute("dwbh");

String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String dqbm=(String)session.getAttribute("dqbm");
String zwbm=(String)session.getAttribute("zwbm");
String ywyssxz=cf.fillNull(cf.executeQuery("select sjsbh from sq_yhxx where yhdlm='"+yhdlm+"'"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhxxAllYjList.jsp" name="selectform">
<div align="center">市场部客户－移交</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr align="center">
    <td colspan="4"><input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">所属分公司</td>
    <td bgcolor="#FFFFCC">
		<select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
		</select>
 
	  </td>
    <td align="right" bgcolor="#FFFFCC">录入部门</td>
    <td bgcolor="#FFFFCC">
	  <select name="crm_scbkhxx_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
		}
		else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='07' and  cxbz='N' and ssfgs='"+ssfgs+"' order by cxbz,dwbh","");
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
		%> 
	  %> 
	  </select>
	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>录入人</strong></td>
    <td><input type="text" name="crm_scbkhxx_lrr" size="20" maxlength="20" ></td>
    <td align="right">小区类型</td>
    <td><select name="crm_scbkhxx_xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">市场部客户编号</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_scbkhbh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_khbh" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">状态</td>
  <td colspan="3">
    <INPUT type="radio" name="crm_scbkhxx_zt" value="1">
    跟踪
    <INPUT type="radio" name="crm_scbkhxx_zt" value="5">
    准备移交
    <INPUT type="radio" name="crm_scbkhxx_zt" value="6">
    准备失败
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需回访</td>
  <td><input type="radio" name="crm_scbkhxx_sfxhf" value="Y">
    需要
    <input type="radio" name="crm_scbkhxx_sfxhf" value="N">
    否 </td>
  <td align="right">客户资源性质</td>
  <td><select name="crm_scbkhxx_khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxz","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">下次回访时间 从</td>
  <td><input type="text" name="crm_scbkhxx_xchfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_scbkhxx_xchfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最近跟踪时间 从</td>
  <td><input type="text" name="crm_scbkhxx_zjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_scbkhxx_zjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">客户姓名</span></td>
  <td><input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" ></td>
  <td align="right">客户姓名</td>
  <td><input type="text" name="crm_scbkhxx_khxm2" size="14" maxlength="50" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">联系方式</span></td>
  <td><input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" ></td>
  <td align="right">联系方式</td>
  <td><input type="text" name="crm_scbkhxx_lxfs2" size="14" maxlength="50" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">其它电话</span></td>
  <td><input type="text" name="crm_scbkhxx_qtdh" size="20" maxlength="50" ></td>
  <td align="right">其它电话</td>
  <td><input type="text" name="crm_scbkhxx_qtdh2" size="14" maxlength="50" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">房屋地址</span></td>
  <td><input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right">房屋地址</td>
  <td><input type="text" name="crm_scbkhxx_fwdz2" size="14" maxlength="100" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">所属城区</td>
  <td><select name="crm_scbkhxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%>
  </select></td>
  <td align="right">小区</td>
  <td><input type="text" name="crm_scbkhxx_xqbm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">街道</td>
  <td><input type="text" name="crm_scbkhxx_jiedao" size="20" maxlength="50" ></td>
  <td align="right">楼号</td>
  <td><input type="text" name="crm_scbkhxx_louhao" size="20" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><strong>业务员</strong></td>
  <td>
  <select name="crm_scbkhxx_ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
     <option value=""></option>
      <%
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.ssfgs='"+ssfgs+"'";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.ssfgs='"+ssfgs+"'";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,"");
%>
    </select>	
  
  
  </td>
  <td align="right" bgcolor="#FFFFFF"><strong>业务员所属小组</strong></td>
  <td>
  <select name="crm_scbkhxx_ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
     <option value=""></option>
   <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F4' and ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
%>
  </select>
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">户型</td>
  <td><select name="crm_scbkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right">竞争对手名称</td>
  <td><input type="text" name="crm_scbkhxx_jzdsmc" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">建筑面积 从</td>
  <td><input type="text" name="crm_scbkhxx_fwmj" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_scbkhxx_fwmj2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">房价 从</td>
  <td><input type="text" name="crm_scbkhxx_fj" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_scbkhxx_fj2" size="20" maxlength="8" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">预计装修时间 从</td>
  <td><input type="text" name="crm_scbkhxx_yjzxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"> 到</td>
  <td><input type="text" name="crm_scbkhxx_yjzxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">移交人</td>
  <td><input type="text" name="crm_scbkhxx_yjr" size="20" maxlength="20" ></td>
  <td align="right">移交部门</td>
  <td>
    <select name="crm_scbkhxx_yjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
      <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx='F2' and cxbz='N' order by dwbh","");
	  %>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">移交时间</td>
  <td><input type="text" name="crm_scbkhxx_yjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">是否新小区</td>
  <td><input type="radio" name="crm_scbkhxx_sfxxq" value="Y">
    是
    <input type="radio" name="crm_scbkhxx_sfxxq" value="N">
    否</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">接收人</td>
  <td><input type="text" name="crm_scbkhxx_jsr" size="20" maxlength="20" >  </td>
  <td align="right">接收时间</td>
  <td><input type="text" name="crm_scbkhxx_jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">失败原因</td> 
  <td width="32%"> 
    <select name="crm_scbkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
    </select>  </td>
  <td align="right" width="18%">失败登记人</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_sbdjr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">失败登记时间 从</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_sbdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_sbdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到 </td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	//启用Ajax
	cf.ajax(out);
%>
function changeFgs(FormName)
{
	FormName.crm_scbkhxx_lrbm.length=1;

	if (FormName.crm_scbkhxx_ssfgs.value=="")
	{
		return;
	}


	var sql;
	sql="select dwbh,dwmc from sq_dwxx where dwflbm='07' and  cxbz='N' and ssfgs='"+FormName.crm_scbkhxx_ssfgs.value+"' order by cxbz,dwbh";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.crm_scbkhxx_lrbm,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_scbkhxx_sbdjsj, "失败登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_sbdjsj2, "失败登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjsj, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_jssj, "接收时间"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fwmj, "建筑面积"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fwmj2, "建筑面积"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fj, "房价"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fj2, "房价"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjzxsj2, "预计装修时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj, "最近跟踪时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj2, "最近跟踪时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_xchfsj, "下次回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_xchfsj2, "下次回访时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
