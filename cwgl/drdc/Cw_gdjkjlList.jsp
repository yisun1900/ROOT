<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_gdjkjl_gdjkjlh=null;
	String cw_gdjkjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_sgbz=null;
	String crm_khxx_zjxm=null;
	String cw_gdjkjl_jklx=null;
	String cw_gdjkjl_jkje=null;
	String cw_gdjkjl_jkblr=null;
	String cw_gdjkjl_jkblsj=null;
	String cw_gdjkjl_lrr=null;
	String cw_gdjkjl_lrsj=null;
	String cw_gdjkjl_lrbm=null;
	String cw_gdjkjl_gdjsjd=null;
	String cw_gdjkjl_gdjsjlh=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_gdjkjl.scbz='"+scbz+"')";

	String czlx=null;
	czlx=request.getParameter("czlx");
	if (!(czlx.equals("")))	wheresql+=" and  (cw_gdjkjl.czlx='"+czlx+"')";

	cw_gdjkjl_gdjkjlh=request.getParameter("cw_gdjkjl_gdjkjlh");
	if (cw_gdjkjl_gdjkjlh!=null)
	{
		cw_gdjkjl_gdjkjlh=cf.GB2Uni(cw_gdjkjl_gdjkjlh);
		if (!(cw_gdjkjl_gdjkjlh.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjkjlh='"+cw_gdjkjl_gdjkjlh+"')";
	}
	cw_gdjkjl_khbh=request.getParameter("cw_gdjkjl_khbh");
	if (cw_gdjkjl_khbh!=null)
	{
		cw_gdjkjl_khbh=cf.GB2Uni(cw_gdjkjl_khbh);
		if (!(cw_gdjkjl_khbh.equals("")))	wheresql+=" and  (cw_gdjkjl.khbh='"+cw_gdjkjl_khbh+"')";
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
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye="+crm_khxx_qye+") ";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_gdjkjl_jklx=request.getParameter("cw_gdjkjl_jklx");
	if (cw_gdjkjl_jklx!=null)
	{
		cw_gdjkjl_jklx=cf.GB2Uni(cw_gdjkjl_jklx);
		if (!(cw_gdjkjl_jklx.equals("")))	wheresql+=" and  (cw_gdjkjl.jklx='"+cw_gdjkjl_jklx+"')";
	}
	cw_gdjkjl_jkje=request.getParameter("cw_gdjkjl_jkje");
	if (cw_gdjkjl_jkje!=null)
	{
		cw_gdjkjl_jkje=cw_gdjkjl_jkje.trim();
		if (!(cw_gdjkjl_jkje.equals("")))	wheresql+=" and  (cw_gdjkjl.jkje="+cw_gdjkjl_jkje+") ";
	}
	cw_gdjkjl_jkblr=request.getParameter("cw_gdjkjl_jkblr");
	if (cw_gdjkjl_jkblr!=null)
	{
		cw_gdjkjl_jkblr=cf.GB2Uni(cw_gdjkjl_jkblr);
		if (!(cw_gdjkjl_jkblr.equals("")))	wheresql+=" and  (cw_gdjkjl.jkblr='"+cw_gdjkjl_jkblr+"')";
	}
	cw_gdjkjl_jkblsj=request.getParameter("cw_gdjkjl_jkblsj");
	if (cw_gdjkjl_jkblsj!=null)
	{
		cw_gdjkjl_jkblsj=cw_gdjkjl_jkblsj.trim();
		if (!(cw_gdjkjl_jkblsj.equals("")))	wheresql+="  and (cw_gdjkjl.jkblsj=TO_DATE('"+cw_gdjkjl_jkblsj+"','YYYY/MM/DD'))";
	}
	cw_gdjkjl_lrr=request.getParameter("cw_gdjkjl_lrr");
	if (cw_gdjkjl_lrr!=null)
	{
		cw_gdjkjl_lrr=cf.GB2Uni(cw_gdjkjl_lrr);
		if (!(cw_gdjkjl_lrr.equals("")))	wheresql+=" and  (cw_gdjkjl.lrr='"+cw_gdjkjl_lrr+"')";
	}
	cw_gdjkjl_lrsj=request.getParameter("cw_gdjkjl_lrsj");
	if (cw_gdjkjl_lrsj!=null)
	{
		cw_gdjkjl_lrsj=cw_gdjkjl_lrsj.trim();
		if (!(cw_gdjkjl_lrsj.equals("")))	wheresql+="  and (cw_gdjkjl.lrsj=TO_DATE('"+cw_gdjkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdjkjl_lrbm=request.getParameter("cw_gdjkjl_lrbm");
	if (cw_gdjkjl_lrbm!=null)
	{
		cw_gdjkjl_lrbm=cf.GB2Uni(cw_gdjkjl_lrbm);
		if (!(cw_gdjkjl_lrbm.equals("")))	wheresql+=" and  (cw_gdjkjl.lrbm='"+cw_gdjkjl_lrbm+"')";
	}
	cw_gdjkjl_gdjsjd=request.getParameter("cw_gdjkjl_gdjsjd");
	if (cw_gdjkjl_gdjsjd!=null)
	{
		cw_gdjkjl_gdjsjd=cf.GB2Uni(cw_gdjkjl_gdjsjd);
		if (!(cw_gdjkjl_gdjsjd.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjsjd='"+cw_gdjkjl_gdjsjd+"')";
	}
	cw_gdjkjl_gdjsjlh=request.getParameter("cw_gdjkjl_gdjsjlh");
	if (cw_gdjkjl_gdjsjlh!=null)
	{
		cw_gdjkjl_gdjsjlh=cf.GB2Uni(cw_gdjkjl_gdjsjlh);
		if (!(cw_gdjkjl_gdjsjlh.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjsjlh='"+cw_gdjkjl_gdjsjlh+"')";
	}
	ls_sql="SELECT cw_gdjkjl.gdjkjlh as gdjkjlh,cw_gdjkjl.khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.zjxm as crm_khxx_zjxm,sgdmc as sgd, DECODE(cw_gdjkjl.jklx,'1','生活费','2','材料款','3','中期拨款','9','其它') as cw_gdjkjl_jklx,cw_gdjkjl.jkje as cw_gdjkjl_jkje,cw_gdjkjl.jkblr as cw_gdjkjl_jkblr,cw_gdjkjl.jkblsj as cw_gdjkjl_jkblsj,cw_gdjkjl.bz as cw_gdjkjl_bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.sgd,cw_gdjkjl.gdjkjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_gdjkjlList.jsp","SelectCw_gdjkjl.jsp","","");
	pageObj.setPageRow(100);//设置每页显示记录数
//设置显示列
	String[] disColName={"sgd","crm_khxx_hth","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_zjxm","gdjkjlh","cw_gdjkjl_jklx","cw_gdjkjl_jkje","cw_gdjkjl_jkblr","cw_gdjkjl_jkblsj","cw_gdjkjl_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"gdjkjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_gdjkjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_hth","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_khxm","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_fwdz","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_sjs","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_zjxm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("crm_khxx_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] gdjkjlh = request.getParameterValues("gdjkjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gdjkjlh,"gdjkjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update cw_gdjkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"' where scbz='N' and czlx='3' and gdjsjd='0' and ("+chooseitem+")";
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">中期拨款－导入维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">施工队</td>
	<td  width="7%">合同号</td>
	<td  width="5%">客户姓名</td>
	<td  width="19%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="5%">质检</td>
	<td  width="6%">领款记录号</td>
	<td  width="6%">领款类型</td>
	<td  width="7%">领款金额</td>
	<td  width="5%">办理人</td>
	<td  width="7%">办理时间</td>
	<td  width="11%">备注</td>
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