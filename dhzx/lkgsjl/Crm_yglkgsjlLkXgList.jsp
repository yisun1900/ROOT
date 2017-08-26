<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_yglkgsjl_jlh=null;
	String crm_yglkgsjl_ygbh=null;
	String crm_yglkgsjl_yhmc=null;
	String crm_yglkgsjl_ygbm=null;
	String crm_yglkgsjl_rylx=null;
	String crm_yglkgsjl_jhlkrq=null;
	String crm_yglkgsjl_jhlksj=null;
	String crm_yglkgsjl_jhfhsj=null;
	String crm_yglkgsjl_lkgsmd=null;
	String crm_yglkgsjl_zt=null;
	String crm_yglkgsjl_lrr=null;
	String crm_yglkgsjl_lrsj=null;
	String crm_yglkgsjl_ssfgs=null;
	crm_yglkgsjl_jlh=request.getParameter("crm_yglkgsjl_jlh");
	if (crm_yglkgsjl_jlh!=null)
	{
		crm_yglkgsjl_jlh=crm_yglkgsjl_jlh.trim();
		if (!(crm_yglkgsjl_jlh.equals("")))	wheresql+=" and (crm_yglkgsjl.jlh="+crm_yglkgsjl_jlh+") ";
	}
	crm_yglkgsjl_ygbh=request.getParameter("crm_yglkgsjl_ygbh");
	if (crm_yglkgsjl_ygbh!=null)
	{
		crm_yglkgsjl_ygbh=crm_yglkgsjl_ygbh.trim();
		if (!(crm_yglkgsjl_ygbh.equals("")))	wheresql+=" and (crm_yglkgsjl.ygbh="+crm_yglkgsjl_ygbh+") ";
	}
	crm_yglkgsjl_yhmc=request.getParameter("crm_yglkgsjl_yhmc");
	if (crm_yglkgsjl_yhmc!=null)
	{
		crm_yglkgsjl_yhmc=cf.GB2Uni(crm_yglkgsjl_yhmc);
		if (!(crm_yglkgsjl_yhmc.equals("")))	wheresql+=" and  (crm_yglkgsjl.yhmc='"+crm_yglkgsjl_yhmc+"')";
	}
	crm_yglkgsjl_ygbm=request.getParameter("crm_yglkgsjl_ygbm");
	if (crm_yglkgsjl_ygbm!=null)
	{
		crm_yglkgsjl_ygbm=cf.GB2Uni(crm_yglkgsjl_ygbm);
		if (!(crm_yglkgsjl_ygbm.equals("")))	wheresql+=" and  (crm_yglkgsjl.ygbm='"+crm_yglkgsjl_ygbm+"')";
	}
	crm_yglkgsjl_rylx=request.getParameter("crm_yglkgsjl_rylx");
	if (crm_yglkgsjl_rylx!=null)
	{
		crm_yglkgsjl_rylx=cf.GB2Uni(crm_yglkgsjl_rylx);
		if (!(crm_yglkgsjl_rylx.equals("")))	wheresql+=" and  (crm_yglkgsjl.rylx='"+crm_yglkgsjl_rylx+"')";
	}
	crm_yglkgsjl_jhlkrq=request.getParameter("crm_yglkgsjl_jhlkrq");
	if (crm_yglkgsjl_jhlkrq!=null)
	{
		crm_yglkgsjl_jhlkrq=crm_yglkgsjl_jhlkrq.trim();
		if (!(crm_yglkgsjl_jhlkrq.equals("")))	wheresql+="  and (crm_yglkgsjl.jhlkrq>=TO_DATE('"+crm_yglkgsjl_jhlkrq+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_jhlkrq=request.getParameter("crm_yglkgsjl_jhlkrq2");
	if (crm_yglkgsjl_jhlkrq!=null)
	{
		crm_yglkgsjl_jhlkrq=crm_yglkgsjl_jhlkrq.trim();
		if (!(crm_yglkgsjl_jhlkrq.equals("")))	wheresql+="  and (crm_yglkgsjl.jhlkrq<=TO_DATE('"+crm_yglkgsjl_jhlkrq+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_jhlksj=request.getParameter("crm_yglkgsjl_jhlksj");
	if (crm_yglkgsjl_jhlksj!=null)
	{
		crm_yglkgsjl_jhlksj=crm_yglkgsjl_jhlksj.trim();
		if (!(crm_yglkgsjl_jhlksj.equals("")))	wheresql+=" and  (crm_yglkgsjl.jhlksj="+crm_yglkgsjl_jhlksj+") ";
	}
	crm_yglkgsjl_jhfhsj=request.getParameter("crm_yglkgsjl_jhfhsj");
	if (crm_yglkgsjl_jhfhsj!=null)
	{
		crm_yglkgsjl_jhfhsj=crm_yglkgsjl_jhfhsj.trim();
		if (!(crm_yglkgsjl_jhfhsj.equals("")))	wheresql+=" and  (crm_yglkgsjl.jhfhsj="+crm_yglkgsjl_jhfhsj+") ";
	}
	crm_yglkgsjl_lkgsmd=request.getParameter("crm_yglkgsjl_lkgsmd");
	if (crm_yglkgsjl_lkgsmd!=null)
	{
		crm_yglkgsjl_lkgsmd=cf.GB2Uni(crm_yglkgsjl_lkgsmd);
		if (!(crm_yglkgsjl_lkgsmd.equals("")))	wheresql+=" and  (crm_yglkgsjl.lkgsmd='"+crm_yglkgsjl_lkgsmd+"')";
	}
	crm_yglkgsjl_zt=request.getParameter("crm_yglkgsjl_zt");
	if (crm_yglkgsjl_zt!=null)
	{
		crm_yglkgsjl_zt=cf.GB2Uni(crm_yglkgsjl_zt);
		if (!(crm_yglkgsjl_zt.equals("")))	wheresql+=" and  (crm_yglkgsjl.zt='"+crm_yglkgsjl_zt+"')";
	}
	crm_yglkgsjl_lrr=request.getParameter("crm_yglkgsjl_lrr");
	if (crm_yglkgsjl_lrr!=null)
	{
		crm_yglkgsjl_lrr=cf.GB2Uni(crm_yglkgsjl_lrr);
		if (!(crm_yglkgsjl_lrr.equals("")))	wheresql+=" and  (crm_yglkgsjl.lrr='"+crm_yglkgsjl_lrr+"')";
	}
	crm_yglkgsjl_lrsj=request.getParameter("crm_yglkgsjl_lrsj");
	if (crm_yglkgsjl_lrsj!=null)
	{
		crm_yglkgsjl_lrsj=crm_yglkgsjl_lrsj.trim();
		if (!(crm_yglkgsjl_lrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lrsj>=TO_DATE('"+crm_yglkgsjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_lrsj=request.getParameter("crm_yglkgsjl_lrsj2");
	if (crm_yglkgsjl_lrsj!=null)
	{
		crm_yglkgsjl_lrsj=crm_yglkgsjl_lrsj.trim();
		if (!(crm_yglkgsjl_lrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lrsj<=TO_DATE('"+crm_yglkgsjl_lrsj+"','YYYY/MM/DD'))";
	}

	crm_yglkgsjl_ssfgs=request.getParameter("crm_yglkgsjl_ssfgs");
	if (crm_yglkgsjl_ssfgs!=null)
	{
		crm_yglkgsjl_ssfgs=cf.GB2Uni(crm_yglkgsjl_ssfgs);
		if (!(crm_yglkgsjl_ssfgs.equals("")))	wheresql+=" and  (crm_yglkgsjl.ssfgs='"+crm_yglkgsjl_ssfgs+"')";
	}
	ls_sql="SELECT crm_yglkgsjl.jlh,DECODE(crm_yglkgsjl.zt,'1','录入申请','2','离开公司','3','返回公司','4','已审核'),crm_yglkgsjl.ygbh,crm_yglkgsjl.yhmc,b.dwmc ygbm,crm_yglkgsjl.rylx,crm_yglkgsjl.jhlkrq,crm_yglkgsjl.jhlksj,crm_yglkgsjl.jhfhsj,crm_yglkgsjl.lkgsmd,crm_yglkgsjl.lkgssm,crm_yglkgsjl.lrr,crm_yglkgsjl.lrsj,a.dwmc fgs,crm_yglkgsjl.bz  ";
	ls_sql+=" FROM crm_yglkgsjl,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where crm_yglkgsjl.ssfgs=a.dwbh(+) and crm_yglkgsjl.ygbm=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_yglkgsjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_yglkgsjl.ygbm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jlh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_yglkgsjlLkXgList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jlh","crm_yglkgsjl_ygbh","crm_yglkgsjl_yhmc","crm_yglkgsjl_ygbm","crm_yglkgsjl_rylx","crm_yglkgsjl_jhlkrq","crm_yglkgsjl_jhlksj","crm_yglkgsjl_jhfhsj","crm_yglkgsjl_lkgsmd","crm_yglkgsjl_lkgssm","crm_yglkgsjl_zt","crm_yglkgsjl_lrr","crm_yglkgsjl_lrsj","crm_yglkgsjl_lrbm","sq_dwxx_dwmc","crm_yglkgsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除登记"};//按钮的显示名称
	String[] buttonLink={"DeleteLkCrm_yglkgsjl.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_yglkgsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">离开登记－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">记录号</td>
	<td  width="4%">状态</td>
	<td  width="3%">员工编号</td>
	<td  width="4%">员工名称</td>
	<td  width="7%">员工部门</td>
	<td  width="4%">人员类型</td>
	<td  width="5%">计划离开日期</td>
	<td  width="3%">计划离开时间</td>
	<td  width="3%">计划返回时间</td>
	<td  width="7%">离开公司目的</td>
	<td  width="25%">离开公司说明</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">所属公司</td>
	<td  width="15%">备注</td>
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