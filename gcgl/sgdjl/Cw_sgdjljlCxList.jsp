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

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_sgd.ssfgs='"+fgs+"')";


	String cw_sgdjljl_jlh=null;
	String cw_sgdjljl_sgd=null;
	String cw_sgdjljl_jlsj=null;
	String cw_sgdjljl_jlr=null;
	String cw_sgdjljl_jlje=null;
	String cw_sgdjljl_shr=null;
	String cw_sgdjljl_shsj=null;
	String cw_sgdjljl_skkr=null;
	String cw_sgdjljl_skksj=null;
	String cw_sgdjljl_zt=null;
	String cw_sgdjljl_lrr=null;
	String cw_sgdjljl_lrsj=null;
	String cw_sgdjljl_lrbm=null;
	String cw_sgdjljl_scbz=null;
	String cw_sgdjljl_scr=null;
	String cw_sgdjljl_scsj=null;
	cw_sgdjljl_jlh=request.getParameter("cw_sgdjljl_jlh");
	if (cw_sgdjljl_jlh!=null)
	{
		cw_sgdjljl_jlh=cf.GB2Uni(cw_sgdjljl_jlh);
		if (!(cw_sgdjljl_jlh.equals("")))	wheresql+=" and  (cw_sgdjljl.jlh='"+cw_sgdjljl_jlh+"')";
	}
	cw_sgdjljl_sgd=request.getParameter("cw_sgdjljl_sgd");
	if (cw_sgdjljl_sgd!=null)
	{
		cw_sgdjljl_sgd=cf.GB2Uni(cw_sgdjljl_sgd);
		if (!(cw_sgdjljl_sgd.equals("")))	wheresql+=" and  (cw_sgdjljl.sgd='"+cw_sgdjljl_sgd+"')";
	}
	cw_sgdjljl_jlsj=request.getParameter("cw_sgdjljl_jlsj");
	if (cw_sgdjljl_jlsj!=null)
	{
		cw_sgdjljl_jlsj=cw_sgdjljl_jlsj.trim();
		if (!(cw_sgdjljl_jlsj.equals("")))	wheresql+="  and (cw_sgdjljl.jlsj>=TO_DATE('"+cw_sgdjljl_jlsj+"','YYYY/MM/DD'))";
	}
	cw_sgdjljl_jlsj=request.getParameter("cw_sgdjljl_jlsj2");
	if (cw_sgdjljl_jlsj!=null)
	{
		cw_sgdjljl_jlsj=cw_sgdjljl_jlsj.trim();
		if (!(cw_sgdjljl_jlsj.equals("")))	wheresql+="  and (cw_sgdjljl.jlsj<=TO_DATE('"+cw_sgdjljl_jlsj+"','YYYY/MM/DD'))";
	}
	cw_sgdjljl_jlr=request.getParameter("cw_sgdjljl_jlr");
	if (cw_sgdjljl_jlr!=null)
	{
		cw_sgdjljl_jlr=cf.GB2Uni(cw_sgdjljl_jlr);
		if (!(cw_sgdjljl_jlr.equals("")))	wheresql+=" and  (cw_sgdjljl.jlr='"+cw_sgdjljl_jlr+"')";
	}
	cw_sgdjljl_jlje=request.getParameter("cw_sgdjljl_jlje");
	if (cw_sgdjljl_jlje!=null)
	{
		cw_sgdjljl_jlje=cw_sgdjljl_jlje.trim();
		if (!(cw_sgdjljl_jlje.equals("")))	wheresql+=" and  (cw_sgdjljl.jlje="+cw_sgdjljl_jlje+") ";
	}
	cw_sgdjljl_shr=request.getParameter("cw_sgdjljl_shr");
	if (cw_sgdjljl_shr!=null)
	{
		cw_sgdjljl_shr=cf.GB2Uni(cw_sgdjljl_shr);
		if (!(cw_sgdjljl_shr.equals("")))	wheresql+=" and  (cw_sgdjljl.shr='"+cw_sgdjljl_shr+"')";
	}
	cw_sgdjljl_shsj=request.getParameter("cw_sgdjljl_shsj");
	if (cw_sgdjljl_shsj!=null)
	{
		cw_sgdjljl_shsj=cw_sgdjljl_shsj.trim();
		if (!(cw_sgdjljl_shsj.equals("")))	wheresql+="  and (cw_sgdjljl.shsj=TO_DATE('"+cw_sgdjljl_shsj+"','YYYY/MM/DD'))";
	}
	cw_sgdjljl_skkr=request.getParameter("cw_sgdjljl_skkr");
	if (cw_sgdjljl_skkr!=null)
	{
		cw_sgdjljl_skkr=cf.GB2Uni(cw_sgdjljl_skkr);
		if (!(cw_sgdjljl_skkr.equals("")))	wheresql+=" and  (cw_sgdjljl.skkr='"+cw_sgdjljl_skkr+"')";
	}
	cw_sgdjljl_skksj=request.getParameter("cw_sgdjljl_skksj");
	if (cw_sgdjljl_skksj!=null)
	{
		cw_sgdjljl_skksj=cw_sgdjljl_skksj.trim();
		if (!(cw_sgdjljl_skksj.equals("")))	wheresql+="  and (cw_sgdjljl.skksj>=TO_DATE('"+cw_sgdjljl_skksj+"','YYYY/MM/DD'))";
	}
	cw_sgdjljl_skksj=request.getParameter("cw_sgdjljl_skksj2");
	if (cw_sgdjljl_skksj!=null)
	{
		cw_sgdjljl_skksj=cw_sgdjljl_skksj.trim();
		if (!(cw_sgdjljl_skksj.equals("")))	wheresql+="  and (cw_sgdjljl.skksj<=TO_DATE('"+cw_sgdjljl_skksj+"','YYYY/MM/DD'))";
	}
	cw_sgdjljl_zt=request.getParameter("cw_sgdjljl_zt");
	if (cw_sgdjljl_zt!=null)
	{
		cw_sgdjljl_zt=cf.GB2Uni(cw_sgdjljl_zt);
		if (!(cw_sgdjljl_zt.equals("")))	wheresql+=" and  (cw_sgdjljl.zt='"+cw_sgdjljl_zt+"')";
	}
	cw_sgdjljl_lrr=request.getParameter("cw_sgdjljl_lrr");
	if (cw_sgdjljl_lrr!=null)
	{
		cw_sgdjljl_lrr=cf.GB2Uni(cw_sgdjljl_lrr);
		if (!(cw_sgdjljl_lrr.equals("")))	wheresql+=" and  (cw_sgdjljl.lrr='"+cw_sgdjljl_lrr+"')";
	}
	cw_sgdjljl_lrsj=request.getParameter("cw_sgdjljl_lrsj");
	if (cw_sgdjljl_lrsj!=null)
	{
		cw_sgdjljl_lrsj=cw_sgdjljl_lrsj.trim();
		if (!(cw_sgdjljl_lrsj.equals("")))	wheresql+="  and (cw_sgdjljl.lrsj>=TO_DATE('"+cw_sgdjljl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdjljl_lrsj=request.getParameter("cw_sgdjljl_lrsj2");
	if (cw_sgdjljl_lrsj!=null)
	{
		cw_sgdjljl_lrsj=cw_sgdjljl_lrsj.trim();
		if (!(cw_sgdjljl_lrsj.equals("")))	wheresql+="  and (cw_sgdjljl.lrsj<=TO_DATE('"+cw_sgdjljl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdjljl_lrbm=request.getParameter("cw_sgdjljl_lrbm");
	if (cw_sgdjljl_lrbm!=null)
	{
		cw_sgdjljl_lrbm=cf.GB2Uni(cw_sgdjljl_lrbm);
		if (!(cw_sgdjljl_lrbm.equals("")))	wheresql+=" and  (cw_sgdjljl.lrbm='"+cw_sgdjljl_lrbm+"')";
	}
	cw_sgdjljl_scbz=request.getParameter("cw_sgdjljl_scbz");
	if (cw_sgdjljl_scbz!=null)
	{
		cw_sgdjljl_scbz=cf.GB2Uni(cw_sgdjljl_scbz);
		if (!(cw_sgdjljl_scbz.equals("")))	wheresql+=" and  (cw_sgdjljl.scbz='"+cw_sgdjljl_scbz+"')";
	}
	cw_sgdjljl_scr=request.getParameter("cw_sgdjljl_scr");
	if (cw_sgdjljl_scr!=null)
	{
		cw_sgdjljl_scr=cf.GB2Uni(cw_sgdjljl_scr);
		if (!(cw_sgdjljl_scr.equals("")))	wheresql+=" and  (cw_sgdjljl.scr='"+cw_sgdjljl_scr+"')";
	}
	cw_sgdjljl_scsj=request.getParameter("cw_sgdjljl_scsj");
	if (cw_sgdjljl_scsj!=null)
	{
		cw_sgdjljl_scsj=cw_sgdjljl_scsj.trim();
		if (!(cw_sgdjljl_scsj.equals("")))	wheresql+="  and (cw_sgdjljl.scsj=TO_DATE('"+cw_sgdjljl_scsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT cw_sgdjljl.jlh,DECODE(cw_sgdjljl.zt,'1','未审核','2','审核','3','结算'), DECODE(cw_sgdjljl.scbz,'N','未删除','Y','已删除'),sgdmc,sgbz,cw_sgdjljl.jlsj,cw_sgdjljl.jlr,cw_sgdjljl.jlje,cw_sgdjljl.jlyy,cw_sgdjljl.shr,cw_sgdjljl.shsj,cw_sgdjljl.shsm, cw_sgdjljl.lrr,cw_sgdjljl.lrsj,dwmc,cw_sgdjljl.scr,cw_sgdjljl.scsj,cw_sgdjljl.bz";
	ls_sql+=" FROM cw_sgdjljl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_sgdjljl.sgd=sq_sgd.sgd(+) and cw_sgdjljl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdjljl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdjljlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jlh","cw_sgdjljl_sgd","cw_sgdjljl_khbh","crm_khxx_khxm","crm_khxx_fwdz","cw_sgdjljl_jlsj","cw_sgdjljl_jlr","cw_sgdjljl_jlje","cw_sgdjljl_jlyy","cw_sgdjljl_shr","cw_sgdjljl_shsj","cw_sgdjljl_shsm","cw_sgdjljl_skkr","cw_sgdjljl_skksj","cw_sgdjljl_skksm","cw_sgdjljl_zt","cw_sgdjljl_lrr","cw_sgdjljl_lrsj","cw_sgdjljl_lrbm","cw_sgdjljl_scbz","cw_sgdjljl_scr","cw_sgdjljl_scsj","cw_sgdjljl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);


//设置列超级连接

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">施工队奖励－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">奖励记录</td>
	<td  width="3%">状态</td>
	<td  width="3%">删除标志</td>
	<td  width="3%">施工队</td>
	<td  width="3%">施工班长</td>
	<td  width="4%">奖励时间</td>
	<td  width="3%">奖励人</td>
	<td  width="4%">奖励金额</td>
	<td  width="16%">奖励原因</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核时间</td>
	<td  width="9%">审核说明</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="3%">删除人</td>
	<td  width="4%">删除时间</td>
	<td  width="48%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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