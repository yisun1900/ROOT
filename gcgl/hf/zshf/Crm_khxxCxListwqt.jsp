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
	String ls_sql2=null;
	String wheresql="";
	String wheresql2="";
	String wheresql3="";
	String khbh=null;
	String khxm=null;
	String xb=null;
	String fwdz=null;
	String lxfs=null;
	String lrsj=null;
	String pdclzt=null;
	String pdsj=null;
	String pdr=null;
	String sgd=null;
	String gcjdbm=null;
	String sfxhf=null;
	String hfrq=null;
	String hfrq2=null;
	String hflxbm=null;
	String hdbz=null;
	String tkbz=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and (crm_khxx.dwbh='"+dwbh+"') ";
	}

	tkbz=request.getParameter("tkbz");
	if (tkbz!=null)
	{
		if (!(tkbz.equals("")))	wheresql+=" and  (tkbz='"+tkbz+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (xb='"+xb+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs='"+lxfs+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))	wheresql+=" and  (pdclzt='"+pdclzt+"')";
	}
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		pdsj=pdsj.trim();
		if (!(pdsj.equals("")))	wheresql+="  and (pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		pdsj=pdsj.trim();
		if (!(pdsj.equals("")))	wheresql+="  and (pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdr=request.getParameter("pdr");
	if (pdr!=null)
	{
		pdr=cf.GB2Uni(pdr);
		if (!(pdr.equals("")))	wheresql+=" and  (pdr='"+pdr+"')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (sgd='"+sgd+"')";
	}
	gcjdbm=request.getParameter("gcjdbm");
	if (gcjdbm!=null)
	{
		gcjdbm=cf.GB2Uni(gcjdbm);
		if (!(gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+gcjdbm+"')";
	}
	sfxhf=request.getParameter("sfxhf");
	if (sfxhf!=null)
	{
		sfxhf=cf.GB2Uni(sfxhf);
		if (!(sfxhf.equals("")))	wheresql+=" and  (sfxhf='"+sfxhf+"')";
	}
	hfrq=request.getParameter("hfrq");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (hfrq>=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}
	hfrq2=request.getParameter("hfrq2");
	if (hfrq2!=null)
	{
		hfrq2=hfrq2.trim();
		if (!(hfrq2.equals("")))	wheresql3+="  and (hfrq<=TO_DATE('"+hfrq2+"','YYYY/MM/DD'))";
		if (!(hfrq2.equals("")))	wheresql2+="  and (sjkgrq=TO_DATE('"+cf.addDay(hfrq2,-5)+"','YYYY/MM/DD'))";
	}
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (crm_khxx.hflxbm='"+hflxbm+"')";
	}
	hdbz=request.getParameter("hdbz");
	if (hdbz!=null)
	{
		hdbz=cf.GB2Uni(hdbz);
		if (!(hdbz.equals("")))	wheresql+=" and  (hdbz='"+hdbz+"')";
	}
	ls_sql="SELECT hflxmc,hfrq,sjkgrq,khbh,khxm,fwdz,lxfs,dwmc,gcjdmc from (";
	ls_sql+="SELECT hflxmc,hfrq,sjkgrq,khbh,khxm,fwdz,lxfs,dwmc,gcjdmc";
	ls_sql+=" FROM crm_khxx,sq_dwxx,dm_hflxbm,dm_gcjdbm  ";
    ls_sql+=" where zt='2' and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.hflxbm=dm_hflxbm.hflxbm(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.hflxbm not in ('21')";
    ls_sql+=" and (hfdjbz not in('1','3') or (hfdjbz in('1','3') and jhjdsj<=SYSDATE)) ";
	ls_sql+=wheresql;
	ls_sql+=wheresql3;
    ls_sql+=" union ";

	ls_sql+=" SELECT hflxmc,hfrq,sjkgrq,khbh,khxm,fwdz,lxfs,dwmc,gcjdmc";
	ls_sql+=" FROM crm_khxx,sq_dwxx,dm_hflxbm,dm_gcjdbm  ";
    ls_sql+=" where zt='2' and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.hflxbm=dm_hflxbm.hflxbm(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.hflxbm in ('21')";
    ls_sql+=" and (hfdjbz not in('1','3') or (hfdjbz in('1','3') and jhjdsj<=SYSDATE)) ";
	ls_sql+=wheresql;
	ls_sql+=wheresql2;
	
    ls_sql+=")";
    ls_sql+=" order by hfrq";
    pageObj.sql=ls_sql;
	//out.print(ls_sql);
//进行对象初始化
	pageObj.initPage("Crm_khxxCxList.jsp","SelectCxCrm_khxx.jsp","InsertCrm_hfjl.jsp","");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","dwbh","pdclzt","pdsj","sfxhf","hfrq","hflxbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("回访");
//	pageObj.setViewBolt("");
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
  <B><font size="2">需回访列表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(102);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="11%">回访类型</td>
	<td  width="9%">应回访</td>
	<td  width="9%">实开工</td>
	<td  width="7%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="23%">房屋地址</td>
	<td  width="10%">联系方式</td>
	<td  width="11%">签约店面</td>
	<td  width="10%">工程进度</td>
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
