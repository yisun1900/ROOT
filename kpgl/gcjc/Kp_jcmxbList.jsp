<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String kpxh=request.getParameter("kpxh");

	ls_sql="SELECT '修改' xg,'删除' sc,kp_jcmxb.kpxh as kpxh,kp_jcmxb.kpxmbm as kpxmbm,kp_gckpxm.kpxmmc as kp_gckpxm_kpxmmc,kp_jcmxb.kpjg, DECODE(kp_jcmxb.kpjg,'1','轻微违章','2','严重违章','3','特别严重') as kpjgmc,kp_jcmxb.kpcfbm as kpcfbm,kp_kpdlbm.kpdlmc as kp_kpdlbm_kpdlmc,kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc  ";
	ls_sql+=" FROM kp_kpcfbm,kp_kpdlbm,kp_gckpxm,kp_jcmxb  ";
    ls_sql+=" where kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm and kp_jcmxb.kpxmbm=kp_gckpxm.kpxmbm and kp_jcmxb.kpjg=kp_gckpxm.kpjg";
    ls_sql+=" and kp_jcmxb.kpxh='"+kpxh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_jcmxb.kpxmbm,kp_jcmxb.kpjg,kp_jcmxb.kpcfbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"kp_kpdlbm_kpdlmc","kp_gckpxm_kpxmmc","kpjgmc","xg","sc","kp_kpcfbm_kpcfmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"kpxh","kpxmbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="yrk_editmain.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target=_blank";//
	coluParmHash.put("xg",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"kpxh","kpxmbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="DeleteKp_jcmxb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target=_blank";//
	coluParmHash.put("sc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//列参数对象加入Hash表
	spanColHash.put("kp_gckpxm_kpxmmc","1");//列参数对象加入Hash表
	spanColHash.put("kpjgmc","1");//列参数对象加入Hash表
	spanColHash.put("xg","1");//列参数对象加入Hash表
	spanColHash.put("sc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER ><B>考评结果(考评序号：<%=kpxh%>)</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="22%">考评大类</td>
	<td  width="15%">考评项目</td>
	<td  width="12%">考评结果</td>
	<td  width="6%">修改</td>
	<td  width="6%">删除</td>
	<td  width="15%">考评处罚</td>
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