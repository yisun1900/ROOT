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
	String cw_sjsjsjl_jsjlh=null;
	String sjsbh=null;
	String cw_sjsjsjl_lrr=null;
	String cw_sjsjsjl_lrsj=null;
	String cw_sjsjsjl_lrbm=null;
	String cw_sjsjsjl_spbz=null;
	String cw_sjsjsjl_spr=null;
	String cw_sjsjsjl_spsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_sjsjsjl.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_sjsjsjl.dwbh='"+dwbh+"')";
	}

	cw_sjsjsjl_jsjlh=request.getParameter("cw_sjsjsjl_jsjlh");
	if (cw_sjsjsjl_jsjlh!=null)
	{
		cw_sjsjsjl_jsjlh=cf.GB2Uni(cw_sjsjsjl_jsjlh);
		if (!(cw_sjsjsjl_jsjlh.equals("")))	wheresql+=" and  (cw_sjsjsjl.jsjlh='"+cw_sjsjsjl_jsjlh+"')";
	}
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (cw_sjsjsjl.sjsbh='"+sjsbh+"')";
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
	cw_sjsjsjl_lrbm=request.getParameter("cw_sjsjsjl_lrbm");
	if (cw_sjsjsjl_lrbm!=null)
	{
		cw_sjsjsjl_lrbm=cf.GB2Uni(cw_sjsjsjl_lrbm);
		if (!(cw_sjsjsjl_lrbm.equals("")))	wheresql+=" and  (cw_sjsjsjl.lrbm='"+cw_sjsjsjl_lrbm+"')";
	}
	cw_sjsjsjl_spbz=request.getParameter("cw_sjsjsjl_spbz");
	if (cw_sjsjsjl_spbz!=null)
	{
		cw_sjsjsjl_spbz=cf.GB2Uni(cw_sjsjsjl_spbz);
		if (!(cw_sjsjsjl_spbz.equals("")))	wheresql+=" and  (cw_sjsjsjl.spbz='"+cw_sjsjsjl_spbz+"')";
	}
	cw_sjsjsjl_spr=request.getParameter("cw_sjsjsjl_spr");
	if (cw_sjsjsjl_spr!=null)
	{
		cw_sjsjsjl_spr=cf.GB2Uni(cw_sjsjsjl_spr);
		if (!(cw_sjsjsjl_spr.equals("")))	wheresql+=" and  (cw_sjsjsjl.spr='"+cw_sjsjsjl_spr+"')";
	}
	cw_sjsjsjl_spsj=request.getParameter("cw_sjsjsjl_spsj");
	if (cw_sjsjsjl_spsj!=null)
	{
		cw_sjsjsjl_spsj=cw_sjsjsjl_spsj.trim();
		if (!(cw_sjsjsjl_spsj.equals("")))	wheresql+="  and (cw_sjsjsjl.spsj>=TO_DATE('"+cw_sjsjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_sjsjsjl_spsj=request.getParameter("cw_sjsjsjl_spsj2");
	if (cw_sjsjsjl_spsj!=null)
	{
		cw_sjsjsjl_spsj=cw_sjsjsjl_spsj.trim();
		if (!(cw_sjsjsjl_spsj.equals("")))	wheresql+="  and (cw_sjsjsjl.spsj<=TO_DATE('"+cw_sjsjsjl_spsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_sjsjsjl.jsjlh,DECODE(cw_sjsjsjl.spbz,'2','未审批','3','审批通过','4','审批未通过'),b.dwmc dwbh,c.dwmc sjsbh,cw_sjsjsjl.sjfw2,cw_sjsjsjl.dyqdze,cw_sjsjsjl.dyqds,cw_sjsjsjl.sjstcbl||'%',cw_sjsjsjl.sjsjsbl||'%',cw_sjsjsjl.dyjss,cw_sjsjsjl.jzssk,cw_sjsjsjl.wgjsje,cw_sjsjsjl.kqtk,cw_sjsjsjl.qdsyjsje,cw_sjsjsjl.sjf,cw_sjsjsjl.sjfksbl||'%',cw_sjsjsjl.sjftcbl||'%',cw_sjsjsjl.dyjsze,cw_sjsjsjl.lrr,cw_sjsjsjl.lrsj,a.dwmc lrbm, cw_sjsjsjl.spyj,cw_sjsjsjl.spr,cw_sjsjsjl.spsj,cw_sjsjsjl.bz  ";
	ls_sql+=" FROM cw_sjsjsjl,sq_dwxx a,sq_dwxx b,sq_dwxx c  ";
    ls_sql+=" where cw_sjsjsjl.lrbm=a.dwbh and cw_sjsjsjl.dwbh=b.dwbh and cw_sjsjsjl.sjsbh=c.dwbh";
    ls_sql+=" and cw_sjsjsjl.spbz in('3','4')";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sjsjsjl.jsjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sjsjsjlXgSpList.jsp","SelectXgSpCw_sjsjsjl.jsp","","XgSpCw_sjsjsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sjsjsjl_dwbh","cw_sjsjsjl_sjsbh","cw_sjsjsjl_sjfw2","cw_sjsjsjl_dyqdze","cw_sjsjsjl_dyqds","cw_sjsjsjl_sjstcbl","cw_sjsjsjl_sjsjsbl","cw_sjsjsjl_dyjss","cw_sjsjsjl_jzssk","cw_sjsjsjl_wgjsje","cw_sjsjsjl_kqtk","cw_sjsjsjl_qdsyjsje","cw_sjsjsjl_sjf","cw_sjsjsjl_sjfksbl","cw_sjsjsjl_sjftcbl","cw_sjsjsjl_dyjsze","cw_sjsjsjl_lrr","cw_sjsjsjl_lrsj","sq_dwxx_dwmc","cw_sjsjsjl_spbz","cw_sjsjsjl_spyj","cw_sjsjsjl_spr","cw_sjsjsjl_spsj","cw_sjsjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpCw_sjsjsjl.jsp"};//按钮单击调用的网页，可以增加参数
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
  <B><font size="3">设计师结算---修改审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">结算记录号</td>
	<td  width="3%">审批标志</td>
	<td  width="5%">店面</td>
	<td  width="5%">设计室</td>
	<td  width="4%">时间范围到</td>
	<td  width="4%">当月签单总额</td>
	<td  width="3%">当月签单数</td>
	<td  width="3%">设计师提成比率</td>
	<td  width="3%">设计师结算比率</td>
	<td  width="3%">完工工地数</td>
	<td  width="4%">家装实收款</td>
	<td  width="4%">完工结算金额</td>
	<td  width="3%">扣其它款</td>
	<td  width="4%">签单时已结算金额</td>
	<td  width="3%">设计费</td>
	<td  width="3%">设计费扣税比率</td>
	<td  width="3%">设计费提成比率</td>
	<td  width="4%">设计师结算总额</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">单位名称</td>
	<td  width="7%">审批意见</td>
	<td  width="3%">审批人</td>
	<td  width="4%">审批时间</td>
	<td  width="7%">备注</td>
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