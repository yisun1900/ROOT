<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String tsjlh=request.getParameter("tsjlh");

	ls_sql="SELECT crm_tsbm.tsjlh,crm_tsbm.tsyybm,dm_tsyybm.tsyymc,dm_tslxbm.tslxmc,dm_tsxlbm.tsxlmc,dwmc,zrr,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') clzt,tspp,ppmc,gys,DECODE(rglrbz,'1','系统取得','2','人工录入') rglrbz ";
	ls_sql+=" FROM crm_tsbm,dm_tslxbm,dm_tsxlbm,dm_tsyybm,sq_dwxx  ";
    ls_sql+=" where crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.tslxbm=dm_tslxbm.tslxbm(+)";
    ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh(+) and crm_tsbm.tsjlh='"+tsjlh+"'";
    ls_sql+=" order by crm_tsbm.tslxbm,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditCrm_tsbm.jsp?tsjlh="+tsjlh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//	pageObj.alignStr[3]="align='left'";

//设置显示列
	String[] disColName={"tslxmc","tsxlmc","tsyymc","clzt","dwmc","zrr","tspp","gys","rglrbz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"tsyybm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_tsbm.jsp?tsjlh="+tsjlh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tslxmc","1");//列参数对象加入Hash表
	spanColHash.put("tsxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户投诉原因（投诉记录号：<%=tsjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="10%">投诉报修大类</td>
	<td  width="11%">投诉报修小类</td>
	<td  width="15%">投诉报修原因</td>
	<td  width="6%">处理状态</td>
	<td  width="11%">责任部门</td>
	<td  width="7%">负责人</td>
	<td  width="8%">子品牌</td>
	<td  width="17%">涉及供应商</td>
	<td  width="7%">人工录入</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
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