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
	String crm_sjsjdjl_sjsjdjlh=null;
	String crm_sjsjdjl_khbh=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_xb=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_lxfs=null;
	String crm_zxkhxx_lrsj=null;
	String crm_sjsjdjl_ssfgs=null;
	String crm_sjsjdjl_zxdm=null;
	String crm_sjsjdjl_sjs=null;
	String crm_sjsjdjl_kssj=null;
	String crm_sjsjdjl_kslrr=null;
	String crm_sjsjdjl_jssj=null;
	String crm_sjsjdjl_jslrr=null;
	String crm_sjsjdjl_sbyybm=null;
	String crm_sjsjdjl_zxzt=null;
	crm_sjsjdjl_sjsjdjlh=request.getParameter("crm_sjsjdjl_sjsjdjlh");
	if (crm_sjsjdjl_sjsjdjlh!=null)
	{
		crm_sjsjdjl_sjsjdjlh=cf.GB2Uni(crm_sjsjdjl_sjsjdjlh);
		if (!(crm_sjsjdjl_sjsjdjlh.equals("")))	wheresql+=" and  (crm_sjsjdjl.sjsjdjlh='"+crm_sjsjdjl_sjsjdjlh+"')";
	}
	crm_sjsjdjl_khbh=request.getParameter("crm_sjsjdjl_khbh");
	if (crm_sjsjdjl_khbh!=null)
	{
		crm_sjsjdjl_khbh=cf.GB2Uni(crm_sjsjdjl_khbh);
		if (!(crm_sjsjdjl_khbh.equals("")))	wheresql+=" and  (crm_sjsjdjl.khbh='"+crm_sjsjdjl_khbh+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_xb=request.getParameter("crm_zxkhxx_xb");
	if (crm_zxkhxx_xb!=null)
	{
		crm_zxkhxx_xb=cf.GB2Uni(crm_zxkhxx_xb);
		if (!(crm_zxkhxx_xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+crm_zxkhxx_xb+"')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+crm_zxkhxx_fwdz+"')";
	}
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj2");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_ssfgs=request.getParameter("crm_sjsjdjl_ssfgs");
	if (crm_sjsjdjl_ssfgs!=null)
	{
		crm_sjsjdjl_ssfgs=cf.GB2Uni(crm_sjsjdjl_ssfgs);
		if (!(crm_sjsjdjl_ssfgs.equals("")))	wheresql+=" and  (crm_sjsjdjl.ssfgs='"+crm_sjsjdjl_ssfgs+"')";
	}
	crm_sjsjdjl_zxdm=request.getParameter("crm_sjsjdjl_zxdm");
	if (crm_sjsjdjl_zxdm!=null)
	{
		crm_sjsjdjl_zxdm=cf.GB2Uni(crm_sjsjdjl_zxdm);
		if (!(crm_sjsjdjl_zxdm.equals("")))	wheresql+=" and  (crm_sjsjdjl.zxdm='"+crm_sjsjdjl_zxdm+"')";
	}
	crm_sjsjdjl_sjs=request.getParameter("crm_sjsjdjl_sjs");
	if (crm_sjsjdjl_sjs!=null)
	{
		crm_sjsjdjl_sjs=cf.GB2Uni(crm_sjsjdjl_sjs);
		if (!(crm_sjsjdjl_sjs.equals("")))	wheresql+=" and  (crm_sjsjdjl.sjs='"+crm_sjsjdjl_sjs+"')";
	}
	crm_sjsjdjl_kssj=request.getParameter("crm_sjsjdjl_kssj");
	if (crm_sjsjdjl_kssj!=null)
	{
		crm_sjsjdjl_kssj=crm_sjsjdjl_kssj.trim();
		if (!(crm_sjsjdjl_kssj.equals("")))	wheresql+="  and (crm_sjsjdjl.kssj>=TO_DATE('"+crm_sjsjdjl_kssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_kssj=request.getParameter("crm_sjsjdjl_kssj2");
	if (crm_sjsjdjl_kssj!=null)
	{
		crm_sjsjdjl_kssj=crm_sjsjdjl_kssj.trim();
		if (!(crm_sjsjdjl_kssj.equals("")))	wheresql+="  and (crm_sjsjdjl.kssj<=TO_DATE('"+crm_sjsjdjl_kssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_kslrr=request.getParameter("crm_sjsjdjl_kslrr");
	if (crm_sjsjdjl_kslrr!=null)
	{
		crm_sjsjdjl_kslrr=cf.GB2Uni(crm_sjsjdjl_kslrr);
		if (!(crm_sjsjdjl_kslrr.equals("")))	wheresql+=" and  (crm_sjsjdjl.kslrr='"+crm_sjsjdjl_kslrr+"')";
	}
	crm_sjsjdjl_jssj=request.getParameter("crm_sjsjdjl_jssj");
	if (crm_sjsjdjl_jssj!=null)
	{
		crm_sjsjdjl_jssj=crm_sjsjdjl_jssj.trim();
		if (!(crm_sjsjdjl_jssj.equals("")))	wheresql+="  and (crm_sjsjdjl.jssj>=TO_DATE('"+crm_sjsjdjl_jssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_jssj=request.getParameter("crm_sjsjdjl_jssj2");
	if (crm_sjsjdjl_jssj!=null)
	{
		crm_sjsjdjl_jssj=crm_sjsjdjl_jssj.trim();
		if (!(crm_sjsjdjl_jssj.equals("")))	wheresql+="  and (crm_sjsjdjl.jssj<=TO_DATE('"+crm_sjsjdjl_jssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_jslrr=request.getParameter("crm_sjsjdjl_jslrr");
	if (crm_sjsjdjl_jslrr!=null)
	{
		crm_sjsjdjl_jslrr=cf.GB2Uni(crm_sjsjdjl_jslrr);
		if (!(crm_sjsjdjl_jslrr.equals("")))	wheresql+=" and  (crm_sjsjdjl.jslrr='"+crm_sjsjdjl_jslrr+"')";
	}
	crm_sjsjdjl_sbyybm=request.getParameter("crm_sjsjdjl_sbyybm");
	if (crm_sjsjdjl_sbyybm!=null)
	{
		crm_sjsjdjl_sbyybm=cf.GB2Uni(crm_sjsjdjl_sbyybm);
		if (!(crm_sjsjdjl_sbyybm.equals("")))	wheresql+=" and  (crm_sjsjdjl.sbyybm='"+crm_sjsjdjl_sbyybm+"')";
	}
	crm_sjsjdjl_zxzt=request.getParameter("crm_sjsjdjl_zxzt");
	if (crm_sjsjdjl_zxzt!=null)
	{
		crm_sjsjdjl_zxzt=cf.GB2Uni(crm_sjsjdjl_zxzt);
		if (!(crm_sjsjdjl_zxzt.equals("")))	wheresql+=" and  (crm_sjsjdjl.zxzt='"+crm_sjsjdjl_zxzt+"')";
	}
	ls_sql="SELECT a.dwmc ssfgs,b.dwmc zxdm,crm_sjsjdjl.sjs,crm_sjsjdjl.sjsjdjlh,DECODE(crm_sjsjdjl.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') ,crm_sjsjdjl.khbh,crm_zxkhxx.khxm, DECODE(crm_zxkhxx.xb,'M','男','W','女'),crm_zxkhxx.fwdz,crm_zxkhxx.lrsj,crm_sjsjdjl.kssj,crm_sjsjdjl.kslrr,crm_sjsjdjl.jssj,crm_sjsjdjl.jslrr,dm_sbyybm.sbyymc,crm_sjsjdjl.sbyyxs";
	ls_sql+=" FROM dm_sbyybm,sq_dwxx a,sq_dwxx b,crm_zxkhxx,crm_sjsjdjl  ";
    ls_sql+=" where crm_sjsjdjl.sbyybm=dm_sbyybm.sbyybm(+) and crm_sjsjdjl.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_sjsjdjl.ssfgs=a.dwbh and crm_sjsjdjl.zxdm=b.dwbh";
    ls_sql+=" and (crm_sjsjdjl.zt='1' or crm_sjsjdjl.zt is null)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_sjsjdjl.ssfgs,crm_sjsjdjl.zxdm,crm_sjsjdjl.sjs,crm_sjsjdjl.sjsjdjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_sjsjdjlCxList.jsp","SelectCxCrm_sjsjdjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sjsjdjlh","crm_sjsjdjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_lrsj","crm_sjsjdjl_ssfgs","sq_dwxx_dwmc","crm_sjsjdjl_sjs","crm_sjsjdjl_kssj","crm_sjsjdjl_kslrr","crm_sjsjdjl_jssj","crm_sjsjdjl_jslrr","dm_sbyybm_sbyymc","crm_sjsjdjl_sbyyxs","crm_sjsjdjl_zxzt"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sjsjdjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"通知"};//按钮的显示名称
	String[] buttonLink={"SaveTz.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">设计师接单记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">所属分公司</td>
	<td  width="7%">咨询店面</td>
	<td  width="4%">设计师</td>
	<td  width="5%">设计师接单记录号</td>
	<td  width="6%">咨询状态</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="3%">性别</td>
	<td  width="14%">房屋地址</td>
	<td  width="5%">录入时间</td>
	<td  width="5%">首次来公司时间</td>
	<td  width="4%">开始录入人</td>
	<td  width="5%">结束时间</td>
	<td  width="4%">结束录入人</td>
	<td  width="7%">失败原因</td>
	<td  width="15%">失败原因详述</td>
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