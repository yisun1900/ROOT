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
	String crm_hthxx_hth=null;
	String crm_hthxx_dwbh=null;
	String crm_hthxx_sqr=null;
	String crm_hthxx_sqsj=null;
	String crm_hthxx_khbh=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_sjs=null;
	String crm_hthxx_sybz=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_hthxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssfgs='"+fgs+"'))";

	crm_hthxx_hth=request.getParameter("crm_hthxx_hth");
	if (crm_hthxx_hth!=null)
	{
		crm_hthxx_hth=cf.GB2Uni(crm_hthxx_hth);
		if (!(crm_hthxx_hth.equals("")))	wheresql+=" and  (crm_hthxx.hth='"+crm_hthxx_hth+"')";
	}

	crm_hthxx_dwbh=request.getParameter("crm_hthxx_dwbh");
	if (!(crm_hthxx_dwbh.equals("")))	wheresql+=" and  (crm_hthxx.dwbh='"+crm_hthxx_dwbh+"')";

	crm_hthxx_sqr=request.getParameter("crm_hthxx_sqr");
	if (crm_hthxx_sqr!=null)
	{
		crm_hthxx_sqr=cf.GB2Uni(crm_hthxx_sqr);
		if (!(crm_hthxx_sqr.equals("")))	wheresql+=" and  (crm_hthxx.sqr='"+crm_hthxx_sqr+"')";
	}
	crm_hthxx_sqsj=request.getParameter("crm_hthxx_sqsj");
	if (crm_hthxx_sqsj!=null)
	{
		crm_hthxx_sqsj=crm_hthxx_sqsj.trim();
		if (!(crm_hthxx_sqsj.equals("")))	wheresql+="  and (crm_hthxx.sqsj>=TO_DATE('"+crm_hthxx_sqsj+"','YYYY/MM/DD'))";
	}
	crm_hthxx_sqsj=request.getParameter("crm_hthxx_sqsj2");
	if (crm_hthxx_sqsj!=null)
	{
		crm_hthxx_sqsj=crm_hthxx_sqsj.trim();
		if (!(crm_hthxx_sqsj.equals("")))	wheresql+="  and (crm_hthxx.sqsj<=TO_DATE('"+crm_hthxx_sqsj+"','YYYY/MM/DD'))";
	}
	crm_hthxx_khbh=request.getParameter("crm_hthxx_khbh");
	if (crm_hthxx_khbh!=null)
	{
		crm_hthxx_khbh=cf.GB2Uni(crm_hthxx_khbh);
		if (!(crm_hthxx_khbh.equals("")))	wheresql+=" and  (crm_hthxx.khbh='"+crm_hthxx_khbh+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+crm_zxkhxx_fwdz+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	crm_hthxx_sybz=request.getParameter("crm_hthxx_sybz");
	if (crm_hthxx_sybz!=null)
	{
		crm_hthxx_sybz=cf.GB2Uni(crm_hthxx_sybz);
		if (!(crm_hthxx_sybz.equals("")))	wheresql+=" and  (crm_hthxx.sybz='"+crm_hthxx_sybz+"')";
	}
	ls_sql="SELECT crm_hthxx.hth,sq_dwxx.dwmc,crm_hthxx.sqr,crm_hthxx.sqsj,crm_hthxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs, DECODE(crm_hthxx.sybz,'Y','已使用','N','未使用')  ";
	ls_sql+=" FROM sq_dwxx,crm_zxkhxx,crm_hthxx  ";
    ls_sql+=" where crm_hthxx.dwbh=sq_dwxx.dwbh and crm_hthxx.khbh=crm_zxkhxx.khbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_hthxx.dwbh in(select dwbh from sq_dwxx where ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') )";
	}
	else
	{
		ls_sql+=" and crm_hthxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_hthxx.sqsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_hthxxCxList.jsp","SelectCxCrm_hthxx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hth","sq_dwxx_dwmc","crm_hthxx_sqr","crm_hthxx_sqsj","crm_hthxx_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_sjs","crm_hthxx_sybz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hth"};
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
	<td  width="9%">合同号</td>
	<td  width="12%">申请单位</td>
	<td  width="6%">申请人</td>
	<td  width="11%">申请时间</td>
	<td  width="9%">客户编号</td>
	<td  width="8%">客户姓名</td>
	<td  width="28%">房屋地址</td>
	<td  width="8%">设计师</td>
	<td  width="9%">使用标志</td>
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