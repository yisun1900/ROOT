<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>未按计划解决</B> 
</CENTER>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">投诉序号</td>
	<td  width="5%">责任部门</td>
	<td  width="3%">负责人</td>
	<td  width="6%">投诉原因</td>
	<td  width="4%">处理状态</td>
	<td  width="3%">姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="4%">计划解决时间</td>
	<td  width="4%">出方案时间</td>
	<td  width="3%">处理人</td>
	<td  width="4%">处理时间</td>
	<td  width="20%">处理情况</td>
	<td  width="3%">设计师</td>
	<td  width="3%">施工队</td>
	<td  width="6%">投诉来源</td>
	<td  width="4%">受理时间</td>
	<td  width="6%">结案状态</td>
	<td  width="8%">涉及厂商</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));
	
	ls_sql="SELECT  crm_tsjl.tsjlh,crm_tsbm.zrr,crm_tsjl.khbh,tsxlmc,dm_slfsbm.slfsmc,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,crm_tsjl.slsj,crm_tsbm.dwbh,sq_dwxx.dwmc zrbm,crm_tsbm.tzsj,crm_tsbm.tsyybm,crm_tsbm.tspp";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as clzt,crm_khxx.sjs";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') as jazt,sgdmc";
	ls_sql+=" ,crm_tsbm.clr,crm_tsbm.clsj,crm_tsbm.clqk,crm_tsbm.jhjjsj,crm_tsbm.sjcfasj";

	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,crm_tsbm,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)";
    ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修
	ls_sql+=" and crm_tsbm.clzt in('1','2','4','6','7','8','9','A','B','C')";
	ls_sql+=" and crm_tsbm.jhjjsj<SYSDATE";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsbm.jssj desc,crm_tsbm.cljlh,crm_tsbm.tsyybm" ;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);//设置每页显示记录数
//设置显示列
	String[] disColName={"tsjlh","zrbm","zrr","tsxlmc","clzt","khxm","fwdz","jhjjsj","sjcfasj","clr","clsj","clqk","sjs","sgdmc","slfsmc","slsj","jazt","tspp"};
	pageObj.setDisColName(disColName);


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
	pageObj.printDate();
%> 
</table>
</body>
</html>
