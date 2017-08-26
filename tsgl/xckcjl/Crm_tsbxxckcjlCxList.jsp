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
	String crm_tsbxxckcjl_tsjlh=null;
	String crm_tsjl_slfsbm=null;
	String crm_tsjl_yzcdbm=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_clzt=null;
	String crm_tsjl_jasj=null;
	String crm_tsbxxckcjl_kcjlh=null;
	String crm_tsbxxckcjl_kcr=null;
	String crm_tsbxxckcjl_kcsj=null;
	String crm_tsbxxckcjl_lrr=null;
	String crm_tsbxxckcjl_lrsj=null;
	String crm_tsjl_lx=null;

	
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

	


	crm_tsbxxckcjl_tsjlh=request.getParameter("crm_tsbxxckcjl_tsjlh");
	if (crm_tsbxxckcjl_tsjlh!=null)
	{
		crm_tsbxxckcjl_tsjlh=cf.GB2Uni(crm_tsbxxckcjl_tsjlh);
		if (!(crm_tsbxxckcjl_tsjlh.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.tsjlh='"+crm_tsbxxckcjl_tsjlh+"')";
	}
	crm_tsjl_slfsbm=request.getParameter("crm_tsjl_slfsbm");
	if (crm_tsjl_slfsbm!=null)
	{
		crm_tsjl_slfsbm=cf.GB2Uni(crm_tsjl_slfsbm);
		if (!(crm_tsjl_slfsbm.equals("")))	wheresql+=" and  (crm_tsjl.slfsbm='"+crm_tsjl_slfsbm+"')";
	}
	crm_tsjl_yzcdbm=request.getParameter("crm_tsjl_yzcdbm");
	if (crm_tsjl_yzcdbm!=null)
	{
		crm_tsjl_yzcdbm=cf.GB2Uni(crm_tsjl_yzcdbm);
		if (!(crm_tsjl_yzcdbm.equals("")))	wheresql+=" and  (crm_tsjl.yzcdbm='"+crm_tsjl_yzcdbm+"')";
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
	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj");
	if (crm_tsjl_jasj!=null)
	{
		crm_tsjl_jasj=crm_tsjl_jasj.trim();
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj>=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj2");
	if (crm_tsjl_jasj!=null)
	{
		crm_tsjl_jasj=crm_tsjl_jasj.trim();
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj<=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_kcjlh=request.getParameter("crm_tsbxxckcjl_kcjlh");
	if (crm_tsbxxckcjl_kcjlh!=null)
	{
		crm_tsbxxckcjl_kcjlh=cf.GB2Uni(crm_tsbxxckcjl_kcjlh);
		if (!(crm_tsbxxckcjl_kcjlh.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.kcjlh='"+crm_tsbxxckcjl_kcjlh+"')";
	}
	crm_tsbxxckcjl_kcr=request.getParameter("crm_tsbxxckcjl_kcr");
	if (crm_tsbxxckcjl_kcr!=null)
	{
		crm_tsbxxckcjl_kcr=cf.GB2Uni(crm_tsbxxckcjl_kcr);
		if (!(crm_tsbxxckcjl_kcr.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.kcr='"+crm_tsbxxckcjl_kcr+"')";
	}
	crm_tsbxxckcjl_kcsj=request.getParameter("crm_tsbxxckcjl_kcsj");
	if (crm_tsbxxckcjl_kcsj!=null)
	{
		crm_tsbxxckcjl_kcsj=crm_tsbxxckcjl_kcsj.trim();
		if (!(crm_tsbxxckcjl_kcsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.kcsj>=TO_DATE('"+crm_tsbxxckcjl_kcsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_kcsj=request.getParameter("crm_tsbxxckcjl_kcsj2");
	if (crm_tsbxxckcjl_kcsj!=null)
	{
		crm_tsbxxckcjl_kcsj=crm_tsbxxckcjl_kcsj.trim();
		if (!(crm_tsbxxckcjl_kcsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.kcsj<=TO_DATE('"+crm_tsbxxckcjl_kcsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_lrr=request.getParameter("crm_tsbxxckcjl_lrr");
	if (crm_tsbxxckcjl_lrr!=null)
	{
		crm_tsbxxckcjl_lrr=cf.GB2Uni(crm_tsbxxckcjl_lrr);
		if (!(crm_tsbxxckcjl_lrr.equals("")))	wheresql+=" and  (crm_tsbxxckcjl.lrr='"+crm_tsbxxckcjl_lrr+"')";
	}
	crm_tsbxxckcjl_lrsj=request.getParameter("crm_tsbxxckcjl_lrsj");
	if (crm_tsbxxckcjl_lrsj!=null)
	{
		crm_tsbxxckcjl_lrsj=crm_tsbxxckcjl_lrsj.trim();
		if (!(crm_tsbxxckcjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.lrsj>=TO_DATE('"+crm_tsbxxckcjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxxckcjl_lrsj=request.getParameter("crm_tsbxxckcjl_lrsj2");
	if (crm_tsbxxckcjl_lrsj!=null)
	{
		crm_tsbxxckcjl_lrsj=crm_tsbxxckcjl_lrsj.trim();
		if (!(crm_tsbxxckcjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxxckcjl.lrsj<=TO_DATE('"+crm_tsbxxckcjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_lx=request.getParameter("crm_tsjl_lx");
	if (crm_tsjl_lx!=null)
	{
		crm_tsjl_lx=cf.GB2Uni(crm_tsjl_lx);
		if (!(crm_tsjl_lx.equals("")))	wheresql+=" and  (crm_tsjl.lx='"+crm_tsjl_lx+"')";
	}

	ls_sql="SELECT crm_tsbxxckcjl.kcjlh,crm_khxx.khxm,crm_tsbxxckcjl.xcqk,crm_tsbxxckcjl.xcclqk,crm_tsbxxckcjl.kcr,crm_tsbxxckcjl.kcsj,crm_tsbxxckcjl.lrr,crm_tsbxxckcjl.lrsj,dwmc,crm_tsbxxckcjl.bz,crm_khxx.fwdz,crm_khxx.lxfs,crm_tsbxxckcjl.tsjlh,crm_tsjl.tsnr,crm_tsjl.slsj,crm_tsjl.slr, DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案'),crm_khxx.khbh  ";
	ls_sql+=" FROM crm_khxx,crm_tsbxxckcjl,crm_tsjl,sq_dwxx  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsbxxckcjl.tsjlh=crm_tsjl.tsjlh and crm_tsbxxckcjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tsbxxckcjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tsbxxckcjlCxList.jsp","SelectCxCrm_tsbxxckcjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"crm_khxx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_tsbxxckcjl_tsjlh","crm_tsjl_tsnr","crm_tsjl_slsj","crm_tsjl_slr","crm_tsjl_clzt","kcjlh","crm_tsbxxckcjl_xcqk","crm_tsbxxckcjl_xcclqk","crm_tsbxxckcjl_kcr","crm_tsbxxckcjl_kcsj","crm_tsbxxckcjl_lrr","crm_tsbxxckcjl_lrsj","crm_tsbxxckcjl_lrbm","crm_tsbxxckcjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kcjlh"};
	pageObj.setKey(keyName);

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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">勘查记录号</td>
	<td  width="3%">客户姓名</td>
	<td  width="12%">现场情况</td>
	<td  width="12%">现场处理情况</td>
	<td  width="3%">勘查人</td>
	<td  width="4%">勘查时间</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="5%">备注</td>
	<td  width="9%">房屋地址</td>
	<td  width="7%">联系方式</td>
	<td  width="4%">投诉报修记录号</td>
	<td  width="11%">投诉报修内容</td>
	<td  width="4%">客服受理时间</td>
	<td  width="3%">客服受理人</td>
	<td  width="4%">结案状态</td>
	<td  width="3%">客户编号</td>
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