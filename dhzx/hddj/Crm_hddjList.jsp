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
	String crm_hddj_khbh=null;
	String crm_hddj_khxm=null;
	String crm_hddj_xb=null;
	String crm_hddj_lxfs=null;
	String crm_hddj_cqbm=null;
	String crm_hddj_fwdz=null;
	String crm_hddj_cgdz=null;
	String crm_hddj_hdsgd=null;
	String crm_hddj_hdsgbz=null;
	String crm_hddj_hdsjs=null;
	String crm_hddj_lrr=null;
	String crm_hddj_lrsj=null;
	crm_hddj_khbh=request.getParameter("crm_hddj_khbh");
	if (crm_hddj_khbh!=null)
	{
		crm_hddj_khbh=cf.GB2Uni(crm_hddj_khbh);
		if (!(crm_hddj_khbh.equals("")))	wheresql+=" and  (crm_hddj.khbh='"+crm_hddj_khbh+"')";
	}
	crm_hddj_khxm=request.getParameter("crm_hddj_khxm");
	if (crm_hddj_khxm!=null)
	{
		crm_hddj_khxm=cf.GB2Uni(crm_hddj_khxm);
		if (!(crm_hddj_khxm.equals("")))	wheresql+=" and  (crm_hddj.khxm='"+crm_hddj_khxm+"')";
	}
	crm_hddj_xb=request.getParameter("crm_hddj_xb");
	if (crm_hddj_xb!=null)
	{
		crm_hddj_xb=cf.GB2Uni(crm_hddj_xb);
		if (!(crm_hddj_xb.equals("")))	wheresql+=" and  (crm_hddj.xb='"+crm_hddj_xb+"')";
	}
	crm_hddj_lxfs=request.getParameter("crm_hddj_lxfs");
	if (crm_hddj_lxfs!=null)
	{
		crm_hddj_lxfs=cf.GB2Uni(crm_hddj_lxfs);
		if (!(crm_hddj_lxfs.equals("")))	wheresql+=" and  (crm_hddj.lxfs='"+crm_hddj_lxfs+"')";
	}
	crm_hddj_cqbm=request.getParameter("crm_hddj_cqbm");
	if (crm_hddj_cqbm!=null)
	{
		crm_hddj_cqbm=cf.GB2Uni(crm_hddj_cqbm);
		if (!(crm_hddj_cqbm.equals("")))	wheresql+=" and  (crm_hddj.cqbm='"+crm_hddj_cqbm+"')";
	}
	crm_hddj_fwdz=request.getParameter("crm_hddj_fwdz");
	if (crm_hddj_fwdz!=null)
	{
		crm_hddj_fwdz=cf.GB2Uni(crm_hddj_fwdz);
		if (!(crm_hddj_fwdz.equals("")))	wheresql+=" and  (crm_hddj.fwdz like '%"+crm_hddj_fwdz+"%')";
	}
	crm_hddj_cgdz=request.getParameter("crm_hddj_cgdz");
	if (crm_hddj_cgdz!=null)
	{
		crm_hddj_cgdz=cf.GB2Uni(crm_hddj_cgdz);
		if (!(crm_hddj_cgdz.equals("")))	wheresql+=" and  (crm_hddj.cgdz like '%"+crm_hddj_cgdz+"%')";
	}
	crm_hddj_hdsgd=request.getParameter("crm_hddj_hdsgd");
	if (crm_hddj_hdsgd!=null)
	{
		crm_hddj_hdsgd=cf.GB2Uni(crm_hddj_hdsgd);
		if (!(crm_hddj_hdsgd.equals("")))	wheresql+=" and  (crm_hddj.hdsgd='"+crm_hddj_hdsgd+"')";
	}
	crm_hddj_hdsgbz=request.getParameter("crm_hddj_hdsgbz");
	if (crm_hddj_hdsgbz!=null)
	{
		crm_hddj_hdsgbz=cf.GB2Uni(crm_hddj_hdsgbz);
		if (!(crm_hddj_hdsgbz.equals("")))	wheresql+=" and  (crm_hddj.hdsgbz='"+crm_hddj_hdsgbz+"')";
	}
	crm_hddj_hdsjs=request.getParameter("crm_hddj_hdsjs");
	if (crm_hddj_hdsjs!=null)
	{
		crm_hddj_hdsjs=cf.GB2Uni(crm_hddj_hdsjs);
		if (!(crm_hddj_hdsjs.equals("")))	wheresql+=" and  (crm_hddj.hdsjs='"+crm_hddj_hdsjs+"')";
	}
	crm_hddj_lrr=request.getParameter("crm_hddj_lrr");
	if (crm_hddj_lrr!=null)
	{
		crm_hddj_lrr=cf.GB2Uni(crm_hddj_lrr);
		if (!(crm_hddj_lrr.equals("")))	wheresql+=" and  (crm_hddj.lrr='"+crm_hddj_lrr+"')";
	}
	crm_hddj_lrsj=request.getParameter("crm_hddj_lrsj");
	if (crm_hddj_lrsj!=null)
	{
		crm_hddj_lrsj=crm_hddj_lrsj.trim();
		if (!(crm_hddj_lrsj.equals("")))	wheresql+="  and (crm_hddj.lrsj>=TO_DATE('"+crm_hddj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_hddj_lrsj=request.getParameter("crm_hddj_lrsj2");
	if (crm_hddj_lrsj!=null)
	{
		crm_hddj_lrsj=crm_hddj_lrsj.trim();
		if (!(crm_hddj_lrsj.equals("")))	wheresql+="  and (crm_hddj.lrsj<=TO_DATE('"+crm_hddj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_hddj.khbh,crm_hddj.khxm, DECODE(crm_hddj.xb,'M','男','W','女'),crm_hddj.lxfs,dm_cqbm.cqmc,crm_hddj.fwdz,crm_hddj.cgdz,sq_dwxx.dwmc  ";
	ls_sql+=" FROM crm_hddj,dm_cqbm,sq_dwxx  ";
    ls_sql+=" where crm_hddj.cqbm=dm_cqbm.cqbm(+) and crm_hddj.hdsgd=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by khbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_hddjList.jsp","SelectCrm_hddj.jsp","","EditCrm_hddj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_hddj_khxm","crm_hddj_xb","crm_hddj_lxfs","dm_cqbm_cqmc","crm_hddj_fwdz","crm_hddj_cgdz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_hddjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_hddj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_hddj where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">客户编号</td>
	<td  width="8%">客户姓名</td>
	<td  width="6%">性别</td>
	<td  width="10%">联系方式</td>
	<td  width="10%">所属城区</td>
	<td  width="20%">拟装修地址</td>
	<td  width="18%">回单装修地址</td>
	<td  width="8%">回单施工队</td>
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