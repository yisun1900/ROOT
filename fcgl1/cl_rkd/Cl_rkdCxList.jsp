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
	String rkph=null;
	String dwbh=null;
	String gysmc=null;
	String rkr=null;
	String rksj=null;
	String rkzsl=null;
	String rkzje=null;
	String rkzt=null;
	String lrr=null;
	String lrsj=null;
	String fgs=null;

	String rklx=null;
	rklx=request.getParameter("rklx");
	if (rklx!=null)
	{
		rklx=cf.GB2Uni(rklx);
		if (!(rklx.equals("")))	wheresql+=" and  (cl_rkd.rklx='"+rklx+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (cl_rkd.sgd='"+sgd+"')";
	}

	String sgph=null;
	sgph=request.getParameter("sgph");
	if (sgph!=null)
	{
		sgph=cf.GB2Uni(sgph);
		if (!(sgph.equals("")))	wheresql+=" and  (sgph='"+sgph+"')";
	}
	
	
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_rkd.dwbh='"+fgs+"')";
	
	rkph=request.getParameter("rkph");
	if (rkph!=null)
	{
		rkph=cf.GB2Uni(rkph);
		if (!(rkph.equals("")))	wheresql+=" and  (rkph='"+rkph+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc='"+gysmc+"')";
	}
	rkr=request.getParameter("rkr");
	if (rkr!=null)
	{
		rkr=cf.GB2Uni(rkr);
		if (!(rkr.equals("")))	wheresql+=" and  (rkr='"+rkr+"')";
	}
	rksj=request.getParameter("rksj");
	if (rksj!=null)
	{
		rksj=rksj.trim();
		if (!(rksj.equals("")))	wheresql+="  and (rksj>=TO_DATE('"+rksj+"','YYYY/MM/DD'))";
	}
	rksj=request.getParameter("rksj2");
	if (rksj!=null)
	{
		rksj=rksj.trim();
		if (!(rksj.equals("")))	wheresql+="  and (rksj<=TO_DATE('"+rksj+"','YYYY/MM/DD'))";
	}
	rkzsl=request.getParameter("rkzsl");
	if (rkzsl!=null)
	{
		rkzsl=rkzsl.trim();
		if (!(rkzsl.equals("")))	wheresql+=" and  (rkzsl>="+rkzsl+") ";
	}
	rkzsl=request.getParameter("rkzsl2");
	if (rkzsl!=null)
	{
		rkzsl=rkzsl.trim();
		if (!(rkzsl.equals("")))	wheresql+=" and  (rkzsl<="+rkzsl+") ";
	}
	rkzje=request.getParameter("rkzje");
	if (rkzje!=null)
	{
		rkzje=rkzje.trim();
		if (!(rkzje.equals("")))	wheresql+=" and  (rkzje>="+rkzje+") ";
	}
	rkzje=request.getParameter("rkzje2");
	if (rkzje!=null)
	{
		rkzje=rkzje.trim();
		if (!(rkzje.equals("")))	wheresql+=" and  (rkzje<="+rkzje+") ";
	}
	rkzt=request.getParameter("rkzt");
	if (rkzt!=null)
	{
		rkzt=cf.GB2Uni(rkzt);
		if (!(rkzt.equals("")))	wheresql+=" and  (rkzt='"+rkzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rkph,DECODE(rkzt,'1','未提交','2','已提交','3','已审核'),dwmc,DECODE(rklx,'1','新货','2','退货'),gysmc,sgdmc,rkr,rksj,rkzsl,rkzje,sgph,shr,shsj,shyj,lrr,lrsj,cl_rkd.bz  ";
	ls_sql+=" FROM cl_rkd,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cl_rkd.dwbh=sq_dwxx.dwbh(+) and cl_rkd.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_rkdCxList.jsp","SelectCxCl_rkd.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"rkph","dwbh","gysmc","rkr","rksj","rkzsl","rkzje","rkzt","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"rkph"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"rkph",};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="viewrkmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("rkph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
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
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">入库批号</td>
	<td  width="4%">入库状态</td>
	<td  width="6%">入库单位</td>
	<td  width="3%">类型</td>
	<td  width="6%">供应商</td>
	<td  width="4%">退货施工队</td>
	<td  width="3%">入库人</td>
	<td  width="5%">入库时间</td>
	<td  width="5%">入库总数量</td>
	<td  width="7%">入库总金额</td>
	<td  width="5%">申购批号</td>
	<td  width="3%">审核人</td>
	<td  width="5%">审核时间</td>
	<td  width="16%">审核意见</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="15%">备注</td>
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