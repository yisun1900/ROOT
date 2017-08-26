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
	String sq_yhsqrz_xh=null;
	String sq_yhsqrz_ip=null;
	String sq_yhsqrz_lrrdlm=null;
	String sq_yhsqrz_lrrxm=null;
	String sq_yhsqrz_lrsj=null;
	String sq_yhsqrz_yhdlm=null;
	String sq_yhsqrz_czlx=null;
	sq_yhsqrz_xh=request.getParameter("sq_yhsqrz_xh");
	if (sq_yhsqrz_xh!=null)
	{
		sq_yhsqrz_xh=sq_yhsqrz_xh.trim();
		if (!(sq_yhsqrz_xh.equals("")))	wheresql+=" and (sq_yhsqrz.xh="+sq_yhsqrz_xh+") ";
	}
	sq_yhsqrz_ip=request.getParameter("sq_yhsqrz_ip");
	if (sq_yhsqrz_ip!=null)
	{
		sq_yhsqrz_ip=cf.GB2Uni(sq_yhsqrz_ip);
		if (!(sq_yhsqrz_ip.equals("")))	wheresql+=" and  (sq_yhsqrz.ip='"+sq_yhsqrz_ip+"')";
	}
	sq_yhsqrz_lrrdlm=request.getParameter("sq_yhsqrz_lrrdlm");
	if (sq_yhsqrz_lrrdlm!=null)
	{
		sq_yhsqrz_lrrdlm=cf.GB2Uni(sq_yhsqrz_lrrdlm);
		if (!(sq_yhsqrz_lrrdlm.equals("")))	wheresql+=" and  (sq_yhsqrz.lrrdlm='"+sq_yhsqrz_lrrdlm+"')";
	}
	sq_yhsqrz_lrrxm=request.getParameter("sq_yhsqrz_lrrxm");
	if (sq_yhsqrz_lrrxm!=null)
	{
		sq_yhsqrz_lrrxm=cf.GB2Uni(sq_yhsqrz_lrrxm);
		if (!(sq_yhsqrz_lrrxm.equals("")))	wheresql+=" and  (sq_yhsqrz.lrrxm='"+sq_yhsqrz_lrrxm+"')";
	}
	sq_yhsqrz_lrsj=request.getParameter("sq_yhsqrz_lrsj");
	if (sq_yhsqrz_lrsj!=null)
	{
		sq_yhsqrz_lrsj=sq_yhsqrz_lrsj.trim();
		if (!(sq_yhsqrz_lrsj.equals("")))	wheresql+="  and (sq_yhsqrz.lrsj>=TO_DATE('"+sq_yhsqrz_lrsj+"','YYYY/MM/DD'))";
	}
	sq_yhsqrz_lrsj=request.getParameter("sq_yhsqrz_lrsj2");
	if (sq_yhsqrz_lrsj!=null)
	{
		sq_yhsqrz_lrsj=sq_yhsqrz_lrsj.trim();
		if (!(sq_yhsqrz_lrsj.equals("")))	wheresql+="  and (sq_yhsqrz.lrsj<=TO_DATE('"+sq_yhsqrz_lrsj+"','YYYY/MM/DD'))";
	}
	sq_yhsqrz_yhdlm=request.getParameter("sq_yhsqrz_yhdlm");
	if (sq_yhsqrz_yhdlm!=null)
	{
		sq_yhsqrz_yhdlm=cf.GB2Uni(sq_yhsqrz_yhdlm);
		if (!(sq_yhsqrz_yhdlm.equals("")))	wheresql+=" and  (sq_yhsqrz.yhdlm='"+sq_yhsqrz_yhdlm+"')";
	}
	sq_yhsqrz_czlx=request.getParameter("sq_yhsqrz_czlx");
	if (sq_yhsqrz_czlx!=null)
	{
		sq_yhsqrz_czlx=cf.GB2Uni(sq_yhsqrz_czlx);
		if (!(sq_yhsqrz_czlx.equals("")))	wheresql+=" and  (sq_yhsqrz.czlx='"+sq_yhsqrz_czlx+"')";
	}
	ls_sql="SELECT sq_yhsqrz.xh,sq_yhsqrz.ip,sq_yhsqrz.lrrdlm,sq_yhsqrz.lrrxm,sq_yhsqrz.lrsj,sq_yhsqrz.yhdlm,sq_yhsqrz.yhmc,sq_yhsqrz.yhzbh, DECODE(sq_yhsqrz.czlx,'1','插入','2','删除','3','修改'),sq_yhz.yhzmc,sq_yhsqrz.bz  ";
	ls_sql+=" FROM sq_yhsqrz,sq_yhz  ";
    ls_sql+=" where sq_yhsqrz.yhzbh =sq_yhz.yhzbh (+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_yhsqrzCxList.jsp","SelectCxSq_yhsqrz.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","sq_yhsqrz_ip","sq_yhsqrz_lrrdlm","sq_yhsqrz_lrrxm","sq_yhsqrz_lrsj","sq_yhsqrz_yhdlm","sq_yhsqrz_yhzbh","sq_yhsqrz_czlx","sq_yhsqrz_bz","sq_yhz_yhzmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">序号</td>
	<td  width="10%">录入人IP地址</td>
	<td  width="8%">录入人登陆名</td>
	<td  width="8%">录入人姓名</td>
	<td  width="10%">录入时间</td>
	<td  width="10%">被操作的用户登陆名</td>
	<td  width="10%">用户名称</td>
	<td  width="10%">被操作的用户组</td>
	<td  width="6%">操作类型</td>
	<td  width="10%">被操作的用户组</td>
	<td  width="12%">备注</td>
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