<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>拷贝Excel文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
       <b>拷贝Excel文件－－&gt;型材门（订单号：<%=ddbh%>）</b>
		  <input name="ddbh" type="hidden" value="<%=ddbh%>">
		  <table width="100%" border="0" style="FONT-SIZE:14">
          <tr>
            <td width="16%" height="25">&nbsp;</td>
            <td width="84%"><strong>第一步</strong>：<a href="拷贝型材门模板.xls"><b>点击右键另存为，下载型材门拷贝模板</b></a> </td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第二步</strong>：根据Excel模板格式，录入型材门明细，<b><font color="#FF0000">注意：行之间即使数据相同也不要合并</font></b></td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第三步</strong>：清空下面编辑框中演示数据</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第四步</strong>：全选Excel文件，拷贝</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第五步</strong>：把拷贝内容粘贴到下面编辑框中</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第六步</strong>：点击
            <input name="button" type="button" onClick="f_do(editform)"  value="下一步"></td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td width="68%" align="center"> 
        <textarea name="dataStr" cols="137" rows="27">
型材门类型	型材门名称	安装位置	推拉门：边框型号； 吸塑：刀型；包覆：刀型；板材铝门：门型	边框颜色	其它收费	总高度(mm)	总宽度(mm)	面板一材料/花色	面板一芯板配置	面板一高度(mm)	面板一宽度(mm)	面板二材料/花色	面板二芯板配置	面板二高度(mm)	面板二宽度(mm)	备注
推拉门	储物间门	储物间	边框系列型号1	黑色	12	1000	500	面板材料1	芯板配置	1000	300	面板材料3		1000	200	
包覆	橱柜门	橱柜	70A	黄色	0	1000	300	p108红樱桃（台湾）	凹凸芯板/普通玻璃	1000	200	p109红樱桃（台湾）	凹凸芯板/普通玻璃	1000	100	仅能做门板
板材铝门	隔断门	隔断	铝合金封边平板门	黄色	0	1000	500	三聚氰胺板		1000	500					
包覆	衣柜门	衣柜	70A	黄色	0	1000	300	p108红樱桃（台湾）	凹凸芯板/普通玻璃	1000	200	p109红樱桃（台湾）	凹凸芯板/普通玻璃	1000	100	仅能做门板
</textarea></td>
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
	if(	javaTrim(FormName.dataStr)=="") {
		alert("请拷贝[柜体配件]！");
		FormName.dataStr.focus();
		return false;
	}

	FormName.action="DisplayExcelCopyXcm.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
