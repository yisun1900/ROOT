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

	String zt=null;
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		zt=cf.GB2Uni(zt);
		if (!(zt.equals("")))	wheresql+=" and  (crm_baoxian.zt='"+zt+"')";
	}

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
	String hth=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
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

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}



	String crm_baoxian_rybxje=null;
	String crm_baoxian_cdbxje=null;
	String crm_baoxian_baokssj=null;
	String crm_baoxian_baozzsj=null;
	String crm_baoxian_lrr=null;
	String crm_baoxian_lrsj=null;

	crm_baoxian_rybxje=request.getParameter("crm_baoxian_rybxje");
	if (crm_baoxian_rybxje!=null)
	{
		crm_baoxian_rybxje=cf.GB2Uni(crm_baoxian_rybxje);
		if (!(crm_baoxian_rybxje.equals("")))	wheresql+=" and  (crm_baoxian.rybxje='"+crm_baoxian_rybxje+"')";
	}
	crm_baoxian_cdbxje=request.getParameter("crm_baoxian_cdbxje");
	if (crm_baoxian_cdbxje!=null)
	{
		crm_baoxian_cdbxje=crm_baoxian_cdbxje.trim();
		if (!(crm_baoxian_cdbxje.equals("")))	wheresql+=" and  (crm_baoxian.cdbxje="+crm_baoxian_cdbxje+") ";
	}
	crm_baoxian_baokssj=request.getParameter("crm_baoxian_baokssj");
	if (crm_baoxian_baokssj!=null)
	{
		crm_baoxian_baokssj=crm_baoxian_baokssj.trim();
		if (!(crm_baoxian_baokssj.equals("")))	wheresql+="  and (crm_baoxian.baokssj>=TO_DATE('"+crm_baoxian_baokssj+"','YYYY/MM/DD'))";
	}
	crm_baoxian_baokssj=request.getParameter("crm_baoxian_baokssj2");
	if (crm_baoxian_baokssj!=null)
	{
		crm_baoxian_baokssj=crm_baoxian_baokssj.trim();
		if (!(crm_baoxian_baokssj.equals("")))	wheresql+="  and (crm_baoxian.baokssj<=TO_DATE('"+crm_baoxian_baokssj+"','YYYY/MM/DD'))";
	}
	crm_baoxian_baozzsj=request.getParameter("crm_baoxian_baozzsj");
	if (crm_baoxian_baozzsj!=null)
	{
		crm_baoxian_baozzsj=crm_baoxian_baozzsj.trim();
		if (!(crm_baoxian_baozzsj.equals("")))	wheresql+="  and (crm_baoxian.baozzsj>=TO_DATE('"+crm_baoxian_baozzsj+"','YYYY/MM/DD'))";
	}
	crm_baoxian_baozzsj=request.getParameter("crm_baoxian_baozzsj2");
	if (crm_baoxian_baozzsj!=null)
	{
		crm_baoxian_baozzsj=crm_baoxian_baozzsj.trim();
		if (!(crm_baoxian_baozzsj.equals("")))	wheresql+="  and (crm_baoxian.baozzsj<=TO_DATE('"+crm_baoxian_baozzsj+"','YYYY/MM/DD'))";
	}
	crm_baoxian_lrr=request.getParameter("crm_baoxian_lrr");
	if (crm_baoxian_lrr!=null)
	{
		crm_baoxian_lrr=cf.GB2Uni(crm_baoxian_lrr);
		if (!(crm_baoxian_lrr.equals("")))	wheresql+=" and  (crm_baoxian.lrr='"+crm_baoxian_lrr+"')";
	}
	crm_baoxian_lrsj=request.getParameter("crm_baoxian_lrsj");
	if (crm_baoxian_lrsj!=null)
	{
		crm_baoxian_lrsj=crm_baoxian_lrsj.trim();
		if (!(crm_baoxian_lrsj.equals("")))	wheresql+="  and (crm_baoxian.lrsj>=TO_DATE('"+crm_baoxian_lrsj+"','YYYY/MM/DD'))";
	}
	crm_baoxian_lrsj=request.getParameter("crm_baoxian_lrsj2");
	if (crm_baoxian_lrsj!=null)
	{
		crm_baoxian_lrsj=crm_baoxian_lrsj.trim();
		if (!(crm_baoxian_lrsj.equals("")))	wheresql+="  and (crm_baoxian.lrsj<=TO_DATE('"+crm_baoxian_lrsj+"','YYYY/MM/DD'))";
	}

	String myxssl=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");

	ls_sql="SELECT crm_baoxian.khbh,DECODE(crm_baoxian.zt,'2','未结算','3','结算'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_baoxian.cdbxje,crm_baoxian.rybxje,crm_baoxian.baokssj,crm_baoxian.baozzsj,crm_baoxian.lrr,crm_baoxian.lrsj,a.dwmc lrbm,b.dwmc dm,crm_baoxian.bz  ";
	ls_sql+=" FROM crm_khxx,crm_baoxian,sq_dwxx a,sq_dwxx b,sq_sgd ";
    ls_sql+=" where crm_baoxian.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_baoxian.lrbm=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_baoxian.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_baoxianCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_baoxian_rybxje","crm_baoxian_cdbxje","crm_baoxian_baokssj","crm_baoxian_baozzsj","crm_baoxian_lrr","crm_baoxian_lrsj","crm_baoxian_lrbm","crm_baoxian_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

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
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询保险</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">客户编号</td>
	<td  width="4%">状态</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="4%">合同号</td>
	<td  width="4%">设计师</td>
	<td  width="4%">施工队</td>
	<td  width="5%">场地保险金额</td>
	<td  width="5%">人员保险金额</td>
	<td  width="5%">保险开始时间</td>
	<td  width="5%">保险终止时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="8%">签单店面</td>
	<td  width="23%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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