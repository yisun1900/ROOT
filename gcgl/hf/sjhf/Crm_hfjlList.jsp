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
	String crm_hfjl_hfjlh=null;

	String crm_hfjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;

	crm_hfjl_hfjlh=request.getParameter("crm_hfjl_hfjlh");
	if (crm_hfjl_hfjlh!=null)
	{
		crm_hfjl_hfjlh=crm_hfjl_hfjlh.trim();
		if (!(crm_hfjl_hfjlh.equals("")))	wheresql+=" and (crm_sjhfjl.hfjlh="+crm_hfjl_hfjlh+") ";
	}
	crm_hfjl_khbh=request.getParameter("crm_hfjl_khbh");
	if (crm_hfjl_khbh!=null)
	{
		crm_hfjl_khbh=cf.GB2Uni(crm_hfjl_khbh);
		if (!(crm_hfjl_khbh.equals("")))	wheresql+=" and  (crm_sjhfjl.khbh='"+crm_hfjl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}

	String crm_hfjl_clfs=null;
	String crm_hfjl_dwbh=null;
	String clzt=null;

	crm_hfjl_clfs=request.getParameter("crm_hfjl_clfs");
	if (crm_hfjl_clfs!=null)
	{
		crm_hfjl_clfs=cf.GB2Uni(crm_hfjl_clfs);
		if (!(crm_hfjl_clfs.equals("")))	wheresql+=" and  (crm_sjhfjl.clfs='"+crm_hfjl_clfs+"')";
	}
	crm_hfjl_dwbh=request.getParameter("crm_hfjl_dwbh");
	if (crm_hfjl_dwbh!=null)
	{
		crm_hfjl_dwbh=cf.GB2Uni(crm_hfjl_dwbh);
		if (!(crm_hfjl_dwbh.equals("")))	wheresql+=" and  (crm_sjhffkbm.dwbh='"+crm_hfjl_dwbh+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		if (!(clzt.equals("")))	wheresql+=" and  (crm_sjhffkbm.clzt='"+clzt+"')";
	}

	String crm_hfjl_hfsj=null;
	String crm_hfjl_hfr=null;
	String hfbm=null;
	hfbm=request.getParameter("hfbm");
	if (!(hfbm.equals("")))	wheresql+=" and  (crm_sjhfjl.hfbm='"+hfbm+"')";


	crm_hfjl_hfsj=request.getParameter("crm_hfjl_hfsj");
	if (crm_hfjl_hfsj!=null)
	{
		crm_hfjl_hfsj=crm_hfjl_hfsj.trim();
		if (!(crm_hfjl_hfsj.equals("")))	wheresql+="  and (crm_sjhfjl.hfsj>=TO_DATE('"+crm_hfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_hfjl_hfsj=request.getParameter("crm_hfjl_hfsj2");
	if (crm_hfjl_hfsj!=null)
	{
		crm_hfjl_hfsj=crm_hfjl_hfsj.trim();
		if (!(crm_hfjl_hfsj.equals("")))	wheresql+="  and (crm_sjhfjl.hfsj<=TO_DATE('"+crm_hfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_hfjl_hfr=request.getParameter("crm_hfjl_hfr");
	if (crm_hfjl_hfr!=null)
	{
		crm_hfjl_hfr=cf.GB2Uni(crm_hfjl_hfr);
		if (!(crm_hfjl_hfr.equals("")))	wheresql+=" and  (crm_sjhfjl.hfr='"+crm_hfjl_hfr+"')";
	}

	ls_sql="SELECT distinct crm_sjhfjl.hfjlh as hfjlh,jglxmc,crm_sjhfjl.khbh as khbh,khxm,hfsm,crm_sjhfjl.hfsj,crm_sjhfjl.hfr,DECODE(clfs,'0','不需处理','1','反馈相关部门')  ";
	ls_sql+=" FROM crm_sjhfjl,crm_khxx,crm_sjhffkbm,dm_jglxbm   ";
    ls_sql+=" where crm_sjhfjl.khbh=crm_khxx.khbh(+) and crm_sjhfjl.hfjlh=crm_sjhffkbm.hfjlh(+) and crm_sjhfjl.jglxbm=dm_jglxbm.jglxbm";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_sjhfjl.hfsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_hfjlList.jsp","SelectCrm_hfjl.jsp","","EditCrm_hfjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfjlh","dm_hflxbm_hflxmc","crm_hfjl_khbh","sq_dwxx_dwmc","crm_hfjl_hfsj","crm_hfjl_hfr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[4]="align='left'";
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_hfjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hfjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_hfjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hfjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">修改随机回访记录 </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="5%">回访记录号</td>
	<td  width="10%">回访结果</td>
	<td  width="7%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="38%">回访内容</td>
	<td  width="8%">回访时间</td>
	<td  width="6%">回访人</td>
	<td  width="10%">处理方式</td>
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