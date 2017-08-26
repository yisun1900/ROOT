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
	String xh=null;
	String gysbm=null;
	String lxrxm=null;
	String zw=null;
	String sj=null;
	String bgdh=null;
	String cz=null;
	String sflz=null;
	String bz=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (jxc_gyslxr.xh="+xh+") ";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (jxc_gyslxr.gysbm="+gysbm+") ";
	}
	lxrxm=request.getParameter("lxrxm");
	if (lxrxm!=null)
	{
		lxrxm=cf.GB2Uni(lxrxm);
		if (!(lxrxm.equals("")))	wheresql+=" and  (jxc_gyslxr.lxrxm='"+lxrxm+"')";
	}
	zw=request.getParameter("zw");
	if (zw!=null)
	{
		zw=cf.GB2Uni(zw);
		if (!(zw.equals("")))	wheresql+=" and  (jxc_gyslxr.zw='"+zw+"')";
	}
	sj=request.getParameter("sj");
	if (sj!=null)
	{
		sj=cf.GB2Uni(sj);
		if (!(sj.equals("")))	wheresql+=" and  (jxc_gyslxr.sj='"+sj+"')";
	}
	bgdh=request.getParameter("bgdh");
	if (bgdh!=null)
	{
		bgdh=cf.GB2Uni(bgdh);
		if (!(bgdh.equals("")))	wheresql+=" and  (jxc_gyslxr.bgdh='"+bgdh+"')";
	}
	cz=request.getParameter("cz");
	if (cz!=null)
	{
		cz=cf.GB2Uni(cz);
		if (!(cz.equals("")))	wheresql+=" and  (jxc_gyslxr.cz='"+cz+"')";
	}
	sflz=request.getParameter("sflz");
	if (sflz!=null)
	{
		sflz=cf.GB2Uni(sflz);
		if (!(sflz.equals("")))	wheresql+=" and  (jxc_gyslxr.sflz='"+sflz+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_gyslxr.bz='"+bz+"')";
	}
	ls_sql="SELECT xh,gysmc,lxrxm,zw,sj,bgdh,cz,DECODE(sflz,'Y','离职','N','在职') sflz,jxc_gyslxr.bz  ";
	ls_sql+=" FROM jxc_gyslxr,jxc_gysxx  ";
    ls_sql+=" where jxc_gyslxr.gysbm=jxc_gysxx.gysbm";
    ls_sql+=wheresql;
	ls_sql+=" order by gysmc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_gyslxrList.jsp","","","EditJxc_gyslxr.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","gysbm","lxrxm","zw","sj","bgdh","cz","sflz","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_gyslxrList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_gyslxr where "+chooseitem;
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
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">序号</td>
	<td  width="15%">供应商</td>
	<td  width="5%">联系人姓名</td>
	<td  width="10%">职务</td>
	<td  width="15%">手机</td>
	<td  width="15%">办公电话</td>
	<td  width="12%">传真</td>
	<td  width="3%">是否离职</td>
	<td  width="18%">备注</td>
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