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
	String kp_ybjkp_sgd=null;
	String kp_ybjkp_ybjsl=null;
	String kp_ybjkp_cgcs=null;
	String kp_ybjkp_cgsbcs=null;
	String kp_ybjkp_cgcgcs=null;
	String kp_ybjkp_tsjjf=null;
	String kp_ybjkp_ybjpf=null;
	String kp_ybjkp_qssj=null;
	String kp_ybjkp_jzsj=null;
	String kp_ybjkp_kpr=null;
	kp_ybjkp_sgd=request.getParameter("kp_ybjkp_sgd");
	if (kp_ybjkp_sgd!=null)
	{
		kp_ybjkp_sgd=cf.GB2Uni(kp_ybjkp_sgd);
		if (!(kp_ybjkp_sgd.equals("")))	wheresql+=" and  (kp_ybjkp.sgd='"+kp_ybjkp_sgd+"')";
	}
	kp_ybjkp_ybjsl=request.getParameter("kp_ybjkp_ybjsl");
	if (kp_ybjkp_ybjsl!=null)
	{
		kp_ybjkp_ybjsl=kp_ybjkp_ybjsl.trim();
		if (!(kp_ybjkp_ybjsl.equals("")))	wheresql+=" and (kp_ybjkp.ybjsl="+kp_ybjkp_ybjsl+") ";
	}
	kp_ybjkp_cgcs=request.getParameter("kp_ybjkp_cgcs");
	if (kp_ybjkp_cgcs!=null)
	{
		kp_ybjkp_cgcs=kp_ybjkp_cgcs.trim();
		if (!(kp_ybjkp_cgcs.equals("")))	wheresql+=" and (kp_ybjkp.cgcs="+kp_ybjkp_cgcs+") ";
	}
	kp_ybjkp_cgsbcs=request.getParameter("kp_ybjkp_cgsbcs");
	if (kp_ybjkp_cgsbcs!=null)
	{
		kp_ybjkp_cgsbcs=kp_ybjkp_cgsbcs.trim();
		if (!(kp_ybjkp_cgsbcs.equals("")))	wheresql+=" and (kp_ybjkp.cgsbcs="+kp_ybjkp_cgsbcs+") ";
	}
	kp_ybjkp_cgcgcs=request.getParameter("kp_ybjkp_cgcgcs");
	if (kp_ybjkp_cgcgcs!=null)
	{
		kp_ybjkp_cgcgcs=kp_ybjkp_cgcgcs.trim();
		if (!(kp_ybjkp_cgcgcs.equals("")))	wheresql+=" and (kp_ybjkp.cgcgcs="+kp_ybjkp_cgcgcs+") ";
	}
	kp_ybjkp_tsjjf=request.getParameter("kp_ybjkp_tsjjf");
	if (kp_ybjkp_tsjjf!=null)
	{
		kp_ybjkp_tsjjf=kp_ybjkp_tsjjf.trim();
		if (!(kp_ybjkp_tsjjf.equals("")))	wheresql+=" and (kp_ybjkp.tsjjf="+kp_ybjkp_tsjjf+") ";
	}
	kp_ybjkp_ybjpf=request.getParameter("kp_ybjkp_ybjpf");
	if (kp_ybjkp_ybjpf!=null)
	{
		kp_ybjkp_ybjpf=kp_ybjkp_ybjpf.trim();
		if (!(kp_ybjkp_ybjpf.equals("")))	wheresql+=" and (kp_ybjkp.ybjpf="+kp_ybjkp_ybjpf+") ";
	}
	kp_ybjkp_qssj=request.getParameter("kp_ybjkp_qssj");
	if (kp_ybjkp_qssj!=null)
	{
		kp_ybjkp_qssj=kp_ybjkp_qssj.trim();
		if (!(kp_ybjkp_qssj.equals("")))	wheresql+="  and (kp_ybjkp.qssj=TO_DATE('"+kp_ybjkp_qssj+"','YYYY/MM/DD'))";
	}
	kp_ybjkp_jzsj=request.getParameter("kp_ybjkp_jzsj");
	if (kp_ybjkp_jzsj!=null)
	{
		kp_ybjkp_jzsj=kp_ybjkp_jzsj.trim();
		if (!(kp_ybjkp_jzsj.equals("")))	wheresql+="  and (kp_ybjkp.jzsj=TO_DATE('"+kp_ybjkp_jzsj+"','YYYY/MM/DD'))";
	}
	kp_ybjkp_kpr=request.getParameter("kp_ybjkp_kpr");
	if (kp_ybjkp_kpr!=null)
	{
		kp_ybjkp_kpr=cf.GB2Uni(kp_ybjkp_kpr);
		if (!(kp_ybjkp_kpr.equals("")))	wheresql+=" and  (kp_ybjkp.kpr='"+kp_ybjkp_kpr+"')";
	}
	ls_sql="SELECT kp_ybjkp.sgd,sgdmc,kp_ybjkp.ybjsl,kp_ybjkp.cgcs,kp_ybjkp.cgsbcs,kp_ybjkp.cgcgcs,kp_ybjkp.tsjjf,kp_ybjkp.ybjpf,kp_ybjkp.qssj,kp_ybjkp.jzsj,kp_ybjkp.kpr  ";
	ls_sql+=" FROM kp_ybjkp,sq_sgd  ";
    ls_sql+=" where kp_ybjkp.sgd=sq_sgd.sgd";
    ls_sql+=wheresql;
	ls_sql+=" order by  kp_ybjkp.sgd ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_ybjkpList.jsp","SelectKp_ybjkp.jsp","","EditKp_ybjkp.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sgd","sq_dwxx_dwmc","kp_ybjkp_ybjsl","kp_ybjkp_cgcs","kp_ybjkp_cgsbcs","kp_ybjkp_cgcgcs","kp_ybjkp_tsjjf","kp_ybjkp_ybjpf","kp_ybjkp_qssj","kp_ybjkp_jzsj","kp_ybjkp_kpr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sgd"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">施工队</td>
	<td  width="8%">施工队</td>
	<td  width="8%">提供样板间数量</td>
	<td  width="8%">参观次数</td>
	<td  width="8%">参观失败次数</td>
	<td  width="8%">参观成功次数</td>
	<td  width="8%">特殊加减分</td>
	<td  width="8%">样板间评分</td>
	<td  width="10%">考评起始时间</td>
	<td  width="10%">考评截止时间</td>
	<td  width="8%">考评人</td>
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