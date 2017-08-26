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

	String cw_jcfkd_lrr=null;
	String cw_jcfkd_lrsj=null;
	String cw_jcfkd_blr=null;
	String cw_jcfkd_blsj=null;

	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (cw_jcfkd.khbh='"+khbh+"')";
	}
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

	
	cw_jcfkd_lrr=request.getParameter("cw_jcfkd_lrr");
	if (cw_jcfkd_lrr!=null)
	{
		cw_jcfkd_lrr=cf.GB2Uni(cw_jcfkd_lrr);
		if (!(cw_jcfkd_lrr.equals("")))	wheresql+=" and  (cw_jcfkd.lrr='"+cw_jcfkd_lrr+"')";
	}
	cw_jcfkd_lrsj=request.getParameter("cw_jcfkd_lrsj");
	if (cw_jcfkd_lrsj!=null)
	{
		cw_jcfkd_lrsj=cw_jcfkd_lrsj.trim();
		if (!(cw_jcfkd_lrsj.equals("")))	wheresql+="  and (cw_jcfkd.lrsj>=TO_DATE('"+cw_jcfkd_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jcfkd_lrsj=request.getParameter("cw_jcfkd_lrsj2");
	if (cw_jcfkd_lrsj!=null)
	{
		cw_jcfkd_lrsj=cw_jcfkd_lrsj.trim();
		if (!(cw_jcfkd_lrsj.equals("")))	wheresql+="  and (cw_jcfkd.lrsj<=TO_DATE('"+cw_jcfkd_lrsj+"','YYYY/MM/DD'))";
	}

	cw_jcfkd_blr=request.getParameter("cw_jcfkd_blr");
	if (cw_jcfkd_blr!=null)
	{
		cw_jcfkd_blr=cf.GB2Uni(cw_jcfkd_blr);
		if (!(cw_jcfkd_blr.equals("")))	wheresql+=" and  (cw_jcfkd.blr='"+cw_jcfkd_blr+"')";
	}
	cw_jcfkd_blsj=request.getParameter("cw_jcfkd_blsj");
	if (cw_jcfkd_blsj!=null)
	{
		cw_jcfkd_blsj=cw_jcfkd_blsj.trim();
		if (!(cw_jcfkd_blsj.equals("")))	wheresql+="  and (cw_jcfkd.blsj>=TO_DATE('"+cw_jcfkd_blsj+"','YYYY/MM/DD'))";
	}
	cw_jcfkd_blsj=request.getParameter("cw_jcfkd_blsj2");
	if (cw_jcfkd_blsj!=null)
	{
		cw_jcfkd_blsj=cw_jcfkd_blsj.trim();
		if (!(cw_jcfkd_blsj.equals("")))	wheresql+="  and (cw_jcfkd.blsj<=TO_DATE('"+cw_jcfkd_blsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,cw_jcfkd.jzssk,cw_jcfkd.cxhddj,cw_jcfkd.jrhdje,cw_jcfkd.ybkje,cw_jcfkd.yfkje,cw_jcfkd.blr,cw_jcfkd.blsj ,cw_jcfkd.lrr,cw_jcfkd.lrsj,cw_jcfkd.khbh,crm_khxx.sjs,dwmc,cw_jcfkd.bz ";
	ls_sql+=" FROM cw_jcfkd,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_jcfkd.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jcfkd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jcfkdCxList.jsp","","","ViewCw_jcfkd.jsp");
	pageObj.setEditStr("打印");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","cw_jcfkd_fgsbh","cw_jcfkd_jzssk","cw_jcfkd_cxhddj","cw_jcfkd_jrhdje","cw_jcfkd_ybkje","cw_jcfkd_yfkje","cw_jcfkd_lrr","cw_jcfkd_lrsj","cw_jcfkd_lrbm","cw_jcfkd_bz","cw_jcfkd_blr","cw_jcfkd_blsj","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_qtdh","crm_khxx_hth","crm_khxx_sjs"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);


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
  <B><font size="3">查询集成返款单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="5%">家装实收款</td>
	<td  width="5%">促销活动订金</td>
	<td  width="5%">计入活动金额</td>
	<td  width="5%">应补（扣）款金额</td>
	<td  width="5%">应返款金额</td>
	<td  width="4%">办理人</td>
	<td  width="5%">办理时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">设计师</td>
	<td  width="7%">所属店面</td>
	<td  width="19%">备注</td>
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