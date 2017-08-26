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
	String wheresql="";
	String xjjlh=null;


	xjjlh=request.getParameter("xjjlh");
	if (xjjlh!=null)
	{
		xjjlh=cf.GB2Uni(xjjlh);
		if (!(xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjlh='"+xjjlh+"')";
	}
	
	ls_sql="SELECT kp_xjgdjl.xjjlh,DECODE(cfspbz,'1','不需审批','2','未审批','3','审批通过','4','审批未通过'),DECODE(kp_xjgdjl.kpbz,'N','未考评','Y','已考评'),DECODE(kp_xjgdjl.jsbz,'N','未结算','Y','已结算'),sgdmc,fkze,kfzs,jlje,kp_xjgdjl.kcjdebl||'%',crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,xjjgmc,kp_xjgdjl.bz,crm_khxx.sjs,crm_khxx.zjxm,kp_xjgdjl.lrr,kp_xjgdjl.lrsj,dwmc  ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm,dm_xjjgbm,sq_dwxx  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
	ls_sql+=" and kp_xjgdjl.lrdw=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_xjgdjlCxAllList.jsp","SelectCxAllKp_xjgdjl.jsp","","");
	pageObj.setPageRow(25);
/*
//设置显示列
	String[] disColName={"xjjlh","kp_xjgdjl_khbh","kp_xjgdjl_xjr","kp_xjgdjl_xjsj","xjlxbm","dm_xjjgbm_xjjgmc","kp_xjgdjl_lrr","kp_xjgdjl_lrsj","kp_xjgdjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xjjlh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xjjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_xjgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xjjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
  <B><font size="3">施工队检查记录--查询全部</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">检查记录号</td>
	<td  width="4%">审批标志</td>
	<td  width="3%">考评标志</td>
	<td  width="3%">结算标志</td>
	<td  width="3%">施工队</td>
	<td  width="4%">罚款总额</td>
	<td  width="4%">扣分总数</td>
	<td  width="4%">奖励金额</td>
	<td  width="4%">扣除接单额百分比</td>
	<td  width="4%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="3%">检查人</td>
	<td  width="4%">检查时间</td>
	<td  width="5%">检查类型</td>
	<td  width="6%">检查结果</td>
	<td  width="13%">检查情况说明</td>
	<td  width="3%">设计师</td>
	<td  width="3%">监察</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
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