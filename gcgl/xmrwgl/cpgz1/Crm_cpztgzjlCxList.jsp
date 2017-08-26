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
	String crm_cpztgzjl_khbh=null;
	String crm_cpztgzjl_cpflbm=null;
	String crm_cpztgzjl_cpztbm=null;
	String crm_cpztgzjl_fssj=null;
	String crm_cpztgzjl_zrr=null;
	String crm_cpztgzjl_lrr=null;
	String crm_cpztgzjl_lrsj=null;
	String crm_cpztgzjl_lrbm=null;
	crm_cpztgzjl_khbh=request.getParameter("crm_cpztgzjl_khbh");
	if (crm_cpztgzjl_khbh!=null)
	{
		crm_cpztgzjl_khbh=cf.GB2Uni(crm_cpztgzjl_khbh);
		if (!(crm_cpztgzjl_khbh.equals("")))	wheresql+=" and  (crm_cpztgzjl.khbh='"+crm_cpztgzjl_khbh+"')";
	}
	crm_cpztgzjl_cpflbm=request.getParameter("crm_cpztgzjl_cpflbm");
	if (crm_cpztgzjl_cpflbm!=null)
	{
		crm_cpztgzjl_cpflbm=cf.GB2Uni(crm_cpztgzjl_cpflbm);
		if (!(crm_cpztgzjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.cpflbm='"+crm_cpztgzjl_cpflbm+"')";
	}
	crm_cpztgzjl_cpztbm=request.getParameter("crm_cpztgzjl_cpztbm");
	if (crm_cpztgzjl_cpztbm!=null)
	{
		crm_cpztgzjl_cpztbm=cf.GB2Uni(crm_cpztgzjl_cpztbm);
		if (!(crm_cpztgzjl_cpztbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.cpztbm='"+crm_cpztgzjl_cpztbm+"')";
	}
	crm_cpztgzjl_fssj=request.getParameter("crm_cpztgzjl_fssj");
	if (crm_cpztgzjl_fssj!=null)
	{
		crm_cpztgzjl_fssj=crm_cpztgzjl_fssj.trim();
		if (!(crm_cpztgzjl_fssj.equals("")))	wheresql+="  and (crm_cpztgzjl.fssj=TO_DATE('"+crm_cpztgzjl_fssj+"','YYYY/MM/DD'))";
	}
	crm_cpztgzjl_zrr=request.getParameter("crm_cpztgzjl_zrr");
	if (crm_cpztgzjl_zrr!=null)
	{
		crm_cpztgzjl_zrr=cf.GB2Uni(crm_cpztgzjl_zrr);
		if (!(crm_cpztgzjl_zrr.equals("")))	wheresql+=" and  (crm_cpztgzjl.zrr='"+crm_cpztgzjl_zrr+"')";
	}
	crm_cpztgzjl_lrr=request.getParameter("crm_cpztgzjl_lrr");
	if (crm_cpztgzjl_lrr!=null)
	{
		crm_cpztgzjl_lrr=cf.GB2Uni(crm_cpztgzjl_lrr);
		if (!(crm_cpztgzjl_lrr.equals("")))	wheresql+=" and  (crm_cpztgzjl.lrr='"+crm_cpztgzjl_lrr+"')";
	}
	crm_cpztgzjl_lrsj=request.getParameter("crm_cpztgzjl_lrsj");
	if (crm_cpztgzjl_lrsj!=null)
	{
		crm_cpztgzjl_lrsj=crm_cpztgzjl_lrsj.trim();
		if (!(crm_cpztgzjl_lrsj.equals("")))	wheresql+="  and (crm_cpztgzjl.lrsj=TO_DATE('"+crm_cpztgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpztgzjl_lrbm=request.getParameter("crm_cpztgzjl_lrbm");
	if (crm_cpztgzjl_lrbm!=null)
	{
		crm_cpztgzjl_lrbm=cf.GB2Uni(crm_cpztgzjl_lrbm);
		if (!(crm_cpztgzjl_lrbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.lrbm='"+crm_cpztgzjl_lrbm+"')";
	}
	ls_sql="SELECT crm_cpztgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_cpztgzjl.cpflbm,cpflmc,crm_cpztgzjl.cpztbm,cpztmc,crm_cpztgzjl.fssj,crm_cpztgzjl.zrr,crm_cpztgzjl.lrr,crm_cpztgzjl.lrsj,dwmc,crm_cpztgzjl.bz";
	ls_sql+=" FROM crm_cpztgzjl,dm_cpztbm,dm_cpflbm,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_cpztgzjl.cpztbm=dm_cpztbm.cpztbm and crm_cpztgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpztgzjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cpztgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_cpztgzjl.khbh,crm_cpztgzjl.cpflbm,crm_cpztgzjl.fssj ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_cpztgzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"khbh","khxm","fwdz","hth","sjs","cpflmc","cpztmc","fssj","zrr","lrr","lrsj","dwmc","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"khbh","cpflbm","cpztbm"};
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
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("cpflmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="5%">设计师</td>
	<td  width="11%">产品分类</td>
	<td  width="7%">产品状态</td>
	<td  width="6%">发生时间</td>
	<td  width="4%">责任人</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="9%">录入部门</td>
	<td  width="16%">备注</td>
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