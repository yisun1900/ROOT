<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");

String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String bjbbh=cf.executeQuery("select bjbbh from crm_zxkhxx where khbh='"+khbh+"'");
%>

<body bgcolor="#FFFFFF"  onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>从标准项目导入--自定义项目</p>
        <p><b><font color="#FF0000">注意：报价级别，【自定义报价级别】一定与【工程预算价级别】相一致</font></b></p>
        <p><b><font color="#FF0000">否则无法使用【自定义项目】</font></b></p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Bj_jzbjbDrList1.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>报价版本号</td>
              <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:522PX">
                  <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.bjbbh='"+bjbbh+"' ","");
%>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>地区</td>
              <td><select name="bj_jzbjb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
              </select></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>报价级别</td>
              <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'","");
%> 
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"> 项目大类                        </td>
              <td width="33%"> 
                <select name="bj_jzbjb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(bj_jzbjb_xmdlbm,bj_jzbjb_xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF"> 
                项目小类             </td>
              <td width="34%"> 
                <select name="bj_jzbjb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">项目分类</td>
              <td><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm","");
%>
              </select></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"> 项目编号                             </td>
              <td width="33%"> 
              <input type="text" name="bj_jzbjb_xmbh" size="20" maxlength="7" >              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF">项目名称</td>
              <td width="34%"><input type="text" name="bj_jzbjb_xmmc" size="20" maxlength="50" ></td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" >
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bj_jzbjb_dqbm)=="") {
		alert("请选择[地区]！");
		FormName.bj_jzbjb_dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
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
