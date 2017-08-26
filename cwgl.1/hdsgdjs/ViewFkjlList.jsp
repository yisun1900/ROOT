<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String gdjsjlh=request.getParameter("gdjsjlh");

	String ls_sql=null;

	ls_sql="SELECT kp_xjgdjl.xjjlh,sgdmc,crm_khxx.khxm,fkze,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,DECODE(cfspbz,'2','未审批','3','审批通过','4','审批未通过'),DECODE(kp_xjgdjl.kpbz,'N','未考评','Y','已考评'),DECODE(kp_xjgdjl.jsbz,'N','未结算','Y','已结算'),kp_xjgdjl.bz ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm  ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
    ls_sql+=" and kp_xjgdjl.jsjlh='"+gdjsjlh+"' ";
    ls_sql+=" order by kp_xjgdjl.xjjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


//设置主键
	String[] keyName={"xjjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xjjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/zjygl/xjgd/ViewKp_xjgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xjjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">罚款记录（结算记录号：<%=gdjsjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">处罚记录号</td>
	<td  width="6%">施工队</td>
	<td  width="6%">客户姓名</td>
	<td  width="8%">罚款总额</td>
	<td  width="5%">处罚人</td>
	<td  width="8%">处罚时间</td>
	<td  width="9%">处罚类型</td>
	<td  width="6%">审批标志</td>
	<td  width="6%">考评标志</td>
	<td  width="6%">结算标志</td>
	<td  width="33%">处罚情况说明</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>