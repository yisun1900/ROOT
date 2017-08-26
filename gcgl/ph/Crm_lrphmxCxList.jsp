<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String lrph=null;
	lrph=request.getParameter("lrph");
	if (lrph!=null)
	{
		lrph=lrph.trim();
		if (!(lrph.equals("")))	wheresql+=" and (crm_lrphmx.lrph="+lrph+") ";
	}
	ls_sql="SELECT crm_lrphmx.lrxh,crm_lrphmx.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_khxx.qyrq,a.dwmc sbdm,crm_khxx.sjkgrq,crm_khxx.sjjgrq  ";
	ls_sql+=" FROM crm_khxx,crm_lrphmx,sq_dwxx a,sq_sgd ";
    ls_sql+=" where crm_lrphmx.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_lrphmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"lrph","crm_lrphmx_lrxh","khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_qyrq","crm_khxx_sjkgrq","crm_khxx_sjzkrq","crm_khxx_sjjgrq","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">批号明细（批号：<%=lrph%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="6%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="10%">联系方式</td>
	<td  width="21%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="5%">施工队</td>
	<td  width="5%">工程担当</td>
	<td  width="7%">签约日期</td>
	<td  width="10%">签约店面</td>
	<td  width="7%">实开工日期</td>
	<td  width="7%">实竣工日期</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>

