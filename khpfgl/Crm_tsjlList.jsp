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
	String crm_tsjl_tsjlh=null;
	String crm_tsjl_slfsbm=null;
	String hth=null;
	String crm_tsjl_khbh=null;
	String sjs=null;
	String crm_tsjl_sgd=null;
	String zjxm=null;
	String crm_tsjl_jgrq=null;
	String crm_tsjl_sfxhf=null;
	String crm_tsjl_hfsj=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_clzt=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
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


	String crm_tsjl_yqjjsj=null;
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

	String yzcdbm=null;
	yzcdbm=request.getParameter("yzcdbm");
	if (yzcdbm!=null)
	{
		if (!(yzcdbm.equals("")))	wheresql+=" and  (crm_tsjl.yzcdbm='"+yzcdbm+"')";
	}



	crm_tsjl_tsjlh=request.getParameter("crm_tsjl_tsjlh");
	if (crm_tsjl_tsjlh!=null)
	{
		crm_tsjl_tsjlh=crm_tsjl_tsjlh.trim();
		if (!(crm_tsjl_tsjlh.equals("")))	wheresql+=" and (crm_tsjl.tsjlh="+crm_tsjl_tsjlh+") ";
	}
	crm_tsjl_slfsbm=request.getParameter("crm_tsjl_slfsbm");
	if (crm_tsjl_slfsbm!=null)
	{
		crm_tsjl_slfsbm=cf.GB2Uni(crm_tsjl_slfsbm);
		if (!(crm_tsjl_slfsbm.equals("")))	wheresql+=" and  (crm_tsjl.slfsbm='"+crm_tsjl_slfsbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	crm_tsjl_khbh=request.getParameter("crm_tsjl_khbh");
	if (crm_tsjl_khbh!=null)
	{
		crm_tsjl_khbh=cf.GB2Uni(crm_tsjl_khbh);
		if (!(crm_tsjl_khbh.equals("")))	wheresql+=" and  (crm_tsjl.khbh='"+crm_tsjl_khbh+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	crm_tsjl_sgd=request.getParameter("crm_tsjl_sgd");
	if (crm_tsjl_sgd!=null)
	{
		crm_tsjl_sgd=cf.GB2Uni(crm_tsjl_sgd);
		if (!(crm_tsjl_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_tsjl_sgd+"')";
	}
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	crm_tsjl_jgrq=request.getParameter("crm_tsjl_jgrq");
	if (crm_tsjl_jgrq!=null)
	{
		crm_tsjl_jgrq=crm_tsjl_jgrq.trim();
		if (!(crm_tsjl_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq=TO_DATE('"+crm_tsjl_jgrq+"','YYYY/MM/DD'))";
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
	String sfpfkh=null;
	sfpfkh=request.getParameter("sfpfkh");
	if (sfpfkh!=null)
	{
		sfpfkh=cf.GB2Uni(sfpfkh);
		if (!(sfpfkh.equals("")))	wheresql+=" and  (crm_tsjl.sfpfkh='"+sfpfkh+"')";
	}

	ls_sql="SELECT crm_tsjl.tsjlh  ";
	ls_sql+=" ,DECODE(crm_tsjl.zrbmclzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as zrbmclzt";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') as clzt";
	ls_sql+=" ,DECODE(crm_tsjl.sfpfkh,'1','不需赔付','2','发生赔付','3','录入赔付','4','已赔付') as sfpfkh";
	ls_sql+=" ,crm_tsjl.jasj,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_tsjl.slsj,crm_tsjl.tsnr ";
	ls_sql+=" FROM crm_tsjl,crm_khxx,sq_sgd ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and crm_tsjl.sfpfkh in('2','3') ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Crm_tsjlList.jsp","","InsertCrm_khpfd.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数



//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("录入");

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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">赔付单录入</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">录入赔付单</td>
	<td  width="6%">投诉记录号</td>
	<td  width="6%">责任部门处理状态</td>
	<td  width="5%">处理状态</td>
	<td  width="5%">是否赔付客户</td>
	<td  width="6%">结案时间</td>
	<td  width="5%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">施工队</td>
	<td  width="6%">受理时间</td>
	<td  width="325%">投诉内容</td>
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