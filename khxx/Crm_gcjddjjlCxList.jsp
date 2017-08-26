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
	
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_gcjddjjl.djjlh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_gcjddjjl.zpsl,dm_gcjdbm.ysgcjdmc,crm_gcjddjjl.djsj,DECODE(crm_gcjddjjl.sfszhf,'1','设置','0','不设置'),crm_gcjddjjl.hfszjlh,sgdmc,crm_khxx.zjxm,crm_khxx.sjs ,crm_khxx.qyrq,crm_gcjddjjl.khbh,crm_gcjddjjl.lrr,crm_gcjddjjl.lrsj,sq_dwxx.dwmc,crm_gcjddjjl.bz ";
	ls_sql+=" FROM crm_gcjddjjl,crm_khxx,dm_gcjdbm,sq_dwxx,sq_sgd  ";
    ls_sql+=" where crm_gcjddjjl.gcjdbm=dm_gcjdbm.gcjdbm and crm_gcjddjjl.lrdw=sq_dwxx.dwbh and crm_gcjddjjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_gcjddjjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_gcjddjjl.djjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数


//设置主键
	String[] keyName={"djjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"djjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/gcjdgz/ViewCrm_gcjddjjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("djjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">工程进度登记</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">登记记录号</td>
	<td  width="4%">合同号</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="3%">照片数</td>
	<td  width="6%">工程进度</td>
	<td  width="5%">中期验收时间</td>
	<td  width="4%">是否设置回访</td>
	<td  width="5%">回访设置记录号</td>

	<td  width="3%">施工队</td>
	<td  width="3%">工程担当</td>
	<td  width="3%">设计师</td>
	<td  width="5%">签约日期</td>
	<td  width="4%">客户编号</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入单位</td>
	<td  width="19%">备注</td>
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