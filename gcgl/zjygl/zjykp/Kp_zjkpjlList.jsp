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
	String kpfgs=null;
	kpjlh=request.getParameter("kpjlh");
	if (kpjlh!=null)
	{
		kpjlh=kpjlh.trim();
		if (!(kpjlh.equals("")))	wheresql+=" and (kpjlh="+kpjlh+") ";
	}
	qssj=request.getParameter("qssj");
	if (qssj!=null)
	{
		qssj=qssj.trim();
		if (!(qssj.equals("")))	wheresql+="  and (qssj=TO_DATE('"+qssj+"','YYYY/MM/DD'))";
	}
	jzsj=request.getParameter("jzsj");
	if (jzsj!=null)
	{
		jzsj=jzsj.trim();
		if (!(jzsj.equals("")))	wheresql+="  and (jzsj=TO_DATE('"+jzsj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	kpfgs=request.getParameter("kpfgs");
	if (kpfgs!=null)
	{
		kpfgs=cf.GB2Uni(kpfgs);
		if (!(kpfgs.equals("")))	wheresql+=" and  (kpfgs='"+kpfgs+"')";
	}
	ls_sql="SELECT kp_zjkpjl.kpjlh,kp_zjkpjl.qssj,kp_zjkpjl.jzsj,kp_zjkpjl.lrr,kp_zjkpjl.lrsj,dwmc,kp_zjkpjl.bz  ";
	ls_sql+=" FROM kp_zjkpjl,sq_dwxx  ";
    ls_sql+=" where kp_zjkpjl.kpfgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_zjkpjl.kpjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_zjkpjlList.jsp","SelectKp_zjkpjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kpjlh","qssj","jzsj","lrr","lrsj","bz","kpfgs"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kpjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_zjkpjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"kpjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="Kp_zjpfbCxList.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("kpjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
/*
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] kpjlh = request.getParameterValues("kpjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kpjlh,"kpjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from kp_zjpfb where "+chooseitem;
		sql[1]="delete from kp_zjkpjl where "+chooseitem;
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
	<td  width="10%">考评记录号</td>
	<td  width="11%">考评起始时间</td>
	<td  width="11%">考评截止时间</td>
	<td  width="10%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="18%">考评分公司</td>
	<td  width="24%">备注</td>
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