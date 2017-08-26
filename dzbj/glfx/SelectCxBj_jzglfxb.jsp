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
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_jzglfxbCxList.jsp" name="selectform">
<div align="center">查询工料分析</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right">报价版本号</td>
      <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:522PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and sfzybb!='4' order by bj_dzbjbb.dqbm,bjbbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.dqbm='"+dqbm+"' and sfzybb!='4' order by bj_dzbjbb.dqbm,bjbbh","");
	}
%>
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">地区</td>
      <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
      </select></td>
      <td align="right">报价级别</td>
      <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">项目大类</td>
      <td><select name="bj_jzglfxb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%>
      </select></td>
      <td align="right">项目小类</td>
      <td><select name="bj_jzglfxb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">项目编号</td>
      <td><input type="text" name="bj_jzglfxb_xmbh" size="20" maxlength="16" ></td>
      <td align="right">项目名称</td>
      <td><input type="text" name="bj_jzglfxb_xmmc" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">工料分类</td>
      <td width="32%"><select name="bj_jzglfxb_glflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","");
%>
      </select></td>
      <td align="right" width="18%">类型</td>
      <td width="32%">
		  <input type="radio" name="lx" value="1">打印
		  <input type="radio" name="lx" value="2">不打印
	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">工料表序号</td>
      <td width="32%"><input type="text" name="bj_jzglfxb_glbxh" size="20" maxlength="8" ></td>
      <td align="right" width="18%">是否需要物流领料</td>
      <td width="32%">
		  <input type="radio" name="wlllbz" value="Y">需要
		  <input type="radio" name="wlllbz" value="N">否 
	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">材料编码</td>
      <td width="32%"> 
        <input type="text" name="glfxclbm" size="20" maxlength="16" >      </td>
      <td align="right" width="18%">工料名称</td>
      <td width="32%"><input type="text" name="glfxclmc" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">计量单位</td>
      <td width="32%"><input type="text" name="bj_jzglfxb_jldwbm" size="20" maxlength="2" ></td>
      <td align="right" width="18%">录入人</td>
      <td width="32%"><input type="text" name="bj_jzglfxb_lrr" size="20" maxlength="20" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从 </td>
      <td width="32%"><input type="text" name="bj_jzglfxb_lrsj" size="20" maxlength="10" ></td>
      <td align="right" width="18%">到</td>
      <td width="32%"><input type="text" name="bj_jzglfxb_lrsj2" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">每页显示项目数</td>
      <td width="32%"> 
        <input type="text" name="xssl" size="10" value="30">      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}

	if(!(isNumber(FormName.bj_jzglfxb_glbxh, "工料表序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_jzglfxb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_jzglfxb_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isNumber(FormName.xssl, "每页显示项目数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
