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
	String cw_cxhdxgjl_xgjlh=null;
	String cw_cxhdxgjl_khbh=null;
	String cw_cxhdxgjl_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_cxhdxgjl_fgsbh=null;
	String cw_cxhdxgjl_lrr=null;
	String cw_cxhdxgjl_lrsj=null;
	String cw_cxhdxgjl_lrbm=null;
	cw_cxhdxgjl_xgjlh=request.getParameter("cw_cxhdxgjl_xgjlh");
	if (cw_cxhdxgjl_xgjlh!=null)
	{
		cw_cxhdxgjl_xgjlh=cf.GB2Uni(cw_cxhdxgjl_xgjlh);
		if (!(cw_cxhdxgjl_xgjlh.equals("")))	wheresql+=" and  (cw_cxhdxgjl.xgjlh='"+cw_cxhdxgjl_xgjlh+"')";
	}
	cw_cxhdxgjl_khbh=request.getParameter("cw_cxhdxgjl_khbh");
	if (cw_cxhdxgjl_khbh!=null)
	{
		cw_cxhdxgjl_khbh=cf.GB2Uni(cw_cxhdxgjl_khbh);
		if (!(cw_cxhdxgjl_khbh.equals("")))	wheresql+=" and  (cw_cxhdxgjl.khbh='"+cw_cxhdxgjl_khbh+"')";
	}
	cw_cxhdxgjl_khxm=request.getParameter("cw_cxhdxgjl_khxm");
	if (cw_cxhdxgjl_khxm!=null)
	{
		cw_cxhdxgjl_khxm=cf.GB2Uni(cw_cxhdxgjl_khxm);
		if (!(cw_cxhdxgjl_khxm.equals("")))	wheresql+=" and  (cw_cxhdxgjl.khxm='"+cw_cxhdxgjl_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	cw_cxhdxgjl_fgsbh=request.getParameter("cw_cxhdxgjl_fgsbh");
	if (cw_cxhdxgjl_fgsbh!=null)
	{
		cw_cxhdxgjl_fgsbh=cf.GB2Uni(cw_cxhdxgjl_fgsbh);
		if (!(cw_cxhdxgjl_fgsbh.equals("")))	wheresql+=" and  (cw_cxhdxgjl.fgsbh='"+cw_cxhdxgjl_fgsbh+"')";
	}
	cw_cxhdxgjl_lrr=request.getParameter("cw_cxhdxgjl_lrr");
	if (cw_cxhdxgjl_lrr!=null)
	{
		cw_cxhdxgjl_lrr=cf.GB2Uni(cw_cxhdxgjl_lrr);
		if (!(cw_cxhdxgjl_lrr.equals("")))	wheresql+=" and  (cw_cxhdxgjl.lrr='"+cw_cxhdxgjl_lrr+"')";
	}
	cw_cxhdxgjl_lrsj=request.getParameter("cw_cxhdxgjl_lrsj");
	if (cw_cxhdxgjl_lrsj!=null)
	{
		cw_cxhdxgjl_lrsj=cw_cxhdxgjl_lrsj.trim();
		if (!(cw_cxhdxgjl_lrsj.equals("")))	wheresql+="  and (cw_cxhdxgjl.lrsj>=TO_DATE('"+cw_cxhdxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_cxhdxgjl_lrsj=request.getParameter("cw_cxhdxgjl_lrsj2");
	if (cw_cxhdxgjl_lrsj!=null)
	{
		cw_cxhdxgjl_lrsj=cw_cxhdxgjl_lrsj.trim();
		if (!(cw_cxhdxgjl_lrsj.equals("")))	wheresql+="  and (cw_cxhdxgjl.lrsj<=TO_DATE('"+cw_cxhdxgjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	cw_cxhdxgjl_lrbm=request.getParameter("cw_cxhdxgjl_lrbm");
	if (cw_cxhdxgjl_lrbm!=null)
	{
		cw_cxhdxgjl_lrbm=cf.GB2Uni(cw_cxhdxgjl_lrbm);
		if (!(cw_cxhdxgjl_lrbm.equals("")))	wheresql+=" and  (cw_cxhdxgjl.lrbm='"+cw_cxhdxgjl_lrbm+"')";
	}
	ls_sql="SELECT cw_cxhdxgjl.xgjlh,cw_cxhdxgjl.khbh,cw_cxhdxgjl.khxm,crm_khxx.fwdz,crm_khxx.hth,a.dwmc fgsbh,cw_cxhdxgjl.xgqcxhd,cw_cxhdxgjl.xgqcxhdbmxq,cw_cxhdxgjl.xgqcxhdbmzh,cw_cxhdxgjl.xghcxhd,cw_cxhdxgjl.xghcxhdbmxq,cw_cxhdxgjl.xghcxhdbmzh,cw_cxhdxgjl.xgqwdzgce,cw_cxhdxgjl.xgqqye,cw_cxhdxgjl.xgqpmjj,cw_cxhdxgjl.xgqsuijin,cw_cxhdxgjl.xgqguanlif,cw_cxhdxgjl.xghwdzgce,cw_cxhdxgjl.xghqye,cw_cxhdxgjl.xghpmjj,cw_cxhdxgjl.xghsuijin,cw_cxhdxgjl.xghguanlif,cw_cxhdxgjl.lrr,cw_cxhdxgjl.lrsj,b.dwmc lrbm,cw_cxhdxgjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_cxhdxgjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_cxhdxgjl.khbh=crm_khxx.khbh(+) and cw_cxhdxgjl.fgsbh=a.dwbh(+) and cw_cxhdxgjl.lrbm=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_cxhdxgjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_cxhdxgjlCxList.jsp","SelectCxCw_cxhdxgjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xgjlh","cw_cxhdxgjl_khbh","cw_cxhdxgjl_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_cxhdxgjl_fgsbh","cw_cxhdxgjl_xgqcxhd","cw_cxhdxgjl_xgqcxhdbmxq","cw_cxhdxgjl_xgqcxhdbmzh","cw_cxhdxgjl_xghcxhd","cw_cxhdxgjl_xghcxhdbmxq","cw_cxhdxgjl_xghcxhdbmzh","cw_cxhdxgjl_xgqwdzgce","cw_cxhdxgjl_xgqqye","cw_cxhdxgjl_xgqpmjj","cw_cxhdxgjl_xgqsuijin","cw_cxhdxgjl_xgqguanlif","cw_cxhdxgjl_xghwdzgce","cw_cxhdxgjl_xghqye","cw_cxhdxgjl_xghpmjj","cw_cxhdxgjl_xghsuijin","cw_cxhdxgjl_xghguanlif","cw_cxhdxgjl_lrr","cw_cxhdxgjl_lrsj","cw_cxhdxgjl_lrbm","cw_cxhdxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xgjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询－修改促销活动记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">修改记录号</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="4%">所属分公司</td>
	<td  width="6%"><strong>修改前公司促销活动</strong></td>
	<td  width="6%"><strong>修改前小区促销活动</strong></td>
	<td  width="6%"><strong>修改前展会促销活动</strong></td>
	<td  width="6%"><font color="#0000FF"><strong>修改后公司促销活动</strong></font></td>
	<td  width="6%"><font color="#0000FF"><strong>修改后小区促销活动</strong></font></td>
	<td  width="6%"><font color="#0000FF"><strong>修改后展会促销活动</strong></font></td>
	<td  width="3%"><strong>修改前工程原报价</strong></td>
	<td  width="3%"><strong>修改前签约额</strong></td>
	<td  width="2%"><strong>修改前每平米均价</strong></td>
	<td  width="3%"><strong>修改前税金</strong></td>
	<td  width="3%"><strong>修改前折后管理费</strong></td>
	<td  width="3%"><font color="#0000FF"><strong>修改后工程原报价</strong></font></td>
	<td  width="3%"><font color="#0000FF"><strong>修改后签约额</strong></font></td>
	<td  width="2%"><font color="#0000FF"><strong>修改后每平米均价</strong></font></td>
	<td  width="3%"><font color="#0000FF"><strong>修改后税金</strong></font></td>
	<td  width="3%"><font color="#0000FF"><strong>修改后折后管理费</strong></font></td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="8%">备注</td>
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