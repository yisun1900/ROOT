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
	String crm_yglkgsjl_jlh=null;
	String crm_yglkgsjl_ygbh=null;
	String crm_yglkgsjl_yhmc=null;
	String crm_yglkgsjl_ygbm=null;
	String crm_yglkgsjl_rylx=null;
	String crm_yglkgsjl_jhlkrq=null;
	String crm_yglkgsjl_jhlksj=null;
	String crm_yglkgsjl_jhfhsj=null;
	String crm_yglkgsjl_lkgsmd=null;
	String crm_yglkgsjl_sjlksj=null;
	String crm_yglkgsjl_lklrr=null;
	String crm_yglkgsjl_lklrsj=null;
	String crm_yglkgsjl_sjfhsj=null;
	String crm_yglkgsjl_fhlrr=null;
	String crm_yglkgsjl_fhlrsj=null;
	String crm_yglkgsjl_qksfss=null;
	String crm_yglkgsjl_shr=null;
	String crm_yglkgsjl_shsj=null;
	String crm_yglkgsjl_zt=null;
	String crm_yglkgsjl_lrr=null;
	String crm_yglkgsjl_lrsj=null;
	String crm_yglkgsjl_lrbm=null;
	String crm_yglkgsjl_ssfgs=null;
	crm_yglkgsjl_jlh=request.getParameter("crm_yglkgsjl_jlh");
	if (crm_yglkgsjl_jlh!=null)
	{
		crm_yglkgsjl_jlh=crm_yglkgsjl_jlh.trim();
		if (!(crm_yglkgsjl_jlh.equals("")))	wheresql+=" and (crm_yglkgsjl.jlh="+crm_yglkgsjl_jlh+") ";
	}
	crm_yglkgsjl_ygbh=request.getParameter("crm_yglkgsjl_ygbh");
	if (crm_yglkgsjl_ygbh!=null)
	{
		crm_yglkgsjl_ygbh=crm_yglkgsjl_ygbh.trim();
		if (!(crm_yglkgsjl_ygbh.equals("")))	wheresql+=" and (crm_yglkgsjl.ygbh="+crm_yglkgsjl_ygbh+") ";
	}
	crm_yglkgsjl_yhmc=request.getParameter("crm_yglkgsjl_yhmc");
	if (crm_yglkgsjl_yhmc!=null)
	{
		crm_yglkgsjl_yhmc=cf.GB2Uni(crm_yglkgsjl_yhmc);
		if (!(crm_yglkgsjl_yhmc.equals("")))	wheresql+=" and  (crm_yglkgsjl.yhmc='"+crm_yglkgsjl_yhmc+"')";
	}
	crm_yglkgsjl_ygbm=request.getParameter("crm_yglkgsjl_ygbm");
	if (crm_yglkgsjl_ygbm!=null)
	{
		crm_yglkgsjl_ygbm=cf.GB2Uni(crm_yglkgsjl_ygbm);
		if (!(crm_yglkgsjl_ygbm.equals("")))	wheresql+=" and  (crm_yglkgsjl.ygbm='"+crm_yglkgsjl_ygbm+"')";
	}
	crm_yglkgsjl_rylx=request.getParameter("crm_yglkgsjl_rylx");
	if (crm_yglkgsjl_rylx!=null)
	{
		crm_yglkgsjl_rylx=cf.GB2Uni(crm_yglkgsjl_rylx);
		if (!(crm_yglkgsjl_rylx.equals("")))	wheresql+=" and  (crm_yglkgsjl.rylx='"+crm_yglkgsjl_rylx+"')";
	}
	crm_yglkgsjl_jhlkrq=request.getParameter("crm_yglkgsjl_jhlkrq");
	if (crm_yglkgsjl_jhlkrq!=null)
	{
		crm_yglkgsjl_jhlkrq=crm_yglkgsjl_jhlkrq.trim();
		if (!(crm_yglkgsjl_jhlkrq.equals("")))	wheresql+="  and (crm_yglkgsjl.jhlkrq>=TO_DATE('"+crm_yglkgsjl_jhlkrq+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_jhlkrq=request.getParameter("crm_yglkgsjl_jhlkrq2");
	if (crm_yglkgsjl_jhlkrq!=null)
	{
		crm_yglkgsjl_jhlkrq=crm_yglkgsjl_jhlkrq.trim();
		if (!(crm_yglkgsjl_jhlkrq.equals("")))	wheresql+="  and (crm_yglkgsjl.jhlkrq<=TO_DATE('"+crm_yglkgsjl_jhlkrq+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_jhlksj=request.getParameter("crm_yglkgsjl_jhlksj");
	if (crm_yglkgsjl_jhlksj!=null)
	{
		crm_yglkgsjl_jhlksj=crm_yglkgsjl_jhlksj.trim();
		if (!(crm_yglkgsjl_jhlksj.equals("")))	wheresql+=" and  (crm_yglkgsjl.jhlksj="+crm_yglkgsjl_jhlksj+") ";
	}
	crm_yglkgsjl_jhfhsj=request.getParameter("crm_yglkgsjl_jhfhsj");
	if (crm_yglkgsjl_jhfhsj!=null)
	{
		crm_yglkgsjl_jhfhsj=crm_yglkgsjl_jhfhsj.trim();
		if (!(crm_yglkgsjl_jhfhsj.equals("")))	wheresql+=" and  (crm_yglkgsjl.jhfhsj="+crm_yglkgsjl_jhfhsj+") ";
	}
	crm_yglkgsjl_lkgsmd=request.getParameter("crm_yglkgsjl_lkgsmd");
	if (crm_yglkgsjl_lkgsmd!=null)
	{
		crm_yglkgsjl_lkgsmd=cf.GB2Uni(crm_yglkgsjl_lkgsmd);
		if (!(crm_yglkgsjl_lkgsmd.equals("")))	wheresql+=" and  (crm_yglkgsjl.lkgsmd='"+crm_yglkgsjl_lkgsmd+"')";
	}
	crm_yglkgsjl_sjlksj=request.getParameter("crm_yglkgsjl_sjlksj");
	if (crm_yglkgsjl_sjlksj!=null)
	{
		crm_yglkgsjl_sjlksj=crm_yglkgsjl_sjlksj.trim();
		if (!(crm_yglkgsjl_sjlksj.equals("")))	wheresql+=" and  (crm_yglkgsjl.sjlksj='"+crm_yglkgsjl_sjlksj+"') ";
	}
	crm_yglkgsjl_lklrr=request.getParameter("crm_yglkgsjl_lklrr");
	if (crm_yglkgsjl_lklrr!=null)
	{
		crm_yglkgsjl_lklrr=cf.GB2Uni(crm_yglkgsjl_lklrr);
		if (!(crm_yglkgsjl_lklrr.equals("")))	wheresql+=" and  (crm_yglkgsjl.lklrr='"+crm_yglkgsjl_lklrr+"')";
	}
	crm_yglkgsjl_lklrsj=request.getParameter("crm_yglkgsjl_lklrsj");
	if (crm_yglkgsjl_lklrsj!=null)
	{
		crm_yglkgsjl_lklrsj=crm_yglkgsjl_lklrsj.trim();
		if (!(crm_yglkgsjl_lklrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lklrsj>=TO_DATE('"+crm_yglkgsjl_lklrsj+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_lklrsj=request.getParameter("crm_yglkgsjl_lklrsj2");
	if (crm_yglkgsjl_lklrsj!=null)
	{
		crm_yglkgsjl_lklrsj=crm_yglkgsjl_lklrsj.trim();
		if (!(crm_yglkgsjl_lklrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lklrsj<=TO_DATE('"+crm_yglkgsjl_lklrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	crm_yglkgsjl_sjfhsj=request.getParameter("crm_yglkgsjl_sjfhsj");
	if (crm_yglkgsjl_sjfhsj!=null)
	{
		crm_yglkgsjl_sjfhsj=crm_yglkgsjl_sjfhsj.trim();
		if (!(crm_yglkgsjl_sjfhsj.equals("")))	wheresql+=" and  (crm_yglkgsjl.sjfhsj='"+crm_yglkgsjl_sjfhsj+"') ";
	}
	crm_yglkgsjl_fhlrr=request.getParameter("crm_yglkgsjl_fhlrr");
	if (crm_yglkgsjl_fhlrr!=null)
	{
		crm_yglkgsjl_fhlrr=cf.GB2Uni(crm_yglkgsjl_fhlrr);
		if (!(crm_yglkgsjl_fhlrr.equals("")))	wheresql+=" and  (crm_yglkgsjl.fhlrr='"+crm_yglkgsjl_fhlrr+"')";
	}
	crm_yglkgsjl_fhlrsj=request.getParameter("crm_yglkgsjl_fhlrsj");
	if (crm_yglkgsjl_fhlrsj!=null)
	{
		crm_yglkgsjl_fhlrsj=crm_yglkgsjl_fhlrsj.trim();
		if (!(crm_yglkgsjl_fhlrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.fhlrsj>=TO_DATE('"+crm_yglkgsjl_fhlrsj+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_fhlrsj=request.getParameter("crm_yglkgsjl_fhlrsj2");
	if (crm_yglkgsjl_fhlrsj!=null)
	{
		crm_yglkgsjl_fhlrsj=crm_yglkgsjl_fhlrsj.trim();
		if (!(crm_yglkgsjl_fhlrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.fhlrsj<=TO_DATE('"+crm_yglkgsjl_fhlrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	crm_yglkgsjl_qksfss=request.getParameter("crm_yglkgsjl_qksfss");
	if (crm_yglkgsjl_qksfss!=null)
	{
		crm_yglkgsjl_qksfss=cf.GB2Uni(crm_yglkgsjl_qksfss);
		if (!(crm_yglkgsjl_qksfss.equals("")))	wheresql+=" and  (crm_yglkgsjl.qksfss='"+crm_yglkgsjl_qksfss+"')";
	}
	crm_yglkgsjl_shr=request.getParameter("crm_yglkgsjl_shr");
	if (crm_yglkgsjl_shr!=null)
	{
		crm_yglkgsjl_shr=cf.GB2Uni(crm_yglkgsjl_shr);
		if (!(crm_yglkgsjl_shr.equals("")))	wheresql+=" and  (crm_yglkgsjl.shr='"+crm_yglkgsjl_shr+"')";
	}
	crm_yglkgsjl_shsj=request.getParameter("crm_yglkgsjl_shsj");
	if (crm_yglkgsjl_shsj!=null)
	{
		crm_yglkgsjl_shsj=crm_yglkgsjl_shsj.trim();
		if (!(crm_yglkgsjl_shsj.equals("")))	wheresql+="  and (crm_yglkgsjl.shsj>=TO_DATE('"+crm_yglkgsjl_shsj+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_shsj=request.getParameter("crm_yglkgsjl_shsj2");
	if (crm_yglkgsjl_shsj!=null)
	{
		crm_yglkgsjl_shsj=crm_yglkgsjl_shsj.trim();
		if (!(crm_yglkgsjl_shsj.equals("")))	wheresql+="  and (crm_yglkgsjl.shsj<=TO_DATE('"+crm_yglkgsjl_shsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	crm_yglkgsjl_zt=request.getParameter("crm_yglkgsjl_zt");
	if (crm_yglkgsjl_zt!=null)
	{
		crm_yglkgsjl_zt=cf.GB2Uni(crm_yglkgsjl_zt);
		if (!(crm_yglkgsjl_zt.equals("")))	wheresql+=" and  (crm_yglkgsjl.zt='"+crm_yglkgsjl_zt+"')";
	}
	crm_yglkgsjl_lrr=request.getParameter("crm_yglkgsjl_lrr");
	if (crm_yglkgsjl_lrr!=null)
	{
		crm_yglkgsjl_lrr=cf.GB2Uni(crm_yglkgsjl_lrr);
		if (!(crm_yglkgsjl_lrr.equals("")))	wheresql+=" and  (crm_yglkgsjl.lrr='"+crm_yglkgsjl_lrr+"')";
	}
	crm_yglkgsjl_lrsj=request.getParameter("crm_yglkgsjl_lrsj");
	if (crm_yglkgsjl_lrsj!=null)
	{
		crm_yglkgsjl_lrsj=crm_yglkgsjl_lrsj.trim();
		if (!(crm_yglkgsjl_lrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lrsj>=TO_DATE('"+crm_yglkgsjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_lrsj=request.getParameter("crm_yglkgsjl_lrsj2");
	if (crm_yglkgsjl_lrsj!=null)
	{
		crm_yglkgsjl_lrsj=crm_yglkgsjl_lrsj.trim();
		if (!(crm_yglkgsjl_lrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lrsj<=TO_DATE('"+crm_yglkgsjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	crm_yglkgsjl_lrbm=request.getParameter("crm_yglkgsjl_lrbm");
	if (crm_yglkgsjl_lrbm!=null)
	{
		crm_yglkgsjl_lrbm=cf.GB2Uni(crm_yglkgsjl_lrbm);
		if (!(crm_yglkgsjl_lrbm.equals("")))	wheresql+=" and  (crm_yglkgsjl.lrbm='"+crm_yglkgsjl_lrbm+"')";
	}
	crm_yglkgsjl_ssfgs=request.getParameter("crm_yglkgsjl_ssfgs");
	if (crm_yglkgsjl_ssfgs!=null)
	{
		crm_yglkgsjl_ssfgs=cf.GB2Uni(crm_yglkgsjl_ssfgs);
		if (!(crm_yglkgsjl_ssfgs.equals("")))	wheresql+=" and  (crm_yglkgsjl.ssfgs='"+crm_yglkgsjl_ssfgs+"')";
	}

	ls_sql="SELECT crm_yglkgsjl.jlh,DECODE(crm_yglkgsjl.zt,'1','录入申请','2','离开公司','3','返回公司','4','已审核'),crm_yglkgsjl.ygbh,crm_yglkgsjl.yhmc,b.dwmc ygbm,crm_yglkgsjl.rylx,TO_CHAR(crm_yglkgsjl.jhlkrq,'YYYY-MM-DD'),crm_yglkgsjl.jhlksj,crm_yglkgsjl.jhfhsj,crm_yglkgsjl.lkgsmd,crm_yglkgsjl.lkgssm,crm_yglkgsjl.sjlksj,crm_yglkgsjl.lklrr,crm_yglkgsjl.lklrsj,crm_yglkgsjl.sjfhsj,crm_yglkgsjl.fhlrr,crm_yglkgsjl.fhlrsj, DECODE(crm_yglkgsjl.qksfss,'Y','属实','N','不属实'),crm_yglkgsjl.shr,crm_yglkgsjl.shsj,crm_yglkgsjl.shsm,crm_yglkgsjl.lrr,crm_yglkgsjl.lrsj,a.dwmc fgs,crm_yglkgsjl.bz  ";
	ls_sql+=" FROM crm_yglkgsjl,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where crm_yglkgsjl.ssfgs=a.dwbh(+) and crm_yglkgsjl.ygbm=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_yglkgsjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_yglkgsjl.ygbm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jlh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_yglkgsjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setDateType("long");


//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_yglkgsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">员工离开公司－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">记录号</td>
	<td  width="3%">状态</td>
	<td  width="2%">员工编号</td>
	<td  width="3%">员工名称</td>
	<td  width="5%">员工部门</td>
	<td  width="2%">人员类型</td>
	<td  width="3%">计划离开日期</td>
	<td  width="2%">计划离开时间</td>
	<td  width="2%">计划返回时间</td>
	<td  width="4%">离开公司目的</td>
	<td  width="15%">离开公司说明</td>
	<td  width="2%">实际离开时间</td>
	<td  width="2%">离开录入人</td>
	<td  width="5%">离开录入时间</td>
	<td  width="2%">实际返回时间</td>
	<td  width="2%">返回录入人</td>
	<td  width="5%">返回录入时间</td>
	<td  width="2%">情况是否属实</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="6%">审核说明</td>
	<td  width="2%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="5%">所属公司</td>
	<td  width="23%">备注</td>
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