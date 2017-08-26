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
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_djyy=null;
	String crm_khxx_djsj=null;
	String crm_khxx_djr=null;
	String crm_khxx_jhjdsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}


	String hfdjbz=null;
	hfdjbz=request.getParameter("hfdjbz");
	if (hfdjbz!=null)
	{
		if (!(hfdjbz.equals("")))	wheresql+=" and  (crm_khxx.hfdjbz='"+hfdjbz+"')";
	}

	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
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
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_djyy=request.getParameter("crm_khxx_djyy");
	if (crm_khxx_djyy!=null)
	{
		crm_khxx_djyy=cf.GB2Uni(crm_khxx_djyy);
		if (!(crm_khxx_djyy.equals("")))	wheresql+=" and  (crm_khxx.djyy like '%"+crm_khxx_djyy+"%')";
	}
	crm_khxx_djsj=request.getParameter("crm_khxx_djsj");
	if (crm_khxx_djsj!=null)
	{
		crm_khxx_djsj=crm_khxx_djsj.trim();
		if (!(crm_khxx_djsj.equals("")))	wheresql+="  and (crm_khxx.djsj>=TO_DATE('"+crm_khxx_djsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_djsj=request.getParameter("crm_khxx_djsj2");
	if (crm_khxx_djsj!=null)
	{
		crm_khxx_djsj=crm_khxx_djsj.trim();
		if (!(crm_khxx_djsj.equals("")))	wheresql+="  and (crm_khxx.djsj<=TO_DATE('"+crm_khxx_djsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_djr=request.getParameter("crm_khxx_djr");
	if (crm_khxx_djr!=null)
	{
		crm_khxx_djr=cf.GB2Uni(crm_khxx_djr);
		if (!(crm_khxx_djr.equals("")))	wheresql+=" and  (crm_khxx.djr='"+crm_khxx_djr+"')";
	}
	crm_khxx_jhjdsj=request.getParameter("crm_khxx_jhjdsj");
	if (crm_khxx_jhjdsj!=null)
	{
		crm_khxx_jhjdsj=crm_khxx_jhjdsj.trim();
		if (!(crm_khxx_jhjdsj.equals("")))	wheresql+="  and (crm_khxx.jhjdsj>=TO_DATE('"+crm_khxx_jhjdsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_jhjdsj=request.getParameter("crm_khxx_jhjdsj2");
	if (crm_khxx_jhjdsj!=null)
	{
		crm_khxx_jhjdsj=crm_khxx_jhjdsj.trim();
		if (!(crm_khxx_jhjdsj.equals("")))	wheresql+="  and (crm_khxx.jhjdsj<=TO_DATE('"+crm_khxx_jhjdsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz, DECODE(crm_khxx.hfdjbz,'0','未冻结','1','工程回访冻结','2','投诉报修回访冻结','3','全部冻结'),crm_khxx.djsj,crm_khxx.djr,crm_khxx.jhjdsj,crm_khxx.djyy,crm_khxx.lxfs,crm_khxx.sjs,crm_khxx.zjxm,sgdmc ";
	ls_sql+=" FROM crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.hfdjbz!='0'";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.djsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxScList.jsp","SelectScCrm_khxx.jsp","","DeleteCrm_hfdjjl.jsp");
	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[7]="align='left'";
	pageObj.setEditStr("删除");
//	pageObj.setPageRow(10);//设置每页显示记录数

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
	<td  width="3%">&nbsp;</td>
	<td  width="5%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="7%">回访冻结标志</td>
	<td  width="7%">冻结时间</td>
	<td  width="4%">冻结人</td>
	<td  width="7%">计划解冻时间</td>
	<td  width="25%">冻结原因</td>
	<td  width="11%">联系方式</td>
	<td  width="4%">设计师</td>
	<td  width="4%">质检</td>
	<td  width="4%">施工队</td>
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