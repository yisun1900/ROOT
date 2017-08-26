<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String wheresql1="";


	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (!(fgsbh.equals("")))	wheresql+=" and  (crm_tsjl.ssfgs='"+fgsbh+"')";
	if (!(fgsbh.equals("")))	wheresql1+=" and  (crm_tshfjl.hffgs='"+fgsbh+"')";


	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (crm_tsjl.lx='"+lx+"')";
	}

%>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


<B>受理非客服登记信息</B>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">受理序号</td>
	<td  width="5%">投诉来源</td>
	<td  width="4%">类型</td>
	<td  width="5%">姓名</td>
	<td  width="11%">录入时间</td>
	<td  width="9%">录入部门</td>
	<td  width="35%">投诉报修内容</td>
	<td  width="6%">客户编号</td>
	<td  width="16%">房屋地址</td>
</tr>

<%

	ls_sql="SELECT crm_tsjl.tsjlh,slfsmc,DECODE(crm_tsjl.lx,'1','投诉','2','报修') lx,crm_khxx.khxm,crm_tsjl.lrsj,sq_dwxx.dwmc slbm,crm_tsjl.tsnr,crm_khxx.khbh,crm_khxx.fwdz";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_dwxx";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slbm=sq_dwxx.dwbh";
	ls_sql+=" and crm_tsjl.clzt='0'";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
    pageObj.sql=ls_sql;

	pageObj.initPage("","","","kfsl.jsp");
	pageObj.setDateType("long");
	pageObj.setEditStr("受理");
	pageObj.setPageRow(200);//设置每页显示记录数

//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[6]="align='left'";


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();


%>


<P><B>投诉记录—→需人工通知相关部门、但目前未通知</B>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="12%">责任部门</td>
	<td  width="8%">通知状态</td>
	<td  width="26%">投诉原因</td>
	<td  width="8%">投诉序号</td>
	<td  width="6%">姓名</td>
	<td  width="10%">结案状态</td>
	<td  width="8%">投诉来源</td>
	<td  width="17%">录入时间</td>
</tr>
<%
	ls_sql="SELECT crm_tsjl.tsjlh as tsjlh,crm_tsjl.khbh as khbh,DECODE(crm_tsjl.clzt,0,'未受理',1,'已受理',2,'在处理',3,'结案','9','不立案') jazt,crm_tsbm.tsyybm,'（'||tsxlmc||'）'||tsyymc tsxlmc,slfsmc,crm_khxx.khxm ,crm_tsjl.lrsj,crm_tsbm.dwbh,dwmc,DECODE(crm_tsbm.sfytz,'0','未通知','1','已通知','2','不需通知') as sfytz";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,dm_tsyybm,crm_tsbm,sq_dwxx";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_tsjl.lx='1' ";//1：投诉；2：报修
	ls_sql+=" and crm_tsjl.clzt in('1','2')";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ls_sql+=" and crm_tsbm.sfytz='0'";//0：未通知；1：已通知；2：不需通知
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","SaveCrm_tsbm.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
	pageObj.setEditStr("通知");
	pageObj.setDateType("long");

//设置显示列
	String[] disColName={"dwmc","sfytz","tsxlmc","tsjlh","khxm","jazt","slfsmc","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName1={"tsjlh","tsyybm"};
	pageObj.setKey(keyName1);


	
	pageObj.alignStr[2]="align='left'";

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey3={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey3;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
<P>
<B>报修记录—→需人工通知相关部门、但目前未通知</B>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="12%">责任部门</td>
	<td  width="8%">通知状态</td>
	<td  width="26%">报修原因</td>
	<td  width="8%">报修序号</td>
	<td  width="6%">姓名</td>
	<td  width="10%">结案状态</td>
	<td  width="8%">投诉来源</td>
	<td  width="17%">录入时间</td>
</tr>
<%
	ls_sql="SELECT crm_tsjl.tsjlh,crm_tsjl.khbh,DECODE(crm_tsjl.clzt,0,'未受理',1,'已受理',2,'在处理',3,'结案','9','不立案') jazt,crm_tsbm.tsyybm,'（'||tsxlmc||'）'||tsyymc tsxlmc,slfsmc,crm_khxx.khxm ,crm_tsjl.lrsj,crm_tsbm.dwbh,dwmc,DECODE(crm_tsbm.sfytz,'0','未通知','1','已通知','2','不需通知') as sfytz";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,dm_tsyybm,crm_tsbm,sq_dwxx";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_tsjl.lx='2'";//1：投诉；2：报修
	ls_sql+=" and crm_tsjl.clzt in('1','2')";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ls_sql+=" and crm_tsbm.sfytz='0'";//0：未通知；1：已通知；2：不需通知
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","SaveCrm_tsbm.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
	pageObj.setEditStr("通知");
	pageObj.setDateType("long");
//设置显示列
	String[] disColName1={"dwmc","sfytz","tsxlmc","tsjlh","khxm","jazt","slfsmc","lrsj"};
	pageObj.setDisColName(disColName1);
	pageObj.alignStr[2]="align='left'";
/*
*/

//设置主键
	String[] keyName2={"tsjlh","tsyybm"};
	pageObj.setKey(keyName2);

//设置列超级连接

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey4={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey4;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey5={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey5;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.displayFoot();
%> 

<P>
<B>回访反馈问题—→需人工通知相关部门、但目前未通知</B>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="13%">反馈部门</td>
	<td  width="8%">通知状态</td>
	<td  width="9%">回访记录号</td>
	<td  width="7%">姓名</td>
	<td  width="9%">回访时间</td>
	<td  width="27%">客户回访情况</td>
	<td  width="22%">回访中出现的新问题</td>
</tr>
<%
	ls_sql="SELECT crm_tshfjl.hfjlh as hfjlh,crm_tshffkbm.dwbh,dwmc,DECODE(crm_tshffkbm.clzt,'0','未通知','1','已通知未查看','2','已查看') as clzt,crm_tshfjl.khbh as khbh,crm_khxx.khxm,crm_tshfjl.hfsj,khhfqk,cxxwt";
	ls_sql+=" FROM crm_tshffkbm,crm_tshfjl,crm_khxx,sq_dwxx";
    ls_sql+=" where crm_tshfjl.hfjlh=crm_tshffkbm.hfjlh and crm_tshffkbm.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_tshfjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_tshffkbm.clzt='0'";//0：未通知；1：已通知未查看；2：已查看
	ls_sql+=wheresql1;
    ls_sql+=" order by crm_tshfjl.hfjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","SaveCrm_hfbm.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
	pageObj.setEditStr("通知");
//设置显示列
	String[] disColName2={"dwmc","clzt","hfjlh","khxm","hfsj","khhfqk","cxxwt"};
	pageObj.setDisColName(disColName2);
/*
*/

//设置主键
	String[] keyName3={"hfjlh","dwbh"};
	pageObj.setKey(keyName3);

	pageObj.alignStr[5]="align='left'";
	pageObj.alignStr[6]="align='left'";

//设置列超级连接

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey6={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey6;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("crm_tsjl_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey7={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey7;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</body>
</html>