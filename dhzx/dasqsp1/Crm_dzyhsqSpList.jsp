<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_dzyhsq_khbh=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_sjs=null;
	String crm_dzyhsq_sqr=null;
	String crm_dzyhsq_sqsj=null;
	String crm_dzyhsq_sfsqqtyh=null;
	String crm_dzyhsq_lrr=null;
	String crm_dzyhsq_spbz=null;

	String sqzkl=request.getParameter("sqzkl");
	if (sqzkl!=null)
	{
		if (!(sqzkl.equals("")))	wheresql+=" and  (crm_dzyhsq.sqzkl>='"+sqzkl+"')";
	}
	sqzkl=request.getParameter("sqzkl2");
	if (sqzkl!=null)
	{
		if (!(sqzkl.equals("")))	wheresql+=" and  (crm_dzyhsq.sqzkl<='"+sqzkl+"')";
	}


	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";
	String crm_zxkhxx_zxdm=null;
	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (crm_zxkhxx_zxdm!=null)
	{
		crm_zxkhxx_zxdm=cf.GB2Uni(crm_zxkhxx_zxdm);
		if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";
	}

	crm_dzyhsq_khbh=request.getParameter("crm_dzyhsq_khbh");
	if (crm_dzyhsq_khbh!=null)
	{
		crm_dzyhsq_khbh=cf.GB2Uni(crm_dzyhsq_khbh);
		if (!(crm_dzyhsq_khbh.equals("")))	wheresql+=" and  (crm_dzyhsq.khbh='"+crm_dzyhsq_khbh+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm+"%')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz+"%')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	crm_dzyhsq_sqr=request.getParameter("crm_dzyhsq_sqr");
	if (crm_dzyhsq_sqr!=null)
	{
		crm_dzyhsq_sqr=cf.GB2Uni(crm_dzyhsq_sqr);
		if (!(crm_dzyhsq_sqr.equals("")))	wheresql+=" and  (crm_dzyhsq.sqr='"+crm_dzyhsq_sqr+"')";
	}
	crm_dzyhsq_sqsj=request.getParameter("crm_dzyhsq_sqsj");
	if (crm_dzyhsq_sqsj!=null)
	{
		crm_dzyhsq_sqsj=crm_dzyhsq_sqsj.trim();
		if (!(crm_dzyhsq_sqsj.equals("")))	wheresql+="  and (crm_dzyhsq.sqsj>=TO_DATE('"+crm_dzyhsq_sqsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_sqsj=request.getParameter("crm_dzyhsq_sqsj2");
	if (crm_dzyhsq_sqsj!=null)
	{
		crm_dzyhsq_sqsj=crm_dzyhsq_sqsj.trim();
		if (!(crm_dzyhsq_sqsj.equals("")))	wheresql+="  and (crm_dzyhsq.sqsj<=TO_DATE('"+crm_dzyhsq_sqsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_sfsqqtyh=request.getParameter("crm_dzyhsq_sfsqqtyh");
	if (crm_dzyhsq_sfsqqtyh!=null)
	{
		crm_dzyhsq_sfsqqtyh=cf.GB2Uni(crm_dzyhsq_sfsqqtyh);
		if (!(crm_dzyhsq_sfsqqtyh.equals("")))	wheresql+=" and  (crm_dzyhsq.sfsqqtyh='"+crm_dzyhsq_sfsqqtyh+"')";
	}
	crm_dzyhsq_lrr=request.getParameter("crm_dzyhsq_lrr");
	if (crm_dzyhsq_lrr!=null)
	{
		crm_dzyhsq_lrr=cf.GB2Uni(crm_dzyhsq_lrr);
		if (!(crm_dzyhsq_lrr.equals("")))	wheresql+=" and  (crm_dzyhsq.lrr='"+crm_dzyhsq_lrr+"')";
	}
	crm_dzyhsq_spbz=request.getParameter("crm_dzyhsq_spbz");
	if (crm_dzyhsq_spbz!=null)
	{
		crm_dzyhsq_spbz=cf.GB2Uni(crm_dzyhsq_spbz);
		if (!(crm_dzyhsq_spbz.equals("")))	wheresql+=" and  (crm_dzyhsq.spbz='"+crm_dzyhsq_spbz+"')";
	}
	ls_sql="SELECT DECODE(crm_dzyhsq.spbz,'1','未审批','2','已审批'),crm_zxkhxx.khxm,crm_dzyhsq.sqzkl,crm_dzyhsq.sqzjxzkl,DECODE(crm_dzyhsq.zklx,'1','全额','2','单项'), DECODE(crm_dzyhsq.sfsqqtyh,'Y','是','N','否'),crm_dzyhsq.sqqtyhnr,crm_dzyhsq.sqyysm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,b.dwmc zxdm,crm_dzyhsq.sqr,crm_dzyhsq.sqsj,crm_dzyhsq.lrr,crm_dzyhsq.lrsj,crm_dzyhsq.khbh ";
	ls_sql+=" FROM crm_dzyhsq,crm_zxkhxx,sq_dwxx b ";
    ls_sql+=" where crm_dzyhsq.khbh=crm_zxkhxx.khbh and crm_zxkhxx.zxdm=b.dwbh(+)";
    ls_sql+=" and crm_dzyhsq.zklx='2'";//1：全额折扣；2：单项折扣
    ls_sql+=wheresql;
    ls_sql+=" order by crm_dzyhsq.sqsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_dzyhsqSpList.jsp","SelectSpCrm_dzyhsq.jsp","","SpCrm_dzyhsq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_sjs","crm_zxkhxx_zxdm","crm_dzyhsq_sqr","crm_dzyhsq_sqsj","crm_dzyhsq_sqzkl","crm_dzyhsq_sfsqqtyh","crm_dzyhsq_sqqtyhnr","crm_dzyhsq_sqyysm","crm_dzyhsq_lrr","crm_dzyhsq_lrsj","sq_dwxx_dwmc","crm_dzyhsq_spbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审批");
//设置按钮参数
	String[] buttonName={"批量同意","批量不同意"};//按钮的显示名称
	String[] buttonLink={"PlSpCrm_dzyhsq.jsp?spjg=1","PlSpCrm_dzyhsq.jsp?spjg=2"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.alignStr[6]="align='left'";
	pageObj.alignStr[7]="align='left'";
	pageObj.alignStr[8]="align='left'";
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
  <B><font size="3">打折优惠申请--审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC" align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">审批标志</td>
	<td  width="4%">客户姓名</td>
	<td  width="4%">直接费合同折扣</td>
	<td  width="4%">直接费增减项折扣</td>
	<td  width="3%">折扣类型</td>
	<td  width="4%">是否申请其它优惠</td>
	<td  width="14%">申请其它优惠内容</td>
	<td  width="17%">申请原因说明</td>
	<td  width="14%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="8%">咨询店面</td>
	<td  width="4%">申请人</td>
	<td  width="4%">申请时间</td>
	<td  width="4%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">客户编号</td>
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