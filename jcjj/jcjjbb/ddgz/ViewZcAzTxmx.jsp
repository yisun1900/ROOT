<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");
	String wheresql="";
	String xmzymc="";
	if (zdyhbz.equals("Y"))
	{
		xmzymc="全部项目专员";
	}
	else 
	{
		xmzymc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
		wheresql+=" and jc_zcdd.xmzy='"+xmzymc+"'";
	}


	String ls_sql=null;

	ls_sql="SELECT jc_zcdd.ddbh, DECODE(jc_zcdd.clzt,'00','订单未完成','01','订单已完成','02','订单已确认','03','已送货'),DECODE(jc_zcdd.xclbz,'1','不需测量','2','等待测量通知','3','测量已通知','4','已测量'),jc_zcdd.htshsj,jc_zcdd.tzshsj,crm_khxx.khxm,crm_khxx.lxfs,jc_zcdd.clgw,jc_zcdd.xmzy,jc_zcdd.hkze,dwmc,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx  ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and jc_zcdd.htshsj<SYSDATE+2 ";
	ls_sql+=" and jc_zcdd.clzt<'03'";
	ls_sql+=wheresql;
    ls_sql+=" order by jc_zcdd.htshsj,jc_zcdd.ddbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","jc_jjdd_clzt","jhccsj","khxm","fwdz","hth","jc_jjdd_dj","yhmc","jc_jjdd_jjsjs","jc_jjdd_ssje","jc_jjdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材送货提醒（项目专员：<%=xmzymc%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">订单编号</td>
	<td  width="8%">处理状态</td>
	<td  width="6%">需测量</td>
	<td  width="10%">合同送货时间</td>
	<td  width="10%">通知送货时间</td>
	<td  width="6%">客户姓名</td>
	<td  width="10%">联系方式</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="6%">项目专员</td>
	<td  width="10%">合同总额</td>
	<td  width="10%">录入部门</td>
	<td  width="11%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>