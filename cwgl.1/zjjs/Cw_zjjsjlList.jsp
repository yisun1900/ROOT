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
	String zjxm=null;
	String sgd=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_zjjsjl.fgsbh='"+fgs+"')";

	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (cw_zjjsjl.zjxm='"+zjxm+"')";
	}

	String zjlx=null;
	zjlx=request.getParameter("zjlx");
	if (zjlx!=null)
	{
		zjlx=cf.GB2Uni(zjlx);
		if (!(zjlx.equals("")))	wheresql+=" and  (cw_zjjsjl.zjlx='"+zjlx+"')";
	}
	
	
	String cw_zjjsjl_jsjlh=null;
	String cw_zjjsjl_lrr=null;
	String cw_zjjsjl_lrsj=null;
	String cw_zjjsjl_spbz=null;
	
	
	cw_zjjsjl_jsjlh=request.getParameter("cw_zjjsjl_jsjlh");
	if (cw_zjjsjl_jsjlh!=null)
	{
		cw_zjjsjl_jsjlh=cf.GB2Uni(cw_zjjsjl_jsjlh);
		if (!(cw_zjjsjl_jsjlh.equals("")))	wheresql+=" and  (cw_zjjsjl.jsjlh='"+cw_zjjsjl_jsjlh+"')";
	}
	
	cw_zjjsjl_lrr=request.getParameter("cw_zjjsjl_lrr");
	if (cw_zjjsjl_lrr!=null)
	{
		cw_zjjsjl_lrr=cf.GB2Uni(cw_zjjsjl_lrr);
		if (!(cw_zjjsjl_lrr.equals("")))	wheresql+=" and  (cw_zjjsjl.lrr='"+cw_zjjsjl_lrr+"')";
	}
	cw_zjjsjl_lrsj=request.getParameter("cw_zjjsjl_lrsj");
	if (cw_zjjsjl_lrsj!=null)
	{
		cw_zjjsjl_lrsj=cw_zjjsjl_lrsj.trim();
		if (!(cw_zjjsjl_lrsj.equals("")))	wheresql+="  and (cw_zjjsjl.lrsj>=TO_DATE('"+cw_zjjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zjjsjl_lrsj=request.getParameter("cw_zjjsjl_lrsj2");
	if (cw_zjjsjl_lrsj!=null)
	{
		cw_zjjsjl_lrsj=cw_zjjsjl_lrsj.trim();
		if (!(cw_zjjsjl_lrsj.equals("")))	wheresql+="  and (cw_zjjsjl.lrsj<=TO_DATE('"+cw_zjjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zjjsjl_spbz=request.getParameter("cw_zjjsjl_spbz");
	if (cw_zjjsjl_spbz!=null)
	{
		cw_zjjsjl_spbz=cf.GB2Uni(cw_zjjsjl_spbz);
		if (!(cw_zjjsjl_spbz.equals("")))	wheresql+=" and  (cw_zjjsjl.spbz='"+cw_zjjsjl_spbz+"')";
	}
	
	ls_sql="SELECT cw_zjjsjl.jsjlh,DECODE(cw_zjjsjl.spbz,'1','开始结算','2','结算完成','3','审批通过','4','审批未通过'),b.dwmc fgsbh,zjxm,DECODE(cw_zjjsjl.zjlx,'1','主任监理','2','监理'),cw_zjjsjl.sjfw,cw_zjjsjl.sjfw2,cw_zjjsjl.tcze,cw_zjjsjl.lrr,cw_zjjsjl.lrsj,a.dwmc lrbm,cw_zjjsjl.bz  ";
	ls_sql+=" FROM cw_zjjsjl,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where cw_zjjsjl.lrbm=a.dwbh and cw_zjjsjl.fgsbh=b.dwbh";
    ls_sql+=" and cw_zjjsjl.spbz in('1','2')";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zjjsjl.jsjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zjjsjlList.jsp","SelectCw_zjjsjl.jsp","","EditCw_zjjsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_zjjsjl_dwbh","cw_zjjsjl_ywybh","cw_zjjsjl_sjfw2","cw_zjjsjl_dyqdze","cw_zjjsjl_dyqds","cw_zjjsjl_ywytcbl","cw_zjjsjl_ywyjsbl","cw_zjjsjl_dyjss","cw_zjjsjl_jzssk","cw_zjjsjl_wgjsje","cw_zjjsjl_kqtk","cw_zjjsjl_qdsyjsje","cw_zjjsjl_sjf","cw_zjjsjl_sjfksbl","cw_zjjsjl_sjftcbl","cw_zjjsjl_dyjsze","cw_zjjsjl_lrr","cw_zjjsjl_lrsj","sq_dwxx_dwmc","cw_zjjsjl_spbz","cw_zjjsjl_spyj","cw_zjjsjl_spr","cw_zjjsjl_spsj","cw_zjjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_zjjsjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_zjjsjl.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">质检结算---修改</font></B>
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
	<td  width="10%">分公司</td>
	<td  width="5%">质检</td>
	<td  width="5%">类型</td>
	<td  width="7%">时间范围从</td>
	<td  width="7%">时间范围到</td>
	<td  width="8%">提成总额</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="10%">录入部门</td>
	<td  width="19%">备注</td>
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