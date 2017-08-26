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
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

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
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
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
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String spjry=null;
	String xmfl=null;
	String pjxm=null;
	String pjjgbm=null;
	spjry=request.getParameter("spjry");
	if (spjry!=null)
	{
		spjry=cf.GB2Uni(spjry);
		if (!(spjry.equals("")))	wheresql+=" and  (crm_khpjb.spjry='"+spjry+"')";
	}
	xmfl=request.getParameter("xmfl");
	if (xmfl!=null)
	{
		xmfl=cf.GB2Uni(xmfl);
		if (!(xmfl.equals("")))	wheresql+=" and  (crm_khpjb.xmfl='"+xmfl+"')";
	}
	pjxm=request.getParameter("pjxm");
	if (pjxm!=null)
	{
		pjxm=cf.GB2Uni(pjxm);
		if (!(pjxm.equals("")))	wheresql+=" and  (crm_khpjb.pjxm='"+pjxm+"')";
	}
	pjjgbm=request.getParameter("pjjgbm");
	if (pjjgbm!=null)
	{
		pjjgbm=cf.GB2Uni(pjjgbm);
		if (!(pjjgbm.equals("")))	wheresql+=" and  (crm_khpjb.pjjgbm='"+pjjgbm+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khpjb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khpjb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	String myxssl=request.getParameter("myxssl");

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}



	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,dwmc,crm_khxx.sjs,crm_khxx.zjxm,sgdmc,crm_khpjb.spjry,crm_khpjb.xmfl,crm_khpjb.pjxm,DECODE(crm_khpjb.pjjgbm,'1','<B>√</B>','2','<font color=\"#CC0000\"><B>×</B></font>','9','') ,crm_khpjb.lrsj,crm_khxx.khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,crm_khpjb ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_khxx.khbh=crm_khpjb.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.khbh,crm_khpjb.spjrybm,crm_khpjb.xmflbm,crm_khpjb.pjxmbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Crm_khpjbCxList.jsp","SelectCxCrm_khpjb.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","sbrq","hdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("spjry","1");//列参数对象加入Hash表
	spanColHash.put("xmfl","1");//列参数对象加入Hash表
	spanColHash.put("khbh","2");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询-客户评价表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">合同号</td>
	<td  width="7%">姓名</td>
	<td  width="10%">店面</td>
	<td  width="6%">设计师</td>
	<td  width="6%">工程担当</td>
	<td  width="6%">施工队</td>
	<td  width="8%">受评价人员</td>
	<td  width="10%">项目分类</td>
	<td  width="20%">评价项目</td>
	<td  width="5%">结果</td>
	<td  width="8%">录入时间</td>
	<td  width="6%">客户编号</td>
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