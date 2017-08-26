<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String kkbbz=(String)session.getAttribute("kkbbz");
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<%
if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
{
	%>
	<body bgcolor="#FFFFFF">
	<%
}
else{
	%>
	<body bgcolor="#FFFFFF"  onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">标准项目查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Bj_jzbjbCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right">报价版本号</td>
              <td colspan="3">
                <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:522PX">
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
                </select>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">地区</td>
              <td><select name="bj_jzbjb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by sq_dwxx.dqbm","");
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by sq_dwxx.dqbm","");
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
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
              <td width="19%" align="right">项目大类</td>
              <td width="31%"> 
                <select name="bj_jzbjb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(bj_jzbjb_xmdlbm,bj_jzbjb_xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select></td>
              <td width="19%" align="right"> 
                项目小类</td>
              <td width="31%"> 
                <select name="bj_jzbjb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">项目分类</td>
              <td><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">项目编号</td>
              <td width="31%"> 
                <input type="text" name="bj_jzbjb_xmbh" size="20" maxlength="16" ></td>
              <td width="19%" align="right">项目名称</td>
              <td width="31%"><input type="text" name="bj_jzbjb_xmmc" size="20" maxlength="50" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">饰面</td>
              <td width="31%"> 
                <select name="bj_jzbjb_smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select></td>
              <td width="19%" align="right">工程量计量单位</td>
              <td width="31%"> 
                <select name="bj_jzbjb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入人</td>
              <td width="31%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">录入时间</td>
              <td width="31%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">是否必选项</td>
              <td colspan="3">
                <input type="radio" name="sfbxx" value="1">
                必报项 
                <input type="radio" name="sfbxx" value="2">
                必列项 
                <input type="radio" name="sfbxx" value="3">
                可选项 
                <input type="radio" name="sfbxx" value="9">
                作废项              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否需要材料</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+需要&N+否","");
%></td>
              <td align="right">是否需要预交底</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+需要&N+否","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">工艺材料简介</td>
              <td colspan="3"> 
                <input type="text" name="gycl" size="73" maxlength="50" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
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
	if(	javaTrim(FormName.bj_jzbjb_dqbm)=="") {
		alert("请选择[地区]！");
		FormName.bj_jzbjb_dqbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}

function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

//-->
</SCRIPT>
