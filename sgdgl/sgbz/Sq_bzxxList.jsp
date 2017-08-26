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
	String sq_bzxx_bzmc=null;
	String sgd=null;
	String sq_bzxx_xb=null;
	String sq_bzxx_dh=null;
	String sq_bzxx_zz=null;
	String sq_bzxx_sfzh=null;
	String sq_bzxx_bz=null;

	String rzsj=null;
	rzsj=request.getParameter("rzsj");
	if (rzsj!=null)
	{
		rzsj=cf.GB2Uni(rzsj);
		if (!(rzsj.equals("")))	wheresql+="  and (sq_bzxx.rzsj>=TO_DATE('"+rzsj+"','YYYY-MM-DD'))";
	}
	rzsj=request.getParameter("rzsj2");
	if (rzsj!=null)
	{
		rzsj=cf.GB2Uni(rzsj);
		if (!(rzsj.equals("")))	wheresql+="  and (sq_bzxx.rzsj<=TO_DATE('"+rzsj+"','YYYY-MM-DD'))";
	}
	String lzsj=null;
	lzsj=request.getParameter("lzsj");
	if (lzsj!=null)
	{
		lzsj=cf.GB2Uni(lzsj);
		if (!(lzsj.equals("")))	wheresql+="  and (sq_bzxx.lzsj>=TO_DATE('"+lzsj+"','YYYY-MM-DD'))";
	}
	lzsj=request.getParameter("lzsj2");
	if (lzsj!=null)
	{
		lzsj=cf.GB2Uni(lzsj);
		if (!(lzsj.equals("")))	wheresql+="  and (sq_bzxx.lzsj<=TO_DATE('"+lzsj+"','YYYY-MM-DD'))";
	}


	String tdbz=null;
	tdbz=request.getParameter("tdbz");
	if (tdbz!=null)
	{
		tdbz=cf.GB2Uni(tdbz);
		if (!(tdbz.equals("")))	wheresql+=" and  (sq_bzxx.tdbz='"+tdbz+"')";
	}

	String sfqldht=null;
	sfqldht=request.getParameter("sfqldht");
	if (sfqldht!=null)
	{
		if (!(sfqldht.equals("")))	wheresql+=" and  (sq_bzxx.sfqldht='"+sfqldht+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_sgd.ssfgs='"+fgs+"')";

	sq_bzxx_bzmc=request.getParameter("sq_bzxx_bzmc");
	if (sq_bzxx_bzmc!=null)
	{
		sq_bzxx_bzmc=cf.GB2Uni(sq_bzxx_bzmc);
		if (!(sq_bzxx_bzmc.equals("")))	wheresql+=" and  (sq_bzxx.bzmc='"+sq_bzxx_bzmc+"')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (sq_bzxx.sgd='"+sgd+"')";
	}
	sq_bzxx_xb=request.getParameter("sq_bzxx_xb");
	if (sq_bzxx_xb!=null)
	{
		sq_bzxx_xb=cf.GB2Uni(sq_bzxx_xb);
		if (!(sq_bzxx_xb.equals("")))	wheresql+=" and  (sq_bzxx.xb='"+sq_bzxx_xb+"')";
	}
	sq_bzxx_dh=request.getParameter("sq_bzxx_dh");
	if (sq_bzxx_dh!=null)
	{
		sq_bzxx_dh=cf.GB2Uni(sq_bzxx_dh);
		if (!(sq_bzxx_dh.equals("")))	wheresql+=" and  (sq_bzxx.dh='"+sq_bzxx_dh+"')";
	}
	sq_bzxx_zz=request.getParameter("sq_bzxx_zz");
	if (sq_bzxx_zz!=null)
	{
		sq_bzxx_zz=cf.GB2Uni(sq_bzxx_zz);
		if (!(sq_bzxx_zz.equals("")))	wheresql+=" and  (sq_bzxx.zz='"+sq_bzxx_zz+"')";
	}
	sq_bzxx_sfzh=request.getParameter("sq_bzxx_sfzh");
	if (sq_bzxx_sfzh!=null)
	{
		sq_bzxx_sfzh=cf.GB2Uni(sq_bzxx_sfzh);
		if (!(sq_bzxx_sfzh.equals("")))	wheresql+=" and  (sq_bzxx.sfzh='"+sq_bzxx_sfzh+"')";
	}
	sq_bzxx_bz=request.getParameter("sq_bzxx_bz");
	if (sq_bzxx_bz!=null)
	{
		sq_bzxx_bz=cf.GB2Uni(sq_bzxx_bz);
		if (!(sq_bzxx_bz.equals("")))	wheresql+=" and  (sq_bzxx.bz='"+sq_bzxx_bz+"')";
	}
	ls_sql="SELECT sq_bzxx.bzmc, DECODE(sq_bzxx.xb,'M','男','W','女') xb,sgdjbmc,grsl,yygrsl,kygrsl,DECODE(sq_bzxx.tdbz,'Y','停单','N','正常','K','开除','L','离职') tdbz,sq_bzxx.rzsj,sq_bzxx.lzsj,sq_bzxx.dh,sq_bzxx.sgd,sq_sgd.sgdmc,dwmc,DECODE(sq_bzxx.sfqldht,'N','<font color=\"#FF0000\">否</font>','Y','是') sfqldht,sq_bzxx.khmyd||'%' khmyd,sq_bzxx.mqzsgds,sq_bzxx.zxzsgds,sq_bzxx.zdzsgds,sq_bzxx.kjdzxz,sq_bzxx.kjdzdz,sq_bzxx.zz,sq_bzxx.sfzh,sq_bzxx.jjlxr,sq_bzxx.jjlxrdh,sq_bzxx.jjlxrdz,sq_bzxx.bz  ";
	ls_sql+=" FROM sq_sgd,sq_bzxx,sq_dwxx,sq_sgdjbbm  ";
    ls_sql+=" where sq_bzxx.sgd=sq_sgd.sgd(+) and sq_sgd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=" and sq_bzxx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_sgd.ssfgs,sq_sgd.sgdmc,bzmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_bzxxList.jsp","SelectSq_bzxx.jsp","","EditSq_bzxx.jsp");
	pageObj.setPageRow(20);//设置每页显示记录数
