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
	String pxjhbh=null;
	String pxjhmc=null;
	String pxrs=null;
	String pxfy=null;
	String fgs=null;
	String jhzt=null;
	String shjl=null;
	String sfjhn=null;
//	String pxlx=null;
//	String jhkssj=null;
//	String jhjssj=null;
	String lrr=null;
	String ssfgs=null;
	String lrsj=null;
	pxjhmc=request.getParameter("pxjhmc");
	if (pxjhmc!=null)
	{
		pxjhmc=cf.GB2Uni(pxjhmc);
		if (!(pxjhmc.equals("")))	wheresql+=" and  (pxjhmc='"+pxjhmc+"')";
	}
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (pxjhbh='"+pxjhbh+"')";
	}
	pxrs=request.getParameter("pxrs");
	if (pxrs!=null)
	{
		pxrs=pxrs.trim();
		if (!(pxrs.equals("")))	wheresql+=" and (pxrs="+pxrs+") ";
	}
	pxfy=request.getParameter("pxfy");
	if (pxfy!=null)
	{
		pxfy=pxfy.trim();
		if (!(pxfy.equals("")))	wheresql+=" and  (pxfy="+pxfy+") ";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_pxjh.fgs='"+fgs+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (rs_pxjh.jhzt='"+jhzt+"')";
	}
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (rs_pxjh.shjl='"+shjl+"')";
	}
//	pxlx=request.getParameter("pxlx");
//	if (pxlx!=null)
//	{
//		pxlx=cf.GB2Uni(pxlx);
//		if (!(pxlx.equals("")))	wheresql+=" and  (pxlx='"+pxlx+"')";
//	}
	sfjhn=request.getParameter("sfjhn");
	if (sfjhn!=null)
	{
		sfjhn=cf.GB2Uni(sfjhn);
		if (!(sfjhn.equals("")))	wheresql+=" and  (sfjhn='"+sfjhn+"')";
	}
//	jhkssj=request.getParameter("jhkssj");
//	if (jhkssj!=null)
//	{
//		jhkssj=jhkssj.trim();
//		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
//	}
//	jhkssj=request.getParameter("jhkssj2");
//	if (jhkssj!=null)
//	{
//		jhkssj=jhkssj.trim();
//		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
//	}
//	jhjssj=request.getParameter("jhjssj");
//	if (jhjssj!=null)
//	{
//		jhjssj=jhjssj.trim();
//		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
//	}
//	jhjssj=request.getParameter("jhjssj2");
//	if (jhjssj!=null)
//	{
//		jhjssj=jhjssj.trim();
//		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
//	}

	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_pxjh.ssfgs='"+ssfgs+"')";
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
	ls_sql="SELECT pxjhbh,pxjhmc,pxrs,pxfy,a.dwmc fgs,DECODE(jhzt,'0','录入未完成','1','等待审批','2','审批流程中','3','培训完成','4','审批未通过','5','修改计划','6','审核完成'),rs_ztbm.ztmc ztbm,rs_pxshbm.shjlmc shjl,DECODE(sfjhn,'0','计划内','1','计划外'),lrr,b.dwmc ssfgs,lrsj,rs_pxjh.bz  ";
	ls_sql+=" FROM rs_pxjh,rs_pxshbm,sq_dwxx a,sq_dwxx b,rs_ztbm  ";
    ls_sql+=" where rs_pxshbm.shjl=rs_pxjh.shjl and a.dwbh=rs_pxjh.fgs and b.dwbh=rs_pxjh.ssfgs and rs_ztbm.ztbm=rs_pxjh.ztbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;


//进行对象初始化
	pageObj.initPage("Rs_pxjhCxList.jsp","SelectCxRs_pxjh.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pxjhbh","pxrs","pxfy","fgs","jhzt","ztbm","shjl","jhkssj","jhjssj","lrr","ssfgs","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pxjhbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"pxjhbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="viewpxjhmx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("pxjhbh",coluParm);//列参数对象加入Hash表
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">培训计划编号</td>
	<td  width="12%">计划培训名称</td>
	<td  width="5%">培训人数</td>
	<td  width="5%">培训费用</td>
	<td  width="6%">所属分公司</td>
	<td  width="5%">计划状态</td>
	<td  width="10%">状态编码</td>
	<td  width="5%">审核结论</td>
	<td  width="6%">是否计划内</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入人分公司</td>
	<td  width="6%">录入时间</td>
	<td  width="21%">备注</td>
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