<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_zxkhywyxhjl_khbh=null;
	String crm_zxkhywyxhjl_ssfgs=null;
	String crm_zxkhywyxhjl_khxm=null;
	String crm_zxkhywyxhjl_oldywy=null;
	String crm_zxkhywyxhjl_newywy=null;
	String crm_zxkhywyxhjl_xgr=null;
	String crm_zxkhywyxhjl_xgsj=null;
	crm_zxkhywyxhjl_khbh=request.getParameter("crm_zxkhywyxhjl_khbh");
	if (crm_zxkhywyxhjl_khbh!=null)
	{
		crm_zxkhywyxhjl_khbh=cf.GB2Uni(crm_zxkhywyxhjl_khbh);
		if (!(crm_zxkhywyxhjl_khbh.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.khbh='"+crm_zxkhywyxhjl_khbh+"')";
	}
	crm_zxkhywyxhjl_ssfgs=request.getParameter("crm_zxkhywyxhjl_ssfgs");
	if (crm_zxkhywyxhjl_ssfgs!=null)
	{
		crm_zxkhywyxhjl_ssfgs=cf.GB2Uni(crm_zxkhywyxhjl_ssfgs);
		if (!(crm_zxkhywyxhjl_ssfgs.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.ssfgs='"+crm_zxkhywyxhjl_ssfgs+"')";
	}
	crm_zxkhywyxhjl_khxm=request.getParameter("crm_zxkhywyxhjl_khxm");
	if (crm_zxkhywyxhjl_khxm!=null)
	{
		crm_zxkhywyxhjl_khxm=cf.GB2Uni(crm_zxkhywyxhjl_khxm);
		if (!(crm_zxkhywyxhjl_khxm.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.khxm='"+crm_zxkhywyxhjl_khxm+"')";
	}
	crm_zxkhywyxhjl_oldywy=request.getParameter("crm_zxkhywyxhjl_oldywy");
	if (crm_zxkhywyxhjl_oldywy!=null)
	{
		crm_zxkhywyxhjl_oldywy=cf.GB2Uni(crm_zxkhywyxhjl_oldywy);
		if (!(crm_zxkhywyxhjl_oldywy.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.oldywy='"+crm_zxkhywyxhjl_oldywy+"')";
	}
	crm_zxkhywyxhjl_newywy=request.getParameter("crm_zxkhywyxhjl_newywy");
	if (crm_zxkhywyxhjl_newywy!=null)
	{
		crm_zxkhywyxhjl_newywy=cf.GB2Uni(crm_zxkhywyxhjl_newywy);
		if (!(crm_zxkhywyxhjl_newywy.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.newywy='"+crm_zxkhywyxhjl_newywy+"')";
	}
	crm_zxkhywyxhjl_xgr=request.getParameter("crm_zxkhywyxhjl_xgr");
	if (crm_zxkhywyxhjl_xgr!=null)
	{
		crm_zxkhywyxhjl_xgr=cf.GB2Uni(crm_zxkhywyxhjl_xgr);
		if (!(crm_zxkhywyxhjl_xgr.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.xgr='"+crm_zxkhywyxhjl_xgr+"')";
	}
	crm_zxkhywyxhjl_xgsj=request.getParameter("crm_zxkhywyxhjl_xgsj");
	if (crm_zxkhywyxhjl_xgsj!=null)
	{
		crm_zxkhywyxhjl_xgsj=crm_zxkhywyxhjl_xgsj.trim();
		if (!(crm_zxkhywyxhjl_xgsj.equals("")))	wheresql+="  and (crm_zxkhywyxhjl.xgsj>=TO_DATE('"+crm_zxkhywyxhjl_xgsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhywyxhjl_xgsj=request.getParameter("crm_zxkhywyxhjl_xgsj2");
	if (crm_zxkhywyxhjl_xgsj!=null)
	{
		crm_zxkhywyxhjl_xgsj=crm_zxkhywyxhjl_xgsj.trim();
		if (!(crm_zxkhywyxhjl_xgsj.equals("")))	wheresql+="  and (crm_zxkhywyxhjl.xgsj<=TO_DATE('"+crm_zxkhywyxhjl_xgsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_zxkhywyxhjl.khbh,crm_zxkhywyxhjl.khxm,sq_dwxx.dwmc,crm_zxkhywyxhjl.oldywy,crm_zxkhywyxhjl.newywy,crm_zxkhywyxhjl.xgr,crm_zxkhywyxhjl.xgsj,crm_zxkhywyxhjl.xgsm  ";
	ls_sql+=" FROM sq_dwxx,crm_zxkhywyxhjl  ";
    ls_sql+=" where crm_zxkhywyxhjl.ssfgs=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhywyxhjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhywyxhjl.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhywyxhjl.xgsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhywyxhjlCxList.jsp","SelectCxCrm_zxkhywyxhjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setDateType("long");
/*
//设置显示列
	String[] disColName={"khbh","sq_dwxx_dwmc","crm_zxkhywyxhjl_khxm","crm_zxkhywyxhjl_oldywy","crm_zxkhywyxhjl_newywy","crm_zxkhywyxhjl_xgr","xgsj","crm_zxkhywyxhjl_xgsm"};
	pageObj.setDisColName(disColName);
*/

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询修改记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">客户编号</td>
	<td  width="7%">客户姓名</td>
	<td  width="9%">所属分公司</td>
	<td  width="7%">原业务员</td>
	<td  width="7%">新业务员</td>
	<td  width="7%">修改人</td>
	<td  width="15%">修改时间</td>
	<td  width="41%">修改说明</td>
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