//设置显示列
	String[] disColName={"bzmc","sgdjbmc","grsl","yygrsl","kygrsl","tdbz","xb","dh","sgdmc","rzsj","lzsj","dwmc","sfqldht","khmyd","mqzsgds","zxzsgds","zdzsgds","kjdzxz","kjdzdz","zz","sfzh","jjlxr","jjlxrdh","jjlxrdz","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"bzmc","sgd"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSq_bzxx.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

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
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">班长</td>
	<td  width="3%">级别</td>
	<td  width="2%">工人数量</td>
	<td  width="2%">已用工人数量</td>
	<td  width="2%">可用工人数量</td>
	<td  width="2%">状态</td>
	<td  width="2%">性别</td>
	<td  width="9%">电话</td>
	<td  width="3%">施工队</td>
	<td  width="4%">入职时间</td>
	<td  width="4%">离职时间</td>
	<td  width="5%">所属分公司</td>
	<td  width="2%">签劳动合同</td>
	<td  width="3%">客户满意度</td>
	<td  width="3%">目前在施工地</td>
	<td  width="3%">最小在施工地</td>
	<td  width="3%">最大在施工地</td>
	<td  width="4%">可接单最小值</td>
	<td  width="4%">可接单最大值</td>
	<td  width="6%">住址</td>
	<td  width="6%">身份证号</td>
	<td  width="3%">紧急联系人</td>
	<td  width="7%">联系人电话</td>
	<td  width="6%">紧急联系人地址</td>
	<td  width="9%">备注</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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