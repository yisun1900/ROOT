<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbhs=(String)session.getAttribute("ssfgs");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String rkph=null;
	String dwbh=null;
	String gysmc=null;
	String rkr=null;
	String rksj=null;
	String rkzsl=null;
	String rkzje=null;
	String rkzt=null;
	String lrr=null;
	String lrsj=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_rkd.dwbh='"+fgs+"')";
	rkph=request.getParameter("rkph");
	if (rkph!=null)
	{
		rkph=cf.GB2Uni(rkph);
		if (!(rkph.equals("")))	wheresql+=" and  (rkph='"+rkph+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cl_rkd.dwbh='"+dwbh+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc='"+gysmc+"')";
	}
	rkr=request.getParameter("rkr");
	if (rkr!=null)
	{
		rkr=cf.GB2Uni(rkr);
		if (!(rkr.equals("")))	wheresql+=" and  (rkr='"+rkr+"')";
	}
	rksj=request.getParameter("rksj");
	if (rksj!=null)
	{
		rksj=rksj.trim();
		if (!(rksj.equals("")))	wheresql+="  and (rksj>=TO_DATE('"+rksj+"','YYYY/MM/DD'))";
	}
	rksj=request.getParameter("rksj2");
	if (rksj!=null)
	{
		rksj=rksj.trim();
		if (!(rksj.equals("")))	wheresql+="  and (rksj<=TO_DATE('"+rksj+"','YYYY/MM/DD'))";
	}
	rkzsl=request.getParameter("rkzsl");
	if (rkzsl!=null)
	{
		rkzsl=rkzsl.trim();
		if (!(rkzsl.equals("")))	wheresql+=" and  (rkzsl>="+rkzsl+") ";
	}
	rkzsl=request.getParameter("rkzsl2");
	if (rkzsl!=null)
	{
		rkzsl=rkzsl.trim();
		if (!(rkzsl.equals("")))	wheresql+=" and  (rkzsl<="+rkzsl+") ";
	}
	rkzje=request.getParameter("rkzje");
	if (rkzje!=null)
	{
		rkzje=rkzje.trim();
		if (!(rkzje.equals("")))	wheresql+=" and  (rkzje>="+rkzje+") ";
	}
	rkzje=request.getParameter("rkzje2");
	if (rkzje!=null)
	{
		rkzje=rkzje.trim();
		if (!(rkzje.equals("")))	wheresql+=" and  (rkzje<="+rkzje+") ";
	}
	rkzt=request.getParameter("rkzt");
	if (rkzt!=null)
	{
		rkzt=cf.GB2Uni(rkzt);
		if (!(rkzt.equals("")))	wheresql+=" and  (rkzt='"+rkzt+"')";
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
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT rkph,dwmc,gysmc,rkr,rksj,rkzsl,rkzje,DECODE(rkzt,'1','未提交','2','已提交','3','已审核'),sgph,shr,shsj,shyj,lrr,lrsj,cl_rkd.bz  ";
	ls_sql+=" FROM cl_rkd,sq_dwxx  ";
    ls_sql+=" where cl_rkd.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_rkdXgShList.jsp","SelectXgShCl_rkd.jsp","","XgShCl_rkd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"rkph","dwbh","gysmc","rkr","rksj","rkzsl","rkzje","rkzt","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"rkph"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除审核"};//按钮的显示名称
	String[] buttonLink={"Cl_rkdXgShList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"rkph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="viewrkmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("rkph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] rkph = request.getParameterValues("rkph");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(rkph,"rkph"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update cl_rkd set rkzt='2',shr=null,shsj=null,shyj=null where rkzt='3' and "+chooseitem;
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
  <B><font size="3">修改审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">入库批号</td>
	<td  width="6%">入库单位</td>
	<td  width="6%">供应商</td>
	<td  width="3%">入库人</td>
	<td  width="5%">入库时间</td>
	<td  width="5%">入库总数量</td>
	<td  width="7%">入库总金额</td>
	<td  width="4%">入库状态</td>
	<td  width="5%">申购批号</td>
	<td  width="3%">审核人</td>
	<td  width="5%">审核时间</td>
	<td  width="17%">审核意见</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="17%">备注</td>
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