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
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_zxkhxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
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
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	
	
	String crm_cpztgzjl_khbh=null;
	String crm_cpztgzjl_cpflbm=null;
	String crm_cpztgzjl_cpztbm=null;
	String crm_cpztgzjl_fssj=null;
	String crm_cpztgzjl_zrr=null;
	String crm_cpztgzjl_lrr=null;
	String crm_cpztgzjl_lrsj=null;
	String crm_cpztgzjl_lrbm=null;
	crm_cpztgzjl_khbh=request.getParameter("crm_cpztgzjl_khbh");
	if (crm_cpztgzjl_khbh!=null)
	{
		crm_cpztgzjl_khbh=cf.GB2Uni(crm_cpztgzjl_khbh);
		if (!(crm_cpztgzjl_khbh.equals("")))	wheresql+=" and  (crm_cpztgzjl.khbh='"+crm_cpztgzjl_khbh+"')";
	}
	crm_cpztgzjl_cpflbm=request.getParameter("crm_cpztgzjl_cpflbm");
	if (crm_cpztgzjl_cpflbm!=null)
	{
		crm_cpztgzjl_cpflbm=cf.GB2Uni(crm_cpztgzjl_cpflbm);
		if (!(crm_cpztgzjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.cpflbm='"+crm_cpztgzjl_cpflbm+"')";
	}
	crm_cpztgzjl_cpztbm=request.getParameter("crm_cpztgzjl_cpztbm");
	if (crm_cpztgzjl_cpztbm!=null)
	{
		crm_cpztgzjl_cpztbm=cf.GB2Uni(crm_cpztgzjl_cpztbm);
		if (!(crm_cpztgzjl_cpztbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.cpztbm='"+crm_cpztgzjl_cpztbm+"')";
	}
	crm_cpztgzjl_fssj=request.getParameter("crm_cpztgzjl_fssj");
	if (crm_cpztgzjl_fssj!=null)
	{
		crm_cpztgzjl_fssj=crm_cpztgzjl_fssj.trim();
		if (!(crm_cpztgzjl_fssj.equals("")))	wheresql+="  and (crm_cpztgzjl.fssj=TO_DATE('"+crm_cpztgzjl_fssj+"','YYYY/MM/DD'))";
	}
	crm_cpztgzjl_zrr=request.getParameter("crm_cpztgzjl_zrr");
	if (crm_cpztgzjl_zrr!=null)
	{
		crm_cpztgzjl_zrr=cf.GB2Uni(crm_cpztgzjl_zrr);
		if (!(crm_cpztgzjl_zrr.equals("")))	wheresql+=" and  (crm_cpztgzjl.zrr='"+crm_cpztgzjl_zrr+"')";
	}
	crm_cpztgzjl_lrr=request.getParameter("crm_cpztgzjl_lrr");
	if (crm_cpztgzjl_lrr!=null)
	{
		crm_cpztgzjl_lrr=cf.GB2Uni(crm_cpztgzjl_lrr);
		if (!(crm_cpztgzjl_lrr.equals("")))	wheresql+=" and  (crm_cpztgzjl.lrr='"+crm_cpztgzjl_lrr+"')";
	}
	crm_cpztgzjl_lrsj=request.getParameter("crm_cpztgzjl_lrsj");
	if (crm_cpztgzjl_lrsj!=null)
	{
		crm_cpztgzjl_lrsj=crm_cpztgzjl_lrsj.trim();
		if (!(crm_cpztgzjl_lrsj.equals("")))	wheresql+="  and (crm_cpztgzjl.lrsj=TO_DATE('"+crm_cpztgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpztgzjl_lrbm=request.getParameter("crm_cpztgzjl_lrbm");
	if (crm_cpztgzjl_lrbm!=null)
	{
		crm_cpztgzjl_lrbm=cf.GB2Uni(crm_cpztgzjl_lrbm);
		if (!(crm_cpztgzjl_lrbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.lrbm='"+crm_cpztgzjl_lrbm+"')";
	}
	ls_sql="SELECT crm_cpztgzjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.hth,crm_zxkhxx.sjs,crm_cpztgzjl.cpflbm,cpflmc,crm_cpztgzjl.cpztbm,cpztmc,crm_cpztgzjl.fssj,crm_cpztgzjl.zrr,crm_cpztgzjl.lrr,crm_cpztgzjl.lrsj,dwmc,crm_cpztgzjl.bz";
	ls_sql+=" FROM crm_cpztgzjl,dm_cpztbm,dm_cpflbm,crm_zxkhxx,sq_dwxx  ";
    ls_sql+=" where crm_cpztgzjl.cpztbm=dm_cpztbm.cpztbm and crm_cpztgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpztgzjl.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_cpztgzjl.lrbm=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_cpztgzjl.khbh,crm_cpztgzjl.cpflbm,crm_cpztgzjl.fssj ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_cpztgzjlList.jsp","","","EditCrm_cpztgzjl.jsp?");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"cpflmc","cpztmc","fssj","khbh","khxm","fwdz","hth","sjs","zrr","lrr","lrsj","dwmc","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"khbh","cpflbm","cpztbm"};
	pageObj.setKey(keyName);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_cpztgzjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
  <B><font size="3">维护状态信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="11%">产品分类</td>
	<td  width="7%">产品状态</td>
	<td  width="6%">发生时间</td>
	<td  width="4%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="6%">合同号</td>
	<td  width="4%">设计师</td>
	<td  width="4%">责任人</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="9%">录入部门</td>
	<td  width="11%">备注</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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