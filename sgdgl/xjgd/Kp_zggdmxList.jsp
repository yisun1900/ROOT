<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String xjjlh=request.getParameter("xjjlh");

	ls_sql="SELECT '修改' xg,'删除' sc,kp_zggdmx.zgjlh, DECODE(kp_zggdmx.clzt,'1','未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') as clzt,kp_zggdmx.yqjjsj,dwmc,kp_zggdmx.fkbmjsr,kp_zggdmx.zgsm";
	ls_sql+=" FROM kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_zggdmx.zgjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"zgjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="EditKp_zggdmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target=_blank";//
	coluParmHash.put("xg",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"zgjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="DeleteKp_zggdmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target=_blank";//
	coluParmHash.put("sc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER ><B>整改项目明细(检查记录号：<%=xjjlh%>)</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">修改</td>
	<td  width="4%">删除</td>
	<td  width="8%">整改记录号</td>
	<td  width="6%">处理状态</td>
	<td  width="7%">要求解决</td>
	<td  width="10%">反馈部门</td>
	<td  width="5%">接收人</td>
	<td  width="56%">整改说明</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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