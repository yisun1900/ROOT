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
	String fgs=null;
	String jhzt=null;
	String shjl=null;
	String jhkssj=null;
	String jhjssj=null;
	String lrr=null;
	String ssfgs=null;
	String lrsj=null;
	zpjhbh=request.getParameter("zpjhbh");
	if (zpjhbh!=null)
	{
		zpjhbh=cf.GB2Uni(zpjhbh);
		if (!(zpjhbh.equals("")))	wheresql+=" and  (zpjhbh='"+zpjhbh+"')";
	}
	zprs=request.getParameter("zprs");
	if (zprs!=null)
	{
		zprs=zprs.trim();
		if (!(zprs.equals("")))	wheresql+=" and (zprs="+zprs+") ";
	}
	zpfy=request.getParameter("zpfy");
	if (zpfy!=null)
	{
		zpfy=zpfy.trim();
		if (!(zpfy.equals("")))	wheresql+=" and  (zpfy="+zpfy+") ";
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
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (rs_zpjh.shjl='"+shjl+"')";
	}
	jhkssj=request.getParameter("jhkssj");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhkssj=request.getParameter("jhkssj2");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj2");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}

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
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_zpjh.ssfgs='"+ssfgs+"')";
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
	ls_sql="SELECT zpjhbh,zprs,zpfy,a.dwmc fgs,DECODE(jhzt,'0','录入未完成','1','等待审批','2','审批流程中','3','招聘完成','4','审批未通过','5','修改计划'),rs_ztbm.ztmc ztbm,rs_zpshbm.shjlmc shjl,jhkssj,jhjssj,lrr,b.dwmc ssfgs,lrsj,rs_zpjh.bz  ";
	ls_sql+=" FROM rs_zpjh,rs_zpshbm,sq_dwxx a,sq_dwxx b,rs_ztbm  ";
    ls_sql+=" where rs_zpshbm.shjl=rs_zpjh.shjl and a.dwbh=rs_zpjh.fgs and b.dwbh=rs_zpjh.ssfgs and rs_ztbm.ztbm=rs_zpjh.ztbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_zpjhList.jsp","SelectRs_zpjh.jsp","","EditRs_zpjh.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zpjhbh","zprs","zpfy","fgs","jhzt","ztbm","shjl","jhkssj","jhjssj","lrr","ssfgs","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zpjhbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_zpjhList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] zpjhbh = request.getParameterValues("zpjhbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zpjhbh,"zpjhbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from rs_zpjh where "+chooseitem;
		sql[1]="delete from rs_zpjhmx where "+chooseitem;
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">招聘计划编号</td>
	<td  width="5%">招聘人数</td>
	<td  width="6%">招聘费用</td>
	<td  width="7%">所属分公司</td>
	<td  width="6%">计划状态</td>
	<td  width="7%">状态编码</td>
	<td  width="6%">审核结论</td>
	<td  width="8%">计划开始时间</td>
	<td  width="8%">计划结束时间</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入人分公司</td>
	<td  width="7%">录入时间</td>
	<td  width="10%">备注</td>
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