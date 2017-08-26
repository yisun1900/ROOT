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
	String ywy=null;
	String zjxm=null;
	String sgd=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_ywyjsjl.fgsbh='"+fgs+"')";

	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (cw_ywyjsjl.ywy='"+ywy+"')";
	}
	
	
	String cw_ywyjsjl_jsjlh=null;
	String cw_ywyjsjl_lrr=null;
	String cw_ywyjsjl_lrsj=null;
	String cw_ywyjsjl_spbz=null;
	
	
	cw_ywyjsjl_jsjlh=request.getParameter("cw_ywyjsjl_jsjlh");
	if (cw_ywyjsjl_jsjlh!=null)
	{
		cw_ywyjsjl_jsjlh=cf.GB2Uni(cw_ywyjsjl_jsjlh);
		if (!(cw_ywyjsjl_jsjlh.equals("")))	wheresql+=" and  (cw_ywyjsjl.jsjlh='"+cw_ywyjsjl_jsjlh+"')";
	}
	
	cw_ywyjsjl_lrr=request.getParameter("cw_ywyjsjl_lrr");
	if (cw_ywyjsjl_lrr!=null)
	{
		cw_ywyjsjl_lrr=cf.GB2Uni(cw_ywyjsjl_lrr);
		if (!(cw_ywyjsjl_lrr.equals("")))	wheresql+=" and  (cw_ywyjsjl.lrr='"+cw_ywyjsjl_lrr+"')";
	}
	cw_ywyjsjl_lrsj=request.getParameter("cw_ywyjsjl_lrsj");
	if (cw_ywyjsjl_lrsj!=null)
	{
		cw_ywyjsjl_lrsj=cw_ywyjsjl_lrsj.trim();
		if (!(cw_ywyjsjl_lrsj.equals("")))	wheresql+="  and (cw_ywyjsjl.lrsj>=TO_DATE('"+cw_ywyjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_ywyjsjl_lrsj=request.getParameter("cw_ywyjsjl_lrsj2");
	if (cw_ywyjsjl_lrsj!=null)
	{
		cw_ywyjsjl_lrsj=cw_ywyjsjl_lrsj.trim();
		if (!(cw_ywyjsjl_lrsj.equals("")))	wheresql+="  and (cw_ywyjsjl.lrsj<=TO_DATE('"+cw_ywyjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_ywyjsjl_spbz=request.getParameter("cw_ywyjsjl_spbz");
	if (cw_ywyjsjl_spbz!=null)
	{
		cw_ywyjsjl_spbz=cf.GB2Uni(cw_ywyjsjl_spbz);
		if (!(cw_ywyjsjl_spbz.equals("")))	wheresql+=" and  (cw_ywyjsjl.spbz='"+cw_ywyjsjl_spbz+"')";
	}
	
	ls_sql="SELECT cw_ywyjsjl.jsjlh,DECODE(cw_ywyjsjl.spbz,'1','开始结算','2','结算完成','3','审批通过','4','审批未通过'),b.dwmc fgsbh,ywy,cw_ywyjsjl.sjfw,cw_ywyjsjl.sjfw2,cw_ywyjsjl.tcze,cw_ywyjsjl.lrr,cw_ywyjsjl.lrsj,a.dwmc lrbm,cw_ywyjsjl.bz  ";
	ls_sql+=" FROM cw_ywyjsjl,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where cw_ywyjsjl.lrbm=a.dwbh and cw_ywyjsjl.fgsbh=b.dwbh";
    ls_sql+=" and cw_ywyjsjl.spbz in('1','2')";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_ywyjsjl.jsjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_ywyjsjlList.jsp","SelectCw_ywyjsjl.jsp","","EditCw_ywyjsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_ywyjsjl_dwbh","cw_ywyjsjl_ywybh","cw_ywyjsjl_sjfw2","cw_ywyjsjl_dyqdze","cw_ywyjsjl_dyqds","cw_ywyjsjl_ywytcbl","cw_ywyjsjl_ywyjsbl","cw_ywyjsjl_dyjss","cw_ywyjsjl_jzssk","cw_ywyjsjl_wgjsje","cw_ywyjsjl_kqtk","cw_ywyjsjl_qdsyjsje","cw_ywyjsjl_sjf","cw_ywyjsjl_sjfksbl","cw_ywyjsjl_sjftcbl","cw_ywyjsjl_dyjsze","cw_ywyjsjl_lrr","cw_ywyjsjl_lrsj","sq_dwxx_dwmc","cw_ywyjsjl_spbz","cw_ywyjsjl_spyj","cw_ywyjsjl_spr","cw_ywyjsjl_spsj","cw_ywyjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_ywyjsjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_ywyjsjl.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">业务员结算---修改</font></B>
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
	<td  width="6%">业务员</td>
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