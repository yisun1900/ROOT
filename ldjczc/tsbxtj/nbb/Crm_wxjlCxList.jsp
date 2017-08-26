<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String sgd=request.getParameter("sgd");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+sgd+"'");



	ls_sql="SELECT distinct crm_tsjl.tsjlh as tsjlh,crm_tsjl.khbh as khbh,tsnr,tsxlmc,slfsmc,tsyymc,crm_khxx.khxm,crm_khxx.fwdz,crm_tsjl.slsj,crm_tsjl.hfsj,DECODE(crm_tsjl.clzt,0,'非客服登记',1,'客服受理',2,'在处理',3,'结案') as jazt,hfjgmc,zzjgmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_zzjgbm,dm_slfsbm,dm_tsxlbm,dm_tsyybm,crm_tsbm,dm_hfjgbm  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm ";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
    ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+) ";
	ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
	ls_sql+=" and (crm_tsbm.tslxbm='11')";//2：报修
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
    ls_sql+=" order by  crm_tsjl.khbh,crm_tsjl.slsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//设置每页显示记录数

//设置显示列
	String[] disColName={"khxm","fwdz","tsjlh","slfsmc","slsj","tsnr","tsxlmc","tsyymc","jazt","hfjgmc","zzjgmc"};
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
	spanColHash.put("slfsmc","1");//列参数对象加入Hash表
	spanColHash.put("slsj","1");//列参数对象加入Hash表
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
  <B><font size="3">施工队报修明细（<%=dwmc%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="6%">报修记录</td>
	<td  width="5%">受理方式</td>
	<td  width="7%">受理时间</td>
	<td  width="25%">报修内容</td>
	<td  width="6%">小类</td>
	<td  width="12%">原因</td>
	<td  width="6%">结案状态</td>
	<td  width="6%">回访结果</td>
	<td  width="6%">结案客户是否满意</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>