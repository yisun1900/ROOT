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
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_zjxm=null;
	String cl_djj_czxh=null;
	String cl_djj_khbh=null;
	String cl_djj_sfjm=null;
	String cl_djj_shzt=null;
	String cl_djj_lrr=null;
	String cl_djj_lrsj=null;
	String cl_djj_dwbh=null;
	String cl_djj_czzt=null;

	String shjl=null;
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		if (!(shjl.equals("")))	wheresql+=" and  (cl_djj.shjl='"+shjl+"')";
	}
	
	
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cl_djj_czxh=request.getParameter("cl_djj_czxh");
	if (cl_djj_czxh!=null)
	{
		cl_djj_czxh=cf.GB2Uni(cl_djj_czxh);
		if (!(cl_djj_czxh.equals("")))	wheresql+=" and  (cl_djj.czxh='"+cl_djj_czxh+"')";
	}
	cl_djj_khbh=request.getParameter("cl_djj_khbh");
	if (cl_djj_khbh!=null)
	{
		cl_djj_khbh=cf.GB2Uni(cl_djj_khbh);
		if (!(cl_djj_khbh.equals("")))	wheresql+=" and  (cl_djj.khbh='"+cl_djj_khbh+"')";
	}
	cl_djj_sfjm=request.getParameter("cl_djj_sfjm");
	if (cl_djj_sfjm!=null)
	{
		cl_djj_sfjm=cf.GB2Uni(cl_djj_sfjm);
		if (!(cl_djj_sfjm.equals("")))	wheresql+=" and  (cl_djj.sfjm='"+cl_djj_sfjm+"')";
	}
	cl_djj_shzt=request.getParameter("cl_djj_shzt");
	if (cl_djj_shzt!=null)
	{
		cl_djj_shzt=cf.GB2Uni(cl_djj_shzt);
		if (!(cl_djj_shzt.equals("")))	wheresql+=" and  (cl_djj.shzt='"+cl_djj_shzt+"')";
	}
	cl_djj_lrr=request.getParameter("cl_djj_lrr");
	if (cl_djj_lrr!=null)
	{
		cl_djj_lrr=cf.GB2Uni(cl_djj_lrr);
		if (!(cl_djj_lrr.equals("")))	wheresql+=" and  (cl_djj.lrr='"+cl_djj_lrr+"')";
	}
	cl_djj_lrsj=request.getParameter("cl_djj_lrsj");
	if (cl_djj_lrsj!=null)
	{
		cl_djj_lrsj=cl_djj_lrsj.trim();
		if (!(cl_djj_lrsj.equals("")))	wheresql+="  and (cl_djj.lrsj>=TO_DATE('"+cl_djj_lrsj+"','YYYY/MM/DD'))";
	}
	cl_djj_lrsj=request.getParameter("cl_djj_lrsj2");
	if (cl_djj_lrsj!=null)
	{
		cl_djj_lrsj=cl_djj_lrsj.trim();
		if (!(cl_djj_lrsj.equals("")))	wheresql+="  and (cl_djj.lrsj<=TO_DATE('"+cl_djj_lrsj+"','YYYY/MM/DD'))";
	}
	cl_djj_dwbh=request.getParameter("cl_djj_dwbh");
	if (cl_djj_dwbh!=null)
	{
		cl_djj_dwbh=cf.GB2Uni(cl_djj_dwbh);
		if (!(cl_djj_dwbh.equals("")))	wheresql+=" and  (cl_djj.dwbh='"+cl_djj_dwbh+"')";
	}
	cl_djj_czzt=request.getParameter("cl_djj_czzt");
	if (cl_djj_czzt!=null)
	{
		cl_djj_czzt=cf.GB2Uni(cl_djj_czzt);
		if (!(cl_djj_czzt.equals("")))	wheresql+=" and  (cl_djj.czzt='"+cl_djj_czzt+"')";
	}

	ls_sql="SELECT cl_djj.czxh, DECODE(cl_djj.czzt,'1','未提交','2','已提交','3','已打印'), DECODE(cl_djj.sfjm,'1','不申请','2','申请减免'), DECODE(cl_djj.shzt,'1','未审核','2','一级审核','3','二级审核'),DECODE(shjl,'1','同意','2','不同意') shjl,DECODE(ejshjl,'1','同意','2','不同意') ejshjl,crm_khxx.khxm,cl_djj.qye,cl_djj.sqlqsl,cl_djj.sqlqje,cl_djj.sjsl,cl_djj.sjje,cl_djj.ylqze,cl_djj.ylqze-cl_djj.sjje,cl_djj.shr,cl_djj.shsj,cl_djj.shyj,cl_djj.ejshr,cl_djj.ejshsj,cl_djj.ejshyj,cl_djj.khbh,crm_khxx.fwdz,sgdmc,sq_dwxx.dwmc  ,cl_djj.lrr,cl_djj.lrsj,cl_djj.bz";
	ls_sql+=" FROM cl_djj,crm_khxx,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cl_djj.dwbh=sq_dwxx.dwbh and cl_djj.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_djj.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_djjCxshList.jsp","SelectCxshCl_djj.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","czxh","cl_djj_khbh","cl_djj_qye","cl_djj_sqlqsl","cl_djj_sqlqje","cl_djj_sjsl","cl_djj_sjje","cl_djj_sfjm","cl_djj_jmyy","cl_djj_shzt","cl_djj_lrr","cl_djj_lrsj","cl_djj_czzt","cl_djj_bz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"czxh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"撤销审核"};//按钮的显示名称
	String[] buttonLink={"DeleteJmshCl_djjmx.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"czxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCl_djj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("czxh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">撤销一级审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">操作序号</td>
	<td  width="2%">操作状态</td>
	<td  width="3%">是否申请减免</td>
	<td  width="3%">减免审核状态</td>
	<td  width="2%">一级审核结论</td>
	<td  width="2%">二级审核结论</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">签约额</td>
	<td  width="2%">申请领取数量</td>
	<td  width="4%">申请领取金额</td>
	<td  width="2%">实际数量</td>
	<td  width="4%">实际金额</td>
	<td  width="4%">应领取总额</td>
	<td  width="4%">减免金额</td>
	<td  width="2%">一级审核人</td>
	<td  width="3%">一级审核时间</td>
	<td  width="8%">一级审核意见</td>
	<td  width="2%">二级审核人</td>
	<td  width="3%">二级审核时间</td>
	<td  width="8%">二级审核意见</td>
	<td  width="2%">客户编号</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">施工队</td>
	<td  width="4%">分公司</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="8%">备注</td>
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