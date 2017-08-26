<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
%>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String crm_zxkhxx_lfsj=null;
	String crm_zxkhxx_zxdm=null;
	String crm_zxkhxx_zxdjbm=null;
	String sq_dwxx_dwmc=null;
//**********************************
	//根据用户属性，附加分公司查询条件
	//********************************
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (sq_dwxx.dwlx='F1' or sq_dwxx.dwlx='F2') ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+=" and (sq_dwxx.dwlx='F1' or sq_dwxx.dwlx='F2') and sq_dwxx.ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}

	crm_zxkhxx_lfsj=request.getParameter("crm_zxkhxx_lfsj");
	if (crm_zxkhxx_lfsj!=null)
	{
		crm_zxkhxx_lfsj=crm_zxkhxx_lfsj.trim();
		if (!(crm_zxkhxx_lfsj.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj>=TO_DATE('"+crm_zxkhxx_lfsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lfsj=request.getParameter("crm_zxkhxx_lfsj2");
	if (crm_zxkhxx_lfsj!=null)
	{
		crm_zxkhxx_lfsj=crm_zxkhxx_lfsj.trim();
		if (!(crm_zxkhxx_lfsj.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj<=TO_DATE('"+crm_zxkhxx_lfsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (crm_zxkhxx_zxdm!=null)
	{
		crm_zxkhxx_zxdm=cf.GB2Uni(crm_zxkhxx_zxdm);
		if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";
	}
	crm_zxkhxx_zxdjbm=request.getParameter("crm_zxkhxx_zxdjbm");
	if (crm_zxkhxx_zxdjbm!=null)
	{
		crm_zxkhxx_zxdjbm=cf.GB2Uni(crm_zxkhxx_zxdjbm);
		if (!(crm_zxkhxx_zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+crm_zxkhxx_zxdjbm+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc='"+sq_dwxx_dwmc+"')";
	}
	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.ywy as crm_zxkhxx_ywy,crm_zxkhxx.sjs as crm_zxkhxx_sjs,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_zxkhxx.lfsj as crm_zxkhxx_lfsj";
	
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx  ";
    ls_sql+=" where crm_zxkhxx.zxdjbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
	ls_sql+="  order by sq_dwxx.dwbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","InsertQh_lfcxdjb1.jsp");
	pageObj.setPageRow(4000);
/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","crm_zxkhxx_lfsj","crm_zxkhxx_zxdm","crm_zxkhxx_zxdjbm","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("登记");
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">营销部人员量房统计表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	
	<td  width="4%">登记</td>
	<td  width="5%">客户编号</td>
	<td  width="5%">营销代表</td>
	<td  width="5%">设计师</td>
	<td  width="6%">所在店面</td>
	<td  width="4%">客户姓名</td>
	<td  width="9%">新居地址</td>
	<td  width="4%">联系电话</td>
	<td  width="4%">量房时间</td>
	
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