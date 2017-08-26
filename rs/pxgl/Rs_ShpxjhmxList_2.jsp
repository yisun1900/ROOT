<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String jhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String jhmc=cf.GB2Uni(request.getParameter("pxjhmc"));
String shbh=cf.GB2Uni(request.getParameter("shbh"));

%>
<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String pxjhbh=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (pxjhbh='"+pxjhbh+"')";
	}
	ls_sql="SELECT pxmxbh,DECODE(pxlx,'0','内训','1','外训') pxlx,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxrs,pxfy,gcrs,zcrs,jcrs,pxkssj,pxjssj,pxjs,pxcd,lrr,lrsj,bz  ";
	ls_sql+=" FROM rs_pxjhmx,rs_pxskxsbm,rs_pxkclxbm  ";
    ls_sql+=" where rs_pxjhmx.skxs=rs_pxskxsbm.skxs and rs_pxjhmx.kclx=rs_pxkclxbm.kclx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ShpxjhmxList.jsp","","","ViewRs_pxjhmx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
//	String[] disColName={"pxmxbh","pxlx","skxs","kclx","pxrs","pxfy","gcrs","zcrs","jcrs","pxkssj","pxjssj","pxjs","pxcd","lrr","lrsj","bz"};
//	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"pxmxbh"};
	pageObj.setKey(keyName);
//设置按钮参数
//	String[] buttonName={"删除选中的信息"};//按钮的显示名称
//	String[] buttonLink={"Rs_deleteJhmx.jsp?"};//按钮单击调用的网页，可以增加参数
//	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
//	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
//	String[] pxmxbh = request.getParameterValues("pxmxbh");
//	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pxmxbh,"pxmxbh"));
//	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
//	{
//		String[] sql=new String[1];//要执行的SQL
//		boolean needCommit=false;//不需要事务处理
//		sql[0]="delete from rs_pxjhmx where "+chooseitem;
//		pageObj.execDelete(sql,needCommit);
//	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <b><font size="3" color=black>（<%=jhmc%>:<%=jhbh%>）</font></b>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">培训明细编号</td>
	<td  width="3%">培训类型</td>
	<td  width="3%">授课形式</td>
	<td  width="4%">课程类型</td>
	<td  width="3%">培训人数</td>
	<td  width="3%">培训费用</td>
	<td  width="3%">高层人数</td>
	<td  width="3%">中层人数</td>
	<td  width="3%">基层人数</td>
	<td  width="5%">计划开始时间</td>
	<td  width="5%">计划结束时间</td>
	<td  width="5%">培训讲师</td>
	<td  width="10%">培训场地</td>
	<td  width="4%">录入人</td>
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