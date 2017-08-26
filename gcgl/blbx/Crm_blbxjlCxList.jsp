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

	String crm_blbxjl_kbxbz=null;
	String crm_blbxjl_bxlbbm=null;
	String crm_blbxjl_bxkssj=null;
	String crm_blbxjl_bxjzsj=null;
	String crm_blbxjl_lrr=null;
	String crm_blbxjl_lrsj=null;

	crm_blbxjl_kbxbz=request.getParameter("crm_blbxjl_kbxbz");
	if (crm_blbxjl_kbxbz!=null)
	{
		crm_blbxjl_kbxbz=cf.GB2Uni(crm_blbxjl_kbxbz);
		if (!(crm_blbxjl_kbxbz.equals("")))	wheresql+=" and  (crm_blbxjl.kbxbz='"+crm_blbxjl_kbxbz+"')";
	}
	crm_blbxjl_bxlbbm=request.getParameter("crm_blbxjl_bxlbbm");
	if (crm_blbxjl_bxlbbm!=null)
	{
		crm_blbxjl_bxlbbm=cf.GB2Uni(crm_blbxjl_bxlbbm);
		if (!(crm_blbxjl_bxlbbm.equals("")))	wheresql+=" and  (crm_blbxjl.bxlbbm='"+crm_blbxjl_bxlbbm+"')";
	}
	crm_blbxjl_bxkssj=request.getParameter("crm_blbxjl_bxkssj");
	if (crm_blbxjl_bxkssj!=null)
	{
		crm_blbxjl_bxkssj=crm_blbxjl_bxkssj.trim();
		if (!(crm_blbxjl_bxkssj.equals("")))	wheresql+="  and (crm_blbxjl.bxkssj>=TO_DATE('"+crm_blbxjl_bxkssj+"','YYYY/MM/DD'))";
	}
	crm_blbxjl_bxkssj=request.getParameter("crm_blbxjl_bxkssj2");
	if (crm_blbxjl_bxkssj!=null)
	{
		crm_blbxjl_bxkssj=crm_blbxjl_bxkssj.trim();
		if (!(crm_blbxjl_bxkssj.equals("")))	wheresql+="  and (crm_blbxjl.bxkssj<=TO_DATE('"+crm_blbxjl_bxkssj+"','YYYY/MM/DD'))";
	}
	crm_blbxjl_bxjzsj=request.getParameter("crm_blbxjl_bxjzsj");
	if (crm_blbxjl_bxjzsj!=null)
	{
		crm_blbxjl_bxjzsj=crm_blbxjl_bxjzsj.trim();
		if (!(crm_blbxjl_bxjzsj.equals("")))	wheresql+="  and (crm_blbxjl.bxjzsj>=TO_DATE('"+crm_blbxjl_bxjzsj+"','YYYY/MM/DD'))";
	}
	crm_blbxjl_bxjzsj=request.getParameter("crm_blbxjl_bxjzsj2");
	if (crm_blbxjl_bxjzsj!=null)
	{
		crm_blbxjl_bxjzsj=crm_blbxjl_bxjzsj.trim();
		if (!(crm_blbxjl_bxjzsj.equals("")))	wheresql+="  and (crm_blbxjl.bxjzsj<=TO_DATE('"+crm_blbxjl_bxjzsj+"','YYYY/MM/DD'))";
	}
	crm_blbxjl_lrr=request.getParameter("crm_blbxjl_lrr");
	if (crm_blbxjl_lrr!=null)
	{
		crm_blbxjl_lrr=cf.GB2Uni(crm_blbxjl_lrr);
		if (!(crm_blbxjl_lrr.equals("")))	wheresql+=" and  (crm_blbxjl.lrr='"+crm_blbxjl_lrr+"')";
	}
	crm_blbxjl_lrsj=request.getParameter("crm_blbxjl_lrsj");
	if (crm_blbxjl_lrsj!=null)
	{
		crm_blbxjl_lrsj=crm_blbxjl_lrsj.trim();
		if (!(crm_blbxjl_lrsj.equals("")))	wheresql+="  and (crm_blbxjl.lrsj>=TO_DATE('"+crm_blbxjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_blbxjl_lrsj=request.getParameter("crm_blbxjl_lrsj2");
	if (crm_blbxjl_lrsj!=null)
	{
		crm_blbxjl_lrsj=crm_blbxjl_lrsj.trim();
		if (!(crm_blbxjl_lrsj.equals("")))	wheresql+="  and (crm_blbxjl.lrsj<=TO_DATE('"+crm_blbxjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_blbxjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs, DECODE(crm_blbxjl.kbxbz,'Y','保修','N','不保修'),bxlbmc,crm_blbxjl.bxkssj,crm_blbxjl.bxjzsj,crm_blbxjl.bxsm,crm_blbxjl.lrr,crm_blbxjl.lrsj,a.dwmc lrbm,b.dwmc dm  ";
	ls_sql+=" FROM crm_blbxjl,crm_khxx,crm_bxlbbm,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_blbxjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_blbxjl.bxlbbm=crm_bxlbbm.bxlbbm(+)";
    ls_sql+=" and crm_blbxjl.lrbm=a.dwbh(+)";
    ls_sql+=" and crm_khxx.dwbh=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_blbxjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_blbxjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_blbxjl_kbxbz","crm_blbxjl_bxlbbm","crm_blbxjl_bxkssj","crm_blbxjl_bxjzsj","crm_blbxjl_lrr","crm_blbxjl_lrsj","crm_blbxjl_lrbm","crm_blbxjl_bxsm"};
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询保修信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="4%">设计师</td>
	<td  width="4%">可保修标志</td>
	<td  width="6%">保修类别</td>
	<td  width="5%">保修开始时间</td>
	<td  width="5%">保修截止时间</td>
	<td  width="26%">保修说明</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="8%">店面</td>
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