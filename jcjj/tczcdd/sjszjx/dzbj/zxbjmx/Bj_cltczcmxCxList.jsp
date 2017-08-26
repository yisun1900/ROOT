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
	String cpbm=null;
	String cpmc=null;
	String dqbm=null;
	String jgwzbm=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String gysmc=null;

	String zjxxh=request.getParameter("zjxxh");
	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String lx=cf.GB2Uni(request.getParameter("lx"));

	String tcmc=null;
	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (tcmc like '%"+tcmc+"%')";
	}

	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+=" and  (cpbm='"+cpbm+"')";
	}
	cpmc=request.getParameter("cpmc");
	if (cpmc!=null)
	{
		cpmc=cf.GB2Uni(cpmc);
		if (!(cpmc.equals("")))	wheresql+=" and  (cpmc like '%"+cpmc+"%')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_cltczcmx.dqbm='"+dqbm+"')";
	}
	jgwzbm=request.getParameter("jgwzbm");
	if (jgwzbm!=null)
	{
		jgwzbm=cf.GB2Uni(jgwzbm);
		if (!(jgwzbm.equals("")))	wheresql+=" and  (jgwzbm='"+jgwzbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (xh='"+xh+"')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (gg='"+gg+"')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (ppmc='"+ppmc+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc='"+gysmc+"')";
	}

	ls_sql="SELECT cpbm,cpmc,xh,gg,ppmc,jldw,bz  ";
	ls_sql+=" FROM bj_cltczcmx  ";
    ls_sql+=" where cpbm not in(select cpbm from bj_khcltcmxh where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+jgwzbm+"')";
    ls_sql+=wheresql;
    ls_sql+=" order by cpmc,xh";
    pageObj.sql=ls_sql;

//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Bj_cltczcmxCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"选择型号"};//按钮的显示名称
	String[] buttonLink={"SaveInsertBj_khcltcmx.jsp?zjxxh="+zjxxh+"&khbh="+khbh+"&tcmc="+tcmc+"&jgwzbm="+jgwzbm+"&lx="+lx};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="10%">产品编码</td>
	<td  width="18%">产品名称</td>
	<td  width="18%">型号</td>
	<td  width="18%">规格</td>
	<td  width="12%">品牌</td>
	<td  width="6%">计量单位</td>
	<td  width="133%">备注</td>
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