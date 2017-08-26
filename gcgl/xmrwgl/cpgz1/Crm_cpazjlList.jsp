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
	String crm_cpazjl_azjlh=null;
	String crm_cpazjl_khbh=null;
	String crm_cpazjl_cpflbm=null;
	String crm_cpazjl_azjg=null;
	String crm_cpazjl_smsj=null;
	String crm_cpazjl_smr=null;
	String crm_cpazjl_lrr=null;
	String crm_cpazjl_lrsj=null;
	String crm_cpazjl_lrbm=null;
	crm_cpazjl_azjlh=request.getParameter("crm_cpazjl_azjlh");
	if (crm_cpazjl_azjlh!=null)
	{
		crm_cpazjl_azjlh=cf.GB2Uni(crm_cpazjl_azjlh);
		if (!(crm_cpazjl_azjlh.equals("")))	wheresql+=" and  (crm_cpazjl.azjlh='"+crm_cpazjl_azjlh+"')";
	}
	crm_cpazjl_khbh=request.getParameter("crm_cpazjl_khbh");
	if (crm_cpazjl_khbh!=null)
	{
		crm_cpazjl_khbh=cf.GB2Uni(crm_cpazjl_khbh);
		if (!(crm_cpazjl_khbh.equals("")))	wheresql+=" and  (crm_cpazjl.khbh='"+crm_cpazjl_khbh+"')";
	}
	crm_cpazjl_cpflbm=request.getParameter("crm_cpazjl_cpflbm");
	if (crm_cpazjl_cpflbm!=null)
	{
		crm_cpazjl_cpflbm=cf.GB2Uni(crm_cpazjl_cpflbm);
		if (!(crm_cpazjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpazjl.cpflbm='"+crm_cpazjl_cpflbm+"')";
	}
	crm_cpazjl_azjg=request.getParameter("crm_cpazjl_azjg");
	if (crm_cpazjl_azjg!=null)
	{
		crm_cpazjl_azjg=cf.GB2Uni(crm_cpazjl_azjg);
		if (!(crm_cpazjl_azjg.equals("")))	wheresql+=" and  (crm_cpazjl.azjg='"+crm_cpazjl_azjg+"')";
	}
	crm_cpazjl_smsj=request.getParameter("crm_cpazjl_smsj");
	if (crm_cpazjl_smsj!=null)
	{
		crm_cpazjl_smsj=crm_cpazjl_smsj.trim();
		if (!(crm_cpazjl_smsj.equals("")))	wheresql+="  and (crm_cpazjl.smsj>=TO_DATE('"+crm_cpazjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_smsj=request.getParameter("crm_cpazjl_smsj2");
	if (crm_cpazjl_smsj!=null)
	{
		crm_cpazjl_smsj=crm_cpazjl_smsj.trim();
		if (!(crm_cpazjl_smsj.equals("")))	wheresql+="  and (crm_cpazjl.smsj<=TO_DATE('"+crm_cpazjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_smr=request.getParameter("crm_cpazjl_smr");
	if (crm_cpazjl_smr!=null)
	{
		crm_cpazjl_smr=cf.GB2Uni(crm_cpazjl_smr);
		if (!(crm_cpazjl_smr.equals("")))	wheresql+=" and  (crm_cpazjl.smr='"+crm_cpazjl_smr+"')";
	}
	crm_cpazjl_lrr=request.getParameter("crm_cpazjl_lrr");
	if (crm_cpazjl_lrr!=null)
	{
		crm_cpazjl_lrr=cf.GB2Uni(crm_cpazjl_lrr);
		if (!(crm_cpazjl_lrr.equals("")))	wheresql+=" and  (crm_cpazjl.lrr='"+crm_cpazjl_lrr+"')";
	}
	crm_cpazjl_lrsj=request.getParameter("crm_cpazjl_lrsj");
	if (crm_cpazjl_lrsj!=null)
	{
		crm_cpazjl_lrsj=crm_cpazjl_lrsj.trim();
		if (!(crm_cpazjl_lrsj.equals("")))	wheresql+="  and (crm_cpazjl.lrsj>=TO_DATE('"+crm_cpazjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_lrsj=request.getParameter("crm_cpazjl_lrsj2");
	if (crm_cpazjl_lrsj!=null)
	{
		crm_cpazjl_lrsj=crm_cpazjl_lrsj.trim();
		if (!(crm_cpazjl_lrsj.equals("")))	wheresql+="  and (crm_cpazjl.lrsj<=TO_DATE('"+crm_cpazjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_lrbm=request.getParameter("crm_cpazjl_lrbm");
	if (crm_cpazjl_lrbm!=null)
	{
		crm_cpazjl_lrbm=cf.GB2Uni(crm_cpazjl_lrbm);
		if (!(crm_cpazjl_lrbm.equals("")))	wheresql+=" and  (crm_cpazjl.lrbm='"+crm_cpazjl_lrbm+"')";
	}
	ls_sql="SELECT crm_cpazjl.azjlh,crm_cpazjl.khbh,crm_cpazjl.cpflbm,dm_cpflbm.cpflmc, DECODE(crm_cpazjl.azjg,'1','未完成','2','安装成功','3','安装失败'),crm_cpazjl.smsj,crm_cpazjl.smr,crm_cpazjl.azsm,crm_cpazjl.lrr,crm_cpazjl.lrsj,crm_cpazjl.lrbm  ";
	ls_sql+=" FROM dm_cpflbm,crm_cpazjl  ";
    ls_sql+=" where crm_cpazjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_cpazjlList.jsp","","","EditCrm_cpazjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"azjlh","crm_cpazjl_khbh","crm_cpazjl_cpflbm","dm_cpflbm_cpflmc","crm_cpazjl_azjg","crm_cpazjl_smsj","crm_cpazjl_smr","crm_cpazjl_azsm","crm_cpazjl_lrr","crm_cpazjl_lrsj","crm_cpazjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"azjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_cpazjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String[] azjlh = request.getParameterValues("azjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(azjlh,"azjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_cpazjl where "+chooseitem;
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
  <B><font size="3">维护安装记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">安装记录号</td>
	<td  width="8%">客户编号</td>
	<td  width="8%">产品分类</td>
	<td  width="8%">产品分类</td>
	<td  width="8%">安装结果</td>
	<td  width="8%">上门时间</td>
	<td  width="8%">上门人</td>
	<td  width="12%">安装说明</td>
	<td  width="8%">录入人</td>
	<td  width="8%">录入时间</td>
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