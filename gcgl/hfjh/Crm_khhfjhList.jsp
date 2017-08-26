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
	String crm_khhfjh_khbh=null;
	String crm_khhfjh_xchfrq=null;
	String crm_khhfjh_hflxbm=null;
	String crm_khhfjh_khxm=null;
	String crm_khhfjh_xb=null;
	String crm_khhfjh_fwdz=null;
	String crm_khhfjh_lxfs=null;
	String crm_khhfjh_clzt=null;
	crm_khhfjh_khbh=request.getParameter("crm_khhfjh_khbh");
	if (crm_khhfjh_khbh!=null)
	{
		crm_khhfjh_khbh=cf.GB2Uni(crm_khhfjh_khbh);
		if (!(crm_khhfjh_khbh.equals("")))	wheresql+=" and  (crm_khhfjh.khbh='"+crm_khhfjh_khbh+"')";
	}
	crm_khhfjh_xchfrq=request.getParameter("crm_khhfjh_xchfrq");
	if (crm_khhfjh_xchfrq!=null)
	{
		crm_khhfjh_xchfrq=crm_khhfjh_xchfrq.trim();
		if (!(crm_khhfjh_xchfrq.equals("")))	wheresql+="  and (crm_khhfjh.xchfrq>=TO_DATE('"+crm_khhfjh_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_khhfjh_xchfrq=request.getParameter("crm_khhfjh_xchfrq2");
	if (crm_khhfjh_xchfrq!=null)
	{
		crm_khhfjh_xchfrq=crm_khhfjh_xchfrq.trim();
		if (!(crm_khhfjh_xchfrq.equals("")))	wheresql+="  and (crm_khhfjh.xchfrq<=TO_DATE('"+crm_khhfjh_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_khhfjh_hflxbm=request.getParameter("crm_khhfjh_hflxbm");
	if (crm_khhfjh_hflxbm!=null)
	{
		crm_khhfjh_hflxbm=cf.GB2Uni(crm_khhfjh_hflxbm);
		if (!(crm_khhfjh_hflxbm.equals("")))	wheresql+=" and  (crm_khhfjh.hflxbm='"+crm_khhfjh_hflxbm+"')";
	}
	crm_khhfjh_khxm=request.getParameter("crm_khhfjh_khxm");
	if (crm_khhfjh_khxm!=null)
	{
		crm_khhfjh_khxm=cf.GB2Uni(crm_khhfjh_khxm);
		if (!(crm_khhfjh_khxm.equals("")))	wheresql+=" and  (crm_khhfjh.khxm='"+crm_khhfjh_khxm+"')";
	}
	crm_khhfjh_xb=request.getParameter("crm_khhfjh_xb");
	if (crm_khhfjh_xb!=null)
	{
		crm_khhfjh_xb=cf.GB2Uni(crm_khhfjh_xb);
		if (!(crm_khhfjh_xb.equals("")))	wheresql+=" and  (crm_khhfjh.xb='"+crm_khhfjh_xb+"')";
	}
	crm_khhfjh_fwdz=request.getParameter("crm_khhfjh_fwdz");
	if (crm_khhfjh_fwdz!=null)
	{
		crm_khhfjh_fwdz=cf.GB2Uni(crm_khhfjh_fwdz);
		if (!(crm_khhfjh_fwdz.equals("")))	wheresql+=" and  (crm_khhfjh.fwdz='"+crm_khhfjh_fwdz+"')";
	}
	crm_khhfjh_lxfs=request.getParameter("crm_khhfjh_lxfs");
	if (crm_khhfjh_lxfs!=null)
	{
		crm_khhfjh_lxfs=cf.GB2Uni(crm_khhfjh_lxfs);
		if (!(crm_khhfjh_lxfs.equals("")))	wheresql+=" and  (crm_khhfjh.lxfs='"+crm_khhfjh_lxfs+"')";
	}
	crm_khhfjh_clzt=request.getParameter("crm_khhfjh_clzt");
	if (crm_khhfjh_clzt!=null)
	{
		crm_khhfjh_clzt=cf.GB2Uni(crm_khhfjh_clzt);
		if (!(crm_khhfjh_clzt.equals("")))	wheresql+=" and  (crm_khhfjh.clzt='"+crm_khhfjh_clzt+"')";
	}
	ls_sql="SELECT crm_khhfjh.khbh as khbh,crm_khhfjh.xchfrq as xchfrq,dm_hflxbm.hflxmc as dm_hflxbm_hflxmc,crm_khhfjh.khxm as crm_khhfjh_khxm, DECODE(crm_khhfjh.xb,'M','男','W','女') as crm_khhfjh_xb,crm_khhfjh.fwdz as crm_khhfjh_fwdz,crm_khhfjh.lxfs as crm_khhfjh_lxfs, DECODE(crm_khhfjh.clzt,'N','未回访','Y','已回访') as crm_khhfjh_clzt  ";
	ls_sql+=" FROM crm_khhfjh,dm_hflxbm  ";
    ls_sql+=" where crm_khhfjh.hflxbm=dm_hflxbm.hflxbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khhfjhList.jsp","SelectCrm_khhfjh.jsp","","EditCrm_khhfjh.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","xchfrq","dm_hflxbm_hflxmc","crm_khhfjh_khxm","crm_khhfjh_xb","crm_khhfjh_fwdz","crm_khhfjh_lxfs","crm_khhfjh_clzt"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh","xchfrq"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_khhfjhList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_khhfjh where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="11%">客户编号</td>
	<td  width="13%">回访日期</td>
	<td  width="14%">回访类型</td>
	<td  width="10%">姓名</td>
	<td  width="6%">性别</td>
	<td  width="15%">房屋地址</td>
	<td  width="11%">联系方式</td>
	<td  width="7%">状态</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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