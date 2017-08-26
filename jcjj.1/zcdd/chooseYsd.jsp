<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	String khbh=request.getParameter("khbh");
	String ddbh=request.getParameter("ddbh");
	String ppbm=cf.executeQuery("select ppbm from jc_zcdd where ddbh='"+ddbh+"'");

	ls_sql="SELECT jc_zcysd.ddbh,DECODE(jc_zcysd.clzt,'00','录入预算单','01','预算单完成','02','转为正式订单'),jc_zcysd.ppbm,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,jc_zcysd.wdzje,jc_zcysd.hkze,jc_zcysd.lrsj,a.dwmc lrdw,jc_zcysd.bz,jc_zcysd.ppmc,jc_zcysd.gys,zcxlbm";
	ls_sql+=" FROM crm_khxx,jc_zcysd,sq_dwxx a ";
    ls_sql+=" where jc_zcysd.khbh=crm_khxx.khbh and jc_zcysd.dwbh=a.dwbh";
    ls_sql+=" and jc_zcysd.khbh='"+khbh+"' and jc_zcysd.ppbm='"+ppbm+"'";
    ls_sql+=" and jc_zcysd.clzt!='02' ";
    ls_sql+=" order by jc_zcysd.lrsj desc,jc_zcysd.ddbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","drysd.jsp?drddbh="+ddbh);
	pageObj.setPageRow(100);//设置每页显示记录数

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
	pageObj.setEditStr("导入");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材预算单</font></B>（<font color="#FF0000" size="4"><strong>注意：订单中已存在的单品，将不会被导入</strong></font>）
</CENTER>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">订单编号</td>
	<td  width="5%">处理状态</td>
	<td  width="8%">子品牌</td>
	<td  width="4%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="5%">折前总额</td>
	<td  width="5%">折后总额</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入部门</td>
	<td  width="14%">备注</td>
	<td  width="7%">品牌</td>
	<td  width="10%">供应商</td>
	<td  width="8%">主材小类</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
</body>
</html>