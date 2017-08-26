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
	String kpjlh=null;
	String qssj=null;
	String jzsj=null;
	String lrr=null;
	String lrsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and (kp_kpjl.fgs='"+fgs+"') ";
	}

	kpjlh=request.getParameter("kpjlh");
	if (kpjlh!=null)
	{
		kpjlh=kpjlh.trim();
		if (!(kpjlh.equals("")))	wheresql+=" and (kp_kpjl.kpjlh="+kpjlh+") ";
	}
	qssj=request.getParameter("qssj");
	if (qssj!=null)
	{
		qssj=qssj.trim();
		if (!(qssj.equals("")))	wheresql+="  and (kp_kpjl.qssj=TO_DATE('"+qssj+"','YYYY/MM/DD'))";
	}
	jzsj=request.getParameter("jzsj");
	if (jzsj!=null)
	{
		jzsj=jzsj.trim();
		if (!(jzsj.equals("")))	wheresql+="  and (kp_kpjl.jzsj=TO_DATE('"+jzsj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (kp_kpjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (kp_kpjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (kp_kpjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT kpjlh,dwmc,qssj,jzsj,lrr,lrsj,kp_kpjl.bz  ";
	ls_sql+=" FROM kp_kpjl,sq_dwxx  ";
    ls_sql+=" where (kp_kpjl.fgs=sq_dwxx.dwbh(+))";
    ls_sql+=wheresql;
    ls_sql+=" order by kpjlh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_kpjlList.jsp","SelectKp_kpjl.jsp","","Kp_yzfsgdkpjgList.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kpjlh","qssj","jzsj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kpjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteKp_kpjlList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"kpjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="Kp_yzfsgdkpjgCxList.jsp";//为列参数：coluParm.link设置超级链接
//	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("kpjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] kpjlh = request.getParameterValues("kpjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kpjlh,"kpjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[6];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from kp_sgdkpjg where "+chooseitem;
		sql[1]="delete from kp_sgdpfb where "+chooseitem;
		sql[2]="delete from kp_kpcftj where "+chooseitem;
		sql[3]="delete from kp_kpkftj where "+chooseitem;
		sql[4]="delete from kp_gdpfb where "+chooseitem;
		sql[5]="delete from kp_kpjl where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="8%">考评记录号</td>
	<td  width="10%">分公司</td>
	<td  width="14%">考评起始时间</td>
	<td  width="14%">考评截止时间</td>
	<td  width="8%">录入人</td>
	<td  width="14%">录入时间</td>
	<td  width="14%">备注</td>
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