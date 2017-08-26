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
		wheresql+=" and jc_jjdd.xmzy='"+xmzymc+"'";
	}

	String ls_sql=null;

	ls_sql="SELECT jc_jjdd.ddbh as ddbh,jc_jjdd.xmzy,jc_jjdd.khbh as khbh,jgrq,jc_jjdd.dj as jc_jjdd_dj,jc_jjdd.jjsjs as jc_jjdd_jjsjs,clztmc, DECODE(jc_jjdd.khlx,'1','装修客户','2','家具客户') as jc_jjdd_khlx,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.hth as hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_dwxx   ";
    ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jhazrq<SYSDATE";
	ls_sql+=" and clzt<'08'";
	ls_sql+=wheresql;
    ls_sql+=" order by jhazrq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"ddbh","clztmc","jgrq","khxm","fwdz","hth","jc_jjdd_dj","xmzy","jc_jjdd_jjsjs","jc_jjdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置列超级连接
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
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
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家具安装延期（项目专员：<%=xmzymc%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">订单编号</td>
	<td  width="10%">处理状态</td>
	<td  width="8%">合同竣工日期</td>
	<td  width="6%">客户姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="7%">合同号</td>
	<td  width="5%">订金</td>
	<td  width="6%">项目专员</td>
	<td  width="6%">家居设计师</td>
	<td  width="6%">客户类型</td>
	<td  width="10%">录入部门</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>