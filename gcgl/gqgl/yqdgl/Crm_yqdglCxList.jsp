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

	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
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
	
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	

	String crm_yqdgl_yqdbh=null;
	String crm_yqdgl_sqsj=null;
	String crm_yqdgl_zjts=null;
	String crm_yqdgl_clzt=null;
	String crm_yqdgl_lrr=null;
	String crm_yqdgl_lrsj=null;

	crm_yqdgl_yqdbh=request.getParameter("crm_yqdgl_yqdbh");
	if (crm_yqdgl_yqdbh!=null)
	{
		crm_yqdgl_yqdbh=cf.GB2Uni(crm_yqdgl_yqdbh);
		if (!(crm_yqdgl_yqdbh.equals("")))	wheresql+=" and  (crm_yqdgl.yqdbh='"+crm_yqdgl_yqdbh+"')";
	}
	crm_yqdgl_sqsj=request.getParameter("crm_yqdgl_sqsj");
	if (crm_yqdgl_sqsj!=null)
	{
		crm_yqdgl_sqsj=crm_yqdgl_sqsj.trim();
		if (!(crm_yqdgl_sqsj.equals("")))	wheresql+="  and (crm_yqdgl.sqsj>=TO_DATE('"+crm_yqdgl_sqsj+"','YYYY/MM/DD'))";
	}
	crm_yqdgl_sqsj=request.getParameter("crm_yqdgl_sqsj2");
	if (crm_yqdgl_sqsj!=null)
	{
		crm_yqdgl_sqsj=crm_yqdgl_sqsj.trim();
		if (!(crm_yqdgl_sqsj.equals("")))	wheresql+="  and (crm_yqdgl.sqsj<=TO_DATE('"+crm_yqdgl_sqsj+"','YYYY/MM/DD'))";
	}
	crm_yqdgl_zjts=request.getParameter("crm_yqdgl_zjts");
	if (crm_yqdgl_zjts!=null)
	{
		crm_yqdgl_zjts=crm_yqdgl_zjts.trim();
		if (!(crm_yqdgl_zjts.equals("")))	wheresql+=" and (crm_yqdgl.zjts>="+crm_yqdgl_zjts+") ";
	}
	crm_yqdgl_zjts=request.getParameter("crm_yqdgl_zjts2");
	if (crm_yqdgl_zjts!=null)
	{
		crm_yqdgl_zjts=crm_yqdgl_zjts.trim();
		if (!(crm_yqdgl_zjts.equals("")))	wheresql+=" and (crm_yqdgl.zjts<="+crm_yqdgl_zjts+") ";
	}
	crm_yqdgl_clzt=request.getParameter("crm_yqdgl_clzt");
	if (crm_yqdgl_clzt!=null)
	{
		crm_yqdgl_clzt=cf.GB2Uni(crm_yqdgl_clzt);
		if (!(crm_yqdgl_clzt.equals("")))	wheresql+=" and  (crm_yqdgl.clzt='"+crm_yqdgl_clzt+"')";
	}
	crm_yqdgl_lrr=request.getParameter("crm_yqdgl_lrr");
	if (crm_yqdgl_lrr!=null)
	{
		crm_yqdgl_lrr=cf.GB2Uni(crm_yqdgl_lrr);
		if (!(crm_yqdgl_lrr.equals("")))	wheresql+=" and  (crm_yqdgl.lrr='"+crm_yqdgl_lrr+"')";
	}
	crm_yqdgl_lrsj=request.getParameter("crm_yqdgl_lrsj");
	if (crm_yqdgl_lrsj!=null)
	{
		crm_yqdgl_lrsj=crm_yqdgl_lrsj.trim();
		if (!(crm_yqdgl_lrsj.equals("")))	wheresql+="  and (crm_yqdgl.lrsj>=TO_DATE('"+crm_yqdgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_yqdgl_lrsj=request.getParameter("crm_yqdgl_lrsj2");
	if (crm_yqdgl_lrsj!=null)
	{
		crm_yqdgl_lrsj=crm_yqdgl_lrsj.trim();
		if (!(crm_yqdgl_lrsj.equals("")))	wheresql+="  and (crm_yqdgl.lrsj<=TO_DATE('"+crm_yqdgl_lrsj+"','YYYY/MM/DD'))";
	}

	String crm_yqdgl_shr=null;
	String crm_yqdgl_shsj=null;
	String crm_yqdgl_shjg=null;
	String crm_yqdgl_shts=null;
	String crm_khxx_sgd=null;
	crm_yqdgl_shr=request.getParameter("crm_yqdgl_shr");
	if (crm_yqdgl_shr!=null)
	{
		crm_yqdgl_shr=cf.GB2Uni(crm_yqdgl_shr);
		if (!(crm_yqdgl_shr.equals("")))	wheresql+=" and  (crm_yqdgl.shr='"+crm_yqdgl_shr+"')";
	}
	crm_yqdgl_shsj=request.getParameter("crm_yqdgl_shsj");
	if (crm_yqdgl_shsj!=null)
	{
		crm_yqdgl_shsj=crm_yqdgl_shsj.trim();
		if (!(crm_yqdgl_shsj.equals("")))	wheresql+="  and (crm_yqdgl.shsj>=TO_DATE('"+crm_yqdgl_shsj+"','YYYY/MM/DD'))";
	}
	crm_yqdgl_shsj=request.getParameter("crm_yqdgl_shsj2");
	if (crm_yqdgl_shsj!=null)
	{
		crm_yqdgl_shsj=crm_yqdgl_shsj.trim();
		if (!(crm_yqdgl_shsj.equals("")))	wheresql+="  and (crm_yqdgl.shsj<=TO_DATE('"+crm_yqdgl_shsj+"','YYYY/MM/DD'))";
	}
	crm_yqdgl_shjg=request.getParameter("crm_yqdgl_shjg");
	if (crm_yqdgl_shjg!=null)
	{
		crm_yqdgl_shjg=cf.GB2Uni(crm_yqdgl_shjg);
		if (!(crm_yqdgl_shjg.equals("")))	wheresql+=" and  (crm_yqdgl.shjg='"+crm_yqdgl_shjg+"')";
	}
	crm_yqdgl_shts=request.getParameter("crm_yqdgl_shts");
	if (crm_yqdgl_shts!=null)
	{
		crm_yqdgl_shts=crm_yqdgl_shts.trim();
		if (!(crm_yqdgl_shts.equals("")))	wheresql+=" and (crm_yqdgl.shts>="+crm_yqdgl_shts+") ";
	}
	crm_yqdgl_shts=request.getParameter("crm_yqdgl_shts2");
	if (crm_yqdgl_shts!=null)
	{
		crm_yqdgl_shts=crm_yqdgl_shts.trim();
		if (!(crm_yqdgl_shts.equals("")))	wheresql+=" and (crm_yqdgl.shts<="+crm_yqdgl_shts+") ";
	}
	
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (sq_sgd.sgd='"+crm_khxx_sgd+"')";
	}

	ls_sql="SELECT crm_yqdgl.yqdbh,crm_yqdgl.yqbh,DECODE(crm_yqdgl.clzt,'1','申请','2','审批'), DECODE(crm_yqdgl.shjg,'Y','通过','N','未通过'),crm_yqdgl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_yqdgl.sqsj,crm_yqdgl.zjts,crm_yqdgl.sqyy,crm_yqdgl.bz,crm_yqdgl.shr,crm_yqdgl.shsj,crm_yqdgl.shts,crm_yqdgl.shsm, crm_yqdgl.lrr,crm_yqdgl.lrsj,a.dwmc lrbm,crm_khxx.hth,b.dwmc dm,crm_khxx.sjs,sgdmc,crm_khxx.zjxm,ysgcjdmc";
	ls_sql+=" FROM crm_khxx,crm_yqdgl,sq_sgd,dm_gcjdbm,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where crm_yqdgl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_yqdgl.lrbm=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.dwbh=b.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by crm_yqdgl.sqsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_yqdglCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yqdbh","crm_yqdgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_yqdgl_sqsj","crm_yqdgl_zjts","crm_yqdgl_sqyy","crm_yqdgl_shr","crm_yqdgl_shsj","crm_yqdgl_shjg","crm_yqdgl_shts","crm_yqdgl_shsm","crm_yqdgl_clzt","crm_yqdgl_lrr","crm_yqdgl_lrsj","crm_yqdgl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yqdbh"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("审核");


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">延期单申请－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="3%">延期单编号</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">审核结果</td>
	<td  width="2%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">申请时间</td>
	<td  width="2%">工期增加天数</td>
	<td  width="5%">申请原因</td>
	<td  width="16%">备注</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="2%">审核增加天数</td>
	<td  width="17%">审核说明</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="3%">合同号</td>
	<td  width="4%">签单店面</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">工程担当</td>
	<td  width="4%">工程进度</td>
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