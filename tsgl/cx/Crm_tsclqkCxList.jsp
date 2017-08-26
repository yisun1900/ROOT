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
	String crm_tsjl_tsjlh=null;
	String crm_tsjl_tslxbm=null;
	String crm_tsjl_slfsbm=null;
	String crm_tsjl_tsyybm=null;
	String crm_tsjl_hth=null;
	String crm_tsjl_khbh=null;
	String crm_tsjl_khxm=null;
	String crm_tsjl_fwdz=null;
	String crm_tsjl_lxfs=null;
	String crm_tsjl_sjs=null;
	String crm_tsjl_sgd=null;
	String crm_tsjl_zjy=null;
	String crm_tsjl_jgrq=null;
	String crm_tsjl_sfxhf=null;
	String crm_tsjl_hfsj=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_clzt=null;
	String crm_tsjl_zzjgbm=null;
	String crm_tsjl_tsnr=null;
	String crm_tsjl_yqjjsj=null;
	String yzcdbm=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";

	String qydm=null;
	qydm=request.getParameter("qydm");
	if (qydm!=null)
	{
		if (!(qydm.equals("")))	wheresql+=" and  (crm_tsjl.dwbh='"+qydm+"')";
	}


	yzcdbm=request.getParameter("yzcdbm");
	if (yzcdbm!=null)
	{
		if (!(yzcdbm.equals("")))	wheresql+=" and  (crm_tsjl.yzcdbm='"+yzcdbm+"')";
	}
	String slbm=null;
	slbm=request.getParameter("slbm");
	if (slbm!=null)
	{
		if (!(slbm.equals("")))	wheresql+=" and  (crm_tsjl.slbm='"+slbm+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_tsclqk.dwbh='"+dwbh+"')";
	}
	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj>=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj2");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj<=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}

	crm_tsjl_tsjlh=request.getParameter("crm_tsjl_tsjlh");
	if (crm_tsjl_tsjlh!=null)
	{
		crm_tsjl_tsjlh=crm_tsjl_tsjlh.trim();
		if (!(crm_tsjl_tsjlh.equals("")))	wheresql+=" and (crm_tsjl.tsjlh="+crm_tsjl_tsjlh+") ";
	}
	crm_tsjl_tslxbm=request.getParameter("crm_tsjl_tslxbm");
	if (crm_tsjl_tslxbm!=null)
	{
		crm_tsjl_tslxbm=cf.GB2Uni(crm_tsjl_tslxbm);
		if (!(crm_tsjl_tslxbm.equals("")))	wheresql+=" and  (crm_tsjl.tslxbm='"+crm_tsjl_tslxbm+"')";
	}
	crm_tsjl_slfsbm=request.getParameter("crm_tsjl_slfsbm");
	if (crm_tsjl_slfsbm!=null)
	{
		crm_tsjl_slfsbm=cf.GB2Uni(crm_tsjl_slfsbm);
		if (!(crm_tsjl_slfsbm.equals("")))	wheresql+=" and  (crm_tsjl.slfsbm='"+crm_tsjl_slfsbm+"')";
	}
	crm_tsjl_tsyybm=request.getParameter("crm_tsjl_tsyybm");
	if (crm_tsjl_tsyybm!=null)
	{
		crm_tsjl_tsyybm=cf.GB2Uni(crm_tsjl_tsyybm);
		if (!(crm_tsjl_tsyybm.equals("")))	wheresql+=" and  (crm_tsjl.tsyybm='"+crm_tsjl_tsyybm+"')";
	}
	crm_tsjl_hth=request.getParameter("crm_tsjl_hth");
	if (crm_tsjl_hth!=null)
	{
		crm_tsjl_hth=cf.GB2Uni(crm_tsjl_hth);
		if (!(crm_tsjl_hth.equals("")))	wheresql+=" and  (crm_tsjl.hth='"+crm_tsjl_hth+"')";
	}
	crm_tsjl_khbh=request.getParameter("crm_tsjl_khbh");
	if (crm_tsjl_khbh!=null)
	{
		crm_tsjl_khbh=cf.GB2Uni(crm_tsjl_khbh);
		if (!(crm_tsjl_khbh.equals("")))	wheresql+=" and  (crm_tsjl.khbh='"+crm_tsjl_khbh+"')";
	}
	crm_tsjl_khxm=request.getParameter("crm_tsjl_khxm");
	if (crm_tsjl_khxm!=null)
	{
		crm_tsjl_khxm=cf.GB2Uni(crm_tsjl_khxm);
		if (!(crm_tsjl_khxm.equals("")))	wheresql+=" and  (crm_tsjl.khxm like '%"+crm_tsjl_khxm+"%')";
	}
	crm_tsjl_fwdz=request.getParameter("crm_tsjl_fwdz");
	if (crm_tsjl_fwdz!=null)
	{
		crm_tsjl_fwdz=cf.GB2Uni(crm_tsjl_fwdz);
		if (!(crm_tsjl_fwdz.equals("")))	wheresql+=" and  (crm_tsjl.fwdz like '%"+crm_tsjl_fwdz+"%')";
	}
	crm_tsjl_lxfs=request.getParameter("crm_tsjl_lxfs");
	if (crm_tsjl_lxfs!=null)
	{
		crm_tsjl_lxfs=cf.GB2Uni(crm_tsjl_lxfs);
		if (!(crm_tsjl_lxfs.equals("")))	wheresql+=" and  (crm_tsjl.lxfs='"+crm_tsjl_lxfs+"')";
	}
	crm_tsjl_sjs=request.getParameter("crm_tsjl_sjs");
	if (crm_tsjl_sjs!=null)
	{
		crm_tsjl_sjs=cf.GB2Uni(crm_tsjl_sjs);
		if (!(crm_tsjl_sjs.equals("")))	wheresql+=" and  (crm_tsjl.sjs='"+crm_tsjl_sjs+"')";
	}
	crm_tsjl_sgd=request.getParameter("crm_tsjl_sgd");
	if (crm_tsjl_sgd!=null)
	{
		crm_tsjl_sgd=cf.GB2Uni(crm_tsjl_sgd);
		if (!(crm_tsjl_sgd.equals("")))	wheresql+=" and  (crm_tsjl.sgd='"+crm_tsjl_sgd+"')";
	}
	crm_tsjl_zjy=request.getParameter("crm_tsjl_zjy");
	if (crm_tsjl_zjy!=null)
	{
		crm_tsjl_zjy=cf.GB2Uni(crm_tsjl_zjy);
		if (!(crm_tsjl_zjy.equals("")))	wheresql+=" and  (crm_tsjl.zjy='"+crm_tsjl_zjy+"')";
	}
	crm_tsjl_jgrq=request.getParameter("crm_tsjl_jgrq");
	if (crm_tsjl_jgrq!=null)
	{
		crm_tsjl_jgrq=crm_tsjl_jgrq.trim();
		if (!(crm_tsjl_jgrq.equals("")))	wheresql+="  and (crm_tsjl.jgrq=TO_DATE('"+crm_tsjl_jgrq+"','YYYY/MM/DD'))";
	}
	crm_tsjl_sfxhf=request.getParameter("crm_tsjl_sfxhf");
	if (crm_tsjl_sfxhf!=null)
	{
		crm_tsjl_sfxhf=cf.GB2Uni(crm_tsjl_sfxhf);
		if (!(crm_tsjl_sfxhf.equals("")))	wheresql+=" and  (crm_tsjl.sfxhf='"+crm_tsjl_sfxhf+"')";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	wheresql+="  and (crm_tsjl.hfsj>=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj2");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	wheresql+="  and (crm_tsjl.hfsj<=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj2");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slr=request.getParameter("crm_tsjl_slr");
	if (crm_tsjl_slr!=null)
	{
		crm_tsjl_slr=cf.GB2Uni(crm_tsjl_slr);
		if (!(crm_tsjl_slr.equals("")))	wheresql+=" and  (crm_tsjl.slr='"+crm_tsjl_slr+"')";
	}
	crm_tsjl_clzt=request.getParameter("crm_tsjl_clzt");
	if (crm_tsjl_clzt!=null)
	{
		crm_tsjl_clzt=cf.GB2Uni(crm_tsjl_clzt);
		if (!(crm_tsjl_clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+crm_tsjl_clzt+"')";
	}
	crm_tsjl_zzjgbm=request.getParameter("crm_tsjl_zzjgbm");
	if (crm_tsjl_zzjgbm!=null)
	{
		crm_tsjl_zzjgbm=cf.GB2Uni(crm_tsjl_zzjgbm);
		if (!(crm_tsjl_zzjgbm.equals("")))	wheresql+=" and  (crm_tsjl.zzjgbm='"+crm_tsjl_zzjgbm+"')";
	}
	crm_tsjl_tsnr=request.getParameter("crm_tsjl_tsnr");
	if (crm_tsjl_tsnr!=null)
	{
		crm_tsjl_tsnr=cf.GB2Uni(crm_tsjl_tsnr);
		if (!(crm_tsjl_tsnr.equals("")))	wheresql+=" and  (crm_tsjl.tsnr like '%"+crm_tsjl_tsnr+"%')";
	}
	ls_sql="SELECT crm_tsjl.tsjlh as tsjlh,dwmc,crm_tsjl.khbh as khbh,dm_tslxbm.tslxmc as dm_tslxbm_tslxmc,clqk,crm_tsjl.khxm as crm_tsjl_khxm,tsnr,crm_tsjl.slsj as crm_tsjl_slsj,DECODE(crm_tsjl.clzt,0,'非客服登记',1,'客服受理',2,'在处理',3,'结案') as jazt,DECODE(crm_tsclqk.clzt,0,'未通知',1,'未处理',2,'在处理','3','解决') as clzt,clsj,clr";
	ls_sql+=" FROM crm_tsjl,dm_tslxbm,sq_dwxx,crm_tsclqk  ";
    ls_sql+=" where crm_tsjl.tslxbm=dm_tslxbm.tslxbm ";
    ls_sql+=" and crm_tsclqk.dwbh=sq_dwxx.dwbh and crm_tsjl.tsjlh=crm_tsclqk.tsjlh";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.slsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tsclqkCxList.jsp","SelectCxCrm_tsclqk.jsp","","");
	pageObj.setPageRow(50);//设置每页显示记录数

//设置显示列
	String[] disColName={"tsjlh","crm_tsjl_khxm","dm_tslxbm_tslxmc","crm_tsjl_slsj","tsnr","jazt","dwmc","clzt","clqk","clsj","clr"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[4]="align='left'";
	pageObj.alignStr[8]="align='left'";

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("crm_tsjl_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tsjlh","1");//列参数对象加入Hash表
	spanColHash.put("crm_tsjl_khxm","1");//列参数对象加入Hash表
	spanColHash.put("dm_tslxbm_tslxmc","1");//列参数对象加入Hash表
	spanColHash.put("crm_tsjl_slsj","1");//列参数对象加入Hash表
	spanColHash.put("jazt","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">受理序号</td>
	<td  width="4%">姓名</td>
	<td  width="8%">原因</td>
	<td  width="6%">客服受理时间</td>
	<td  width="27%">投诉报修内容</td>
	<td  width="5%">结案状态</td>
	<td  width="7%">责任部门</td>
	<td  width="5%">处理状态</td>
	<td  width="23%">处理情况</td>
	<td  width="6%">处理时间</td>
	<td  width="4%">处理人</td>
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