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
	String ybj_ybjsb_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;
	String crm_khxx_jgrq=null;
	String crm_khxx_sjjgrq=null;
	String dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String ssfgs=null;
	String ybj_ybjsb_sbr=null;
	String ybj_ybjsb_sbsj=null;
	String ybj_ybjsb_shr=null;
	String ybj_ybjsb_shsj=null;
	String ybj_ybjsb_shjl=null;
	String ybj_ybjsb_shsm=null;
	String ybj_ybjsb_clzt=null;

	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (ybj_ybjsb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (ybj_ybjsb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (ybj_ybjsb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	
	
	ybj_ybjsb_khbh=request.getParameter("ybj_ybjsb_khbh");
	if (ybj_ybjsb_khbh!=null)
	{
		ybj_ybjsb_khbh=cf.GB2Uni(ybj_ybjsb_khbh);
		if (!(ybj_ybjsb_khbh.equals("")))	wheresql+=" and  (ybj_ybjsb.khbh='"+ybj_ybjsb_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjjgrq=request.getParameter("crm_khxx_sjjgrq");
	if (crm_khxx_sjjgrq!=null)
	{
		crm_khxx_sjjgrq=crm_khxx_sjjgrq.trim();
		if (!(crm_khxx_sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq=TO_DATE('"+crm_khxx_sjjgrq+"','YYYY/MM/DD'))";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ybj_ybjsb.ssfgs='"+ssfgs+"')";
	}
	ybj_ybjsb_sbr=request.getParameter("ybj_ybjsb_sbr");
	if (ybj_ybjsb_sbr!=null)
	{
		ybj_ybjsb_sbr=cf.GB2Uni(ybj_ybjsb_sbr);
		if (!(ybj_ybjsb_sbr.equals("")))	wheresql+=" and  (ybj_ybjsb.sbr='"+ybj_ybjsb_sbr+"')";
	}
	ybj_ybjsb_sbsj=request.getParameter("ybj_ybjsb_sbsj");
	if (ybj_ybjsb_sbsj!=null)
	{
		ybj_ybjsb_sbsj=ybj_ybjsb_sbsj.trim();
		if (!(ybj_ybjsb_sbsj.equals("")))	wheresql+="  and (ybj_ybjsb.sbsj>=TO_DATE('"+ybj_ybjsb_sbsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_sbsj=request.getParameter("ybj_ybjsb_sbsj2");
	if (ybj_ybjsb_sbsj!=null)
	{
		ybj_ybjsb_sbsj=ybj_ybjsb_sbsj.trim();
		if (!(ybj_ybjsb_sbsj.equals("")))	wheresql+="  and (ybj_ybjsb.sbsj<=TO_DATE('"+ybj_ybjsb_sbsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_shr=request.getParameter("ybj_ybjsb_shr");
	if (ybj_ybjsb_shr!=null)
	{
		ybj_ybjsb_shr=cf.GB2Uni(ybj_ybjsb_shr);
		if (!(ybj_ybjsb_shr.equals("")))	wheresql+=" and  (ybj_ybjsb.shr='"+ybj_ybjsb_shr+"')";
	}
	ybj_ybjsb_shsj=request.getParameter("ybj_ybjsb_shsj");
	if (ybj_ybjsb_shsj!=null)
	{
		ybj_ybjsb_shsj=ybj_ybjsb_shsj.trim();
		if (!(ybj_ybjsb_shsj.equals("")))	wheresql+="  and (ybj_ybjsb.shsj>=TO_DATE('"+ybj_ybjsb_shsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_shsj=request.getParameter("ybj_ybjsb_shsj2");
	if (ybj_ybjsb_shsj!=null)
	{
		ybj_ybjsb_shsj=ybj_ybjsb_shsj.trim();
		if (!(ybj_ybjsb_shsj.equals("")))	wheresql+="  and (ybj_ybjsb.shsj<=TO_DATE('"+ybj_ybjsb_shsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjsb_shjl=request.getParameter("ybj_ybjsb_shjl");
	if (ybj_ybjsb_shjl!=null)
	{
		ybj_ybjsb_shjl=cf.GB2Uni(ybj_ybjsb_shjl);
		if (!(ybj_ybjsb_shjl.equals("")))	wheresql+=" and  (ybj_ybjsb.shjl='"+ybj_ybjsb_shjl+"')";
	}
	ybj_ybjsb_shsm=request.getParameter("ybj_ybjsb_shsm");
	if (ybj_ybjsb_shsm!=null)
	{
		ybj_ybjsb_shsm=cf.GB2Uni(ybj_ybjsb_shsm);
		if (!(ybj_ybjsb_shsm.equals("")))	wheresql+=" and  (ybj_ybjsb.shsm='"+ybj_ybjsb_shsm+"')";
	}
	ybj_ybjsb_clzt=request.getParameter("ybj_ybjsb_clzt");
	if (ybj_ybjsb_clzt!=null)
	{
		ybj_ybjsb_clzt=cf.GB2Uni(ybj_ybjsb_clzt);
		if (!(ybj_ybjsb_clzt.equals("")))	wheresql+=" and  (ybj_ybjsb.clzt='"+ybj_ybjsb_clzt+"')";
	}

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm, DECODE(ybj_ybjsb.clzt,'1','未审核','2','已审核'), DECODE(ybj_ybjsb.shjl,'Y','合格','N','不合格'),ybj_ybjsb.shr,ybj_ybjsb.shsj,ybj_ybjsb.shsm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.zjxm,sq_dwxx.dwmc ssfgs,ybj_ybjsb.sbr,ybj_ybjsb.sbsj,ybj_ybjsb.ybjyxq,ybj_ybjsb.lrr,ybj_ybjsb.lrsj,ybj_ybjsb.bz  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,ybj_ybjsb  ";
    ls_sql+=" where ybj_ybjsb.khbh=crm_khxx.khbh and ybj_ybjsb.ssfgs=sq_dwxx.dwbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by ybj_ybjsb.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Ybj_ybjsbFbList.jsp","SelectFbYbj_ybjsb.jsp","","FbEditYbj_ybjsb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setEditStr("发布");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm","sq_dwxx_dwmc","ybj_ybjsb_sbr","ybj_ybjsb_sbsj","ybj_ybjsb_shjl","ybj_ybjsb_clzt","ybj_ybjsb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"批量发布"};//按钮的显示名称
	String[] buttonLink={"Ybj_ybjsbFbList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String yhmc=(String)session.getAttribute("yhmc");
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="update ybj_ybjsb set fbr='"+yhmc+"',fbsj=TRUNC(SYSDATE),fbsm='批量审批',clzt='3' where "+chooseitem;
		sql[1]="update crm_khxx set ybjbz='Y',ybjdjsj=TRUNC(SYSDATE),ybjyxq=(select ybjyxq from ybj_ybjsb where ybj_ybjsb.khbh=crm_khxx.khbh) where "+chooseitem;
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
  <B><font size="3">样板间发布</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="4%">状态</td>
	<td  width="4%">审核结论</td>
	<td  width="3%">审核人</td>
	<td  width="5%">审核时间</td>
	<td  width="13%">审核说明</td>
	<td  width="13%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检</td>
	<td  width="6%">所属分公司</td>
	<td  width="3%">申报人</td>
	<td  width="5%">申报时间</td>
	<td  width="5%">样板间有效期</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="12%">备注</td>
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