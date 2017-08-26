<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String sgd=request.getParameter("sgd");
	String lrsj=request.getParameter("lrsj");
	String lrsj2=request.getParameter("lrsj2");

	String ls_sql=null;

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队检查记录</font></B>
</CENTER>
<%

	ls_sql="SELECT gdm_gdjcjl.jcjlh,sgdmc,fkze,kfzs,crm_khxx.hth,crm_khxx.khxm,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,xjlxmc,xjjgmc,DECODE(cfspbz,'2','未审批','3','审批通过','4','审批未通过'),DECODE(gdm_gdjcjl.kpbz,'N','未考评','Y','已考评'),DECODE(gdm_gdjcjl.jsbz,'N','未结算','Y','已结算'),gdm_gdjcjl.bz,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm  ";
	ls_sql+=" FROM gdm_gdjcjl,crm_khxx,sq_sgd,kp_jclxbm,dm_jcjgbm  ";
    ls_sql+=" where gdm_gdjcjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh and gdm_gdjcjl.jclxbm=kp_jclxbm.jclxbm";
	ls_sql+=" and gdm_gdjcjl.sgd='"+sgd+"' ";//FBJ12:工程部
	ls_sql+=" and gdm_gdjcjl.jcjgbm=dm_jcjgbm.jcjgbm ";//FBJ12:工程部
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	ls_sql+=" and (gdm_gdjcjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals(""))) ls_sql+=" and (gdm_gdjcjl.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}
    ls_sql+=" order by gdm_gdjcjl.jcjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jcjlh","gdm_gdjcjl_khbh","gdm_gdjcjl_xjr","gdm_gdjcjl_xjsj","jclxbm","dm_jcjgbm_xjjgmc","gdm_gdjcjl_lrr","gdm_gdjcjl_lrsj","gdm_gdjcjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jcjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewGdm_gdjcjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jcjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">检查记录号</td>
	<td  width="4%">施工队</td>
	<td  width="5%">罚款总额</td>
	<td  width="4%">扣分总数</td>
	<td  width="5%">合同号</td>
	<td  width="4%">客户姓名</td>
	<td  width="4%">检查人</td>
	<td  width="5%">检查时间</td>
	<td  width="6%">检查类型</td>
	<td  width="6%">检查结果</td>
	<td  width="5%">审批标志</td>
	<td  width="4%">考评标志</td>
	<td  width="4%">结算标志</td>
	<td  width="17%">检查情况说明</td>
	<td  width="13%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">工程担当</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>