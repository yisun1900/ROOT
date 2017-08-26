<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String kpjlh=null;
	kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT kp_sgdkpjg.kpjlh as kpjlh,kp_sgdkpjg.sgd,sgdmc as sq_dwxx_dwmc,sq_sgdjbbm.sgdjbmc as sq_sgdjbbm_sgdjbmc,kp_sgdkpjg.zbj as kp_sgdkpjg_zbj,kp_sgdkpjg.bzs as kp_sgdkpjg_bzs,kp_sgdkpjg.jcf as kp_sgdkpjg_jcf,kp_sgdkpjg.kpgds as kp_sgdkpjg_kpgds,kp_sgdkpjg.zjyzldf as kp_sgdkpjg_zjyzldf,kp_sgdkpjg.xjyzldf as kp_sgdkpjg_xjyzldf,kp_sgdkpjg.cczldf as kp_sgdkpjg_cczldf,kp_sgdkpjg.zjyaqdf as kp_sgdkpjg_zjyaqdf,kp_sgdkpjg.xjyaqdf as kp_sgdkpjg_xjyaqdf,kp_sgdkpjg.ccaqdf as kp_sgdkpjg_ccaqdf,kp_sgdkpjg.zjygqdf as kp_sgdkpjg_zjygqdf,kp_sgdkpjg.zjygldf as kp_sgdkpjg_zjygldf,kp_sgdkpjg.xjygldf as kp_sgdkpjg_xjygldf,kp_sgdkpjg.ccgldf as kp_sgdkpjg_ccgldf,kp_sgdkpjg.khpjdf as kp_sgdkpjg_khpjdf,kp_sgdkpjg.tsdf as kp_sgdkpjg_tsdf,kp_sgdkpjg.wxdf as kp_sgdkpjg_wxdf,kp_sgdkpjg.ybjdf as kp_sgdkpjg_ybjdf,kp_sgdkpjg.bqdf as kp_sgdkpjg_bqdf,kp_sgdkpjg.sqzf as kp_sgdkpjg_sqzf,kp_sgdkpjg.bqzf as kp_sgdkpjg_bqzf,kp_sgdkpjg.sqpm as kp_sgdkpjg_sqpm,kp_sgdkpjg.bqpm as kp_sgdkpjg_bqpm, DECODE(kp_sgdkpjg.pmfd,'1','1到15位','2','16到45位','3','46位以后') as kp_sgdkpjg_pmfd, DECODE(kp_sgdkpjg.hjwbz,'Y','是','N','否') as kp_sgdkpjg_hjwbz, DECODE(kp_sgdkpjg.qjwbz,'Y','是','N','否') as kp_sgdkpjg_qjwbz, DECODE(kp_sgdkpjg.sjbz,'Y','是','N','否') as kp_sgdkpjg_sjbz, DECODE(kp_sgdkpjg.jjbz,'Y','是','N','否') as kp_sgdkpjg_jjbz,kp_sgdkpjg.ddbl*100||'%' as kp_sgdkpjg_ddbl,kp_sgdkpjg.zdbl*100||'%' as kp_sgdkpjg_zdbl,kp_sgdkpjg.xdbl*100||'%' as kp_sgdkpjg_xdbl,kp_sgdkpjg.ddbzs as kp_sgdkpjg_ddbzs,kp_sgdkpjg.zdbzs as kp_sgdkpjg_zdbzs,kp_sgdkpjg.xdbzs as kp_sgdkpjg_xdbzs,kp_sgdkpjg.ddjls as kp_sgdkpjg_ddjls,kp_sgdkpjg.zdjls as kp_sgdkpjg_zdjls,kp_sgdkpjg.xdjls as kp_sgdkpjg_xdjls,kp_sgdkpjg.kdds as kp_sgdkpjg_kdds,kp_sgdkpjg.kzds as kp_sgdkpjg_kzds,kp_sgdkpjg.kxds as kp_sgdkpjg_kxds,kp_sgdkpjg.tsjcdd as kp_sgdkpjg_tsjcdd,kp_sgdkpjg.tsjczd as kp_sgdkpjg_tsjczd,kp_sgdkpjg.tsjcxd as kp_sgdkpjg_tsjcxd,kp_sgdkpjg.kjdds as kp_sgdkpjg_kjdds,kp_sgdkpjg.kjzds as kp_sgdkpjg_kjzds,kp_sgdkpjg.kjxds as kp_sgdkpjg_kjxds,kp_sgdkpjg.kjdzs as kp_sgdkpjg_kjdzs,kp_sgdkpjg.kjdze as kp_sgdkpjg_kjdze,kp_sgdkpjg.yjdds as kp_sgdkpjg_yjdds,kp_sgdkpjg.yjddje as kp_sgdkpjg_yjddje,kp_sgdkpjg.yjzds as kp_sgdkpjg_yjzds,kp_sgdkpjg.yjzdje as kp_sgdkpjg_yjzdje,kp_sgdkpjg.yjxds as kp_sgdkpjg_yjxds,kp_sgdkpjg.yjxdje as kp_sgdkpjg_yjxdje,kp_sgdkpjg.ywgs as kp_sgdkpjg_ywgs,kp_sgdkpjg.zsgds as kp_sgdkpjg_zsgds  ";
	ls_sql+=" FROM kp_sgdkpjg,sq_sgd,sq_sgdjbbm  ";
    ls_sql+=" where kp_sgdkpjg.sgdjbbm=sq_sgdjbbm.sgdjbbm(+) and kp_sgdkpjg.sgd=sq_sgd.sgd";
    ls_sql+=" and kp_sgdkpjg.kpjlh="+kpjlh;
    ls_sql+=" order by bqpm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//设置显示列
	String[] disColName={"kp_sgdkpjg_bqpm","sq_dwxx_dwmc","kp_sgdkpjg_bqzf","kp_sgdkpjg_kjdds","kp_sgdkpjg_kjzds","kp_sgdkpjg_kjxds","kp_sgdkpjg_kjdzs","kp_sgdkpjg_kjdze","kp_sgdkpjg_yjdds","kp_sgdkpjg_yjddje","kp_sgdkpjg_yjzds","kp_sgdkpjg_yjzdje","kp_sgdkpjg_yjxds","kp_sgdkpjg_yjxdje","kp_sgdkpjg_bqdf","kp_sgdkpjg_sqzf","kp_sgdkpjg_sqpm","kp_sgdkpjg_pmfd","kp_sgdkpjg_hjwbz","kp_sgdkpjg_qjwbz","kp_sgdkpjg_sjbz","kp_sgdkpjg_jjbz","sq_sgdjbbm_sgdjbmc","kp_sgdkpjg_zbj","kp_sgdkpjg_bzs","kp_sgdkpjg_jcf","kp_sgdkpjg_kpgds","kp_sgdkpjg_zjyzldf","kp_sgdkpjg_xjyzldf","kp_sgdkpjg_cczldf","kp_sgdkpjg_zjyaqdf","kp_sgdkpjg_xjyaqdf","kp_sgdkpjg_ccaqdf","kp_sgdkpjg_zjygqdf","kp_sgdkpjg_zjygldf","kp_sgdkpjg_xjygldf","kp_sgdkpjg_ccgldf","kp_sgdkpjg_khpjdf","kp_sgdkpjg_tsdf","kp_sgdkpjg_wxdf","kp_sgdkpjg_ybjdf","kp_sgdkpjg_ddbl","kp_sgdkpjg_zdbl","kp_sgdkpjg_xdbl","kp_sgdkpjg_ddbzs","kp_sgdkpjg_zdbzs","kp_sgdkpjg_xdbzs","kp_sgdkpjg_ddjls","kp_sgdkpjg_zdjls","kp_sgdkpjg_xdjls","kp_sgdkpjg_kdds","kp_sgdkpjg_kzds","kp_sgdkpjg_kxds","kp_sgdkpjg_tsjcdd","kp_sgdkpjg_tsjczd","kp_sgdkpjg_tsjcxd","kp_sgdkpjg_ywgs","kp_sgdkpjg_zsgds"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"kpjlh","sgd"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"kpjlh","sgd"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_sgdkpjg.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sq_dwxx_dwmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">本期排名</td>
	<td  width="1%">施工队</td>
	<td  width="1%">本期总分</td>
	<td  width="1%">下周期可接大单总数</td>
	<td  width="1%">下周期可接中单总数</td>
	<td  width="1%">下周期可接小单总数</td>
	<td  width="1%">下周期可接单总数</td>
	<td  width="1%">下周期可接单总额</td>
	<td  width="1%">已接大单数</td>
	<td  width="1%">已接大单金额</td>
	<td  width="1%">已接中单数</td>
	<td  width="1%">已接中单金额</td>
	<td  width="1%">已接小单数</td>
	<td  width="1%">已接小单金额</td>
	<td  width="1%">本期得分</td>
	<td  width="1%">历史总得分</td>
	<td  width="1%">上期排名</td>
	<td  width="1%">本期排名分段</td>
	<td  width="1%">最后3位标志</td>
	<td  width="1%">前5位标志</td>
	<td  width="1%">升级标志</td>
	<td  width="1%">降级标志</td>
	<td  width="1%">施工队级别</td>
	<td  width="1%">质保金</td>
	<td  width="1%">班组数</td>
	<td  width="1%">基础分</td>
	<td  width="1%">考评工地数</td>
	<td  width="1%">质检员质量得分</td>
	<td  width="1%">巡检员质量得分</td>
	<td  width="1%">公司抽查质量得分</td>
	<td  width="1%">质检员安全文明施工得分</td>
	<td  width="1%">巡检员安全文明施工得分</td>
	<td  width="1%">公司抽查安全文明施工得分</td>
	<td  width="1%">质检员工期得分</td>
	<td  width="1%">质检员管理得分</td>
	<td  width="1%">巡检员管理得分</td>
	<td  width="1%">公司抽查管理得分</td>
	<td  width="1%">客户评价得分</td>
	<td  width="1%">投诉项得分</td>
	<td  width="1%">维修项得分</td>
	<td  width="1%">样板间项得分</td>
	<td  width="1%">大单比率</td>
	<td  width="1%">中单比率</td>
	<td  width="1%">小单比率</td>
	<td  width="1%">可接大单标准数</td>
	<td  width="1%">可接中单标准数</td>
	<td  width="1%">可接小单标准数</td>
	<td  width="1%">大单回单奖励数</td>
	<td  width="1%">中单回单奖励数</td>
	<td  width="1%">小单回单奖励数</td>
	<td  width="1%">重大投诉扣大单</td>
	<td  width="1%">重大投诉扣中单</td>
	<td  width="1%">重大投诉扣小单</td>
	<td  width="1%">特殊奖励或处罚大单</td>
	<td  width="1%">特殊奖励或处罚中单</td>
	<td  width="1%">特殊奖励或处罚小单</td>
	<td  width="1%">已完工数</td>
	<td  width="1%">在施工地数</td>
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