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
	String cw_sjxgjl_xgjlh=null;
	String cw_sjxgjl_khbh=null;
	String cw_sjxgjl_khxm=null;
	String cw_sjxgjl_fgsbh=null;
	String cw_sjxgjl_wdzgce=null;
	String cw_sjxgjl_qye=null;
	String cw_sjxgjl_guanlif=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String cw_sjxgjl_lrr=null;
	String cw_sjxgjl_lrsj=null;

	cw_sjxgjl_xgjlh=request.getParameter("cw_sjxgjl_xgjlh");
	if (cw_sjxgjl_xgjlh!=null)
	{
		cw_sjxgjl_xgjlh=cf.GB2Uni(cw_sjxgjl_xgjlh);
		if (!(cw_sjxgjl_xgjlh.equals("")))	wheresql+=" and  (cw_sjxgjl.xgjlh='"+cw_sjxgjl_xgjlh+"')";
	}
	cw_sjxgjl_khbh=request.getParameter("cw_sjxgjl_khbh");
	if (cw_sjxgjl_khbh!=null)
	{
		cw_sjxgjl_khbh=cf.GB2Uni(cw_sjxgjl_khbh);
		if (!(cw_sjxgjl_khbh.equals("")))	wheresql+=" and  (cw_sjxgjl.khbh='"+cw_sjxgjl_khbh+"')";
	}
	cw_sjxgjl_khxm=request.getParameter("cw_sjxgjl_khxm");
	if (cw_sjxgjl_khxm!=null)
	{
		cw_sjxgjl_khxm=cf.GB2Uni(cw_sjxgjl_khxm);
		if (!(cw_sjxgjl_khxm.equals("")))	wheresql+=" and  (cw_sjxgjl.khxm='"+cw_sjxgjl_khxm+"')";
	}
	cw_sjxgjl_fgsbh=request.getParameter("cw_sjxgjl_fgsbh");
	if (cw_sjxgjl_fgsbh!=null)
	{
		cw_sjxgjl_fgsbh=cf.GB2Uni(cw_sjxgjl_fgsbh);
		if (!(cw_sjxgjl_fgsbh.equals("")))	wheresql+=" and  (cw_sjxgjl.fgsbh='"+cw_sjxgjl_fgsbh+"')";
	}
	cw_sjxgjl_wdzgce=request.getParameter("cw_sjxgjl_wdzgce");
	if (cw_sjxgjl_wdzgce!=null)
	{
		cw_sjxgjl_wdzgce=cw_sjxgjl_wdzgce.trim();
		if (!(cw_sjxgjl_wdzgce.equals("")))	wheresql+=" and  (cw_sjxgjl.wdzgce="+cw_sjxgjl_wdzgce+") ";
	}
	cw_sjxgjl_qye=request.getParameter("cw_sjxgjl_qye");
	if (cw_sjxgjl_qye!=null)
	{
		cw_sjxgjl_qye=cw_sjxgjl_qye.trim();
		if (!(cw_sjxgjl_qye.equals("")))	wheresql+=" and  (cw_sjxgjl.qye="+cw_sjxgjl_qye+") ";
	}
	cw_sjxgjl_guanlif=request.getParameter("cw_sjxgjl_guanlif");
	if (cw_sjxgjl_guanlif!=null)
	{
		cw_sjxgjl_guanlif=cw_sjxgjl_guanlif.trim();
		if (!(cw_sjxgjl_guanlif.equals("")))	wheresql+=" and  (cw_sjxgjl.guanlif="+cw_sjxgjl_guanlif+") ";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	cw_sjxgjl_lrr=request.getParameter("cw_sjxgjl_lrr");
	if (cw_sjxgjl_lrr!=null)
	{
		cw_sjxgjl_lrr=cf.GB2Uni(cw_sjxgjl_lrr);
		if (!(cw_sjxgjl_lrr.equals("")))	wheresql+=" and  (cw_sjxgjl.lrr='"+cw_sjxgjl_lrr+"')";
	}
	cw_sjxgjl_lrsj=request.getParameter("cw_sjxgjl_lrsj");
	if (cw_sjxgjl_lrsj!=null)
	{
		cw_sjxgjl_lrsj=cw_sjxgjl_lrsj.trim();
		if (!(cw_sjxgjl_lrsj.equals("")))	wheresql+="  and (cw_sjxgjl.lrsj>=TO_DATE('"+cw_sjxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sjxgjl_lrsj=request.getParameter("cw_sjxgjl_lrsj2");
	if (cw_sjxgjl_lrsj!=null)
	{
		cw_sjxgjl_lrsj=cw_sjxgjl_lrsj.trim();
		if (!(cw_sjxgjl_lrsj.equals("")))	wheresql+="  and (cw_sjxgjl.lrsj<=TO_DATE('"+cw_sjxgjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT cw_sjxgjl.xgjlh,cw_sjxgjl.khbh,cw_sjxgjl.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,dwmc fgsbh,cw_sjxgjl.xgqsuijinbfb,cw_sjxgjl.xghsuijinbfb,cw_sjxgjl.xgqsuijin,cw_sjxgjl.xghsuijin,cw_sjxgjl.wdzgce,cw_sjxgjl.qye,cw_sjxgjl.guanlif,cw_sjxgjl.lrr,cw_sjxgjl.lrsj,cw_sjxgjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_sjxgjl,sq_dwxx  ";
    ls_sql+=" where cw_sjxgjl.khbh=crm_khxx.khbh(+) and cw_sjxgjl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sjxgjl.lrsj desc,cw_sjxgjl.xgjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sjxgjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xgjlh","cw_sjxgjl_khbh","cw_sjxgjl_khxm","cw_sjxgjl_fgsbh","cw_sjxgjl_wdzgce","cw_sjxgjl_qye","cw_sjxgjl_guanlif","crm_khxx_hth","crm_khxx_sjs","cw_sjxgjl_xgqsuijinbfb","cw_sjxgjl_xghsuijinbfb","cw_sjxgjl_xgqsuijin","cw_sjxgjl_xghsuijin","cw_sjxgjl_lrr","cw_sjxgjl_lrsj","cw_sjxgjl_lrbm","cw_sjxgjl_bz"};
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
  <B><font size="3">查询－修改税金记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">修改记录号</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="5%">设计师</td>
	<td  width="7%">所属分公司</td>
	<td  width="3%"><strong>修改前税率</strong></td>
	<td  width="3%"><strong><font color="#0000FF">修改后税率</font></strong></td>
	<td  width="5%"><strong>修改前税金</strong></td>
	<td  width="5%"><strong><font color="#0000FF">修改后税金</font></strong></td>
	<td  width="5%">工程原报价</td>
	<td  width="5%">签约额</td>
	<td  width="5%">折后管理费</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="18%">备注</td>
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