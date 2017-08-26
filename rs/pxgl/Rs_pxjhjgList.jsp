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
	String jhjg=null;
	String pxrs=null;
	String pxfy=null;
	String fgs=null;
	String jhzt=null;
	String lrr=null;
	String wclrr=null;
	String ssfgs=null;
	String lrsj=null;
	String wclrsj=null;
	String sjzprs=null;
	String sjzpfy=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (rs_pxjhjg.pxjhbh='"+pxjhbh+"')";
	}
	pxjhmc=request.getParameter("pxjhmc");
	if (pxjhmc!=null)
	{
		pxjhmc=cf.GB2Uni(pxjhmc);
		if (!(pxjhmc.equals("")))	wheresql+=" and  (rs_pxjh.pxjhmc='"+pxjhmc+"')";
	}
	jhjg=request.getParameter("jhjg");
	if (jhjg!=null)
	{
		jhjg=cf.GB2Uni(jhjg);
		if (!(jhjg.equals("")))	wheresql+=" and  (rs_pxjhjg.jhjg='"+jhjg+"')";
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
		if (!(fgs.equals("")))	wheresql+=" and  (rs_pxjh.fgs='"+fgs+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (rs_pxjh.jhzt='"+jhzt+"')";
	}
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
	ls_sql="SELECT rs_pxjhjg.pxjhbh pxjhbh,pxjhmc,sjpxrs,sjpxfy,pxrs,pxfy,DECODE(jhjg,'0','未完成','1','完成','2','部分完成') jhjg,rs_pxjhjg.lrr lrr,rs_pxjhjg.lrsj lrsj ";
	ls_sql+=" FROM rs_pxjhjg,rs_pxjh  ";
    ls_sql+=" where rs_pxjhjg.pxjhbh=rs_pxjh.pxjhbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_pxjhjgList.jsp","SelectRs_pxjhjg.jsp","","EditRs_pxjhjg.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pxjhbh","sjpxrs","sjpxfy","sjkssj","sjjssj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pxjhbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_pxjhjgList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] pxjhbh = request.getParameterValues("pxjhbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pxjhbh,"pxjhbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[4];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from rs_pxjhjg where "+chooseitem;
		sql[1]="update rs_pxjh set jhzt='6' where "+chooseitem;
		sql[2]="delete from rs_pxzjmx where "+chooseitem;
		sql[3]="update rs_pxjhmx set mxwc=null where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="9%">培训计划编号</td>
	<td  width="16%">培训计划名称</td>
	<td  width="10%">实际培训人数</td>
	<td  width="10%">实际培训费用</td>
	<td  width="8%">计划人数</td>
	<td  width="8%">计划费用</td>
	<td  width="8%">计划结果</td>
	<td  width="9%">录入人</td>
	<td  width="9%">录入时间</td>
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