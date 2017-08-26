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
	String crm_gjzb_djbh=null;
	String crm_gjzb_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_gjzb_bgr=null;
	String crm_gjzb_bgqssj=null;
	String crm_gjzb_bgjzsj=null;
	String crm_gjzb_sybz=null;
	String crm_gjzb_syr=null;
	String crm_gjzb_sysj=null;
	String crm_gjzb_lrr=null;
	String crm_gjzb_lrsj=null;
	String crm_gjzb_lrbm=null;
	crm_gjzb_djbh=request.getParameter("crm_gjzb_djbh");
	if (crm_gjzb_djbh!=null)
	{
		crm_gjzb_djbh=cf.GB2Uni(crm_gjzb_djbh);
		if (!(crm_gjzb_djbh.equals("")))	wheresql+=" and  (crm_gjzb.djbh='"+crm_gjzb_djbh+"')";
	}
	crm_gjzb_khbh=request.getParameter("crm_gjzb_khbh");
	if (crm_gjzb_khbh!=null)
	{
		crm_gjzb_khbh=cf.GB2Uni(crm_gjzb_khbh);
		if (!(crm_gjzb_khbh.equals("")))	wheresql+=" and  (crm_gjzb.khbh='"+crm_gjzb_khbh+"')";
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
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_gjzb_bgr=request.getParameter("crm_gjzb_bgr");
	if (crm_gjzb_bgr!=null)
	{
		crm_gjzb_bgr=cf.GB2Uni(crm_gjzb_bgr);
		if (!(crm_gjzb_bgr.equals("")))	wheresql+=" and  (crm_gjzb.bgr='"+crm_gjzb_bgr+"')";
	}
	crm_gjzb_bgqssj=request.getParameter("crm_gjzb_bgqssj");
	if (crm_gjzb_bgqssj!=null)
	{
		crm_gjzb_bgqssj=crm_gjzb_bgqssj.trim();
		if (!(crm_gjzb_bgqssj.equals("")))	wheresql+="  and (crm_gjzb.bgqssj>=TO_DATE('"+crm_gjzb_bgqssj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_bgqssj=request.getParameter("crm_gjzb_bgqssj2");
	if (crm_gjzb_bgqssj!=null)
	{
		crm_gjzb_bgqssj=crm_gjzb_bgqssj.trim();
		if (!(crm_gjzb_bgqssj.equals("")))	wheresql+="  and (crm_gjzb.bgqssj<=TO_DATE('"+crm_gjzb_bgqssj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_bgjzsj=request.getParameter("crm_gjzb_bgjzsj");
	if (crm_gjzb_bgjzsj!=null)
	{
		crm_gjzb_bgjzsj=crm_gjzb_bgjzsj.trim();
		if (!(crm_gjzb_bgjzsj.equals("")))	wheresql+="  and (crm_gjzb.bgjzsj>=TO_DATE('"+crm_gjzb_bgjzsj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_bgjzsj=request.getParameter("crm_gjzb_bgjzsj2");
	if (crm_gjzb_bgjzsj!=null)
	{
		crm_gjzb_bgjzsj=crm_gjzb_bgjzsj.trim();
		if (!(crm_gjzb_bgjzsj.equals("")))	wheresql+="  and (crm_gjzb.bgjzsj<=TO_DATE('"+crm_gjzb_bgjzsj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_sybz=request.getParameter("crm_gjzb_sybz");
	if (crm_gjzb_sybz!=null)
	{
		crm_gjzb_sybz=cf.GB2Uni(crm_gjzb_sybz);
		if (!(crm_gjzb_sybz.equals("")))	wheresql+=" and  (crm_gjzb.sybz='"+crm_gjzb_sybz+"')";
	}
	crm_gjzb_syr=request.getParameter("crm_gjzb_syr");
	if (crm_gjzb_syr!=null)
	{
		crm_gjzb_syr=cf.GB2Uni(crm_gjzb_syr);
		if (!(crm_gjzb_syr.equals("")))	wheresql+=" and  (crm_gjzb.syr='"+crm_gjzb_syr+"')";
	}
	crm_gjzb_sysj=request.getParameter("crm_gjzb_sysj");
	if (crm_gjzb_sysj!=null)
	{
		crm_gjzb_sysj=crm_gjzb_sysj.trim();
		if (!(crm_gjzb_sysj.equals("")))	wheresql+="  and (crm_gjzb.sysj>=TO_DATE('"+crm_gjzb_sysj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_sysj=request.getParameter("crm_gjzb_sysj2");
	if (crm_gjzb_sysj!=null)
	{
		crm_gjzb_sysj=crm_gjzb_sysj.trim();
		if (!(crm_gjzb_sysj.equals("")))	wheresql+="  and (crm_gjzb.sysj<=TO_DATE('"+crm_gjzb_sysj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_lrr=request.getParameter("crm_gjzb_lrr");
	if (crm_gjzb_lrr!=null)
	{
		crm_gjzb_lrr=cf.GB2Uni(crm_gjzb_lrr);
		if (!(crm_gjzb_lrr.equals("")))	wheresql+=" and  (crm_gjzb.lrr='"+crm_gjzb_lrr+"')";
	}
	crm_gjzb_lrsj=request.getParameter("crm_gjzb_lrsj");
	if (crm_gjzb_lrsj!=null)
	{
		crm_gjzb_lrsj=crm_gjzb_lrsj.trim();
		if (!(crm_gjzb_lrsj.equals("")))	wheresql+="  and (crm_gjzb.lrsj=TO_DATE('"+crm_gjzb_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_lrbm=request.getParameter("crm_gjzb_lrbm");
	if (crm_gjzb_lrbm!=null)
	{
		crm_gjzb_lrbm=cf.GB2Uni(crm_gjzb_lrbm);
		if (!(crm_gjzb_lrbm.equals("")))	wheresql+=" and  (crm_gjzb.lrbm='"+crm_gjzb_lrbm+"')";
	}
	ls_sql="SELECT crm_gjzb.djbh,DECODE(crm_gjzb.sybz,'N','未阅','Y','已审阅'),crm_gjzb.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_gjzb.bgr,crm_gjzb.bgqssj,crm_gjzb.bgjzsj,crm_gjzb.qksm, crm_gjzb.syr,crm_gjzb.sysj,crm_gjzb.sysm,crm_gjzb.lrr,crm_gjzb.lrsj,dwmc";
	ls_sql+=" FROM crm_gjzb,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_gjzb.khbh=crm_khxx.khbh(+) and crm_gjzb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_gjzb.sybz='N'";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gjzbList.jsp","","","EditCrm_gjzb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"djbh","crm_gjzb_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_gjzb_bgr","crm_gjzb_bgqssj","crm_gjzb_bgjzsj","crm_gjzb_qksm","crm_gjzb_sybz","crm_gjzb_syr","crm_gjzb_sysj","crm_gjzb_sysm","crm_gjzb_lrr","crm_gjzb_lrsj","crm_gjzb_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_gjzbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] djbh = request.getParameterValues("djbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(djbh,"djbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from crm_gjzbzp where "+chooseitem;
		sql[1]="delete from crm_gjzb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">管家周报－－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">登记编号</td>
	<td  width="3%">审阅标志</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="4%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="3%">报告人</td>
	<td  width="4%">报告起始时间</td>
	<td  width="4%">报告截至时间</td>
	<td  width="20%">情况说明</td>
	<td  width="3%">审阅人</td>
	<td  width="4%">审阅时间</td>
	<td  width="18%">审阅说明</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
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