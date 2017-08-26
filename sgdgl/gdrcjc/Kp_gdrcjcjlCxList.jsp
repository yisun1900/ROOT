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
	String kp_gdrcjcjl_jcjlh=null;
	String kp_gdrcjcjl_khbh=null;
	String kp_gdrcjcjl_sgd=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String kp_gdrcjcjl_jcr=null;
	String kp_gdrcjcjl_jcsj=null;
	String kp_gdrcjcjl_rcjclxbm=null;
	String kp_gdrcjcjl_rcjcjgbm=null;
	String kp_gdrcjcjl_spbz=null;
	String kp_gdrcjcjl_spr=null;
	String kp_gdrcjcjl_spsj=null;
	String kp_gdrcjcjl_lrr=null;
	String kp_gdrcjcjl_lrsj=null;
	String kp_gdrcjcjl_lrbm=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	kp_gdrcjcjl_jcjlh=request.getParameter("kp_gdrcjcjl_jcjlh");
	if (kp_gdrcjcjl_jcjlh!=null)
	{
		kp_gdrcjcjl_jcjlh=cf.GB2Uni(kp_gdrcjcjl_jcjlh);
		if (!(kp_gdrcjcjl_jcjlh.equals("")))	wheresql+=" and  (kp_gdrcjcjl.jcjlh='"+kp_gdrcjcjl_jcjlh+"')";
	}
	kp_gdrcjcjl_khbh=request.getParameter("kp_gdrcjcjl_khbh");
	if (kp_gdrcjcjl_khbh!=null)
	{
		kp_gdrcjcjl_khbh=cf.GB2Uni(kp_gdrcjcjl_khbh);
		if (!(kp_gdrcjcjl_khbh.equals("")))	wheresql+=" and  (kp_gdrcjcjl.khbh='"+kp_gdrcjcjl_khbh+"')";
	}
	kp_gdrcjcjl_sgd=request.getParameter("kp_gdrcjcjl_sgd");
	if (kp_gdrcjcjl_sgd!=null)
	{
		kp_gdrcjcjl_sgd=cf.GB2Uni(kp_gdrcjcjl_sgd);
		if (!(kp_gdrcjcjl_sgd.equals("")))	wheresql+=" and  (kp_gdrcjcjl.sgd='"+kp_gdrcjcjl_sgd+"')";
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
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	kp_gdrcjcjl_jcr=request.getParameter("kp_gdrcjcjl_jcr");
	if (kp_gdrcjcjl_jcr!=null)
	{
		kp_gdrcjcjl_jcr=cf.GB2Uni(kp_gdrcjcjl_jcr);
		if (!(kp_gdrcjcjl_jcr.equals("")))	wheresql+=" and  (kp_gdrcjcjl.jcr='"+kp_gdrcjcjl_jcr+"')";
	}
	kp_gdrcjcjl_jcsj=request.getParameter("kp_gdrcjcjl_jcsj");
	if (kp_gdrcjcjl_jcsj!=null)
	{
		kp_gdrcjcjl_jcsj=kp_gdrcjcjl_jcsj.trim();
		if (!(kp_gdrcjcjl_jcsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.jcsj>=TO_DATE('"+kp_gdrcjcjl_jcsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_jcsj=request.getParameter("kp_gdrcjcjl_jcsj2");
	if (kp_gdrcjcjl_jcsj!=null)
	{
		kp_gdrcjcjl_jcsj=kp_gdrcjcjl_jcsj.trim();
		if (!(kp_gdrcjcjl_jcsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.jcsj<=TO_DATE('"+kp_gdrcjcjl_jcsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_rcjclxbm=request.getParameter("kp_gdrcjcjl_rcjclxbm");
	if (kp_gdrcjcjl_rcjclxbm!=null)
	{
		kp_gdrcjcjl_rcjclxbm=cf.GB2Uni(kp_gdrcjcjl_rcjclxbm);
		if (!(kp_gdrcjcjl_rcjclxbm.equals("")))	wheresql+=" and  (kp_gdrcjcjl.rcjclxbm='"+kp_gdrcjcjl_rcjclxbm+"')";
	}
	kp_gdrcjcjl_rcjcjgbm=request.getParameter("kp_gdrcjcjl_rcjcjgbm");
	if (kp_gdrcjcjl_rcjcjgbm!=null)
	{
		kp_gdrcjcjl_rcjcjgbm=cf.GB2Uni(kp_gdrcjcjl_rcjcjgbm);
		if (!(kp_gdrcjcjl_rcjcjgbm.equals("")))	wheresql+=" and  (kp_gdrcjcjl.rcjcjgbm='"+kp_gdrcjcjl_rcjcjgbm+"')";
	}
	kp_gdrcjcjl_spbz=request.getParameter("kp_gdrcjcjl_spbz");
	if (kp_gdrcjcjl_spbz!=null)
	{
		kp_gdrcjcjl_spbz=cf.GB2Uni(kp_gdrcjcjl_spbz);
		if (!(kp_gdrcjcjl_spbz.equals("")))	wheresql+=" and  (kp_gdrcjcjl.spbz='"+kp_gdrcjcjl_spbz+"')";
	}
	kp_gdrcjcjl_spr=request.getParameter("kp_gdrcjcjl_spr");
	if (kp_gdrcjcjl_spr!=null)
	{
		kp_gdrcjcjl_spr=cf.GB2Uni(kp_gdrcjcjl_spr);
		if (!(kp_gdrcjcjl_spr.equals("")))	wheresql+=" and  (kp_gdrcjcjl.spr='"+kp_gdrcjcjl_spr+"')";
	}
	kp_gdrcjcjl_spsj=request.getParameter("kp_gdrcjcjl_spsj");
	if (kp_gdrcjcjl_spsj!=null)
	{
		kp_gdrcjcjl_spsj=kp_gdrcjcjl_spsj.trim();
		if (!(kp_gdrcjcjl_spsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.spsj>=TO_DATE('"+kp_gdrcjcjl_spsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_spsj=request.getParameter("kp_gdrcjcjl_spsj2");
	if (kp_gdrcjcjl_spsj!=null)
	{
		kp_gdrcjcjl_spsj=kp_gdrcjcjl_spsj.trim();
		if (!(kp_gdrcjcjl_spsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.spsj<=TO_DATE('"+kp_gdrcjcjl_spsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_lrr=request.getParameter("kp_gdrcjcjl_lrr");
	if (kp_gdrcjcjl_lrr!=null)
	{
		kp_gdrcjcjl_lrr=cf.GB2Uni(kp_gdrcjcjl_lrr);
		if (!(kp_gdrcjcjl_lrr.equals("")))	wheresql+=" and  (kp_gdrcjcjl.lrr='"+kp_gdrcjcjl_lrr+"')";
	}
	kp_gdrcjcjl_lrsj=request.getParameter("kp_gdrcjcjl_lrsj");
	if (kp_gdrcjcjl_lrsj!=null)
	{
		kp_gdrcjcjl_lrsj=kp_gdrcjcjl_lrsj.trim();
		if (!(kp_gdrcjcjl_lrsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.lrsj>=TO_DATE('"+kp_gdrcjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_lrsj=request.getParameter("kp_gdrcjcjl_lrsj2");
	if (kp_gdrcjcjl_lrsj!=null)
	{
		kp_gdrcjcjl_lrsj=kp_gdrcjcjl_lrsj.trim();
		if (!(kp_gdrcjcjl_lrsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.lrsj<=TO_DATE('"+kp_gdrcjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_lrbm=request.getParameter("kp_gdrcjcjl_lrbm");
	if (kp_gdrcjcjl_lrbm!=null)
	{
		kp_gdrcjcjl_lrbm=cf.GB2Uni(kp_gdrcjcjl_lrbm);
		if (!(kp_gdrcjcjl_lrbm.equals("")))	wheresql+=" and  (kp_gdrcjcjl.lrbm='"+kp_gdrcjcjl_lrbm+"')";
	}
	ls_sql="SELECT kp_gdrcjcjl.jcjlh,kp_gdrcjcjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.sjs,crm_khxx.hth,kp_gdrcjcjl.jcr,kp_gdrcjcjl.jcsj,dm_rcjclxbm.rcjclxmc,dm_rcjcjgbm.rcjcjgmc, DECODE(kp_gdrcjcjl.spbz,'1','未审批','2','审批'),kp_gdrcjcjl.spr,kp_gdrcjcjl.spsj,kp_gdrcjcjl.lrr,kp_gdrcjcjl.lrsj,dwmc,kp_gdrcjcjl.bz  ";
	ls_sql+=" FROM crm_khxx,dm_rcjcjgbm,dm_rcjclxbm,kp_gdrcjcjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where kp_gdrcjcjl.rcjcjgbm=dm_rcjcjgbm.rcjcjgbm(+) and kp_gdrcjcjl.rcjclxbm=dm_rcjclxbm.rcjclxbm(+) and kp_gdrcjcjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and kp_gdrcjcjl.sgd=sq_sgd.sgd(+) and kp_gdrcjcjl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by kp_gdrcjcjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_gdrcjcjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jcjlh","kp_gdrcjcjl_khbh","kp_gdrcjcjl_sgd","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_hth","kp_gdrcjcjl_jcr","kp_gdrcjcjl_jcsj","dm_rcjclxbm_rcjclxmc","dm_rcjcjgbm_rcjcjgmc","kp_gdrcjcjl_spbz","kp_gdrcjcjl_spr","kp_gdrcjcjl_spsj","kp_gdrcjcjl_lrr","kp_gdrcjcjl_lrsj","kp_gdrcjcjl_lrbm","kp_gdrcjcjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jcjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_gdrcjcjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jcjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">检查记录号</td>
	<td  width="4%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">施工队</td>
	<td  width="4%">设计师</td>
	<td  width="5%">合同号</td>
	<td  width="4%">检查人</td>
	<td  width="5%">检查时间</td>
	<td  width="5%">检查类型</td>
	<td  width="5%">检查结果</td>
	<td  width="4%">审批标志</td>
	<td  width="4%">审批人</td>
	<td  width="5%">审批时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="6%">录入单位</td>
	<td  width="25%">备注</td>
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