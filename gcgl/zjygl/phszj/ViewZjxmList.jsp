<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String khbh=request.getParameter("khbh");


	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs";
	ls_sql+=" ,crm_khxx.sjs,sgdmc sgd,crm_khxx.kgrq,crm_khxx.zjxm,crm_khxx.qye,crm_khxx.qyrq";
	ls_sql+=" ,crm_khxx.sjkgrq,a.dwmc sbdm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a ,sq_sgd";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and zt='2'";
	ls_sql+=" and zjxm=(select zjxm from crm_khxx where khbh='"+khbh+"')";
	ls_sql+=" and kgrq=(select kgrq from crm_khxx where khbh='"+khbh+"')";
	ls_sql+=" order by crm_khxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000000);//设置每页显示记录数

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
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
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >当天开工的客户列表</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="10%">联系方式</td>
	<td  width="6%">设计师</td>
	<td  width="6%">施工队</td>
	<td  width="9%">应开工日期</td>
	<td  width="6%">工程担当</td>
	<td  width="7%">签约额</td>
	<td  width="9%">签约日期</td>
	<td  width="9%">实开工日期</td>
	<td  width="7%">签约店面</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>