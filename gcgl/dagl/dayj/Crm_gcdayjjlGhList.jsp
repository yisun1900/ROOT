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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	
	String dadbh=null;
	dadbh=request.getParameter("dadbh");
	if (dadbh!=null)
	{
		dadbh=cf.GB2Uni(dadbh);
		if (!(dadbh.equals("")))	wheresql+=" and  (crm_khxx.dadbh='"+dadbh+"')";
	}
	
	String jlh=null;
	String damxbm=null;
	String sl=null;
	String jyr=null;
	String jysj=null;
	String jyrssbm=null;
	String ghlrr=null;
	String ghlrsj=null;
	String ghlrrssbm=null;
	String zt=null;
	String lrr=null;
	String lrrdw=null;
	String lrsj=null;
	jlh=request.getParameter("jlh");
	if (jlh!=null)
	{
		jlh=jlh.trim();
		if (!(jlh.equals("")))	wheresql+=" and (crm_gcdayjjl.jlh="+jlh+") ";
	}
	damxbm=request.getParameter("damxbm");
	if (damxbm!=null)
	{
		damxbm=cf.GB2Uni(damxbm);
		if (!(damxbm.equals("")))	wheresql+=" and  (crm_gcdayjjl.damxbm='"+damxbm+"')";
	}
	sl=request.getParameter("sl");
	if (sl!=null)
	{
		sl=sl.trim();
		if (!(sl.equals("")))	wheresql+=" and (crm_gcdayjjl.sl="+sl+") ";
	}
	jyr=request.getParameter("jyr");
	if (jyr!=null)
	{
		jyr=cf.GB2Uni(jyr);
		if (!(jyr.equals("")))	wheresql+=" and  (crm_gcdayjjl.jyr='"+jyr+"')";
	}
	jysj=request.getParameter("jysj");
	if (jysj!=null)
	{
		jysj=jysj.trim();
		if (!(jysj.equals("")))	wheresql+="  and (crm_gcdayjjl.jysj>=TO_DATE('"+jysj+"','YYYY/MM/DD'))";
	}
	jysj=request.getParameter("jysj2");
	if (jysj!=null)
	{
		jysj=jysj.trim();
		if (!(jysj.equals("")))	wheresql+="  and (crm_gcdayjjl.jysj<=TO_DATE('"+jysj+"','YYYY/MM/DD'))";
	}
	jyrssbm=request.getParameter("jyrssbm");
	if (jyrssbm!=null)
	{
		jyrssbm=cf.GB2Uni(jyrssbm);
		if (!(jyrssbm.equals("")))	wheresql+=" and  (crm_gcdayjjl.jyrssbm='"+jyrssbm+"')";
	}

	ghlrr=request.getParameter("ghlrr");
	if (ghlrr!=null)
	{
		ghlrr=cf.GB2Uni(ghlrr);
		if (!(ghlrr.equals("")))	wheresql+=" and  (crm_gcdayjjl.ghlrr='"+ghlrr+"')";
	}
	ghlrsj=request.getParameter("ghlrsj");
	if (ghlrsj!=null)
	{
		ghlrsj=ghlrsj.trim();
		if (!(ghlrsj.equals("")))	wheresql+="  and (crm_gcdayjjl.ghlrsj>=TO_DATE('"+ghlrsj+"','YYYY/MM/DD'))";
	}
	ghlrsj=request.getParameter("ghlrsj2");
	if (ghlrsj!=null)
	{
		ghlrsj=ghlrsj.trim();
		if (!(ghlrsj.equals("")))	wheresql+="  and (crm_gcdayjjl.ghlrsj<=TO_DATE('"+ghlrsj+"','YYYY/MM/DD'))";
	}
	ghlrrssbm=request.getParameter("ghlrrssbm");
	if (ghlrrssbm!=null)
	{
		ghlrrssbm=cf.GB2Uni(ghlrrssbm);
		if (!(ghlrrssbm.equals("")))	wheresql+=" and  (crm_gcdayjjl.ghlrrssbm='"+ghlrrssbm+"')";
	}
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		zt=cf.GB2Uni(zt);
		if (!(zt.equals("")))	wheresql+=" and  (crm_gcdayjjl.zt='"+zt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_gcdayjjl.lrr='"+lrr+"')";
	}
	lrrdw=request.getParameter("lrrdw");
	if (lrrdw!=null)
	{
		lrrdw=cf.GB2Uni(lrrdw);
		if (!(lrrdw.equals("")))	wheresql+=" and  (crm_gcdayjjl.lrrdw='"+lrrdw+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_gcdayjjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_gcdayjjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_gcdayjjl.jlh,crm_gcdayjjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.dadbh,DECODE(crm_gcdayjjl.zt,'1','借出','2','归返'),damxmc,crm_gcdayjjl.sl,crm_gcdayjjl.jyr,crm_gcdayjjl.jysj,a.dwmc jyrssbm,crm_gcdayjjl.ghlrr,crm_gcdayjjl.ghlrsj,b.dwmc ghlrrssbm, crm_gcdayjjl.lrr,c.dwmc lrrdw,crm_gcdayjjl.lrsj,crm_gcdayjjl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_gcdayjjl,dm_damxbm,sq_dwxx a,sq_dwxx b,sq_dwxx c  ";
    ls_sql+=" where crm_gcdayjjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_gcdayjjl.damxbm=dm_damxbm.damxbm(+)";
    ls_sql+=" and crm_gcdayjjl.jyrssbm=a.dwbh(+)";
    ls_sql+=" and crm_gcdayjjl.ghlrrssbm=b.dwbh(+)";
    ls_sql+=" and crm_gcdayjjl.lrrdw=c.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_gcdayjjl.jlh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gcdayjjlGhList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);


//设置按钮参数
	String[] buttonName={"归还"};//按钮的显示名称
	String[] buttonLink={"SavePlGh.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">档案归还</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">记录号</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="7%">档案袋编号</td>
	<td  width="3%">状态</td>
	<td  width="7%">档案明细</td>
	<td  width="3%">数量</td>
	<td  width="4%">借阅人</td>
	<td  width="5%">借阅时间</td>
	<td  width="6%">借阅人所属部门</td>
	<td  width="4%">归还录入人</td>
	<td  width="5%">归还录入时间</td>
	<td  width="6%">归还录入人所属部门</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入部门</td>
	<td  width="5%">录入时间</td>
	<td  width="35%">备注</td>
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