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
	String crm_zjxdj_zjxxh=null;
	String hth=null;
	String crm_zjxdj_khbh=null;
	String crm_zjxdj_khxm=null;
	String crm_zjxdj_dh=null;
	String crm_zjxdj_sgd=null;
	String crm_zjxdj_sgbz=null;
	String crm_zjxdj_zjxyybm=null;
	String crm_zjxdj_zjxyysm=null;
	String crm_zjxdj_zjje=null;
	String crm_zjxdj_lrr=null;
	String crm_zjxdj_lrsj=null;
	String fssj=null;
	String crm_zjxdj_fwdz=null;
	String zjxfsjd=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String zjxwcbz=null;
	zjxwcbz=request.getParameter("zjxwcbz");
	if (zjxwcbz!=null)
	{
		zjxwcbz=zjxwcbz.trim();
		if (!(zjxwcbz.equals("")))	wheresql+=" and (crm_zjxdj.zjxwcbz="+zjxwcbz+") ";
	}

	String crm_zjxdj_lrdw=null;
	crm_zjxdj_lrdw=request.getParameter("crm_zjxdj_lrdw");
	if (crm_zjxdj_lrdw!=null)
	{
		if (!(crm_zjxdj_lrdw.equals("")))	wheresql+=" and  (crm_zjxdj.lrdw='"+crm_zjxdj_lrdw+"')";
	}

	crm_zjxdj_zjxxh=request.getParameter("crm_zjxdj_zjxxh");
	if (crm_zjxdj_zjxxh!=null)
	{
		crm_zjxdj_zjxxh=crm_zjxdj_zjxxh.trim();
		if (!(crm_zjxdj_zjxxh.equals("")))	wheresql+=" and (crm_zjxdj.zjxxh="+crm_zjxdj_zjxxh+") ";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	crm_zjxdj_khbh=request.getParameter("crm_zjxdj_khbh");
	if (crm_zjxdj_khbh!=null)
	{
		crm_zjxdj_khbh=cf.GB2Uni(crm_zjxdj_khbh);
		if (!(crm_zjxdj_khbh.equals("")))	wheresql+=" and  (crm_zjxdj.khbh='"+crm_zjxdj_khbh+"')";
	}
	crm_zjxdj_khxm=request.getParameter("crm_zjxdj_khxm");
	if (crm_zjxdj_khxm!=null)
	{
		crm_zjxdj_khxm=cf.GB2Uni(crm_zjxdj_khxm);
		if (!(crm_zjxdj_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_zjxdj_khxm+"%')";
	}
	crm_zjxdj_dh=request.getParameter("crm_zjxdj_dh");
	if (crm_zjxdj_dh!=null)
	{
		crm_zjxdj_dh=cf.GB2Uni(crm_zjxdj_dh);
		if (!(crm_zjxdj_dh.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_zjxdj_dh+"%')";
	}
	crm_zjxdj_sgd=request.getParameter("crm_zjxdj_sgd");
	if (crm_zjxdj_sgd!=null)
	{
		crm_zjxdj_sgd=cf.GB2Uni(crm_zjxdj_sgd);
		if (!(crm_zjxdj_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_zjxdj_sgd+"')";
	}
	crm_zjxdj_sgbz=request.getParameter("crm_zjxdj_sgbz");
	if (crm_zjxdj_sgbz!=null)
	{
		crm_zjxdj_sgbz=cf.GB2Uni(crm_zjxdj_sgbz);
		if (!(crm_zjxdj_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_zjxdj_sgbz+"')";
	}
	crm_zjxdj_zjxyybm=request.getParameter("crm_zjxdj_zjxyybm");
	if (crm_zjxdj_zjxyybm!=null)
	{
		crm_zjxdj_zjxyybm=cf.GB2Uni(crm_zjxdj_zjxyybm);
		if (!(crm_zjxdj_zjxyybm.equals("")))	wheresql+=" and  (crm_zjxyydj.zjxyybm='"+crm_zjxdj_zjxyybm+"')";
	}
	zjxfsjd=request.getParameter("zjxfsjd");
	if (zjxfsjd!=null)
	{
		if (!(zjxfsjd.equals("")))	wheresql+=" and  (crm_zjxdj.zjxfsjd='"+zjxfsjd+"')";
	}
	crm_zjxdj_zjxyysm=request.getParameter("crm_zjxdj_zjxyysm");
	if (crm_zjxdj_zjxyysm!=null)
	{
		crm_zjxdj_zjxyysm=cf.GB2Uni(crm_zjxdj_zjxyysm);
		if (!(crm_zjxdj_zjxyysm.equals("")))	wheresql+=" and  (crm_zjxdj.zjxyysm like '%"+crm_zjxdj_zjxyysm+"%')";
	}
	crm_zjxdj_zjje=request.getParameter("crm_zjxdj_zjje");
	if (crm_zjxdj_zjje!=null)
	{
		crm_zjxdj_zjje=crm_zjxdj_zjje.trim();
		if (!(crm_zjxdj_zjje.equals("")))	wheresql+=" and  (crm_zjxdj.zjje="+crm_zjxdj_zjje+") ";
	}
	crm_zjxdj_lrr=request.getParameter("crm_zjxdj_lrr");
	if (crm_zjxdj_lrr!=null)
	{
		crm_zjxdj_lrr=cf.GB2Uni(crm_zjxdj_lrr);
		if (!(crm_zjxdj_lrr.equals("")))	wheresql+=" and  (crm_zjxdj.lrr='"+crm_zjxdj_lrr+"')";
	}
	fssj=request.getParameter("fssj");
	if (fssj!=null)
	{
		if (!(fssj.equals("")))	wheresql+="  and (crm_zjxdj.fssj>=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	fssj=request.getParameter("fssj2");
	if (fssj!=null)
	{
		if (!(fssj.equals("")))	wheresql+="  and (crm_zjxdj.fssj<=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	crm_zjxdj_lrsj=request.getParameter("crm_zjxdj_lrsj");
	if (crm_zjxdj_lrsj!=null)
	{
		crm_zjxdj_lrsj=crm_zjxdj_lrsj.trim();
		if (!(crm_zjxdj_lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj>=TO_DATE('"+crm_zjxdj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zjxdj_lrsj=request.getParameter("crm_zjxdj_lrsj2");
	if (crm_zjxdj_lrsj!=null)
	{
		crm_zjxdj_lrsj=crm_zjxdj_lrsj.trim();
		if (!(crm_zjxdj_lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj<=TO_DATE('"+crm_zjxdj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zjxdj_fwdz=request.getParameter("crm_zjxdj_fwdz");
	if (crm_zjxdj_fwdz!=null)
	{
		crm_zjxdj_fwdz=cf.GB2Uni(crm_zjxdj_fwdz);
		if (!(crm_zjxdj_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_zjxdj_fwdz+"%')";
	}
	ls_sql="SELECT  hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,sjs,crm_zjxdj.zjxxh,'修改' xg,'删除' sc,DECODE(crm_zjxdj.zjxwcbz,'1','未完成','2','已完成') zjxwcbz,crm_zjxdj.gckk,zjxfsjdmc,crm_zjxdj.zjje,crm_zjxdj.jzjje,crm_zjxdj.kglf,crm_zjxdj.kqtk,fssj,crm_zjxdj.lrr,dm_zjxyybm.zjxyymc";
	ls_sql+=" FROM crm_zjxdj,crm_zjxyydj,dm_zjxyybm,crm_khxx,sq_sgd,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxyydj.zjxyybm=dm_zjxyybm.zjxyybm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_zjxdj.zjxxh=crm_zjxyydj.zjxxh(+) and crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=" and (crm_khxx.gckkspbz='N' or crm_khxx.gckkspbz is null)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_zjxdj.lrsj,crm_zjxdj.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zjxdjList.jsp","SelectCrm_zjxdj.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zjxxh","crm_zjxdj_fylxbm","crm_zjxdj_khbh","crm_zjxdj_khxm","crm_zjxdj_dh","crm_zjxdj_sgd","dm_zjxyybm_zjxyymc","crm_zjxdj_zjje","crm_zjxdj_fwdz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("zjxxh","1");//列参数对象加入Hash表
	spanColHash.put("xg","1");//列参数对象加入Hash表
	spanColHash.put("sc","1");//列参数对象加入Hash表
	spanColHash.put("zjxwcbz","1");//列参数对象加入Hash表
	spanColHash.put("gckk","1");//列参数对象加入Hash表
	spanColHash.put("zjxfsjdmc","1");//列参数对象加入Hash表
	spanColHash.put("zjje","1");//列参数对象加入Hash表
	spanColHash.put("jzjje","1");//列参数对象加入Hash表
	spanColHash.put("kglf","1");//列参数对象加入Hash表
	spanColHash.put("kqtk","1");//列参数对象加入Hash表
	spanColHash.put("fssj","1");//列参数对象加入Hash表
	spanColHash.put("lrr","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="EditCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
//	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xg",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey3={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey3;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/zjx/DeleteCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">合同号</td>
	<td  width="4%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="4%">施工队</td>
	<td  width="4%">设计师</td>
	<td  width="5%">增减项序号</td>
	<td  width="3%">修改</td>
	<td  width="3%">删除</td>
	<td  width="4%">增减项完成标志</td>
	<td  width="4%">工程扣款</td>
	<td  width="4%">发生阶段</td>
	<td  width="6%">折前增减项发生额</td>
	<td  width="6%">折后增减项发生额</td>
	<td  width="5%">扣管理费</td>
	<td  width="5%">扣其它款</td>
	<td  width="5%">增减项发生时间</td>
	<td  width="4%">录入人</td>
	<td  width="13%">增减项原因</td>
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