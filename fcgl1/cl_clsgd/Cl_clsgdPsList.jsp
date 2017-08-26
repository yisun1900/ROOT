<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sgph=null;
	String dwbh=null;
	String sgzsl=null;
	String shzsl=null;
	String sgzt=null;
	String lrr=null;
	String lrsj=null;
	String zbshr=null;
	String zbshsj=null;
	String gysxdr=null;
	String gysxdsj=null;
	String bz=null;
	String fgs=null;

	String psfs=null;
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		psfs=cf.GB2Uni(psfs);
		if (!(psfs.equals("")))	wheresql+=" and  (cl_clsgd.psfs='"+psfs+"')";
	}
	String jhshsj=null;
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (cl_clsgd.jhshsj>=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (cl_clsgd.jhshsj<=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	
	
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_clsgd.dwbh='"+fgs+"')";
	sgph=request.getParameter("sgph");
	if (sgph!=null)
	{
		sgph=cf.GB2Uni(sgph);
		if (!(sgph.equals("")))	wheresql+=" and  (cl_clsgd.sgph='"+sgph+"')";
	}
	sgzsl=request.getParameter("sgzsl");
	if (sgzsl!=null)
	{
		sgzsl=sgzsl.trim();
		if (!(sgzsl.equals("")))	wheresql+=" and  (cl_clsgd.sgzsl>="+sgzsl+") ";
	}
	sgzsl=request.getParameter("sgzsl2");
	if (sgzsl!=null)
	{
		sgzsl=sgzsl.trim();
		if (!(sgzsl.equals("")))	wheresql+=" and  (cl_clsgd.sgzsl<="+sgzsl+") ";
	}
	sgzt=request.getParameter("sgzt");
	if (sgzt!=null)
	{
		sgzt=cf.GB2Uni(sgzt);
		if (!(sgzt.equals("")))	wheresql+=" and  (cl_clsgd.sgzt='"+sgzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cl_clsgd.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_clsgd.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_clsgd.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT sgph,dwmc,sgzsl,DECODE(sgzt,'1','未提交','2','已提交','3','一级审核','4','二级审核','5','三级审核','7','已配送','8','供应商下单','9','审核不通过'),DECODE(psfs,'1','配送','2','自提','9','其它'),jhshsj,lrr,lrsj,cl_clsgd.bz  ";
	ls_sql+=" FROM cl_clsgd,sq_dwxx  ";
    ls_sql+=" where  cl_clsgd.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sgph";
    pageObj.sql=ls_sql;
//	out.print(ls_sql);
//进行对象初始化
	pageObj.initPage("Cl_clsgdPsList.jsp","SelectPsCl_clsgd.jsp","","PsCl_clsgd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setEditStr("配送");
/*
//设置显示列
	String[] disColName={"sgph","dwbh","sgzsl","shzsl","sgzt","lrr","lrsj","zbshr","zbshsj","gysxdr","gysxdsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
//	String[] keyName={"sgph"};
//	pageObj.setKey(keyName);
//设置按钮参数
//	String[] buttonName={"审核定购单"};//按钮的显示名称
//	String[] buttonLink={"dgdshList.jsp?"};//按钮单击调用的网页，可以增加参数
//	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
//	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sgph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="viewsgmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sgph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">配送</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="8%">申购批号</td>
	<td  width="13%">申购单位</td>
	<td  width="9%">申购总数量</td>
	<td  width="7%">申购状态</td>
	<td  width="7%">配送方式</td>
	<td  width="8%">计划送货时间</td>
	<td  width="7%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="29%">备注</td>
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