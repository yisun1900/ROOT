<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dwbh=request.getParameter("dwbh");
	String ts1=request.getParameter("ts1");
	String ts2=request.getParameter("ts2");


	String ls_sql=null;
	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,crm_zxkhxx.ywy,crm_zxkhxx.lrr";
	ls_sql+=" ,crm_scbkhxx.lrsj,round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0) mxxts,crm_zxkhxx.lrsj zxlrsj,round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0) zxts,crm_khxx.qyrq ";
	ls_sql+=" ,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') ";
	ls_sql+=" ,b.dwmc as zxdm,a.dwmc zxdjbm,crm_zxkhxx.khjl";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,crm_khxx,crm_scbkhxx";
	ls_sql+=" where crm_zxkhxx.zxdjbm=a.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
	ls_sql+=" and crm_khxx.zt='2' ";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
	if (!ts1.equals(""))
	{
		ls_sql+=" and round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>"+ts1;
	}
	if (!ts2.equals(""))
	{
		ls_sql+=" and round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<="+ts2;
	}
	ls_sql+=" order by mxxts,zxts";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">咨询客户--查询</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="5%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="5%">业务员</td>
	<td  width="5%">咨询客户录入人</td>

	<td  width="7%">毛信息录入时间</td>
	<td  width="5%">毛信息录入签单天数</td>
	<td  width="7%">咨询客户录入时间</td>
	<td  width="5%">咨询客户录入签单天数</td>
	<td  width="7%">签约日期</td>
	<td  width="8%">咨询状态</td>
	<td  width="8%">咨询店面</td>
	<td  width="8%">咨询客户录入部门</td>
	<td  width="4%">客户经理</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>