<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Gdm_rwbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">任务编码(4位)</td>
  <td width="32%"><input type="text" name="rwbm" size="20" maxlength="4"  value="" ></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">任务分类</td>
  <td width="32%"><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from gdm_rwflbm order by rwflbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务名称</td> 
  <td colspan="3"><input type="text" name="rwmc" size="73" maxlength="100"  value="" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">任务对象</td>
  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "rwdx","1+客户&2+施工队&3+供应商&4+设计师&5+质检","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否涉及验收项</td>
  <td><%
	cf.radioToken(out, "sfsjysxm","Y+是&N+否","");
%></td>
  <td align="right" bgcolor="#FFFFFF">验收项目</td>
  <td bgcolor="#FFFFFF"><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where ysxmflbm='05' order by gcysxmbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">是否涉及主材项目</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sfsjzcxm","Y+是&N+否","");
%></td>
  <td align="right" bgcolor="#FFFFFF">涉及主材大类</td>
  <td bgcolor="#FFFFFF"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb='1' order by cldlmc","");
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">涉及主材节点</td>
  <td>
  <select name="sjzcjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  <%
	cf.selectToken(out,"03+测量通知&05+已测量& 25+复尺通知&26+复尺&09+合同已完成&11+合同已确认&13+工厂已接收&15+确定送货时间&17+已通知送货&19+送货安装完成 ","");
%>
  </select></td>
  <td align="right" bgcolor="#FFFFFF">报警级别</td>
  <td bgcolor="#FFFFFF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from gdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报警时间</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bjsj","1+事前报警&2+事后提醒&3+事前事后都提醒&9+不报警","");
%>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">是否影响后续工期</td>
  <td><%
	cf.radioToken(out, "sfyxhxgq","Y+是&N+否","");
%></td>
  <td align="right" bgcolor="#FFFFFF">重点监控任务</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zdjkrw","Y+重点监控&N+非重点监控","");
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
