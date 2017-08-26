<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ppbm=null;
	String ppmc=null;
	String gysbm=null;
	String gysmc=null;

	String fgs=null;
	fgs=request.getParameter("ssfgs");
	if (!(fgs.equals("")))	wheresql+=" and  (jxc_ppgysdzb.ssfgs='"+fgs+"')";
	
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=ppbm.trim();
		if (!(ppbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.ppbm="+ppbm+") ";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.ppmc like '%"+ppmc+"%')";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.gysbm="+gysbm+") ";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.gysmc like '%"+gysmc+"%')";
	}

	String yhdlm=null;
	String yhkl=null;
	String yhmc=null;
	String kdlxtbz=null;
	String lxdlsbcs=null;
	String mmxgsj=null;
	String mmsyzq=null;
	String yxdlsbcs=null;
	String sfsd=null;
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (yhdlm='"+yhdlm+"')";
	}
	yhkl=request.getParameter("yhkl");
	if (yhkl!=null)
	{
		yhkl=cf.GB2Uni(yhkl);
		if (!(yhkl.equals("")))	wheresql+=" and  (yhkl='"+yhkl+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (yhmc='"+yhmc+"')";
	}
	kdlxtbz=request.getParameter("kdlxtbz");
	if (kdlxtbz!=null)
	{
		kdlxtbz=cf.GB2Uni(kdlxtbz);
		if (!(kdlxtbz.equals("")))	wheresql+=" and  (kdlxtbz='"+kdlxtbz+"')";
	}
	lxdlsbcs=request.getParameter("lxdlsbcs");
	if (lxdlsbcs!=null)
	{
		lxdlsbcs=lxdlsbcs.trim();
		if (!(lxdlsbcs.equals("")))	wheresql+=" and (lxdlsbcs="+lxdlsbcs+") ";
	}
	mmxgsj=request.getParameter("mmxgsj");
	if (mmxgsj!=null)
	{
		mmxgsj=mmxgsj.trim();
		if (!(mmxgsj.equals("")))	wheresql+="  and (mmxgsj>=TO_DATE('"+mmxgsj+"','YYYY/MM/DD'))";
	}
	mmxgsj=request.getParameter("mmxgsj2");
	if (mmxgsj!=null)
	{
		mmxgsj=mmxgsj.trim();
		if (!(mmxgsj.equals("")))	wheresql+="  and (mmxgsj<=TO_DATE('"+mmxgsj+"','YYYY/MM/DD'))";
	}
	mmsyzq=request.getParameter("mmsyzq");
	if (mmsyzq!=null)
	{
		mmsyzq=mmsyzq.trim();
		if (!(mmsyzq.equals("")))	wheresql+=" and (mmsyzq>="+mmsyzq+") ";
	}
	mmsyzq=request.getParameter("mmsyzq2");
	if (mmsyzq!=null)
	{
		mmsyzq=mmsyzq.trim();
		if (!(mmsyzq.equals("")))	wheresql+=" and (mmsyzq<="+mmsyzq+") ";
	}
	yxdlsbcs=request.getParameter("yxdlsbcs");
	if (yxdlsbcs!=null)
	{
		yxdlsbcs=yxdlsbcs.trim();
		if (!(yxdlsbcs.equals("")))	wheresql+=" and (yxdlsbcs>="+yxdlsbcs+") ";
	}
	yxdlsbcs=request.getParameter("yxdlsbcs2");
	if (yxdlsbcs!=null)
	{
		yxdlsbcs=yxdlsbcs.trim();
		if (!(yxdlsbcs.equals("")))	wheresql+=" and (yxdlsbcs<="+yxdlsbcs+") ";
	}
	sfsd=request.getParameter("sfsd");
	if (sfsd!=null)
	{
		sfsd=cf.GB2Uni(sfsd);
		if (!(sfsd.equals("")))	wheresql+=" and  (sfsd='"+sfsd+"')";
	}


	ls_sql="SELECT distinct jxc_ppgysdzb.ppbm,jxc_ppgysdzb.ppmc,jxc_ppgysdzb.gysbm,jxc_ppgysdzb.gysmc,jxc_ppgysdzb.ssfgs,dwmc ,yhdlm,yhmc,DECODE(kdlxtbz,'Y','可登陆','N','不可登陆') kdlxtbz,lxdlsbcs,mmsyzq,yxdlsbcs,DECODE(sfsd,'Y','已锁定','N','未锁定') sfsd ";
	ls_sql+=" FROM jxc_ppgysdzb,jxc_ppxx,jxc_gysxx,sq_dwxx  ";
    ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm ";
    ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
    ls_sql+=" and jxc_ppgysdzb.ssfgs=sq_dwxx.dwbh ";
    ls_sql+=" and jxc_ppxx.pplb='1' ";
    ls_sql+=" and jxc_gysxx.cllx='1' ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by dwmc,jxc_ppgysdzb.ppbm,jxc_ppgysdzb.gysbm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_ppgysdzbList.jsp","","","EditJxc_ppgysdzb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"ppbm","ppmc","gysbm","gysmc","dwmc","yhdlm","yhmc","kdlxtbz","lxdlsbcs","mmsyzq","yxdlsbcs","sfsd"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"ppbm","gysbm","ssfgs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_ppgysdzbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_ppgysdzb where "+chooseitem;
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
  <B><font size="3">主材－对照表维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">子品牌编码</td>
	<td  width="13%">子品牌名称</td>
	<td  width="5%">供应商编码</td>
	<td  width="19%">供应商名称</td>
	<td  width="10%">所属分公司</td>
	<td  width="8%">用户登录名</td>
	<td  width="10%">用户名称</td>
	<td  width="6%">可登陆系统标志</td>
	<td  width="5%">已经登陆失败次数</td>
	<td  width="5%">密码使用周期</td>
	<td  width="5%">允许登陆失败次数</td>
	<td  width="4%">是否锁定</td>
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