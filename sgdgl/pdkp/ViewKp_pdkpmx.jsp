<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT kp_pdkpmx.bqpm,TO_CHAR(kp_pdkpmx.bqdf),kp_pdkpmx.kpzf,sq_sgd.sgdmc, DECODE(kp_pdkpmx.sgdlx,'S0','非直属','S1','直属'),kp_pdkpmx.zbj,kp_pdkpmx.bzs,sgdjbmc,TO_CHAR(kp_pdkpmx.jdqz),kp_pdkpmx.ddbl||'%',kp_pdkpmx.zdbl||'%',kp_pdkpmx.xdbl||'%',kp_pdkpmx.kcjdebfb||'%',kp_pdkpmx.zdjdze,kp_pdkpmx.kjhzdfpe,kp_pdkpmx.lljdze,kp_pdkpmx.jdze,kp_pdkpmx.lljdde,kp_pdkpmx.ddje,kp_pdkpmx.lljzde,kp_pdkpmx.zdje,kp_pdkpmx.lljxde,kp_pdkpmx.xdje,kp_pdkpmx.sqsydze,kp_pdkpmx.sqsydde,kp_pdkpmx.sqsyzde,kp_pdkpmx.sqsyxde,kp_pdkpmx.sqpdbcze,kp_pdkpmx.sqpdbcdde,kp_pdkpmx.sqpdbczde,kp_pdkpmx.sqpdbcxde,kp_pdkpmx.bqjdze,kp_pdkpmx.bqdde,kp_pdkpmx.bqzde,kp_pdkpmx.bqxde,kp_pdkpmx.yjdze,kp_pdkpmx.yjddje,kp_pdkpmx.yjzdje,kp_pdkpmx.yjxdje,kp_pdkpmx.jfdze,kp_pdkpmx.jfddje,kp_pdkpmx.jfzdje,kp_pdkpmx.jfxdje,kp_pdkpmx.sydze,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje,TO_CHAR(kp_pdkpmx.sqpm),DECODE(kp_pdkpmx.hjwbz,'Y','是','N','否'),DECODE(kp_pdkpmx.qjwbz,'Y','是','N','否'),DECODE(kp_pdkpmx.sjbz,'Y','是','N','否'),DECODE(kp_pdkpmx.jjbz,'Y','是','N','否'),kp_pdkpmx.jcf  ";
	ls_sql+=" FROM sq_sgd,kp_pdkpmx,sq_sgdjbbm  ";
    ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and kp_pdkpmx.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_pdkpmx.kpjlh,kp_pdkpmx.sgdlx desc,kp_pdkpmx.bqpm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kpjlh","sq_sgd_sgdmc","kp_pdkpmx_sgdlx","kp_pdkpmx_zbj","kp_pdkpmx_bzs","kp_pdkpmx_jcf","kp_pdkpmx_sgdjbbm","kp_pdkpmx_jdqz","kp_pdkpmx_ddbl","kp_pdkpmx_zdbl","kp_pdkpmx_xdbl","kp_pdkpmx_bqdf","kp_pdkpmx_bqpm","kp_pdkpmx_kpzf","kp_pdkpmx_sqpm","kp_pdkpmx_hjwbz","kp_pdkpmx_qjwbz","kp_pdkpmx_sjbz","kp_pdkpmx_jjbz","kp_pdkpmx_kcjdebfb","kp_pdkpmx_zdjdze","kp_pdkpmx_lljdze","kp_pdkpmx_jdze","kp_pdkpmx_lljdde","kp_pdkpmx_ddje","kp_pdkpmx_lljzde","kp_pdkpmx_zdje","kp_pdkpmx_lljxde","kp_pdkpmx_xdje","kp_pdkpmx_sqsydze","kp_pdkpmx_sqsydde","kp_pdkpmx_sqsyzde","kp_pdkpmx_sqsyxde","kp_pdkpmx_sqpdbcze","kp_pdkpmx_sqpdbcdde","kp_pdkpmx_sqpdbczde","kp_pdkpmx_sqpdbcxde","kp_pdkpmx_bqjdze","kp_pdkpmx_bqdde","kp_pdkpmx_bqzde","kp_pdkpmx_bqxde","kp_pdkpmx_yjdze","kp_pdkpmx_yjddje","kp_pdkpmx_yjzdje","kp_pdkpmx_yjxdje","kp_pdkpmx_jfdze","kp_pdkpmx_jfddje","kp_pdkpmx_jfzdje","kp_pdkpmx_jfxdje","kp_pdkpmx_sydze","kp_pdkpmx_syddje","kp_pdkpmx_syzdje","kp_pdkpmx_syxdje"};
	pageObj.setDisColName(disColName);
*/

/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队派单考评（考评记录号：<%=kpjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(319);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="30">本期排名</td>
	<td  width="40">本期得分</td>
	<td  width="62">考评总分</td>
	<td  width="50">施工队名称</td>
	<td  width="40">施工队类型</td>
	<td  width="55">质保金</td>
	<td  width="45">班组数</td>
	<td  width="40">施工队级别</td>
	<td  width="35">接单权重</td>
	<td  width="35">大单比率</td>
	<td  width="35">中单比率</td>
	<td  width="35">小单比率</td>
	<td  width="40">扣除接单总额百分比</td>
	<td  width="62">最大接单总额</td>
	<td  width="62">扣减后最大分配单额</td>
	<td  width="62">理论接单总额</td>
	<td  width="62">接单总额</td>
	<td  width="62">理论接大单额</td>
	<td  width="62">大单金额</td>
	<td  width="62">理论接中单额</td>
	<td  width="62">中单金额</td>
	<td  width="62">理论接小单额</td>
	<td  width="62">小单金额</td>
	<td  width="62">上期剩余单总额</td>
	<td  width="62">上期剩余大单额</td>
	<td  width="62">上期剩余中单额</td>
	<td  width="62">上期剩余小单额</td>
	<td  width="62">上期派单补偿总额</td>
	<td  width="62">上期派单补偿大单额</td>
	<td  width="62">上期派单补偿中单额</td>
	<td  width="62">上期派单补偿小单额</td>
	<td  width="62">本期接单总额</td>
	<td  width="62">本期大单额</td>
	<td  width="62">本期中单额</td>
	<td  width="62">本期小单额</td>
	<td  width="62">已接单总额</td>
	<td  width="62">已接大单金额</td>
	<td  width="62">已接中单金额</td>
	<td  width="62">已接小单金额</td>
	<td  width="62">奖罚单总额</td>
	<td  width="62">奖罚大单金额</td>
	<td  width="62">奖罚中单金额</td>
	<td  width="62">奖罚小单金额</td>
	<td  width="62">剩余单总额</td>
	<td  width="62">剩余大单金额</td>
	<td  width="62">剩余中单金额</td>
	<td  width="62">剩余小单金额</td>
	<td  width="40">上期排名</td>
	<td  width="40">最后3位标志</td>
	<td  width="40">前5位标志</td>
	<td  width="40">升级标志</td>
	<td  width="40">降级标志</td>
	<td  width="50">基础分</td>
</tr>
<%
	pageObj.displayDateSum();
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