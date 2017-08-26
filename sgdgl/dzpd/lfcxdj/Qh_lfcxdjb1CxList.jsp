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
	String qh_lfcxdjb_zpnr=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_sjs=null;
	String qh_lfcxdjb_djrq=null;
	qh_lfcxdjb_zpnr=request.getParameter("qh_lfcxdjb_zpnr");
	if (qh_lfcxdjb_zpnr!=null)
	{
		qh_lfcxdjb_zpnr=cf.GB2Uni(qh_lfcxdjb_zpnr);
		if (!(qh_lfcxdjb_zpnr.equals("")))	wheresql+=" and  (qh_lfcxdjb.zpnr='"+qh_lfcxdjb_zpnr+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq>=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq2");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq<=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
		 if (yhjs.equals("A0")||yhjs.equals("A1"))
	{ 
		wheresql+=" and (1=1)";
	 }
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and (sq_dwxx.ssdw='"+ssfgs+"')";
	 }
	 else
	 {
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"')";
	 }
	ls_sql="SELECT ROWNUM,crm_zxkhxx.lfsj as qh_lfcxdjb_djrq,crm_zxkhxx.sjs as crm_zxkhxx_sjs ,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_jdjdj.lfdj,qh_lfcxdjb.zpnr as qh_lfcxdjb_zpnr ,qh_lfcxdjb.jsr as qh_lfcxdjb_jsr,qh_lfcxdjb.bz as qh_lfcxdjb_bz ";
	ls_sql+=" FROM crm_zxkhxx,crm_jdjdj,qh_lfcxdjb,sq_dwxx  ";
    ls_sql+=" where crm_zxkhxx.khbh=crm_jdjdj.khbh(+) and qh_lfcxdjb.khbh=crm_zxkhxx.khbh and (sq_dwxx.dwbh(+)=crm_zxkhxx.zxdm)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"djxh","qh_lfcxdjb_khbh","qh_lfcxdjb_zpnr","qh_lfcxdjb_jsr","crm_zxkhxx_khxm","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","qh_lfcxdjb_djrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djxh"};
	pageObj.setKey(keyName);
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
  <B><font size="3">量房促销品发放统计表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="5%">量房日期</td>
	<td  width="6%">设计师</td>
	<td  width="6%">客户</td>
	<td  width="8%">联系电话</td>
	<td  width="8%">定金</td>
	<td  width="10%">赠品内容</td>
	<td  width="7%">经手人</td>
	<td  width="12%">备注</td>
	
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