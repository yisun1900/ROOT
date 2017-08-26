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
	String crm_bdxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_bdxx_yjdz=null;
	String crm_bdxx_yb=null;
	String crm_bdxx_sjr=null;
	String crm_bdxx_dh=null;
	String crm_bdxx_lrr=null;
	String crm_bdxx_lrsj=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	
	
	crm_bdxx_khbh=request.getParameter("crm_bdxx_khbh");
	if (crm_bdxx_khbh!=null)
	{
		crm_bdxx_khbh=cf.GB2Uni(crm_bdxx_khbh);
		if (!(crm_bdxx_khbh.equals("")))	wheresql+=" and  (crm_bdxx.khbh='"+crm_bdxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
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
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_bdxx_yjdz=request.getParameter("crm_bdxx_yjdz");
	if (crm_bdxx_yjdz!=null)
	{
		crm_bdxx_yjdz=cf.GB2Uni(crm_bdxx_yjdz);
		if (!(crm_bdxx_yjdz.equals("")))	wheresql+=" and  (crm_bdxx.yjdz='"+crm_bdxx_yjdz+"')";
	}
	crm_bdxx_yb=request.getParameter("crm_bdxx_yb");
	if (crm_bdxx_yb!=null)
	{
		crm_bdxx_yb=cf.GB2Uni(crm_bdxx_yb);
		if (!(crm_bdxx_yb.equals("")))	wheresql+=" and  (crm_bdxx.yb='"+crm_bdxx_yb+"')";
	}
	crm_bdxx_sjr=request.getParameter("crm_bdxx_sjr");
	if (crm_bdxx_sjr!=null)
	{
		crm_bdxx_sjr=cf.GB2Uni(crm_bdxx_sjr);
		if (!(crm_bdxx_sjr.equals("")))	wheresql+=" and  (crm_bdxx.sjr='"+crm_bdxx_sjr+"')";
	}
	crm_bdxx_dh=request.getParameter("crm_bdxx_dh");
	if (crm_bdxx_dh!=null)
	{
		crm_bdxx_dh=cf.GB2Uni(crm_bdxx_dh);
		if (!(crm_bdxx_dh.equals("")))	wheresql+=" and  (crm_bdxx.dh='"+crm_bdxx_dh+"')";
	}
	crm_bdxx_lrr=request.getParameter("crm_bdxx_lrr");
	if (crm_bdxx_lrr!=null)
	{
		crm_bdxx_lrr=cf.GB2Uni(crm_bdxx_lrr);
		if (!(crm_bdxx_lrr.equals("")))	wheresql+=" and  (crm_bdxx.lrr='"+crm_bdxx_lrr+"')";
	}
	crm_bdxx_lrsj=request.getParameter("crm_bdxx_lrsj");
	if (crm_bdxx_lrsj!=null)
	{
		crm_bdxx_lrsj=crm_bdxx_lrsj.trim();
		if (!(crm_bdxx_lrsj.equals("")))	wheresql+="  and (crm_bdxx.lrsj>=TO_DATE('"+crm_bdxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_bdxx_lrsj=request.getParameter("crm_bdxx_lrsj2");
	if (crm_bdxx_lrsj!=null)
	{
		crm_bdxx_lrsj=crm_bdxx_lrsj.trim();
		if (!(crm_bdxx_lrsj.equals("")))	wheresql+="  and (crm_bdxx.lrsj<=TO_DATE('"+crm_bdxx_lrsj+"','YYYY/MM/DD'))";
	}

	String myxssl=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");

	
	
	ls_sql="SELECT crm_bdxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_bdxx.yjdz,crm_bdxx.yb,crm_bdxx.sjr,crm_bdxx.dh,crm_bdxx.bz  ";
	ls_sql+=" FROM crm_bdxx,crm_khxx  ";
    ls_sql+=" where crm_bdxx.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_bdxx.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_bdxxCxList.jsp","SelectCxCrm_bdxx.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_bdxx_yjdz","crm_bdxx_yb","crm_bdxx_sjr","crm_bdxx_dh","crm_bdxx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="7%">客户姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="7%">合同号</td>
	<td  width="6%">设计师</td>
	<td  width="15%">邮寄地址</td>
	<td  width="7%">邮编</td>
	<td  width="6%">收件人</td>
	<td  width="15%">电话</td>
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