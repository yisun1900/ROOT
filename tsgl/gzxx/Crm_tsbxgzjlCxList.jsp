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
	String crm_tsbxgzjl_gzjlh=null;
	String crm_tsbxgzjl_tsjlh=null;
	String crm_tsbxgzjl_khbh=null;
	String crm_tsbxgzjl_lrsj=null;
	String crm_tsbxgzjl_lrr=null;
	String crm_tsbxgzjl_lrbm=null;
	String crm_tsbxgzjl_lx=null;
	crm_tsbxgzjl_gzjlh=request.getParameter("crm_tsbxgzjl_gzjlh");
	if (crm_tsbxgzjl_gzjlh!=null)
	{
		crm_tsbxgzjl_gzjlh=cf.GB2Uni(crm_tsbxgzjl_gzjlh);
		if (!(crm_tsbxgzjl_gzjlh.equals("")))	wheresql+=" and  (crm_tsbxgzjl.gzjlh='"+crm_tsbxgzjl_gzjlh+"')";
	}
	crm_tsbxgzjl_tsjlh=request.getParameter("crm_tsbxgzjl_tsjlh");
	if (crm_tsbxgzjl_tsjlh!=null)
	{
		crm_tsbxgzjl_tsjlh=cf.GB2Uni(crm_tsbxgzjl_tsjlh);
		if (!(crm_tsbxgzjl_tsjlh.equals("")))	wheresql+=" and  (crm_tsbxgzjl.tsjlh='"+crm_tsbxgzjl_tsjlh+"')";
	}
	crm_tsbxgzjl_khbh=request.getParameter("crm_tsbxgzjl_khbh");
	if (crm_tsbxgzjl_khbh!=null)
	{
		crm_tsbxgzjl_khbh=cf.GB2Uni(crm_tsbxgzjl_khbh);
		if (!(crm_tsbxgzjl_khbh.equals("")))	wheresql+=" and  (crm_tsbxgzjl.khbh='"+crm_tsbxgzjl_khbh+"')";
	}
	crm_tsbxgzjl_lrsj=request.getParameter("crm_tsbxgzjl_lrsj");
	if (crm_tsbxgzjl_lrsj!=null)
	{
		crm_tsbxgzjl_lrsj=crm_tsbxgzjl_lrsj.trim();
		if (!(crm_tsbxgzjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxgzjl.lrsj>=TO_DATE('"+crm_tsbxgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxgzjl_lrsj=request.getParameter("crm_tsbxgzjl_lrsj2");
	if (crm_tsbxgzjl_lrsj!=null)
	{
		crm_tsbxgzjl_lrsj=crm_tsbxgzjl_lrsj.trim();
		if (!(crm_tsbxgzjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxgzjl.lrsj<=TO_DATE('"+crm_tsbxgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxgzjl_lrr=request.getParameter("crm_tsbxgzjl_lrr");
	if (crm_tsbxgzjl_lrr!=null)
	{
		crm_tsbxgzjl_lrr=cf.GB2Uni(crm_tsbxgzjl_lrr);
		if (!(crm_tsbxgzjl_lrr.equals("")))	wheresql+=" and  (crm_tsbxgzjl.lrr='"+crm_tsbxgzjl_lrr+"')";
	}
	crm_tsbxgzjl_lrbm=request.getParameter("crm_tsbxgzjl_lrbm");
	if (crm_tsbxgzjl_lrbm!=null)
	{
		crm_tsbxgzjl_lrbm=cf.GB2Uni(crm_tsbxgzjl_lrbm);
		if (!(crm_tsbxgzjl_lrbm.equals("")))	wheresql+=" and  (crm_tsbxgzjl.lrbm='"+crm_tsbxgzjl_lrbm+"')";
	}
	crm_tsbxgzjl_lx=request.getParameter("crm_tsbxgzjl_lx");
	if (crm_tsbxgzjl_lx!=null)
	{
		crm_tsbxgzjl_lx=cf.GB2Uni(crm_tsbxgzjl_lx);
		if (!(crm_tsbxgzjl_lx.equals("")))	wheresql+=" and  (crm_tsbxgzjl.lx='"+crm_tsbxgzjl_lx+"')";
	}
	ls_sql="SELECT crm_tsbxgzjl.gzjlh, DECODE(crm_tsbxgzjl.lx,'1','客诉专员','2','客服'),crm_tsbxgzjl.tsjlh,crm_tsbxgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_tsjl.tsnr,crm_tsbxgzjl.qksm,crm_tsbxgzjl.lrsj,crm_tsbxgzjl.lrr,dwmc  ";
	ls_sql+=" FROM crm_tsbxgzjl,crm_tsjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_tsbxgzjl.tsjlh=crm_tsjl.tsjlh and crm_tsbxgzjl.khbh=crm_khxx.khbh and crm_tsbxgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tsbxgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tsbxgzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gzjlh","crm_tsbxgzjl_tsjlh","crm_tsjl_tsnr","crm_tsbxgzjl_khbh","crm_tsbxgzjl_qksm","crm_tsbxgzjl_lrsj","crm_tsbxgzjl_lrr","crm_tsbxgzjl_lrbm","crm_tsbxgzjl_lx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gzjlh"};
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
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询跟踪信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">跟踪记录号</td>
	<td  width="4%">类型</td>
	<td  width="5%">投诉报修记录号</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="24%">投诉报修内容</td>
	<td  width="24%">跟踪情况</td>
	<td  width="5%">录入时间</td>
	<td  width="4%">录入人</td>
	<td  width="8%">录入部门</td>
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