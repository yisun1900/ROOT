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
	String zpjhbh=null;
	String zprs=null;
	String zpfy=null;
	String sjzprs=null;
	String sjzpfy=null;
	String fgs=null;
	String jhzt=null;
	String jhkssj=null;
	String jhjssj=null;
	String sjkssj=null;
	String sjjssj=null;
	String lrr=null;
	String wclrr=null;
	String ssfgs=null;
	String lrsj=null;
	String wclrsj=null;

	zpjhbh=request.getParameter("zpjhbh");
	if (zpjhbh!=null)
	{
		zpjhbh=cf.GB2Uni(zpjhbh);
		if (!(zpjhbh.equals("")))	wheresql+=" and  (rs_zpjh.zpjhbh='"+zpjhbh+"')";
	}
	zprs=request.getParameter("zprs");
	if (zprs!=null)
	{
		zprs=zprs.trim();
		if (!(zprs.equals("")))	wheresql+=" and (rs_zpjh.zprs="+zprs+") ";
	}
	zpfy=request.getParameter("zpfy");
	if (zpfy!=null)
	{
		zpfy=zpfy.trim();
		if (!(zpfy.equals("")))	wheresql+=" and  (rs_zpjh.zpfy="+zpfy+") ";
	}
	sjzprs=request.getParameter("sjzprs");
	if (sjzprs!=null)
	{
		sjzprs=sjzprs.trim();
		if (!(sjzprs.equals("")))	wheresql+=" and (rs_zpjhjg.sjzprs="+sjzprs+") ";
	}
	sjzpfy=request.getParameter("sjzpfy");
	if (sjzpfy!=null)
	{
		sjzpfy=sjzpfy.trim();
		if (!(sjzpfy.equals("")))	wheresql+=" and  (rs_zpjhjg.sjzpfy="+sjzpfy+") ";
	}

	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_zpjh.fgs='"+fgs+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (rs_zpjh.jhzt='"+jhzt+"')";
	}
	jhkssj=request.getParameter("jhkssj");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (rs_zpjh.jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhkssj=request.getParameter("jhkssj2");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (rs_zpjh.jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (rs_zpjh.jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj2");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (rs_zpjh.jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	sjkssj=request.getParameter("sjkssj");
	if (sjkssj!=null)
	{
		sjkssj=sjkssj.trim();
		if (!(sjkssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjkssj>=TO_DATE('"+sjkssj+"','YYYY/MM/DD'))";
	}
	sjkssj=request.getParameter("sjkssj2");
	if (sjkssj!=null)
	{
		sjkssj=sjkssj.trim();
		if (!(sjkssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjkssj<=TO_DATE('"+sjkssj+"','YYYY/MM/DD'))";
	}
	sjjssj=request.getParameter("sjjssj");
	if (sjjssj!=null)
	{
		sjjssj=sjjssj.trim();
		if (!(sjjssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjjssj>=TO_DATE('"+sjjssj+"','YYYY/MM/DD'))";
	}
	sjjssj=request.getParameter("sjjssj2");
	if (sjjssj!=null)
	{
		sjjssj=sjjssj.trim();
		if (!(sjjssj.equals("")))	wheresql+="  and (rs_zpjhjg.sjjssj<=TO_DATE('"+sjjssj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_zpjh.lrr='"+lrr+"')";
	}
	wclrr=request.getParameter("wclrr");
	if (wclrr!=null)
	{
		wclrr=cf.GB2Uni(wclrr);
		if (!(wclrr.equals("")))	wheresql+=" and  (rs_zpjhjg.lrr='"+wclrr+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_zpjh.ssfgs='"+ssfgs+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpjh.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpjh.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_zpjhjg.lrsj>=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj2");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_zpjhjg.lrsj<=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_zpjh.zpjhbh zpjhbh,zprs,sjzprs,zpfy,sjzpfy,a.dwmc fgs,jhkssj,sjkssj,jhjssj,sjjssj,rs_zpjh.lrr lrr,rs_zpjhjg.lrr wclrr,b.dwmc ssfgs,rs_zpjh.lrsj lrsj,rs_zpjhjg.lrsj wclrsj ";
	ls_sql+=" FROM rs_zpjh,rs_zpshbm,sq_dwxx a,sq_dwxx b,rs_zpjhjg  ";
    ls_sql+=" where rs_zpshbm.shjl=rs_zpjh.shjl and a.dwbh=rs_zpjh.fgs and b.dwbh=rs_zpjh.ssfgs and rs_zpjh.jhzt='3' and rs_zpjhjg.zpjhbh=rs_zpjh.zpjhbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;


//		ls_sql="SELECT zpjhbh,zprs,zpfy,a.dwmc fgs,jhzt,ztbm,rs_zpjh.shjlmc shjl,jhkssj,jhjssj,lrr,b.dwmc ssfgs,lrsj  ";
//	ls_sql+=" FROM rs_zpjh,sq_dwxx a,sq_dwxx b,rs_zpshbm  ";
//    ls_sql+=" where a.dwbh='"+fgs+"' and b.dwbh='"+ssfgs+"' and rs_zpshbm.shjl='"+shjl+"'";
//    ls_sql+=wheresql;
//    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Rs_zpjhjgCxList.jsp","SelectCxRs_zpjhjg.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zpjhbh","zprs","zpfy","fgs","jhzt","ztbm","shjl","jhkssj","jhjssj","lrr","ssfgs","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zpjhbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"zpjhbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="viewzpjhmx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zpjhbh",coluParm);//列参数对象加入Hash表
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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">招聘计划编号</td>
	<td  width="5%">招聘人数</td>
	<td  width="6%">实际招聘人数</td>
	<td  width="6%">招聘费用</td>
	<td  width="7%">实际招聘费用</td>
	<td  width="7%">所属分公司</td>
	<td  width="7%">计划开始时间</td>
	<td  width="8%">实际计划开始时间</td>
	<td  width="7%">计划结束时间</td>
	<td  width="8%">实际计划结束时间</td>
	<td  width="6%">录入人</td>
	<td  width="6%">结果录入人</td>
	<td  width="7%">录入人分公司</td>
	<td  width="6%">录入时间</td>
	<td  width="7%">结果录入时间</td>
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