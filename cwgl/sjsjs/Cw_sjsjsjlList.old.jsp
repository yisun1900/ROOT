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

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;
	String sjs=null;
	String zjxm=null;
	String sgd=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	zjxm=request.getParameter("zjxm");
	if (sgd!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	
	
	
	
	String cw_sjsjsjl_jsjlh=null;
	String cw_sjsjsjl_lrr=null;
	String cw_sjsjsjl_lrsj=null;
	String cw_sjsjsjl_spbz=null;
	
	
	cw_sjsjsjl_jsjlh=request.getParameter("cw_sjsjsjl_jsjlh");
	if (cw_sjsjsjl_jsjlh!=null)
	{
		cw_sjsjsjl_jsjlh=cf.GB2Uni(cw_sjsjsjl_jsjlh);
		if (!(cw_sjsjsjl_jsjlh.equals("")))	wheresql+=" and  (cw_sjsjsjl.jsjlh='"+cw_sjsjsjl_jsjlh+"')";
	}
	
	cw_sjsjsjl_lrr=request.getParameter("cw_sjsjsjl_lrr");
	if (cw_sjsjsjl_lrr!=null)
	{
		cw_sjsjsjl_lrr=cf.GB2Uni(cw_sjsjsjl_lrr);
		if (!(cw_sjsjsjl_lrr.equals("")))	wheresql+=" and  (cw_sjsjsjl.lrr='"+cw_sjsjsjl_lrr+"')";
	}
	cw_sjsjsjl_lrsj=request.getParameter("cw_sjsjsjl_lrsj");
	if (cw_sjsjsjl_lrsj!=null)
	{
		cw_sjsjsjl_lrsj=cw_sjsjsjl_lrsj.trim();
		if (!(cw_sjsjsjl_lrsj.equals("")))	wheresql+="  and (cw_sjsjsjl.lrsj>=TO_DATE('"+cw_sjsjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sjsjsjl_lrsj=request.getParameter("cw_sjsjsjl_lrsj2");
	if (cw_sjsjsjl_lrsj!=null)
	{
		cw_sjsjsjl_lrsj=cw_sjsjsjl_lrsj.trim();
		if (!(cw_sjsjsjl_lrsj.equals("")))	wheresql+="  and (cw_sjsjsjl.lrsj<=TO_DATE('"+cw_sjsjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sjsjsjl_spbz=request.getParameter("cw_sjsjsjl_spbz");
	if (cw_sjsjsjl_spbz!=null)
	{
		cw_sjsjsjl_spbz=cf.GB2Uni(cw_sjsjsjl_spbz);
		if (!(cw_sjsjsjl_spbz.equals("")))	wheresql+=" and  (cw_sjsjsjl.spbz='"+cw_sjsjsjl_spbz+"')";
	}
	
	ls_sql="SELECT cw_sjsjsjl.jsjlh,DECODE(cw_sjsjsjl.spbz,'1','开始结算','2','结算完成','3','审批通过','4','审批未通过'),b.dwmc dwbh,sjs,cw_sjsjsjl.sjfw,cw_sjsjsjl.sjfw2,cw_sjsjsjl.tcze,cw_sjsjsjl.lrr,cw_sjsjsjl.lrsj,a.dwmc lrbm,cw_sjsjsjl.bz  ";
	ls_sql+=" FROM cw_sjsjsjl,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where cw_sjsjsjl.lrbm=a.dwbh and cw_sjsjsjl.dwbh=b.dwbh";
    ls_sql+=" and cw_sjsjsjl.spbz in('1','2')";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sjsjsjl.jsjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sjsjsjlList.jsp","SelectCw_sjsjsjl.jsp","","EditCw_sjsjsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sjsjsjl_dwbh","cw_sjsjsjl_sjsbh","cw_sjsjsjl_sjfw2","cw_sjsjsjl_dyqdze","cw_sjsjsjl_dyqds","cw_sjsjsjl_sjstcbl","cw_sjsjsjl_sjsjsbl","cw_sjsjsjl_dyjss","cw_sjsjsjl_jzssk","cw_sjsjsjl_wgjsje","cw_sjsjsjl_kqtk","cw_sjsjsjl_qdsyjsje","cw_sjsjsjl_sjf","cw_sjsjsjl_sjfksbl","cw_sjsjsjl_sjftcbl","cw_sjsjsjl_dyjsze","cw_sjsjsjl_lrr","cw_sjsjsjl_lrsj","sq_dwxx_dwmc","cw_sjsjsjl_spbz","cw_sjsjsjl_spyj","cw_sjsjsjl_spr","cw_sjsjsjl_spsj","cw_sjsjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_sjsjsjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_sjsjsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
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
  <B><font size="3">设计师结算---修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="6%">结算记录号</td>
	<td  width="6%">结算状态</td>
	<td  width="10%">店面</td>
	<td  width="6%">设计师</td>
	<td  width="7%">时间范围从</td>
	<td  width="7%">时间范围到</td>
	<td  width="8%">提成总额</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="10%">录入部门</td>
	<td  width="23%">备注</td>
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