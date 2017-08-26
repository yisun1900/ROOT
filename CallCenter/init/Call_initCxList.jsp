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
	String call_init_bjhm=null;
	String call_init_mac=null;
	String call_init_yhbm=null;
	String call_init_ssfgs=null;
	String call_init_lywjml=null;
	String call_init_lrr=null;
	String call_init_lrsj=null;
	String call_init_lrbm=null;
	call_init_bjhm=request.getParameter("call_init_bjhm");
	if (call_init_bjhm!=null)
	{
		call_init_bjhm=cf.GB2Uni(call_init_bjhm);
		if (!(call_init_bjhm.equals("")))	wheresql+=" and  (call_init.bjhm='"+call_init_bjhm+"')";
	}
	call_init_mac=request.getParameter("call_init_mac");
	if (call_init_mac!=null)
	{
		call_init_mac=cf.GB2Uni(call_init_mac);
		if (!(call_init_mac.equals("")))	wheresql+=" and  (call_init.mac='"+call_init_mac+"')";
	}
	call_init_yhbm=request.getParameter("call_init_yhbm");
	if (call_init_yhbm!=null)
	{
		call_init_yhbm=cf.GB2Uni(call_init_yhbm);
		if (!(call_init_yhbm.equals("")))	wheresql+=" and  (call_init.yhbm='"+call_init_yhbm+"')";
	}
	call_init_ssfgs=request.getParameter("call_init_ssfgs");
	if (call_init_ssfgs!=null)
	{
		call_init_ssfgs=cf.GB2Uni(call_init_ssfgs);
		if (!(call_init_ssfgs.equals("")))	wheresql+=" and  (call_init.ssfgs='"+call_init_ssfgs+"')";
	}
	call_init_lywjml=request.getParameter("call_init_lywjml");
	if (call_init_lywjml!=null)
	{
		call_init_lywjml=cf.GB2Uni(call_init_lywjml);
		if (!(call_init_lywjml.equals("")))	wheresql+=" and  (call_init.lywjml='"+call_init_lywjml+"')";
	}
	call_init_lrr=request.getParameter("call_init_lrr");
	if (call_init_lrr!=null)
	{
		call_init_lrr=cf.GB2Uni(call_init_lrr);
		if (!(call_init_lrr.equals("")))	wheresql+=" and  (call_init.lrr='"+call_init_lrr+"')";
	}
	call_init_lrsj=request.getParameter("call_init_lrsj");
	if (call_init_lrsj!=null)
	{
		call_init_lrsj=call_init_lrsj.trim();
		if (!(call_init_lrsj.equals("")))	wheresql+="  and (call_init.lrsj=TO_DATE('"+call_init_lrsj+"','YYYY/MM/DD'))";
	}
	call_init_lrbm=request.getParameter("call_init_lrbm");
	if (call_init_lrbm!=null)
	{
		call_init_lrbm=cf.GB2Uni(call_init_lrbm);
		if (!(call_init_lrbm.equals("")))	wheresql+=" and  (call_init.lrbm='"+call_init_lrbm+"')";
	}
	ls_sql="SELECT call_init.bjhm,call_init.mac,call_init.yhbm,a.dwmc fgs,call_init.lywjml,call_init.lrr,call_init.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM call_init,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where call_init.ssfgs=a.dwbh and call_init.lrbm=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by call_init.ssfgs,call_init.bjhm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Call_initCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"bjhm","call_init_mac","call_init_yhbm","sq_dwxx_dwmc","call_init_lywjml","call_init_lrr","call_init_lrsj","call_init_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bjhm"};
	pageObj.setKey(keyName);
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">本机号码</td>
	<td  width="15%">Mac地址</td>
	<td  width="15%">用户编码</td>
	<td  width="11%">所属分公司</td>
	<td  width="15%">录音文件目录</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="11%">录入部门</td>
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