<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">申请序号</td>
	<td  width="5%">领取状态</td>
	<td  width="8%">申领单位</td>
	<td  width="4%">申领人</td>
	<td  width="6%">录入日期</td>
	<td  width="4%">一级审批人</td>
	<td  width="6%">一级审批时间</td>
	<td  width="5%">一级审批结论</td>
	<td  width="17%">一级审批说明</td>
	<td  width="18%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT oa_xcplqsq.sqxh, DECODE(oa_xcplqsq.lqzt,'1','未完成','2','完成申请','3','一级审批','4','二级审批','5','三级审批','6','已领取'),a.dwmc dw ,oa_xcplqsq.slr,oa_xcplqsq.lrrq,oa_xcplqsq.yjspr,oa_xcplqsq.yjspsj, DECODE(oa_xcplqsq.yjspjl,'1','同意','2','返回上级','3','撤销'),oa_xcplqsq.yjspsm,oa_xcplqsq.bz  ";
	ls_sql+=" FROM oa_xcplqsq,sq_dwxx a";
    ls_sql+=" where oa_xcplqsq.dwbh=a.dwbh(+)  ";
	ls_sql+=" and oa_xcplqsq.lqzt='3' and oa_xcplqsq.yjspjl='2'";
	if (yhjs.equals("A0") )
	{
	}
	else{
		ls_sql+=" and oa_xcplqsq.dwbh='"+dwbh+"'";
	}
    ls_sql+=" order by oa_xcplqsq.yjspsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","EditOa_xcplqsq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewOa_xcplqsq.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sqxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%>
</table>

<form method="post" action="SaveInsertOa_xcplqsq.jsp" name="insertform" >
  <div align="center">印刷品领取申请（<font color="#0000CC"><b>注意：存盘后可录明细</b></font>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font>申领分公司</td>
      <td width="35%"> 
<%
	if (yhjs.equals("A0") )
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgsbh,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>

      </td>
      <td align="right" width="15%"><font color="#CC0033">*</font>申领单位</td>
      <td width="35%">
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") )
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font>申领人</td>
      <td width="35%"> 
        <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">计划领取日期</td>
      <td width="35%"> 
        <input type="text" name="jhlqrq" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font><font color="#0000CC">录入人</font></td>
      <td width="35%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0033">*</font><font color="#0000CC">录入日期</font></td>
      <td width="35%"> 
        <input type="text" name="lrrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="button"  value="录入明细" onClick="f_lrmx(editform)" name="button" disabled>
        <input type="button"  value="查看明细" onClick="f_ckmx(editform)" name="button" disabled>
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[申领分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[申领单位]！");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "计划领取日期"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrrq)=="") {
		alert("请输入[录入日期]！");
		FormName.lrrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "录入日期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
