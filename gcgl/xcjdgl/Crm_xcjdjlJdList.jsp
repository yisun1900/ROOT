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

	String crm_xcjdjl_jdjlh=null;
	String crm_xcjdjl_sqrq=null;
	String crm_xcjdjl_sqr=null;
	String crm_xcjdjl_sqrlxdh=null;
	String crm_xcjdjl_sfxtp=null;
	String crm_xcjdjl_jhjdrq=null;
	String crm_xcjdjl_zcwcsj=null;

	String crm_xcjdjl_clzt=null;
	String crm_xcjdjl_lrr=null;
	String crm_xcjdjl_lrsj=null;

	crm_xcjdjl_jdjlh=request.getParameter("crm_xcjdjl_jdjlh");
	if (crm_xcjdjl_jdjlh!=null)
	{
		crm_xcjdjl_jdjlh=cf.GB2Uni(crm_xcjdjl_jdjlh);
		if (!(crm_xcjdjl_jdjlh.equals("")))	wheresql+=" and  (crm_xcjdjl.jdjlh='"+crm_xcjdjl_jdjlh+"')";
	}
	crm_xcjdjl_sqrq=request.getParameter("crm_xcjdjl_sqrq");
	if (crm_xcjdjl_sqrq!=null)
	{
		crm_xcjdjl_sqrq=crm_xcjdjl_sqrq.trim();
		if (!(crm_xcjdjl_sqrq.equals("")))	wheresql+="  and (crm_xcjdjl.sqrq>=TO_DATE('"+crm_xcjdjl_sqrq+"','YYYY/MM/DD'))";
	}
	crm_xcjdjl_sqrq=request.getParameter("crm_xcjdjl_sqrq2");
	if (crm_xcjdjl_sqrq!=null)
	{
		crm_xcjdjl_sqrq=crm_xcjdjl_sqrq.trim();
		if (!(crm_xcjdjl_sqrq.equals("")))	wheresql+="  and (crm_xcjdjl.sqrq<=TO_DATE('"+crm_xcjdjl_sqrq+"','YYYY/MM/DD'))";
	}
	crm_xcjdjl_sqr=request.getParameter("crm_xcjdjl_sqr");
	if (crm_xcjdjl_sqr!=null)
	{
		crm_xcjdjl_sqr=cf.GB2Uni(crm_xcjdjl_sqr);
		if (!(crm_xcjdjl_sqr.equals("")))	wheresql+=" and  (crm_xcjdjl.sqr='"+crm_xcjdjl_sqr+"')";
	}
	crm_xcjdjl_sqrlxdh=request.getParameter("crm_xcjdjl_sqrlxdh");
	if (crm_xcjdjl_sqrlxdh!=null)
	{
		crm_xcjdjl_sqrlxdh=cf.GB2Uni(crm_xcjdjl_sqrlxdh);
		if (!(crm_xcjdjl_sqrlxdh.equals("")))	wheresql+=" and  (crm_xcjdjl.sqrlxdh='"+crm_xcjdjl_sqrlxdh+"')";
	}
	crm_xcjdjl_sfxtp=request.getParameter("crm_xcjdjl_sfxtp");
	if (crm_xcjdjl_sfxtp!=null)
	{
		crm_xcjdjl_sfxtp=cf.GB2Uni(crm_xcjdjl_sfxtp);
		if (!(crm_xcjdjl_sfxtp.equals("")))	wheresql+=" and  (crm_xcjdjl.sfxtp='"+crm_xcjdjl_sfxtp+"')";
	}
	crm_xcjdjl_jhjdrq=request.getParameter("crm_xcjdjl_jhjdrq");
	if (crm_xcjdjl_jhjdrq!=null)
	{
		crm_xcjdjl_jhjdrq=crm_xcjdjl_jhjdrq.trim();
		if (!(crm_xcjdjl_jhjdrq.equals("")))	wheresql+="  and (crm_xcjdjl.jhjdrq>=TO_DATE('"+crm_xcjdjl_jhjdrq+"','YYYY/MM/DD'))";
	}
	crm_xcjdjl_jhjdrq=request.getParameter("crm_xcjdjl_jhjdrq2");
	if (crm_xcjdjl_jhjdrq!=null)
	{
		crm_xcjdjl_jhjdrq=crm_xcjdjl_jhjdrq.trim();
		if (!(crm_xcjdjl_jhjdrq.equals("")))	wheresql+="  and (crm_xcjdjl.jhjdrq<=TO_DATE('"+crm_xcjdjl_jhjdrq+"','YYYY/MM/DD'))";
	}
	crm_xcjdjl_zcwcsj=request.getParameter("crm_xcjdjl_zcwcsj");
	if (crm_xcjdjl_zcwcsj!=null)
	{
		crm_xcjdjl_zcwcsj=crm_xcjdjl_zcwcsj.trim();
		if (!(crm_xcjdjl_zcwcsj.equals("")))	wheresql+="  and (crm_xcjdjl.zcwcsj>=TO_DATE('"+crm_xcjdjl_zcwcsj+"','YYYY/MM/DD'))";
	}
	crm_xcjdjl_zcwcsj=request.getParameter("crm_xcjdjl_zcwcsj2");
	if (crm_xcjdjl_zcwcsj!=null)
	{
		crm_xcjdjl_zcwcsj=crm_xcjdjl_zcwcsj.trim();
		if (!(crm_xcjdjl_zcwcsj.equals("")))	wheresql+="  and (crm_xcjdjl.zcwcsj<=TO_DATE('"+crm_xcjdjl_zcwcsj+"','YYYY/MM/DD'))";
	}

	crm_xcjdjl_clzt=request.getParameter("crm_xcjdjl_clzt");
	if (crm_xcjdjl_clzt!=null)
	{
		crm_xcjdjl_clzt=cf.GB2Uni(crm_xcjdjl_clzt);
		if (!(crm_xcjdjl_clzt.equals("")))	wheresql+=" and  (crm_xcjdjl.clzt='"+crm_xcjdjl_clzt+"')";
	}
	crm_xcjdjl_lrr=request.getParameter("crm_xcjdjl_lrr");
	if (crm_xcjdjl_lrr!=null)
	{
		crm_xcjdjl_lrr=cf.GB2Uni(crm_xcjdjl_lrr);
		if (!(crm_xcjdjl_lrr.equals("")))	wheresql+=" and  (crm_xcjdjl.lrr='"+crm_xcjdjl_lrr+"')";
	}
	crm_xcjdjl_lrsj=request.getParameter("crm_xcjdjl_lrsj");
	if (crm_xcjdjl_lrsj!=null)
	{
		crm_xcjdjl_lrsj=crm_xcjdjl_lrsj.trim();
		if (!(crm_xcjdjl_lrsj.equals("")))	wheresql+="  and (crm_xcjdjl.lrsj>=TO_DATE('"+crm_xcjdjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xcjdjl_lrsj=request.getParameter("crm_xcjdjl_lrsj2");
	if (crm_xcjdjl_lrsj!=null)
	{
		crm_xcjdjl_lrsj=crm_xcjdjl_lrsj.trim();
		if (!(crm_xcjdjl_lrsj.equals("")))	wheresql+="  and (crm_xcjdjl.lrsj<=TO_DATE('"+crm_xcjdjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_xcjdjl.jdjlh,crm_xcjdjl.jhjdrq,crm_xcjdjl.jhjdsj||'时', DECODE(crm_xcjdjl.clzt,'1','申请','2','确认','3','部分确认','4','特批完成','5','发布','6','已交底'),DECODE(crm_xcjdjl.jdqrjg,'Y','通过','N','未通过'),DECODE(crm_xcjdjl.sfxtp,'Y','是','N','否'), DECODE(crm_xcjdjl.tpsftg,'Y','通过','N','未通过'),DECODE(crm_xcjdjl.sfycp,'1','有产品','2','无'),crm_xcjdjl.cplx,crm_xcjdjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,dwmc,crm_xcjdjl.sqrq,crm_xcjdjl.sqr,crm_xcjdjl.sqrlxdh,crm_xcjdjl.sqsm,crm_xcjdjl.zcwcsj,crm_xcjdjl.lrr,crm_xcjdjl.lrsj";
	ls_sql+=" FROM crm_khxx,crm_xcjdjl,sq_dwxx  ";
    ls_sql+=" where crm_xcjdjl.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_xcjdjl.jhjdrq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_xcjdjlJdList.jsp","","","JdCrm_xcjdjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jdjlh","crm_xcjdjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_xcjdjl_sqrq","crm_xcjdjl_sqr","crm_xcjdjl_sqrlxdh","crm_xcjdjl_sfxtp","crm_xcjdjl_jhjdrq","crm_xcjdjl_jhjdsj","crm_xcjdjl_sqsm","crm_xcjdjl_zcwcsj","crm_xcjdjl_jdqrwcsj","crm_xcjdjl_fbr","crm_xcjdjl_fbsj","crm_xcjdjl_zzqrjdrq","crm_xcjdjl_zzqrjdsj","crm_xcjdjl_sjjdsj","crm_xcjdjl_jdsfcg","crm_xcjdjl_sfkkg","crm_xcjdjl_tzsfqr","crm_xcjdjl_fasfkx","crm_xcjdjl_khsfqr","crm_xcjdjl_xcfzrqr","crm_xcjdjl_qtczdqr","crm_xcjdjl_clzt","crm_xcjdjl_lrr","crm_xcjdjl_lrsj","crm_xcjdjl_lrbm","crm_xcjdjl_sbsfcl","crm_xcjdjl_tpshr","crm_xcjdjl_tpshsj","crm_xcjdjl_tpsftg","crm_xcjdjl_tpsm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jdjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("交底");
//设置按钮参数
	String[] buttonName={"批量交底"};//按钮的显示名称
	String[] buttonLink={"pljd.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jdjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_xcjdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jdjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">实际交底录入</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">交底记录号</td>
	<td  width="4%">计划交底日期</td>
	<td  width="3%">计划交底时间</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">确认结果</td>
	<td  width="2%">需特批</td>
	<td  width="2%">特批通过</td>
	<td  width="3%">是否有产品</td>
	<td  width="6%">产品类型</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="4%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="5%">店面</td>
	<td  width="4%">申请日期</td>
	<td  width="3%">申请人</td>
	<td  width="8%">申请人联系电话</td>
	<td  width="16%">申请说明</td>
	<td  width="4%">最迟完成时间</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
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