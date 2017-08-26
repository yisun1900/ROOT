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
	String ygbh=null;
	String yhmc=null;
	String bianhao=null;
	String sfzh=null;
	String xzzwbm=null;
	String dwbh=null;
	String ssfgs=null;

	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (sq_yhxx.ygbh="+ygbh+") ";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+yhmc+"%')";
	}
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+bianhao+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (sq_yhxx.sfzh='"+sfzh+"')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";


	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh and sq_yhxx.sfzszg in('N','Y')";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_yhxxCxList.jsp","SelectCxSq_yhxx.jsp","","InsertRs_czsq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ygbh","yhmc","bianhao","sfzh","xzzwbm","lzrq","lzyy","dwbh","ssfgs","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
	pageObj.setEditStr("辞职申请");

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
  <B><font size="3">辞职申请</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">员工序号</td>
	<td  width="13%">员工名称</td>
	<td  width="13%">工号</td>
	<td  width="19%">身份证号</td>
	<td  width="14%">行政职务</td>
	<td  width="16%">所属部门</td>
	<td  width="13%">所属公司</td>
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