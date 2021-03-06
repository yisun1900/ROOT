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
	String pdph=null;
	String dqbm=null;
	String ckbh=null;
	String pdzt=null;
	String pdr=null;
	String pdrssbm=null;
	String pdrssfgs=null;
	String pdsj=null;
	String bz=null;
	pdph=request.getParameter("pdph");
	if (pdph!=null)
	{
		pdph=pdph.trim();
		if (!(pdph.equals("")))	wheresql+=" and (jxc_kcpdjl.pdph="+pdph+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_kcpdjl.dqbm='"+dqbm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_kcpdjl.ckbh='"+ckbh+"')";
	}
	pdzt=request.getParameter("pdzt");
	if (pdzt!=null)
	{
		pdzt=cf.GB2Uni(pdzt);
		if (!(pdzt.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdzt='"+pdzt+"')";
	}
	pdr=request.getParameter("pdr");
	if (pdr!=null)
	{
		pdr=cf.GB2Uni(pdr);
		if (!(pdr.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdr='"+pdr+"')";
	}
	pdrssbm=request.getParameter("pdrssbm");
	if (pdrssbm!=null)
	{
		pdrssbm=cf.GB2Uni(pdrssbm);
		if (!(pdrssbm.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdrssbm='"+pdrssbm+"')";
	}
	pdrssfgs=request.getParameter("pdrssfgs");
	if (pdrssfgs!=null)
	{
		pdrssfgs=cf.GB2Uni(pdrssfgs);
		if (!(pdrssfgs.equals("")))	wheresql+=" and  (jxc_kcpdjl.pdrssfgs='"+pdrssfgs+"')";
	}
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		pdsj=pdsj.trim();
		if (!(pdsj.equals("")))	wheresql+="  and (jxc_kcpdjl.pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		pdsj=pdsj.trim();
		if (!(pdsj.equals("")))	wheresql+="  and (jxc_kcpdjl.pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_kcpdjl.bz='"+bz+"')";
	}
	ls_sql=" select pdph,dm_dqbm.dqmc dqbm,ckmc ckbh,DECODE(pdzt,'1','正在盘点','2','盘点结束') pdzt,pdr,a.dwmc pdrssbm,b.dwmc pdrssfgs,pdsj,jxc_kcpdjl.bz bz ";
	ls_sql+=" from jxc_kcpdjl,dm_dqbm,jxc_ckmc,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where jxc_kcpdjl.dqbm=dm_dqbm.dqbm and jxc_kcpdjl.ckbh=jxc_ckmc.ckbh and jxc_kcpdjl.pdrssbm=a.dwbh and  jxc_kcpdjl.pdrssfgs=b.dwbh ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_kcpdjlList.jsp","SelectJxc_kcpdjl.jsp","ViewJxc_kcpdjl.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pdph","dqbm","ckbh","pdzt","pdr","pdrssbm","pdrssfgs","pdsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pdph"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_kcpdjlList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] pdph = request.getParameterValues("pdph");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pdph,"pdph"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_kcpdjl where "+chooseitem;
		sql[1]="delete from jxc_kcpdmx where "+chooseitem;
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
	<td  width="6%">&nbsp;</td>
	<td  width="6%">批号</td>
	<td  width="9%">地区</td>
	<td  width="9%">仓库</td>
	<td  width="8%">盘点状态</td>
	<td  width="7%">盘点人</td>
	<td  width="6%">盘点人所属部门</td>
	<td  width="6%">盘点人所属分公司</td>
	<td  width="9%">盘点时间</td>
	<td  width="9%">备注</td>
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