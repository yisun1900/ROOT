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

	String khxm=null;
	String lxfs=null;
	String hth=null;

	String khbh=null;
	String damxbm=null;

	String bgr=null;
	String bgrdw=null;
	String bgrfgs=null;
	String lrr=null;
	String lrsj=null;
	String lrsj2=null;
	String sl=null;

	String dadbh=null;
	dadbh=request.getParameter("dadbh");
	if (dadbh!=null)
	{
		dadbh=cf.GB2Uni(dadbh);
		if (!(dadbh.equals("")))	wheresql+=" and  (crm_khxx.dadbh='"+dadbh+"')";
	}

	String dalqbz=null;
	dalqbz=request.getParameter("dalqbz");
	if (dalqbz!=null)
	{
		if (!(dalqbz.equals("")))	wheresql+=" and  (crm_khxx.dalqbz='"+dalqbz+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}

	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	damxbm=request.getParameter("damxbm");
	if (damxbm!=null)
	{
		damxbm=cf.GB2Uni(damxbm);
		if (!(damxbm.equals("")))	wheresql+=" and  (crm_gcdagl.damxbm='"+damxbm+"')";
	}
	bgr=request.getParameter("bgr");
	if (bgr!=null)
	{
		bgr=cf.GB2Uni(bgr);
		if (!(bgr.equals("")))	wheresql+=" and  (crm_gcdagl.bgr like '%"+bgr+"%')";
	}
	bgrdw=request.getParameter("bgrdw");
	if (bgrdw!=null)
	{
		bgrdw=cf.GB2Uni(bgrdw);
		if (!(bgrdw.equals("")))	wheresql+=" and  (crm_gcdagl.bgrdw='"+bgrdw+"')";
	}
	bgrfgs=request.getParameter("bgrfgs");
	if (bgrfgs!=null)
	{
		bgrfgs=cf.GB2Uni(bgrfgs);
		if (!(bgrfgs.equals("")))	wheresql+=" and  (crm_gcdagl.bgrfgs='"+bgrfgs+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_gcdagl.lrr like '%"+lrr+"%')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_gcdagl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		lrsj2=lrsj2.trim();
		if (!(lrsj2.equals("")))	wheresql+="  and (crm_gcdagl.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}
	sl=request.getParameter("sl");
	if (sl!=null)
	{
		sl=sl.trim();
		if (!(sl.equals("")))	wheresql+="  and crm_gcdagl.sl="+Long.parseLong(sl.trim());
	}
	String gdbz=null;
	gdbz=request.getParameter("gdbz");
	if (gdbz!=null)
	{
		gdbz=cf.GB2Uni(gdbz);
		if (!(gdbz.equals("")))	wheresql+=" and  (crm_gcdagl.gdbz='"+gdbz+"')";
	}

	ls_sql="select crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.dalqbz,'1','未建档案','2','已建档案','3','已归档','4','借出'),crm_khxx.dadbh,crm_khxx.dagdr,crm_khxx.dagdsj,DECODE(crm_gcdagl.gdbz,'Y','归档','N','已借出'),damxmc,sl,bgr,a.dwmc bgdw,b.dwmc bgfgs,bgsj,crm_gcdagl.lrr,crm_gcdagl.lrsj,crm_gcdagl.bz ";
	ls_sql+=" FROM crm_gcdagl,crm_khxx,dm_damxbm,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_khxx.khbh=crm_gcdagl.khbh(+)";
	ls_sql+=" and crm_gcdagl.damxbm=dm_damxbm.damxbm(+)";
	ls_sql+=" and crm_gcdagl.bgrdw=a.dwbh(+)";
	ls_sql+=" and crm_gcdagl.bgrfgs=b.dwbh(+)";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.dalqbz desc,crm_khxx.dagdsj desc,crm_khxx.khxm,crm_khxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gcdaCxList.jsp","","","");
	pageObj.setPageRow(20);//设置每页显示记录数

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
  <B><font size="3">查询档案明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">客户编号</td>
	<td  width="5%">合同号</td>
	<td  width="5%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="4%">客户归档</td>
	<td  width="5%">档案袋编号</td>
	<td  width="3%">归档人</td>
	<td  width="5%">归档时间</td>
	<td  width="4%">是否借出</td>
	<td  width="8%">档案明细</td>
	<td  width="3%">数量</td>
	<td  width="3%">保管人</td>
	<td  width="7%">保管部门</td>
	<td  width="6%">保管分公司</td>
	<td  width="5%">开始保管时间</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="26%">备注</td>
</tr>
<%
	pageObj.printDate();
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