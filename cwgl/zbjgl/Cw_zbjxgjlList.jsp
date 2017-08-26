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


	String sq_sgd_sgd=null;
	String sq_sgd_sgdmc=null;
	sq_sgd_sgd=request.getParameter("sq_sgd_sgd");
	if (sq_sgd_sgd!=null)
	{
		sq_sgd_sgd=cf.GB2Uni(sq_sgd_sgd);
		if (!(sq_sgd_sgd.equals("")))	wheresql+=" and  (sq_sgd.sgd='"+sq_sgd_sgd+"')";
	}

	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc like '%"+sq_sgd_sgdmc+"%')";
	}

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_sgd.ssfgs='"+ssfgs+"')";
	}
	String cxbz=null;
	cxbz=request.getParameter("cxbz");
	if (cxbz!=null)
	{
		if (!(cxbz.equals("")))	wheresql+=" and  (sq_sgd.cxbz='"+cxbz+"')";
	}


	String cw_zbjxgjl_zbjjsyybm=null;
	String cw_zbjxgjl_lrr=null;
	String cw_zbjxgjl_lrsj=null;

	cw_zbjxgjl_zbjjsyybm=request.getParameter("cw_zbjxgjl_zbjjsyybm");
	if (cw_zbjxgjl_zbjjsyybm!=null)
	{
		cw_zbjxgjl_zbjjsyybm=cf.GB2Uni(cw_zbjxgjl_zbjjsyybm);
		if (!(cw_zbjxgjl_zbjjsyybm.equals("")))	wheresql+=" and  (cw_zbjxgjl.zbjjsyybm='"+cw_zbjxgjl_zbjjsyybm+"')";
	}
	cw_zbjxgjl_lrr=request.getParameter("cw_zbjxgjl_lrr");
	if (cw_zbjxgjl_lrr!=null)
	{
		cw_zbjxgjl_lrr=cf.GB2Uni(cw_zbjxgjl_lrr);
		if (!(cw_zbjxgjl_lrr.equals("")))	wheresql+=" and  (cw_zbjxgjl.lrr='"+cw_zbjxgjl_lrr+"')";
	}
	cw_zbjxgjl_lrsj=request.getParameter("cw_zbjxgjl_lrsj");
	if (cw_zbjxgjl_lrsj!=null)
	{
		cw_zbjxgjl_lrsj=cw_zbjxgjl_lrsj.trim();
		if (!(cw_zbjxgjl_lrsj.equals("")))	wheresql+="  and (cw_zbjxgjl.lrsj>=TO_DATE('"+cw_zbjxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zbjxgjl_lrsj=request.getParameter("cw_zbjxgjl_lrsj2");
	if (cw_zbjxgjl_lrsj!=null)
	{
		cw_zbjxgjl_lrsj=cw_zbjxgjl_lrsj.trim();
		if (!(cw_zbjxgjl_lrsj.equals("")))	wheresql+="  and (cw_zbjxgjl.lrsj<=TO_DATE('"+cw_zbjxgjl_lrsj+"','YYYY/MM/DD'))";
	}

	String jsjlh=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		jsjlh=cf.GB2Uni(jsjlh);
		if (!(jsjlh.equals("")))	wheresql+=" and  (cw_zbjxgjl.jsjlh='"+jsjlh+"')";
	}
	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");
	if (tsjlh!=null)
	{
		tsjlh=cf.GB2Uni(tsjlh);
		if (!(tsjlh.equals("")))	wheresql+=" and  (cw_zbjxgjl.tsjlh='"+tsjlh+"')";
	}
	String scbz=null;
	scbz=request.getParameter("scbz");
	if (scbz!=null)
	{
		scbz=cf.GB2Uni(scbz);
		if (!(scbz.equals("")))	wheresql+=" and  (cw_zbjxgjl.scbz='"+scbz+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (cw_zbjxgjl.lx='"+lx+"')";
	}

	ls_sql="SELECT cw_zbjxgjl.xuhao,sq_sgd.sgdmc,DECODE(cw_zbjxgjl.lx,'1','手工录入','2','完工结算','3','工地维修') lx,cw_zbjxgjl.je,dm_zbjjsyybm.zbjjsyymc,cw_zbjxgjl.jsjlh,cw_zbjxgjl.tsjlh,cw_zbjxgjl.lrr,cw_zbjxgjl.lrsj,dwmc,DECODE(cw_zbjxgjl.scbz,'N','未删除','Y','删除'),cw_zbjxgjl.scr,cw_zbjxgjl.scsj,cw_zbjxgjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjxgjl,sq_dwxx  ";
    ls_sql+=" where cw_zbjxgjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjxgjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_zbjxgjl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zbjxgjl.xuhao desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zbjxgjlList.jsp","","","EditCw_zbjxgjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xuhao","sq_sgd_sgdmc","dm_zbjjsyybm_zbjjsyymc","cw_zbjxgjl_je","cw_zbjxgjl_lrr","cw_zbjxgjl_lrsj","cw_zbjxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_zbjxgjl.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改质保金修改记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="3%">序号</td>
	<td  width="5%">施工队</td>
	<td  width="6%">类型</td>
	<td  width="8%">金额</td>
	<td  width="10%">质保金减少原因</td>
	<td  width="6%">结算记录号</td>
	<td  width="6%">投诉报修记录号</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="9%">录入部门</td>
	<td  width="5%">删除标志</td>
	<td  width="5%">删除人</td>
	<td  width="7%">删除时间</td>
	<td  width="38%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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