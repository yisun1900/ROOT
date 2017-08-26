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
	if (!(xmzy.equals("")))	wheresql+="  and (jc_jjdd.xmzy='"+xmzy+"')";

}

String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	ls_sql="SELECT jc_jjdd.ddbh as ddbh,sq_yhxx.yhmc as yhmc,jc_jjdd.khbh as khbh,jc_jjdd.dj as jc_jjdd_dj,jc_jjdd.jjsjs as jc_jjdd_jjsjs, DECODE(jc_jjdd.kfcbz,'Y','可复测','N','不可复测') as jc_jjdd_kfcbz,jc_jjdd.ssje as jc_jjdd_ssje,clztmc, DECODE(jc_jjdd.khlx,'1','装修客户','2','橱柜客户') as jc_jjdd_khlx,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.hth as hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_dwxx,sq_yhxx  ";
    ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh and jc_jjdd.clzt not in('08') and sq_yhxx.yhdlm=jc_jjdd.xmzy";
 	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by jc_jjdd.lrsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("JjgdCxList.jsp","SelectXmzy.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"ddbh","yhmc","clztmc","khxm","fwdz","hth","jc_jjdd_dj","jc_jjdd_jjsjs","jc_jjdd_kfcbz","jc_jjdd_ssje","jc_jjdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">家具项目专员跟单情况表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">订单编号</td>
	<td  width="10%">项目专员</td>
	<td  width="10%">处理状态</td>
	<td  width="6%">客户姓名</td>
	<td  width="25%">房屋地址</td>
	<td  width="7%">合同号</td>
	<td  width="6%">订金</td>
	<td  width="6%">家居设计师</td>
	<td  width="6%">可复测标志</td>
	<td  width="6%">实收金额</td>
	<td  width="6%">客户类型</td>
	<td  width="16%">录入部门</td>
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