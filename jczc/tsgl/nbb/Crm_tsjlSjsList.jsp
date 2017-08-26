<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(request.getParameter("sjs"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");



	ls_sql="SELECT distinct crm_tsjl.tsjlh as tsjlh,hfjgmc,crm_tsjl.khbh as khbh,dm_slfsbm.slfsmc as dm_slfsbm_slfsmc,dm_tsyybm.tsyymc as dm_tsyybm_tsyymc,khxm,fwdz,crm_tsjl.slsj as crm_tsjl_slsj,tsnr,DECODE(crm_tsjl.clzt,0,'非客服登记',1,'客服受理',2,'在处理',3,'结案') as jazt,dm_zzjgbm.zzjgmc as dm_zzjgbm_cljgmc  ";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_zzjgbm,dm_slfsbm,dm_tsyybm,dm_hfjgbm,crm_tsbm  ";
    ls_sql+=" where crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+) and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm ";
    ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+) and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.sjs='"+sjs+"'";
	ls_sql+=" and crm_tsbm.tsxlbm='2201'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
    ls_sql+=" order by  crm_tsjl.khbh,crm_tsjl.slsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置显示列
	String[] disColName={"khxm","fwdz","tsjlh","dm_slfsbm_slfsmc","crm_tsjl_slsj","tsnr","jazt","dm_tsyybm_tsyymc","hfjgmc","dm_zzjgbm_cljgmc"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("tsjlh","1");//列参数对象加入Hash表
	spanColHash.put("dm_slfsbm_slfsmc","1");//列参数对象加入Hash表
	spanColHash.put("crm_tsjl_slsj","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	spanColHash.put("jazt","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("crm_tsjl_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计师（<%=sjs%>）投诉明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="6%">投诉序号</td>
	<td  width="5%">受理方式</td>
	<td  width="8%">受理时间</td>
	<td  width="23%">投诉内容</td>
	<td  width="6%">结案状态</td>
	<td  width="10%">投诉原因</td>
	<td  width="11%">回访结果</td>
	<td  width="6%">结案客户是否满意</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>