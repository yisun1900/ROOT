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

	String gdm_gdjcjl_xjr=null;
	String gdm_gdjcjl_xjsj=null;
	String gdm_gdjcjl_xxlybm=null;
	String gdm_gdjcjl_jclxbm=null;
	String gdm_gdjcjl_jcjgbm=null;
	String gdm_gdjcjl_jcwtflbm=null;
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj>=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj2");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj<=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xxlybm=request.getParameter("gdm_gdjcjl_xxlybm");
	if (gdm_gdjcjl_xxlybm!=null)
	{
		gdm_gdjcjl_xxlybm=cf.GB2Uni(gdm_gdjcjl_xxlybm);
		if (!(gdm_gdjcjl_xxlybm.equals("")))	wheresql+=" and  (gdm_gdjcjl.xxlybm='"+gdm_gdjcjl_xxlybm+"')";
	}
	gdm_gdjcjl_jclxbm=request.getParameter("gdm_gdjcjl_jclxbm");
	if (gdm_gdjcjl_jclxbm!=null)
	{
		gdm_gdjcjl_jclxbm=cf.GB2Uni(gdm_gdjcjl_jclxbm);
		if (!(gdm_gdjcjl_jclxbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jclxbm='"+gdm_gdjcjl_jclxbm+"')";
	}
	gdm_gdjcjl_jcjgbm=request.getParameter("gdm_gdjcjl_jcjgbm");
	if (gdm_gdjcjl_jcjgbm!=null)
	{
		gdm_gdjcjl_jcjgbm=cf.GB2Uni(gdm_gdjcjl_jcjgbm);
		if (!(gdm_gdjcjl_jcjgbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjgbm='"+gdm_gdjcjl_jcjgbm+"')";
	}
	gdm_gdjcjl_jcwtflbm=request.getParameter("gdm_gdjcjl_jcwtflbm");
	if (gdm_gdjcjl_jcwtflbm!=null)
	{
		gdm_gdjcjl_jcwtflbm=cf.GB2Uni(gdm_gdjcjl_jcwtflbm);
		if (!(gdm_gdjcjl_jcwtflbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcwtflbm='"+gdm_gdjcjl_jcwtflbm+"')";
	}


	String gdm_gdjcjl_lrr=null;
	String gdm_gdjcjl_lrsj=null;
	gdm_gdjcjl_lrr=request.getParameter("gdm_gdjcjl_lrr");
	if (gdm_gdjcjl_lrr!=null)
	{
		gdm_gdjcjl_lrr=cf.GB2Uni(gdm_gdjcjl_lrr);
		if (!(gdm_gdjcjl_lrr.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrr='"+gdm_gdjcjl_lrr+"')";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj>=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj2");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj<=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT gdm_gdjcjl.jcjlh ";
	ls_sql+=" ,DECODE(gdm_gdjcjl.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as clzt ";
	ls_sql+=" ,khxm,fwdz,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,xxlymc,jclxmc,jcjgmc,jcwtflmc,gdm_gdjcjl.fkze,sgdmc,zjxm,sjs,sq_dwxx.dwmc,ysgcjdmc,kgrq,jgrq,gdm_gdjcjl.khbh ";
	ls_sql+=" FROM crm_khxx,gdm_gdjcjl,sq_dwxx,sq_sgd,dm_gcjdbm,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm ";
    ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+) and gdm_gdjcjl.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
	ls_sql+=" and gdm_gdjcjl.sffszg='Y'";//是否发生整改
	ls_sql+=" and gdm_gdjcjl.clzt in('7')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" order by kgrq";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化

	pageObj.initPage("Gdm_zgfajlShList.jsp","","","ShGdm_zgfajl.jsp");
	pageObj.setPageRow(25);//设置每页显示记录数
	pageObj.setEditStr("审核");

//设置主键
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);

/*
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteFaGdm_gdjcjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
*/

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
  <B><font size="3">方案审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">监察记录号</td>
	<td  width="4%">处理状态</td>
	<td  width="4%">姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="3%">检查人</td>
	<td  width="5%">检查时间</td>
	<td  width="4%">信息来源</td>
	<td  width="6%">监察类型</td>
	<td  width="9%">监察结果</td>
	<td  width="7%">问题分类</td>
	<td  width="4%">罚款总额</td>
	<td  width="3%">施工队</td>
	<td  width="3%">工程担当</td>
	<td  width="3%">设计师</td>
	<td  width="7%">签约店面</td>
	<td  width="5%">工程进度</td>
	<td  width="5%">合同开工</td>
	<td  width="5%">合同完工</td>
	<td  width="4%">客户编号</td>
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