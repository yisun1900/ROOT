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
	String cw_gdsgjsd_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String cw_gdsgjsd_lrr=null;
	String cw_gdsgjsd_lrsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	cw_gdsgjsd_khbh=request.getParameter("cw_gdsgjsd_khbh");
	if (cw_gdsgjsd_khbh!=null)
	{
		cw_gdsgjsd_khbh=cf.GB2Uni(cw_gdsgjsd_khbh);
		if (!(cw_gdsgjsd_khbh.equals("")))	wheresql+=" and  (cw_gdsgjsd.khbh='"+cw_gdsgjsd_khbh+"')";
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
	cw_gdsgjsd_lrr=request.getParameter("cw_gdsgjsd_lrr");
	if (cw_gdsgjsd_lrr!=null)
	{
		cw_gdsgjsd_lrr=cf.GB2Uni(cw_gdsgjsd_lrr);
		if (!(cw_gdsgjsd_lrr.equals("")))	wheresql+=" and  (cw_gdsgjsd.lrr='"+cw_gdsgjsd_lrr+"')";
	}
	cw_gdsgjsd_lrsj=request.getParameter("cw_gdsgjsd_lrsj");
	if (cw_gdsgjsd_lrsj!=null)
	{
		cw_gdsgjsd_lrsj=cw_gdsgjsd_lrsj.trim();
		if (!(cw_gdsgjsd_lrsj.equals("")))	wheresql+="  and (cw_gdsgjsd.lrsj>=TO_DATE('"+cw_gdsgjsd_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdsgjsd_lrsj=request.getParameter("cw_gdsgjsd_lrsj2");
	if (cw_gdsgjsd_lrsj!=null)
	{
		cw_gdsgjsd_lrsj=cw_gdsgjsd_lrsj.trim();
		if (!(cw_gdsgjsd_lrsj.equals("")))	wheresql+="  and (cw_gdsgjsd.lrsj<=TO_DATE('"+cw_gdsgjsd_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT cw_gdsgjsd.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs,cw_gdsgjsd.wdzje,cw_gdsgjsd.wtj,cw_gdsgjsd.wtjrq,cw_gdsgjsd.ssk,cw_gdsgjsd.zxje,cw_gdsgjsd.jxje,cw_gdsgjsd.jsk,cw_gdsgjsd.jsrq,cw_gdsgjsd.jsyh,cw_gdsgjsd.lrr,cw_gdsgjsd.lrsj,dwmc,cw_gdsgjsd.bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdsgjsd,sq_dwxx  ";
    ls_sql+=" where cw_gdsgjsd.khbh=crm_khxx.khbh and cw_gdsgjsd.lrbm=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_gdsgjsd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_gdsgjsdCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","cw_gdsgjsd_wdzje","cw_gdsgjsd_wtj","cw_gdsgjsd_wtjrq","cw_gdsgjsd_ssk","cw_gdsgjsd_jsk","cw_gdsgjsd_jsrq","cw_gdsgjsd_mgfy","cw_gdsgjsd_mgrq","cw_gdsgjsd_sdgfy","cw_gdsgjsd_sdgrq","cw_gdsgjsd_nsgfy","cw_gdsgjsd_nsgrq","cw_gdsgjsd_yqgfy","cw_gdsgjsd_yqgrq","cw_gdsgjsd_fyze","cw_gdsgjsd_ye","cw_gdsgjsd_mll","cw_gdsgjsd_lrr","cw_gdsgjsd_lrsj","cw_gdsgjsd_lrbm","cw_gdsgjsd_bz"};
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
  <B><font size="3">客户结算单－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="5%">电话</td>
	<td  width="3%">合同号</td>
	<td  width="2%">设计师</td>
	<td  width="3%">工程预算款</td>
	<td  width="3%">委托金</td>
	<td  width="3%">委托金日期</td>
	<td  width="3%">实收款</td>
	<td  width="3%">增项金额</td>
	<td  width="3%">减项金额</td>
	<td  width="3%">结算款</td>
	<td  width="3%">结算日期</td>
	<td  width="7%">结算优惠</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="8%">备注</td>
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