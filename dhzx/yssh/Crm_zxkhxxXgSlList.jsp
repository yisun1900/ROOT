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

	
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";
	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (zxdm!=null)
	{
		zxdm=cf.GB2Uni(zxdm);
		if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";
	}
	
	String zxzt=null;
	zxzt=request.getParameter("zxzt");
	if (zxzt!=null)
	{
		zxzt=cf.GB2Uni(zxzt);
		if (!(zxzt.equals("")))	wheresql+=" and  (crm_zxkhxx.zxzt='"+zxzt+"')";
	}
	String jzbz=null;
	jzbz=request.getParameter("jzbz");
	if (jzbz!=null)
	{
		if (!(jzbz.equals("")))	wheresql+=" and  (crm_zxkhxx.jzbz='"+jzbz+"')";
	}
	
	
	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	String xb=null;
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+xb+"')";
	}

	
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	
	String qsjhtbz=null;
	qsjhtbz=request.getParameter("qsjhtbz");
	if (qsjhtbz!=null)
	{
		qsjhtbz=cf.GB2Uni(qsjhtbz);
		if (!(qsjhtbz.equals("")))	wheresql+=" and  (crm_zxkhxx.qsjhtbz='"+qsjhtbz+"')";
	}
	String qsjhtsj=null;
	qsjhtsj=request.getParameter("qsjhtsj");
	if (qsjhtsj!=null)
	{
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj>=TO_DATE('"+qsjhtsj+"','YYYY-MM-DD'))";
	}
	qsjhtsj=request.getParameter("qsjhtsj2");
	if (qsjhtsj!=null)
	{
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj<=TO_DATE('"+qsjhtsj+"','YYYY-MM-DD'))";
	}
	String sfzdzbj=null;
	sfzdzbj=request.getParameter("sfzdzbj");
	if (sfzdzbj!=null)
	{
		if (!(sfzdzbj.equals("")))	wheresql+=" and  (crm_zxkhxx.sfzdzbj='"+sfzdzbj+"')";
	}
	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		if (!(bjjb.equals("")))	wheresql+=" and  (crm_zxkhxx.bjjb='"+bjjb+"')";
	}
	String zjzbjsj=null;
	zjzbjsj=request.getParameter("zjzbjsj");
	if (zjzbjsj!=null)
	{
		if (!(zjzbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.zjzbjsj>=TO_DATE('"+zjzbjsj+"','YYYY-MM-DD'))";
	}
	zjzbjsj=request.getParameter("zjzbjsj2");
	if (zjzbjsj!=null)
	{
		if (!(zjzbjsj.equals("")))	wheresql+="  and (crm_zxkhxx.zjzbjsj<=TO_DATE('"+zjzbjsj+"','YYYY-MM-DD'))";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (bj_ysshjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (bj_ysshjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (bj_ysshjl.lrr='"+lrr+"')";
	}
	String slsj=null;
	slsj=request.getParameter("slsj");
	if (slsj!=null)
	{
		slsj=slsj.trim();
		if (!(slsj.equals("")))	wheresql+="  and (bj_ysshjl.slsj>=TO_DATE('"+slsj+"','YYYY/MM/DD'))";
	}
	slsj=request.getParameter("slsj2");
	if (slsj!=null)
	{
		slsj=slsj.trim();
		if (!(slsj.equals("")))	wheresql+="  and (bj_ysshjl.slsj<=TO_DATE('"+slsj+"','YYYY/MM/DD'))";
	}
	String slr=null;
	slr=request.getParameter("slr");
	if (slr!=null)
	{
		slr=cf.GB2Uni(slr);
		if (!(slr.equals("")))	wheresql+=" and  (bj_ysshjl.slr='"+slr+"')";
	}
	

	ls_sql="SELECT bj_ysshjl.ysshjl,DECODE(bj_ysshjl.ysshbz,'N','未申请','B','申请审核','C','受理申请','Y','审核通过','M','未通过','S','修改方案授权','1','等待总监预算审核','2','总监预算审核未通过'),crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,bj_ysshjl.jsy,bj_ysshjl.slr,bj_ysshjl.slsj,bj_ysshjl.slsm,bj_ysshjl.lrr,bj_ysshjl.lrsj,khjl,ywy,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,sq_dwxx.dwmc";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx,bj_ysshjl ";
    ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and crm_zxkhxx.khbh=bj_ysshjl.khbh ";
	ls_sql+=" and bj_ysshjl.ysshbz in('C')";
	ls_sql+=" and bj_ysshjl.zxbz='Y'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
    ls_sql+=" order by bj_ysshjl.slsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxXgSlList.jsp","","","SlBj_ysshjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_fwlxbm","crm_zxkhxx_sfxhf","crm_zxkhxx_hfrq","crm_zxkhxx_hflxbm","crm_zxkhxx_hdbz","crm_zxkhxx_zxzt","crm_zxkhxx_khlxbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ysshjl"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("审核");

//设置按钮参数
	String[] buttonName={"删除受理"};//按钮的显示名称
	String[] buttonLink={"DeleteSlBj_ysshjl.jsp"};//按钮单击调用的网页，可以增加参数
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
  <B><font size="3">修改－受理申请</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">预算审核记录</td>
	<td  width="4%">审核标志</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">价审员</td>
	<td  width="4%">受理人</td>
	<td  width="5%">受理时间</td>
	<td  width="18%">受理说明</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="4%">客户经理</td>
	<td  width="4%">业务员</td>
	<td  width="6%">咨询状态</td>
	<td  width="8%">咨询店面</td>
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