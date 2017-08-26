<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	
	String crm_scbkhxx_ssfgs=null;
	crm_scbkhxx_ssfgs=request.getParameter("crm_scbkhxx_ssfgs");
	if (crm_scbkhxx_ssfgs!=null)
	{
		crm_scbkhxx_ssfgs=cf.GB2Uni(crm_scbkhxx_ssfgs);
		if (!(crm_scbkhxx_ssfgs.equals("")))	wheresql+=" and  (crm_scbkhxx.ssfgs='"+crm_scbkhxx_ssfgs+"')";
	}
	
	String crm_scbkhxx_khxm=null;
	crm_scbkhxx_khxm=request.getParameter("crm_scbkhxx_khxm");
	if (crm_scbkhxx_khxm!=null)
	{
		crm_scbkhxx_khxm=cf.GB2Uni(crm_scbkhxx_khxm);
		if (!(crm_scbkhxx_khxm.equals("")))	wheresql+=" and  (crm_scbkhxx.khxm='"+crm_scbkhxx_khxm+"')";
	}
	String crm_scbkhxx_khxm2=null;
	crm_scbkhxx_khxm2=request.getParameter("crm_scbkhxx_khxm2");
	if (crm_scbkhxx_khxm2!=null)
	{
		crm_scbkhxx_khxm2=cf.GB2Uni(crm_scbkhxx_khxm2);
		if (!(crm_scbkhxx_khxm2.equals("")))	wheresql+=" and  (crm_scbkhxx.khxm like '%"+crm_scbkhxx_khxm2+"%')";
	}
	String crm_scbkhxx_fwdz=null;
	crm_scbkhxx_fwdz=request.getParameter("crm_scbkhxx_fwdz");
	if (crm_scbkhxx_fwdz!=null)
	{
		crm_scbkhxx_fwdz=cf.GB2Uni(crm_scbkhxx_fwdz);
		if (!(crm_scbkhxx_fwdz.equals("")))	wheresql+=" and  (crm_scbkhxx.fwdz='"+crm_scbkhxx_fwdz+"')";
	}
	String crm_scbkhxx_fwdz2=null;
	crm_scbkhxx_fwdz2=request.getParameter("crm_scbkhxx_fwdz2");
	if (crm_scbkhxx_fwdz2!=null)
	{
		crm_scbkhxx_fwdz2=cf.GB2Uni(crm_scbkhxx_fwdz2);
		if (!(crm_scbkhxx_fwdz2.equals("")))	wheresql+=" and  (crm_scbkhxx.fwdz like '%"+crm_scbkhxx_fwdz2+"%')";
	}

	String crm_scbkhxx_lxfs=null;
	crm_scbkhxx_lxfs=request.getParameter("crm_scbkhxx_lxfs");
	if (crm_scbkhxx_lxfs!=null)
	{
		crm_scbkhxx_lxfs=cf.GB2Uni(crm_scbkhxx_lxfs);
		if (!(crm_scbkhxx_lxfs.equals("")))	wheresql+=" and  (crm_scbkhxx.lxfs='"+crm_scbkhxx_lxfs+"')";
	}
	String crm_scbkhxx_lxfs2=null;
	crm_scbkhxx_lxfs2=request.getParameter("crm_scbkhxx_lxfs2");
	if (crm_scbkhxx_lxfs2!=null)
	{
		crm_scbkhxx_lxfs2=cf.GB2Uni(crm_scbkhxx_lxfs2);
		if (!(crm_scbkhxx_lxfs2.equals("")))	wheresql+=" and  (crm_scbkhxx.lxfs like '%"+crm_scbkhxx_lxfs2+"%')";
	}
	
	
	
	String crm_scbkhxx_scbkhbh=null;
	String crm_scbkhxx_zt=null;
	crm_scbkhxx_scbkhbh=request.getParameter("crm_scbkhxx_scbkhbh");
	if (crm_scbkhxx_scbkhbh!=null)
	{
		crm_scbkhxx_scbkhbh=cf.GB2Uni(crm_scbkhxx_scbkhbh);
		if (!(crm_scbkhxx_scbkhbh.equals("")))	wheresql+=" and  (crm_scbkhxx.scbkhbh='"+crm_scbkhxx_scbkhbh+"')";
	}

	crm_scbkhxx_zt=request.getParameter("crm_scbkhxx_zt");
	if (crm_scbkhxx_zt!=null)
	{
		crm_scbkhxx_zt=cf.GB2Uni(crm_scbkhxx_zt);
		if (!(crm_scbkhxx_zt.equals("")))	wheresql+=" and  (crm_scbkhxx.zt='"+crm_scbkhxx_zt+"')";
	}
	String ywybm=null;
	ywybm=request.getParameter("ywybm");
	if (ywybm!=null)
	{
		ywybm=cf.GB2Uni(ywybm);
		if (!(ywybm.equals("")))	wheresql+=" and  (crm_scbkhxx.ywybm='"+ywybm+"')";
	}
	String crm_scbkhxx_ywyssxz=null;
	crm_scbkhxx_ywyssxz=request.getParameter("crm_scbkhxx_ywyssxz");
	if (crm_scbkhxx_ywyssxz!=null)
	{
		crm_scbkhxx_ywyssxz=cf.GB2Uni(crm_scbkhxx_ywyssxz);
		if (!(crm_scbkhxx_ywyssxz.equals("")))	wheresql+=" and  (crm_scbkhxx.ywyssxz='"+crm_scbkhxx_ywyssxz+"')";
	}
	String crm_scbkhxx_ywy=null;
	crm_scbkhxx_ywy=request.getParameter("crm_scbkhxx_ywy");
	if (crm_scbkhxx_ywy!=null)
	{
		crm_scbkhxx_ywy=cf.GB2Uni(crm_scbkhxx_ywy);
		if (!(crm_scbkhxx_ywy.equals("")))	wheresql+=" and  (crm_scbkhxx.ywy='"+crm_scbkhxx_ywy+"')";
	}
	String hfjg=null;
	hfjg=request.getParameter("hfjg");
	if (hfjg!=null)
	{
		hfjg=hfjg.trim();
		if (!(hfjg.equals("")))	wheresql+=" and (crm_scbkhxx.hfjg>="+hfjg+") ";
	}
	hfjg=request.getParameter("hfjg2");
	if (hfjg!=null)
	{
		hfjg=hfjg.trim();
		if (!(hfjg.equals("")))	wheresql+=" and (crm_scbkhxx.hfjg<="+hfjg+") ";
	}
	String crm_scbkhxx_zjgzsj=null;
	crm_scbkhxx_zjgzsj=request.getParameter("crm_scbkhxx_zjgzsj");
	if (crm_scbkhxx_zjgzsj!=null)
	{
		crm_scbkhxx_zjgzsj=crm_scbkhxx_zjgzsj.trim();
		if (!(crm_scbkhxx_zjgzsj.equals("")))	wheresql+="  and (crm_scbkhxx.zjgzsj>=TO_DATE('"+crm_scbkhxx_zjgzsj+"','YYYY-MM-DD'))";
	}
	crm_scbkhxx_zjgzsj=request.getParameter("crm_scbkhxx_zjgzsj2");
	if (crm_scbkhxx_zjgzsj!=null)
	{
		crm_scbkhxx_zjgzsj=crm_scbkhxx_zjgzsj.trim();
		if (!(crm_scbkhxx_zjgzsj.equals("")))	wheresql+="  and (crm_scbkhxx.zjgzsj<=TO_DATE('"+crm_scbkhxx_zjgzsj+"','YYYY-MM-DD'))";
	}

	String crm_scbkhxx_khzyxz=null;
	String crm_scbkhxx_xqlx=null;
	crm_scbkhxx_khzyxz=request.getParameter("crm_scbkhxx_khzyxz");
	if (crm_scbkhxx_khzyxz!=null)
	{
		crm_scbkhxx_khzyxz=cf.GB2Uni(crm_scbkhxx_khzyxz);
		if (!(crm_scbkhxx_khzyxz.equals("")))	wheresql+=" and  (crm_scbkhxx.khzyxz='"+crm_scbkhxx_khzyxz+"')";
	}
	crm_scbkhxx_xqlx=request.getParameter("crm_scbkhxx_xqlx");
	if (crm_scbkhxx_xqlx!=null)
	{
		crm_scbkhxx_xqlx=cf.GB2Uni(crm_scbkhxx_xqlx);
		if (!(crm_scbkhxx_xqlx.equals("")))	wheresql+=" and  (crm_scbkhxx.xqlx='"+crm_scbkhxx_xqlx+"')";
	}
	



	
	String crm_scbkhgzjl_jlh=null;
	crm_scbkhgzjl_jlh=request.getParameter("crm_scbkhgzjl_jlh");
	if (crm_scbkhgzjl_jlh!=null)
	{
		crm_scbkhgzjl_jlh=cf.GB2Uni(crm_scbkhgzjl_jlh);
		if (!(crm_scbkhgzjl_jlh.equals("")))	wheresql+=" and  (crm_scbkhgzjl.jlh='"+crm_scbkhgzjl_jlh+"')";
	}
	String sckhyxbm=null;
	sckhyxbm=request.getParameter("sckhyxbm");
	if (sckhyxbm!=null)
	{
		sckhyxbm=cf.GB2Uni(sckhyxbm);
		if (!(sckhyxbm.equals("")))	wheresql+=" and  (crm_scbkhgzjl.sckhyxbm='"+sckhyxbm+"')";
	}



	String sfxhf=null;
	String xchfsj=null;
	sfxhf=request.getParameter("sfxhf");
	if (sfxhf!=null)
	{
		sfxhf=cf.GB2Uni(sfxhf);
		if (!(sfxhf.equals("")))	wheresql+=" and  (crm_scbkhgzjl.sfxhf='"+sfxhf+"')";
	}
	xchfsj=request.getParameter("xchfsj");
	if (xchfsj!=null)
	{
		xchfsj=xchfsj.trim();
		if (!(xchfsj.equals("")))	wheresql+="  and (crm_scbkhgzjl.xchfsj>=TO_DATE('"+xchfsj+"','YYYY-MM-DD'))";
	}
	xchfsj=request.getParameter("xchfsj2");
	if (xchfsj!=null)
	{
		xchfsj=xchfsj.trim();
		if (!(xchfsj.equals("")))	wheresql+="  and (crm_scbkhgzjl.xchfsj<=TO_DATE('"+xchfsj+"','YYYY-MM-DD'))";
	}
	
	String yyddsj=null;
	yyddsj=request.getParameter("yyddsj");
	if (yyddsj!=null)
	{
		yyddsj=yyddsj.trim();
		if (!(yyddsj.equals("")))	wheresql+="  and (crm_scbkhgzjl.yyddsj>=TO_DATE('"+yyddsj+"','YYYY-MM-DD'))";
	}
	yyddsj=request.getParameter("yyddsj2");
	if (yyddsj!=null)
	{
		yyddsj=yyddsj.trim();
		if (!(yyddsj.equals("")))	wheresql+="  and (crm_scbkhgzjl.yyddsj<=TO_DATE('"+yyddsj+"','YYYY-MM-DD'))";
	}
	

	
	

	String crm_scbkhgzjl_lrr=null;
	String crm_scbkhgzjl_lrsj=null;
	String crm_scbkhgzjl_lrbm=null;
	crm_scbkhgzjl_lrr=request.getParameter("crm_scbkhgzjl_lrr");
	if (crm_scbkhgzjl_lrr!=null)
	{
		crm_scbkhgzjl_lrr=cf.GB2Uni(crm_scbkhgzjl_lrr);
		if (!(crm_scbkhgzjl_lrr.equals("")))	wheresql+=" and  (crm_scbkhgzjl.lrr='"+crm_scbkhgzjl_lrr+"')";
	}
	crm_scbkhgzjl_lrsj=request.getParameter("crm_scbkhgzjl_lrsj");
	if (crm_scbkhgzjl_lrsj!=null)
	{
		crm_scbkhgzjl_lrsj=crm_scbkhgzjl_lrsj.trim();
		if (!(crm_scbkhgzjl_lrsj.equals("")))	wheresql+="  and (crm_scbkhgzjl.lrsj>=TO_DATE('"+crm_scbkhgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhgzjl_lrsj=request.getParameter("crm_scbkhgzjl_lrsj2");
	if (crm_scbkhgzjl_lrsj!=null)
	{
		crm_scbkhgzjl_lrsj=crm_scbkhgzjl_lrsj.trim();
		if (!(crm_scbkhgzjl_lrsj.equals("")))	wheresql+="  and (crm_scbkhgzjl.lrsj<=TO_DATE('"+crm_scbkhgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhgzjl_lrbm=request.getParameter("crm_scbkhgzjl_lrbm");
	if (crm_scbkhgzjl_lrbm!=null)
	{
		crm_scbkhgzjl_lrbm=cf.GB2Uni(crm_scbkhgzjl_lrbm);
		if (!(crm_scbkhgzjl_lrbm.equals("")))	wheresql+=" and  (crm_scbkhgzjl.lrbm='"+crm_scbkhgzjl_lrbm+"')";
	}
	ls_sql="SELECT crm_scbkhgzjl.jlh,crm_scbkhxx.khxm,crm_scbkhxx.fwdz,crm_scbkhxx.ywy,DECODE(crm_scbkhxx.zt,'1','跟踪','6','准备失败','2','失败','5','准备移交','3','移交','4','已接收','7','移交过期'),sckhyxmc,crm_scbkhgzjl.yyddsj,DECODE(crm_scbkhgzjl.sfxhf,'Y','需要','N','否'),crm_scbkhgzjl.xchfsj,crm_scbkhgzjl.gzsm,crm_scbkhgzjl.lrr,crm_scbkhgzjl.lrsj,a.dwmc,b.dwmc ywyssxz,crm_scbkhgzjl.scbkhbh  ";
	ls_sql+=" FROM crm_scbkhgzjl,crm_scbkhxx,sq_dwxx a,sq_dwxx b,dm_sckhyxbm ";
    ls_sql+=" where crm_scbkhgzjl.scbkhbh=crm_scbkhxx.scbkhbh(+) and crm_scbkhgzjl.lrbm=a.dwbh(+) and crm_scbkhxx.ywyssxz=b.dwbh(+)";
    ls_sql+=" and crm_scbkhgzjl.sckhyxbm=dm_sckhyxbm.sckhyxbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_scbkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_scbkhxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_scbkhgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_scbkhgzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jlh","crm_scbkhgzjl_scbkhbh","crm_scbkhxx_khxm","crm_scbkhxx_fwdz","crm_scbkhxx_lxfs","crm_scbkhxx_ywy","ywyssxz","crm_scbkhxx_zt","crm_scbkhgzjl_gzsm","crm_scbkhgzjl_lrr","crm_scbkhgzjl_lrsj","crm_scbkhgzjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"scbkhbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/scbkh/ViewCrm_scbkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<CENTER >
  <B><font size="3">客户回访－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">记录号</td>
	<td  width="4%">客户姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">业务员</td>
	<td  width="4%">状态</td>
	<td  width="4%">客户意向</td>
	<td  width="4%">预约到店时间</td>
	<td  width="3%">是否需回访</td>
	<td  width="4%">下次回访时间</td>
	<td  width="38%">跟踪说明</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="6%">所属小组</td>
	<td  width="3%">客户编号</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

<%
	pageObj.printScript();
%> 
//-->
</script>
</html>