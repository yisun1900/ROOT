<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;
%>
<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">投诉报修记录（客户编号:<%=khbh%>）</div>
<table width="270%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">投诉记录号</td>
	<td  width="2%">结案状态</td>
	<td  width="2%">类型</td>
	<td  width="3%">维修分类</td>
	<td  width="2%">是否已判则</td>
	<td  width="3%">投诉报修时间</td>
	<td  width="2%">受理方式</td>
	<td  width="2%">来电次数</td>
	<td  width="2%">客诉专员</td>
	<td  width="2%">严重程度</td>
	<td  width="19%">投诉报修内容</td>
	<td  width="3%">客户要求解决时间</td>
	<td  width="2%">是否需回访</td>
	<td  width="3%">受理时间</td>
	<td  width="4%">投诉报修小类</td>
	<td  width="8%">投诉报修原因</td>
	<td  width="4%">责任部门</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">处理人</td>
	<td  width="3%">处理时间</td>
	<td  width="3%">回访结果</td>
	<td  width="19%">处理情况</td>
	<td  width="5%">投诉品牌</td>
</tr>

<%
	ls_sql="SELECT crm_tsjl.tsjlh, DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','2','在处理','3','结案','9','不立案') jazt ";
	ls_sql+=" ,DECODE(crm_tsjl.lx,'1','投诉','2','报修') lx,DECODE(crm_tsjl.wxfl,'1','正常维修','2','非正常维修') wxfl";
	ls_sql+=" ,DECODE(crm_tsjl.sfpz,'Y','是','N','否') sfpz,tsbxsj,slfsmc,khldcs,kszy,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj ";
	ls_sql+=" ,DECODE(crm_tsjl.sfxhf,'Y','需回访','N','不需回访') sfxhf,crm_tsjl.slsj,tsxlmc,tsyymc,b.dwmc zrbm";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','尚未处理','2','在处理','3','解决') clzt,crm_tsbm.clr,crm_tsbm.clsj,hfjgmc ";
	ls_sql+=" ,crm_tsbm.clqk,crm_tsbm.tspp ";
	ls_sql+=" FROM crm_khxx,crm_tsbm,crm_tsjl,dm_tsxlbm,dm_tsyybm,dm_slfsbm,dm_yzcdbm,sq_dwxx b,dm_hfjgbm ";
    ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
    ls_sql+=" and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) ";
    ls_sql+=" and crm_tsbm.dwbh=b.dwbh(+) ";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_tsjl.khbh,crm_tsjl.tsjlh,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("tsjlh","1");//列参数对象加入Hash表
	spanColHash.put("jazt","1");//列参数对象加入Hash表
	spanColHash.put("lx","1");//列参数对象加入Hash表
	spanColHash.put("wxfl","1");//列参数对象加入Hash表
	spanColHash.put("sfpz","1");//列参数对象加入Hash表
	spanColHash.put("tsbxsj","1");//列参数对象加入Hash表
	spanColHash.put("slfsmc","1");//列参数对象加入Hash表
	spanColHash.put("khldcs","1");//列参数对象加入Hash表
	spanColHash.put("kszy","1");//列参数对象加入Hash表

	
	spanColHash.put("yzcdmc","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	spanColHash.put("yqjjsj","1");//列参数对象加入Hash表
	spanColHash.put("sfxhf","1");//列参数对象加入Hash表
	spanColHash.put("slsj","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
