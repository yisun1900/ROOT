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
		wheresql+=" and jc_mmydd.xmzy='"+xmzymc+"'";
	}

	String ls_sql=null;

	ls_sql="SELECT yddbh,jc_mmydd.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.jgrq,DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') wjqk,jc_mmydd.sqdj,jc_mmydd.clgw,jc_mmydd.xmzy,b.dwmc pdgc,jc_mmydd.htrq,jhazsj, DECODE(jc_mmydd.clzt,'00','录入未完成','01','预订单完成','02','已派单','03','已完成初测','04','签订合同','05','已入库','06','安装完成','99','取消订单') clzt,a.dwmc lrbm ";
	ls_sql+=" from  jc_mmydd,crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where jc_mmydd.dwbh=a.dwbh and jc_mmydd.pdgc=b.dwbh(+)";
	ls_sql+=" and jc_mmydd.khbh=crm_khxx.khbh ";
	ls_sql+=" and jhazsj<SYSDATE";
	ls_sql+=" and clzt<'06'";
	ls_sql+=wheresql;
	ls_sql+=" order by jhazsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"yddbh","khxm","hth","jgrq","wjqk","sqdj","clgw","xmzy","pdgc","htrq","jhazsj","clzt","lrbm"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">木门安装延期（项目专员：<%=xmzymc%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">预订单号</td>
	<td  width="6%">客户姓名</td>
	<td  width="9%">合同号</td>
	<td  width="8%">合同竣工日期</td>
	<td  width="6%">五金情况</td>
	<td  width="6%">木门定金</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="12%">派单工厂</td>
	<td  width="7%">签合同日期</td>
	<td  width="7%">合同安装时间</td>
	<td  width="7%">处理状态</td>
	<td  width="12%">录入部门</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>