<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String ckjgbz=(String)session.getAttribute("ckjgbz");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='04'");


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

	String jsr=null;
	String jsrdw=null;
	String jsrfgs=null;
	String yjr=null;
	String yjrdw=null;
	String yjrfgs=null;
	String lrr=null;
	String lrsj=null;
	String lrsj2=null;
	String yjsj=null;
	String yjsj2=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (fgsbh='"+fgs+"')";
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
		if (!(khbh.equals("")))	wheresql+=" and  (crm_gcdayjjl.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}

	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs='"+lxfs+"')";
	}

	damxbm=request.getParameter("damxbm");
	if (damxbm!=null)
	{
		damxbm=cf.GB2Uni(damxbm);
		if (!(damxbm.equals("")))	wheresql+=" and  (crm_gcdayjjl.damxbm='"+damxbm+"')";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (jsr like '%"+jsr+"%')";
	}
	jsrdw=request.getParameter("jsrdw");
	if (jsrdw!=null)
	{
		jsrdw=cf.GB2Uni(jsrdw);
		if (!(jsrdw.equals("")))	wheresql+=" and  (jsrdw='"+jsrdw+"')";
	}
	jsrfgs=request.getParameter("jsrfgs");
	if (jsrfgs!=null)
	{
		jsrfgs=cf.GB2Uni(jsrfgs);
		if (!(jsrfgs.equals("")))	wheresql+=" and  (jsrfgs='"+jsrfgs+"')";
	}
	yjr=request.getParameter("yjr");
	if (yjr!=null)
	{
		yjr=cf.GB2Uni(yjr);
		if (!(yjr.equals("")))	wheresql+=" and  (yjr like '%"+yjr+"%')";
	}
	yjrdw=request.getParameter("yjrdw");
	if (yjrdw!=null)
	{
		yjrdw=cf.GB2Uni(yjrdw);
		if (!(yjrdw.equals("")))	wheresql+=" and  (yjrdw='"+yjrdw+"')";
	}
	yjrfgs=request.getParameter("yjrfgs");
	if (yjrfgs!=null)
	{
		yjrfgs=cf.GB2Uni(yjrfgs);
		if (!(yjrfgs.equals("")))	wheresql+=" and  (yjrfgs='"+yjrfgs+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_gcdayjjl.lrr like '%"+lrr+"%')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_gcdayjjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		lrsj2=lrsj2.trim();
		if (!(lrsj2.equals("")))	wheresql+="  and (crm_gcdayjjl.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}
	yjsj=request.getParameter("yjsj");
	if (yjsj!=null)
	{
		yjsj=yjsj.trim();
		if (!(yjsj.equals("")))	wheresql+="  and (yjsj>=TO_DATE('"+yjsj+"','YYYY/MM/DD'))";
	}
	yjsj2=request.getParameter("yjsj2");
	if (yjsj2!=null)
	{
		yjsj2=yjsj2.trim();
		if (!(yjsj2.equals("")))	wheresql+="  and (yjsj<=TO_DATE('"+yjsj2+"','YYYY/MM/DD'))";
	}

	ls_sql="select crm_gcdayjjl.jlh,crm_gcdayjjl.khbh,khxm,damxmc,yjr,a.dwmc yjrdw,jsr,b.dwmc jsrdw,yjsj,crm_gcdayjjl.lrr,crm_gcdayjjl.lrsj,DECODE(crm_gcdayjjl.czlx,'I','归还','O','借出') czlx,crm_gcdayjjl.bz ";
	ls_sql+=" FROM crm_gcdayjjl,crm_khxx,dm_damxbm,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_gcdayjjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_gcdayjjl.damxbm=dm_damxbm.damxbm(+)";
	ls_sql+=" and crm_gcdayjjl.yjrdw=a.dwbh(+)";
	ls_sql+=" and crm_gcdayjjl.jsrdw=b.dwbh(+)";
	ls_sql+=wheresql;
	ls_sql+=" order by jlh desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gcdayjjlCxList.jsp","SelectCxCrm_gcdayjjl.jsp","","");
	pageObj.setPageRow(20);//设置每页显示记录数


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
<body jscolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询档案移交记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">记录号</td>
	<td  width="5%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="12%">档案明细</td>
	<td  width="5%">移交人</td>
	<td  width="9%">移交单位</td>
	<td  width="5%">接收人</td>
	<td  width="9%">接收单位</td>
	<td  width="7%">移交时间</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="6%">操作类型</td>
	<td  width="20%">备注</td>
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