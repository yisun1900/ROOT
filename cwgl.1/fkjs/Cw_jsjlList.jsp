<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="cwgl" scope="page" class="cwgl.Cwgl"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String wheresql1="";
	String cw_jsjl_jsjlh=null;
	String cw_jsjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_qyrq=null;

	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String cw_jsjl_jsr=null;
	String cw_jsjl_jssj=null;

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_jsjl.scbz='"+scbz+"')";

	String jsdw=null;
	jsdw=request.getParameter("jsdw");
	if (!(jsdw.equals("")))	wheresql+=" and  (cw_jsjl.jsdw='"+jsdw+"')";


	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	cw_jsjl_jsjlh=request.getParameter("cw_jsjl_jsjlh");
	if (cw_jsjl_jsjlh!=null)
	{
		cw_jsjl_jsjlh=cf.GB2Uni(cw_jsjl_jsjlh);
		if (!(cw_jsjl_jsjlh.equals("")))	wheresql+=" and  (cw_jsjl.jsjlh='"+cw_jsjl_jsjlh+"')";
	}
	cw_jsjl_khbh=request.getParameter("cw_jsjl_khbh");
	if (cw_jsjl_khbh!=null)
	{
		cw_jsjl_khbh=cf.GB2Uni(cw_jsjl_khbh);
		if (!(cw_jsjl_khbh.equals("")))	wheresql+=" and  (cw_jsjl.khbh='"+cw_jsjl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
		if (!(crm_khxx_khxm.equals("")))	wheresql1+=" and  (khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
		if (!(crm_khxx_fwdz.equals("")))	wheresql1+=" and  (fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
		if (!(crm_khxx_lxfs.equals("")))	wheresql1+=" and  (lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
		if (!(crm_khxx_hth.equals("")))	wheresql1+=" and  (hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}

	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_jsjl_jsr=request.getParameter("cw_jsjl_jsr");
	if (cw_jsjl_jsr!=null)
	{
		cw_jsjl_jsr=cf.GB2Uni(cw_jsjl_jsr);
		if (!(cw_jsjl_jsr.equals("")))	wheresql+=" and  (cw_jsjl.jsr='"+cw_jsjl_jsr+"')";
	}
	cw_jsjl_jssj=request.getParameter("cw_jsjl_jssj");
	if (cw_jsjl_jssj!=null)
	{
		cw_jsjl_jssj=cw_jsjl_jssj.trim();
		if (!(cw_jsjl_jssj.equals("")))	wheresql+="  and (cw_jsjl.jssj>=TO_DATE('"+cw_jsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_jsjl_jssj=request.getParameter("cw_jsjl_jssj2");
	if (cw_jsjl_jssj!=null)
	{
		cw_jsjl_jssj=cw_jsjl_jssj.trim();
		if (!(cw_jsjl_jssj.equals("")))	wheresql+="  and (cw_jsjl.jssj<=TO_DATE('"+cw_jsjl_jssj+"','YYYY/MM/DD'))";
	}
	
	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,sgdmc as sgd,cw_jsjl.jsjlh,TO_CHAR(cw_jsjl.qye),cw_jsjl.zjje,cw_jsjl.jsl||'%',cw_jsjl.bqyfkze,cw_jsjl.jsr,cw_jsjl.jssj,b.dwmc jsdw,cw_jsjl.bz  ";
	ls_sql+=" FROM cw_jsjl,crm_khxx,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where cw_jsjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and cw_jsjl.jsdw=b.dwbh(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by jsjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jsjlList.jsp","SelectCw_jsjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm","cw_jsjl_fkqx","cw_jsjl_fkbz","cw_jsjl_yfkze","cw_jsjl_ljyfkze","cw_jsjl_bqyfkze","cw_jsjl_jsr","cw_jsjl_jssj","cw_jsjl_bqljyfkze","cw_jsjl_bqyfkbl","cw_jsjl_bz","cw_jsjl_jslx","cw_jsjl_qye","cw_jsjl_zjje","cw_jsjl_jxje","cw_jsjl_jsl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_jsjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_jsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCwHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("qye","1");//列参数对象加入Hash表
//	spanColHash.put("cw_jsjl_fkbz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] jsjlh = request.getParameterValues("jsjlh");
	try {
		if (jsjlh!=null && jsjlh.length>0)
		{
			String scr=(String)session.getAttribute("yhdlm");
			cwgl.deletejs(jsjlh,scr);
		}
	}
	catch (Exception e) {
		out.print("Exception: " + e);
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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="3%">质检</td>
	<td  width="3%">施工队</td>
	<td  width="4%">结算记录号</td>
	<td  width="6%">签约额</td>
	<td  width="5%">本期增减项</td>
	<td  width="3%">结算率</td>
	<td  width="6%">本期结算款总额</td>
	<td  width="3%">结算人</td>
	<td  width="5%">结算时间</td>
	<td  width="7%">结算单位</td>
	<td  width="12%">备注</td>
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