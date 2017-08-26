<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String xjjlh=request.getParameter("xjjlh");

	ls_sql="SELECT '修改' xg,'删除' sc,kp_xjgdmx.xjjlh as xjjlh,kp_xjgdmx.kpxmbm as kpxmbm,kp_gckpxm.kpxmmc,kp_xjgdmx.kpjg, DECODE(kp_xjgdmx.kpjg,'1','轻微违章','2','严重违章','3','特别严重') as kpjgmc,kp_xjgdmx.kpcfbm as kpcfbm,kp_kpdlbm.kpdlmc,kp_xjgdmx.kf,kp_xjgdmx.sgdfk,kp_xjgdmx.kcjdebl||'%' kcjdebl,wzcs,kp_kpcfbm.kpcfmc,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"kpdlmc","xg","sc","kpxmmc","kpjgmc","kf","sgdfk","kcjdebl","wzcs","kpcfmc","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xjjlh","kpxmbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="yrk_editmain.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target=_blank";//
	coluParmHash.put("xg",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"xjjlh","kpxmbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="DeleteKp_xjgdmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target=_blank";//
	coluParmHash.put("sc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER ><B>施工队检查明细(检查记录号：<%=xjjlh%>)</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">项目大类</td>
	<td  width="5%">修改</td>
	<td  width="5%">删除</td>
	<td  width="12%">检查项目</td>
	<td  width="8%">违规分级</td>
	<td  width="8%">单次扣分</td>
	<td  width="9%">单次罚款</td>
	<td  width="9%">扣除接单额百分比</td>
	<td  width="7%">违章次数</td>
	<td  width="14%">其它处罚</td>
	<td  width="30%">备注</td>
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