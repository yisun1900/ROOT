<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String ls_sql=null;
String wheresql="";
String xmzy=null;
String xm=cf.GB2Uni(request.getParameter("XM"));
xmzy=request.getParameter("xmzy");
if (xmzy!=null)
{
	xmzy=xmzy.trim();
	if (!(xmzy.equals("")))	wheresql+="  and (jc_mmydd.xmzy='"+xmzy+"')";

}

String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;

	ls_sql="SELECT yddbh,sq_yhxx.yhmc,jc_mmydd.khbh,crm_khxx.khxm,crm_khxx.hth, DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买'),jc_mmydd.sqdj,jc_mmydd.clgw,jc_mmydd.pdgc,jc_mmydd.htje, DECODE(jc_mmydd.wjsgsbz,'Y','已送公司','N','未送公司'), DECODE(jc_mmydd.clzt,'00','录入未完成','01','预订单完成','02','已派单','03','已完成初测','04','签订合同','05','已入库','06','安装完成','99','取消订单'),jc_mmydd.lrsj,sq_dwxx.dwmc  ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx,sq_yhxx  ";
    ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+)  and sq_yhxx.yhdlm=jc_mmydd.xmzy and jc_mmydd.clzt not in ('06','99')";
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj,yddbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("MmgdCxList.jsp","SelectXmzy.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yddbh","jc_mmydd_khbh","crm_khxx_khxm","crm_khxx_hth","jc_mmydd_wjqk","jc_mmydd_sqdj","jc_mmydd_clgw","jc_mmydd_pdgc","jc_mmydd_htje","jc_mmydd_wjsgsbz","jc_mmydd_clzt","jc_mmydd_lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">木门项目专员跟单情况表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">预订单编号</td>
	<td  width="6%">项目专员</td>
	<td  width="6%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="8%">合同号</td>
	<td  width="8%">五金情况</td>
	<td  width="6%">收取定金</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="10%">派单工厂</td>
	<td  width="7%">合同金额</td>
	<td  width="9%">自购五金件送到公司</td>
	<td  width="9%">处理状态</td>
	<td  width="9%">录入时间</td>
	<td  width="10%">录入部门</td>
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