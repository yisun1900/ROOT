<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String day=request.getParameter("day");
	String qssj=request.getParameter("qssj");
	String jzsj=request.getParameter("jzsj");



	ls_sql=" select '',crm_tsjl.tsjlh,crm_tsjl.khbh,crm_tsjl.khxm,crm_tsjl.fwdz,crm_tsjl.sjs,sgdmc sgd,crm_tsjl.zjy,slfsmc,tslxmc,tsyymc,slsj,b.dwmc slbm,yhmc,DECODE(clzt,0,'非客服登记',1,'客服受理',2,'在处理',3,'结案')";
	ls_sql+=" from crm_tsjl,dm_slfsbm,dm_tslxbm,dm_tsyybm,sq_sgd,sq_dwxx b,sq_yhxx";
	ls_sql+=" where crm_tsjl.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tslxbm=dm_tslxbm.tslxbm ";
	ls_sql+=" and crm_tsjl.sgd=sq_sgd.sgd(+) and crm_tsjl.slbm=b.dwbh(+) and crm_tsjl.slr=sq_yhxx.yhdlm(+)";

	ls_sql+=" and zxhfsj is null and lx='2' and clzt!='3'";
	ls_sql+=" and ROUND(SYSDATE-slsj)="+day;
	
	ls_sql+=" order by crm_tsjl.slsj,crm_tsjl.tsjlh";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

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
  <B><font size="2">投诉<%=day%>天后至今未回访明细
  <BR>(受理时间：<%=qssj%>--<%=jzsj%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="6%">投诉记录号</td>
	<td  width="6%">客户编号</td>
	<td  width="5%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="5%">施工队</td>
	<td  width="5%">质检员</td>
	<td  width="5%">受理方式</td>
	<td  width="7%">大类</td>
	<td  width="11%">小类</td>
	<td  width="7%">受理时间</td>
	<td  width="7%">受理部门</td>
	<td  width="5%">受理人</td>
	<td  width="5%">处理状态</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>
</body>
</html>