<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String khbh=request.getParameter("khbh");
	String rwbm=request.getParameter("rwbm");


	ls_sql="SELECT crm_cpgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,cpflmc,cpztmc, DECODE(crm_cpgzjl.cplx,'1','定制品','2','成品'), DECODE(crm_cpgzjl.cpazlx,'1','施工类','2','安装类'), DECODE(crm_cpgzjl.ghf,'甲供','甲供','公司供','公司供','未确认','未确认'),crm_cpgzjl.jgpp,crm_cpgzjl.ghfhzsj, DECODE(crm_cpgzjl.sfxdd,'Y','是','N','否'), DECODE(crm_cpgzjl.sfxhxgl,'Y','是','N','否'), DECODE(crm_cpgzjl.zxsfwz,'Y','是','N','否'),crm_cpgzjl.cpsjs, DECODE(crm_cpgzjl.sfxfb,'N','无返补','Y','等待返补','W','返补完成'),crm_cpgzjl.fbdbh, DECODE(crm_cpgzjl.sfxwx,'N','无维修','Y','等待维修','W','维修完成'),crm_cpgzjl.wxdbh, DECODE(crm_cpgzjl.sfyyc,'N','无异常','Y','等待处理','W','异常解决'),crm_cpgzjl.ycdbh , DECODE(crm_cpgzjl.sfxtx,'Y','需提醒','N','否'),crm_cpgzjl.txrq,crm_cpgzjl.txxs,crm_cpgzjl.txnr,crm_cpgzjl.zwyjcrq,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj,crm_cpgzjl.lrr,crm_cpgzjl.lrsj,dwmc,crm_cpgzjl.bz,crm_cpgzjl.cpflbm";
	ls_sql+=" FROM crm_xmrwcpfl,crm_cpgzjl,crm_khxx,dm_cpflbm,dm_cpztbm,sq_dwxx  ";
    ls_sql+=" where crm_cpgzjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
    ls_sql+=" and crm_cpgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_xmrwcpfl.khbh='"+khbh+"'";
    ls_sql+=" and crm_xmrwcpfl.rwbm='"+rwbm+"'";
    ls_sql+=" and crm_xmrwcpfl.khbh=crm_cpgzjl.khbh";
    ls_sql+=" and crm_xmrwcpfl.cpflbm=crm_cpgzjl.cpflbm ";
    ls_sql+=" order by crm_cpgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","/gcgl/xmrwgl/cpgz/InsertCrm_cpazjl.jsp","/gcgl/xmrwgl/cpgz/InsertCrm_cpztgzjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","cpflbm","crm_cpgzjl_cplx","crm_cpgzjl_cpazlx","crm_cpgzjl_ghf","crm_cpgzjl_jgpp","crm_cpgzjl_ghfhzsj","crm_cpgzjl_sfxdd","crm_cpgzjl_sfxhxgl","crm_cpgzjl_zxsfwz","crm_cpgzjl_cpsjs","crm_cpgzjl_sfxfb","crm_cpgzjl_sfxwx","crm_cpgzjl_sfyyc","crm_cpgzjl_sfxtx","crm_cpgzjl_txrq","crm_cpgzjl_txxs","crm_cpgzjl_txnr","crm_cpgzjl_cpztbm","crm_cpgzjl_lrr","crm_cpgzjl_lrsj","crm_cpgzjl_lrbm","crm_cpgzjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_cpgzjl_fbdbh","crm_cpgzjl_wxdbh","crm_cpgzjl_ycdbh"};
	pageObj.setDisColName(disColName);
//设置主键
*/
	String[] keyName={"khbh","cpflbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("安装");
	pageObj.setEditStr("状态");


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_cpztgzjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cpflmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">产品跟踪</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="2%">合同号</td>
	<td  width="2%">设计师</td>
	<td  width="3%">产品分类</td>
	<td  width="3%">产品状态</td>
	<td  width="2%">产品类型</td>
	<td  width="2%">产品安装类型</td>
	<td  width="2%">供货方</td>
	<td  width="6%">甲供品牌</td>
	<td  width="3%">供货方获知时间</td>
	<td  width="2%">是否交底后新订单</td>
	<td  width="2%">是否需后续管理</td>
	<td  width="2%">选型是否完成</td>
	<td  width="2%">产品设计师</td>
	<td  width="2%">是否需返补</td>
	<td  width="2%">返补单编号</td>
	<td  width="2%">是否需维修</td>
	<td  width="2%">维修单编号</td>
	<td  width="2%">是否有异常</td>
	<td  width="2%">异常单编号</td>
	<td  width="2%">是否需提醒</td>
	<td  width="3%">提醒日期</td>
	<td  width="2%">提醒小时</td>
	<td  width="12%">提醒内容</td>
	<td  width="3%">最晚应进场日期</td>
	<td  width="3%">计划入库时间</td>
	<td  width="3%">计划送货时间</td>
	<td  width="3%">计划安装时间</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="62%">备注</td>
	<td  width="2%">&nbsp;</td>
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