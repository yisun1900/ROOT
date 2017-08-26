<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dwbh=request.getParameter("dwbh");

	String ls_sql=null;

	ls_sql="SELECT b.dwmc ssfgs,a.dwmc as ssdw,sq_yhxx.yhmc as sq_yhxx_yhmc,DECODE(sq_yhxx.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','部门小组','S0','施工队','G0','供应商','J0','加盟商') as sq_yhxx_yhjs,xzzwbm,zwmc,DECODE(sq_yhxx.kfgssq,'0','不授权','1','授权单个分公司','2','<font color=\"#FF0000\">授多个公司</font>','3','授权单个店面','4','授权某一分公司多个店面','5','授权多个分公司多个店面') as kfgssq,sq_yhxx.ygbh,sq_yhxx.yhdlm,DECODE(kdlxtbz,'Y','可以','N','不可登陆') kdlxtbz";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,dm_zwbm";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and sq_yhxx.sfzszg in('Y','N')";
	ls_sql+=" and (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000') OR sq_yhxx.yhdlm is null)";

	ls_sql+=" and sq_yhxx.dwbh='"+dwbh+"'";
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,sq_yhxx.yhmc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(500);//设置每页显示记录数

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"批量授权"};//按钮的显示名称
	String[] buttonLink={"SavePlOneBmSq.jsp?dwbh="+dwbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/xtsq/yhxx/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sq_yhxx_yhmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">按店面批量授权(转正、试用期、登陆名不为空员工才能显示)（只包括本部门员工）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">授权</td>
	<td  width="10%">分公司</td>
	<td  width="14%">所属部门</td>
	<td  width="8%">员工名称</td>
	<td  width="10%">角色</td>
	<td  width="10%">职务</td>
	<td  width="9%">工种</td>
	<td  width="12%">客户资料授权范围</td>
	<td  width="6%">员工序号</td>
	<td  width="10%">用户登陆名</td>
	<td  width="7%">可登陆系统</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>