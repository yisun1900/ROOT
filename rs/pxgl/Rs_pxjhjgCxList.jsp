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
	String pxrs=null;
	String pxfy=null;
	String fgs=null;
	String jhzt=null;
//	String jhkssj=null;
//	String jhjssj=null;
//	String sjkssj=null;
//	String sjjssj=null;
	String lrr=null;
	String wclrr=null;
	String ssfgs=null;
	String lrsj=null;
	String wclrsj=null;
	String sjpxrs=null;
	String sjpxfy=null;
	String jhjg=null;
	jhjg=request.getParameter("jhjg");
	if (jhjg!=null)
	{
		jhjg=cf.GB2Uni(jhjg);
		if (!(jhjg.equals("")))	wheresql+=" and  (rs_pxjhjg.jhjg='"+jhjg+"')";
	}

	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (rs_pxjh.pxjhbh='"+pxjhbh+"')";
	}
	pxrs=request.getParameter("pxrs");
	if (pxrs!=null)
	{
		pxrs=pxrs.trim();
		if (!(pxrs.equals("")))	wheresql+=" and (rs_pxjh.pxrs="+pxrs+") ";
	}
	pxfy=request.getParameter("pxfy");
	if (pxfy!=null)
	{
		pxfy=pxfy.trim();
		if (!(pxfy.equals("")))	wheresql+=" and  (rs_pxjh.pxfy="+pxfy+") ";
	}
	sjpxrs=request.getParameter("sjpxrs");
	if (sjpxrs!=null)
	{
		sjpxrs=sjpxrs.trim();
		if (!(sjpxrs.equals("")))	wheresql+=" and (rs_pxjhjg.sjpxrs="+sjpxrs+") ";
	}
	sjpxfy=request.getParameter("sjpxfy");
	if (sjpxfy!=null)
	{
		sjpxfy=sjpxfy.trim();
		if (!(sjpxfy.equals("")))	wheresql+=" and  (rs_pxjhjg.sjpxfy="+sjpxfy+") ";
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
//	jhkssj=request.getParameter("jhkssj");
//	if (jhkssj!=null)
//	{
//		jhkssj=jhkssj.trim();
//		if (!(jhkssj.equals("")))	wheresql+="  and (rs_pxjh.jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
//	}
//	jhkssj=request.getParameter("jhkssj2");
//	if (jhkssj!=null)
//	{
//		jhkssj=jhkssj.trim();
//		if (!(jhkssj.equals("")))	wheresql+="  and (rs_pxjh.jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
//	}
//	jhjssj=request.getParameter("jhjssj");
//	if (jhjssj!=null)
//	{
//		jhjssj=jhjssj.trim();
//		if (!(jhjssj.equals("")))	wheresql+="  and (rs_pxjh.jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
//	}
//	jhjssj=request.getParameter("jhjssj2");
//	if (jhjssj!=null)
//	{
//		jhjssj=jhjssj.trim();
//		if (!(jhjssj.equals("")))	wheresql+="  and (rs_pxjh.jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
//	}
//	sjkssj=request.getParameter("sjkssj");
//	if (sjkssj!=null)
//	{
//		sjkssj=sjkssj.trim();
//		if (!(sjkssj.equals("")))	wheresql+="  and (rs_pxjhjg.sjkssj>=TO_DATE('"+sjkssj+"','YYYY/MM/DD'))";
//	}
//	sjkssj=request.getParameter("sjkssj2");
//	if (sjkssj!=null)
//	{
//		sjkssj=sjkssj.trim();
//		if (!(sjkssj.equals("")))	wheresql+="  and (rs_pxjhjg.sjkssj<=TO_DATE('"+sjkssj+"','YYYY/MM/DD'))";
//	}
//	sjjssj=request.getParameter("sjjssj");
//	if (sjjssj!=null)
//	{
//		sjjssj=sjjssj.trim();
//		if (!(sjjssj.equals("")))	wheresql+="  and (rs_pxjhjg.sjjssj>=TO_DATE('"+sjjssj+"','YYYY/MM/DD'))";
//	}
//	sjjssj=request.getParameter("sjjssj2");
//	if (sjjssj!=null)
//	{
//		sjjssj=sjjssj.trim();
//		if (!(sjjssj.equals("")))	wheresql+="  and (rs_pxjhjg.sjjssj<=TO_DATE('"+sjjssj+"','YYYY/MM/DD'))";
//	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_pxjh.lrr='"+lrr+"')";
	}
	wclrr=request.getParameter("wclrr");
	if (wclrr!=null)
	{
		wclrr=cf.GB2Uni(wclrr);
		if (!(wclrr.equals("")))	wheresql+=" and  (rs_pxjhjg.lrr='"+wclrr+"')";
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
		if (!(lrsj.equals("")))	wheresql+="  and (rs_pxjh.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_pxjh.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_pxjhjg.lrsj>=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}
	wclrsj=request.getParameter("wclrsj2");
	if (wclrsj!=null)
	{
		wclrsj=wclrsj.trim();
		if (!(wclrsj.equals("")))	wheresql+="  and (rs_pxjhjg.lrsj<=TO_DATE('"+wclrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_pxjh.pxjhbh pxjhbh,pxjhmc,DECODE(jhjg,'0','未完成','1','完成','2','部分完成') jhjg,pxrs,sjpxrs,pxfy,sjpxfy,a.dwmc fgs,rs_pxjh.lrr lrr,rs_pxjhjg.lrr wclrr,b.dwmc ssfgs,rs_pxjh.lrsj lrsj,rs_pxjhjg.lrsj wclrsj ";
	ls_sql+=" FROM rs_pxjh,rs_pxshbm,sq_dwxx a,sq_dwxx b,rs_pxjhjg  ";
    ls_sql+=" where rs_pxshbm.shjl=rs_pxjh.shjl and a.dwbh=rs_pxjh.fgs and b.dwbh=rs_pxjh.ssfgs and rs_pxjh.jhzt='3' and rs_pxjhjg.pxjhbh=rs_pxjh.pxjhbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;


//		ls_sql="SELECT pxjhbh,pxrs,pxfy,a.dwmc fgs,jhzt,ztbm,rs_pxjh.shjlmc shjl,jhkssj,jhjssj,lrr,b.dwmc ssfgs,lrsj  ";
//	ls_sql+=" FROM rs_pxjh,sq_dwxx a,sq_dwxx b,rs_pxshbm  ";
//    ls_sql+=" where a.dwbh='"+fgs+"' and b.dwbh='"+ssfgs+"' and rs_pxshbm.shjl='"+shjl+"'";
//    ls_sql+=wheresql;
//    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Rs_pxjhjgCxList.jsp","SelectCxRs_pxjhjg.jsp","","");
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
	coluParm.link="Rs_pxzjmxCxList.jsp?";//为列参数：coluParm.link设置超级链接
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">培训计划编号</td>
	<td  width="12%">培训计划名称</td>
	<td  width="6%">计划结果</td>
	<td  width="6%">培训人数</td>
	<td  width="8%">实际培训人数</td>
	<td  width="7%">培训费用</td>
	<td  width="8%">实际培训费用</td>
	<td  width="7%">所属分公司</td>
	<td  width="5%">录入人</td>
	<td  width="7%">完成录入人</td>
	<td  width="9%">录入人分公司</td>
	<td  width="7%">录入时间</td>
	<td  width="8%">完成录入时间</td>
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