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
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称
%>

<body bgcolor="#FFFFFF"  onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">从标准项目导入--输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Bj_jzbjbDrList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right">报价类型</td>
              <td><select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">标准项目</option>
              </select></td>
              <td align="right"></td>
              <td></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">项目大类</div>              </td>
              <td width="29%"> 
                <select name="bj_jzbjb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(bj_jzbjb_xmdlbm,bj_jzbjb_xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>              </td>
              <td width="21%"> 
                <div align="right">项目小类</div>              </td>
              <td width="29%"> 
                <select name="bj_jzbjb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">项目编号</div>              </td>
              <td width="29%"> 
                <input type="text" name="bj_jzbjb_xmbh" size="20" maxlength="7" >              </td>
              <td width="21%"> 
                <div align="right">地区</div>              </td>
              <td width="29%"> 
                <select name="bj_jzbjb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">项目名称</td>
              <td colspan="3"> 
                <input type="text" name="bj_jzbjb_xmmc" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">饰面</div>              </td>
              <td width="29%"> 
                <select name="bj_jzbjb_smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>              </td>
              <td width="21%" align="right">审核标志 </td>
              <td width="29%"><select name="shbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="N">未审核</option>
                <option value="Y">已审核</option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">工程量计量单位</td>
              <td><select name="bj_jzbjb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%>
              </select></td>
              <td align="right">材料用量计量单位</td>
              <td><select name="cljldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">录入人</td>
              <td width="29%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >              </td>
              <td width="21%" align="right">录入时间</td>
              <td width="29%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><%=dzbjzjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <input type="text" name="agycl" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><%=dzbjzgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <input type="text" name="bgycl" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><%=dzbjgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <input type="text" name="cgycl" size="73" maxlength="50" >              </td>
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
