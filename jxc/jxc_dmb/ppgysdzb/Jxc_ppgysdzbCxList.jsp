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
	String ppbm=null;
	String ppmc=null;
	String gysbm=null;
	String gysmc=null;

	String fgs=null;
	fgs=request.getParameter("ssfgs");
	if (!(fgs.equals("")))	wheresql+=" and  (jxc_ppgysdzb.ssfgs='"+fgs+"')";
	if (!(fgs.equals("")))	wheresql+=" and  (jxc_gyssqfgs.ssfgs='"+fgs+"')";
	
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=ppbm.trim();
		if (!(ppbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.ppbm="+ppbm+") ";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.ppmc like '%"+ppmc+"%')";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.gysbm="+gysbm+") ";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.gysmc like '%"+gysmc+"%')";
	}


	ls_sql="SELECT distinct jxc_ppgysdzb.ppbm,jxc_ppgysdzb.ppmc,jxc_ppgysdzb.gysbm,jxc_ppgysdzb.gysmc,dwmc ";
	ls_sql+=" FROM jxc_ppgysdzb,jxc_ppxx,jxc_ppgysdzb,jxc_gysxx,jxc_gyssqfgs,sq_dwxx  ";
    ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm";
    ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_gysxx.gysbm=jxc_gyssqfgs.gysbm";
    ls_sql+=" and jxc_gyssqfgs.ssfgs=sq_dwxx.dwbh ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		ls_sql+=" and jxc_gyssqfgs.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		ls_sql+=" and jxc_gyssqfgs.ssfgs in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by dwmc,jxc_ppgysdzb.ppbm,jxc_ppgysdzb.gysbm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_ppgysdzbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ppbm","ppmc","gysbm","gysmc","dqbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ppbm","gysbm"};
	pageObj.setKey(keyName);

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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">子品牌编码</td>
	<td  width="32%">子品牌名称</td>
	<td  width="10%">供应商编码</td>
	<td  width="32%">供应商名称</td>
	<td  width="16%">供应商所属分公司</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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