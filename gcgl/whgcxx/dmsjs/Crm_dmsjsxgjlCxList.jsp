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
	String crm_dmsjsxgjl_xgjlh=null;
	String crm_dmsjsxgjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_dmsjsxgjl_xgqfgsbh=null;
	String crm_dmsjsxgjl_xgqdwbh=null;
	String crm_dmsjsxgjl_xgqsjs=null;
	String crm_dmsjsxgjl_xgqsjsgh=null;
	String crm_dmsjsxgjl_xghfgsbh=null;
	String crm_dmsjsxgjl_xghdwbh=null;
	String crm_dmsjsxgjl_xghsjs=null;
	String crm_dmsjsxgjl_xghsjsgh=null;
	String crm_dmsjsxgjl_lrr=null;
	String crm_dmsjsxgjl_lrsj=null;
	String crm_dmsjsxgjl_lrbm=null;

	String xgqkhjl=null;
	xgqkhjl=request.getParameter("xgqkhjl");
	if (xgqkhjl!=null)
	{
		xgqkhjl=cf.GB2Uni(xgqkhjl);
		if (!(xgqkhjl.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqkhjl='"+xgqkhjl+"')";
	}
	String xghkhjl=null;
	xghkhjl=request.getParameter("xghkhjl");
	if (xghkhjl!=null)
	{
		xghkhjl=cf.GB2Uni(xghkhjl);
		if (!(xghkhjl.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghkhjl='"+xghkhjl+"')";
	}

	
	crm_dmsjsxgjl_xgjlh=request.getParameter("crm_dmsjsxgjl_xgjlh");
	if (crm_dmsjsxgjl_xgjlh!=null)
	{
		crm_dmsjsxgjl_xgjlh=cf.GB2Uni(crm_dmsjsxgjl_xgjlh);
		if (!(crm_dmsjsxgjl_xgjlh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgjlh='"+crm_dmsjsxgjl_xgjlh+"')";
	}
	crm_dmsjsxgjl_khbh=request.getParameter("crm_dmsjsxgjl_khbh");
	if (crm_dmsjsxgjl_khbh!=null)
	{
		crm_dmsjsxgjl_khbh=cf.GB2Uni(crm_dmsjsxgjl_khbh);
		if (!(crm_dmsjsxgjl_khbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.khbh='"+crm_dmsjsxgjl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_dmsjsxgjl_xgqfgsbh=request.getParameter("crm_dmsjsxgjl_xgqfgsbh");
	if (crm_dmsjsxgjl_xgqfgsbh!=null)
	{
		crm_dmsjsxgjl_xgqfgsbh=cf.GB2Uni(crm_dmsjsxgjl_xgqfgsbh);
		if (!(crm_dmsjsxgjl_xgqfgsbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqfgsbh='"+crm_dmsjsxgjl_xgqfgsbh+"')";
	}
	crm_dmsjsxgjl_xgqdwbh=request.getParameter("crm_dmsjsxgjl_xgqdwbh");
	if (crm_dmsjsxgjl_xgqdwbh!=null)
	{
		crm_dmsjsxgjl_xgqdwbh=cf.GB2Uni(crm_dmsjsxgjl_xgqdwbh);
		if (!(crm_dmsjsxgjl_xgqdwbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqdwbh='"+crm_dmsjsxgjl_xgqdwbh+"')";
	}
	crm_dmsjsxgjl_xgqsjs=request.getParameter("crm_dmsjsxgjl_xgqsjs");
	if (crm_dmsjsxgjl_xgqsjs!=null)
	{
		crm_dmsjsxgjl_xgqsjs=cf.GB2Uni(crm_dmsjsxgjl_xgqsjs);
		if (!(crm_dmsjsxgjl_xgqsjs.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqsjs='"+crm_dmsjsxgjl_xgqsjs+"')";
	}
	crm_dmsjsxgjl_xgqsjsgh=request.getParameter("crm_dmsjsxgjl_xgqsjsgh");
	if (crm_dmsjsxgjl_xgqsjsgh!=null)
	{
		crm_dmsjsxgjl_xgqsjsgh=cf.GB2Uni(crm_dmsjsxgjl_xgqsjsgh);
		if (!(crm_dmsjsxgjl_xgqsjsgh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqsjsgh='"+crm_dmsjsxgjl_xgqsjsgh+"')";
	}
	crm_dmsjsxgjl_xghfgsbh=request.getParameter("crm_dmsjsxgjl_xghfgsbh");
	if (crm_dmsjsxgjl_xghfgsbh!=null)
	{
		crm_dmsjsxgjl_xghfgsbh=cf.GB2Uni(crm_dmsjsxgjl_xghfgsbh);
		if (!(crm_dmsjsxgjl_xghfgsbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghfgsbh='"+crm_dmsjsxgjl_xghfgsbh+"')";
	}
	crm_dmsjsxgjl_xghdwbh=request.getParameter("crm_dmsjsxgjl_xghdwbh");
	if (crm_dmsjsxgjl_xghdwbh!=null)
	{
		crm_dmsjsxgjl_xghdwbh=cf.GB2Uni(crm_dmsjsxgjl_xghdwbh);
		if (!(crm_dmsjsxgjl_xghdwbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghdwbh='"+crm_dmsjsxgjl_xghdwbh+"')";
	}
	crm_dmsjsxgjl_xghsjs=request.getParameter("crm_dmsjsxgjl_xghsjs");
	if (crm_dmsjsxgjl_xghsjs!=null)
	{
		crm_dmsjsxgjl_xghsjs=cf.GB2Uni(crm_dmsjsxgjl_xghsjs);
		if (!(crm_dmsjsxgjl_xghsjs.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghsjs='"+crm_dmsjsxgjl_xghsjs+"')";
	}
	crm_dmsjsxgjl_xghsjsgh=request.getParameter("crm_dmsjsxgjl_xghsjsgh");
	if (crm_dmsjsxgjl_xghsjsgh!=null)
	{
		crm_dmsjsxgjl_xghsjsgh=cf.GB2Uni(crm_dmsjsxgjl_xghsjsgh);
		if (!(crm_dmsjsxgjl_xghsjsgh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghsjsgh='"+crm_dmsjsxgjl_xghsjsgh+"')";
	}
	crm_dmsjsxgjl_lrr=request.getParameter("crm_dmsjsxgjl_lrr");
	if (crm_dmsjsxgjl_lrr!=null)
	{
		crm_dmsjsxgjl_lrr=cf.GB2Uni(crm_dmsjsxgjl_lrr);
		if (!(crm_dmsjsxgjl_lrr.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.lrr='"+crm_dmsjsxgjl_lrr+"')";
	}
	crm_dmsjsxgjl_lrsj=request.getParameter("crm_dmsjsxgjl_lrsj");
	if (crm_dmsjsxgjl_lrsj!=null)
	{
		crm_dmsjsxgjl_lrsj=crm_dmsjsxgjl_lrsj.trim();
		if (!(crm_dmsjsxgjl_lrsj.equals("")))	wheresql+="  and (crm_dmsjsxgjl.lrsj>=TO_DATE('"+crm_dmsjsxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dmsjsxgjl_lrsj=request.getParameter("crm_dmsjsxgjl_lrsj2");
	if (crm_dmsjsxgjl_lrsj!=null)
	{
		crm_dmsjsxgjl_lrsj=crm_dmsjsxgjl_lrsj.trim();
		if (!(crm_dmsjsxgjl_lrsj.equals("")))	wheresql+="  and (crm_dmsjsxgjl.lrsj<=TO_DATE('"+crm_dmsjsxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dmsjsxgjl_lrbm=request.getParameter("crm_dmsjsxgjl_lrbm");
	if (crm_dmsjsxgjl_lrbm!=null)
	{
		crm_dmsjsxgjl_lrbm=cf.GB2Uni(crm_dmsjsxgjl_lrbm);
		if (!(crm_dmsjsxgjl_lrbm.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.lrbm='"+crm_dmsjsxgjl_lrbm+"')";
	}
	ls_sql="SELECT crm_dmsjsxgjl.xgjlh,crm_dmsjsxgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,a.dwmc xgqfgsbh,b.dwmc xgqdwbh,crm_dmsjsxgjl.xgqsjs,crm_dmsjsxgjl.xgqsjsgh,crm_dmsjsxgjl.xgqkhjl,c.dwmc xghfgsbh,d.dwmc xghdwbh,crm_dmsjsxgjl.xghsjs,crm_dmsjsxgjl.xghsjsgh,crm_dmsjsxgjl.xghkhjl,crm_dmsjsxgjl.lrr,crm_dmsjsxgjl.lrsj,crm_dmsjsxgjl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_dmsjsxgjl,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d  ";
    ls_sql+=" where crm_dmsjsxgjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_dmsjsxgjl.xgqfgsbh=a.dwbh(+) and crm_dmsjsxgjl.xgqdwbh=b.dwbh(+)";
    ls_sql+=" and crm_dmsjsxgjl.xghfgsbh=c.dwbh(+) and crm_dmsjsxgjl.xghdwbh=d.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_dmsjsxgjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_dmsjsxgjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xgjlh","crm_dmsjsxgjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_dmsjsxgjl_xgqfgsbh","crm_dmsjsxgjl_xgqdwbh","crm_dmsjsxgjl_xgqsjs","crm_dmsjsxgjl_xgqsjsgh","crm_dmsjsxgjl_xghfgsbh","crm_dmsjsxgjl_xghdwbh","crm_dmsjsxgjl_xghsjs","crm_dmsjsxgjl_xghsjsgh","crm_dmsjsxgjl_lrr","crm_dmsjsxgjl_lrsj","crm_dmsjsxgjl_lrbm","crm_dmsjsxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xgjlh"};
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
  <B><font size="3">查询－修改设计师店面记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">修改记录号</td>
	<td  width="4%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="6%">修改前分公司</td>
	<td  width="7%">修改前签约店面</td>
	<td  width="4%">修改前设计师</td>
	<td  width="4%">修改前设计师工号</td>
	<td  width="4%">修改前客户经理</td>
	<td  width="6%">修改后分公司</td>
	<td  width="7%">修改后签约店面</td>
	<td  width="4%">修改后设计师</td>
	<td  width="4%">修改后设计师工号</td>
	<td  width="4%">修改后客户经理</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="11%">备注</td>
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