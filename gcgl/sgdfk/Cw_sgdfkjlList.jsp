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


	String cw_sgdfkjl_fkjlh=null;
	String cw_sgdfkjl_sgd=null;
	String cw_sgdfkjl_fksj=null;
	String cw_sgdfkjl_fkr=null;
	String cw_sgdfkjl_fkje=null;
	String cw_sgdfkjl_shr=null;
	String cw_sgdfkjl_shsj=null;
	String cw_sgdfkjl_skkr=null;
	String cw_sgdfkjl_skksj=null;
	String cw_sgdfkjl_zt=null;
	String cw_sgdfkjl_lrr=null;
	String cw_sgdfkjl_lrsj=null;
	String cw_sgdfkjl_lrbm=null;
	String cw_sgdfkjl_scbz=null;
	String cw_sgdfkjl_scr=null;
	String cw_sgdfkjl_scsj=null;

	String fdbh=null;
	fdbh=request.getParameter("fdbh");
	if (fdbh!=null)
	{
		fdbh=cf.GB2Uni(fdbh);
		if (!(fdbh.equals("")))	wheresql+=" and  (cw_sgdfkjl.fdbh='"+fdbh+"')";
	}

	cw_sgdfkjl_fkjlh=request.getParameter("cw_sgdfkjl_fkjlh");
	if (cw_sgdfkjl_fkjlh!=null)
	{
		cw_sgdfkjl_fkjlh=cf.GB2Uni(cw_sgdfkjl_fkjlh);
		if (!(cw_sgdfkjl_fkjlh.equals("")))	wheresql+=" and  (cw_sgdfkjl.fkjlh='"+cw_sgdfkjl_fkjlh+"')";
	}


	cw_sgdfkjl_sgd=request.getParameter("cw_sgdfkjl_sgd");
	if (cw_sgdfkjl_sgd!=null)
	{
		cw_sgdfkjl_sgd=cf.GB2Uni(cw_sgdfkjl_sgd);
		if (!(cw_sgdfkjl_sgd.equals("")))	wheresql+=" and  (cw_sgdfkjl.sgd='"+cw_sgdfkjl_sgd+"')";
	}
	cw_sgdfkjl_fksj=request.getParameter("cw_sgdfkjl_fksj");
	if (cw_sgdfkjl_fksj!=null)
	{
		cw_sgdfkjl_fksj=cw_sgdfkjl_fksj.trim();
		if (!(cw_sgdfkjl_fksj.equals("")))	wheresql+="  and (cw_sgdfkjl.fksj>=TO_DATE('"+cw_sgdfkjl_fksj+"','YYYY/MM/DD'))";
	}
	cw_sgdfkjl_fksj=request.getParameter("cw_sgdfkjl_fksj2");
	if (cw_sgdfkjl_fksj!=null)
	{
		cw_sgdfkjl_fksj=cw_sgdfkjl_fksj.trim();
		if (!(cw_sgdfkjl_fksj.equals("")))	wheresql+="  and (cw_sgdfkjl.fksj<=TO_DATE('"+cw_sgdfkjl_fksj+"','YYYY/MM/DD'))";
	}
	cw_sgdfkjl_fkr=request.getParameter("cw_sgdfkjl_fkr");
	if (cw_sgdfkjl_fkr!=null)
	{
		cw_sgdfkjl_fkr=cf.GB2Uni(cw_sgdfkjl_fkr);
		if (!(cw_sgdfkjl_fkr.equals("")))	wheresql+=" and  (cw_sgdfkjl.fkr='"+cw_sgdfkjl_fkr+"')";
	}
	cw_sgdfkjl_fkje=request.getParameter("cw_sgdfkjl_fkje");
	if (cw_sgdfkjl_fkje!=null)
	{
		cw_sgdfkjl_fkje=cw_sgdfkjl_fkje.trim();
		if (!(cw_sgdfkjl_fkje.equals("")))	wheresql+=" and  (cw_sgdfkjl.fkje="+cw_sgdfkjl_fkje+") ";
	}
	cw_sgdfkjl_shr=request.getParameter("cw_sgdfkjl_shr");
	if (cw_sgdfkjl_shr!=null)
	{
		cw_sgdfkjl_shr=cf.GB2Uni(cw_sgdfkjl_shr);
		if (!(cw_sgdfkjl_shr.equals("")))	wheresql+=" and  (cw_sgdfkjl.shr='"+cw_sgdfkjl_shr+"')";
	}
	cw_sgdfkjl_shsj=request.getParameter("cw_sgdfkjl_shsj");
	if (cw_sgdfkjl_shsj!=null)
	{
		cw_sgdfkjl_shsj=cw_sgdfkjl_shsj.trim();
		if (!(cw_sgdfkjl_shsj.equals("")))	wheresql+="  and (cw_sgdfkjl.shsj=TO_DATE('"+cw_sgdfkjl_shsj+"','YYYY/MM/DD'))";
	}
	cw_sgdfkjl_skkr=request.getParameter("cw_sgdfkjl_skkr");
	if (cw_sgdfkjl_skkr!=null)
	{
		cw_sgdfkjl_skkr=cf.GB2Uni(cw_sgdfkjl_skkr);
		if (!(cw_sgdfkjl_skkr.equals("")))	wheresql+=" and  (cw_sgdfkjl.skkr='"+cw_sgdfkjl_skkr+"')";
	}
	cw_sgdfkjl_skksj=request.getParameter("cw_sgdfkjl_skksj");
	if (cw_sgdfkjl_skksj!=null)
	{
		cw_sgdfkjl_skksj=cw_sgdfkjl_skksj.trim();
		if (!(cw_sgdfkjl_skksj.equals("")))	wheresql+="  and (cw_sgdfkjl.skksj>=TO_DATE('"+cw_sgdfkjl_skksj+"','YYYY/MM/DD'))";
	}
	cw_sgdfkjl_skksj=request.getParameter("cw_sgdfkjl_skksj2");
	if (cw_sgdfkjl_skksj!=null)
	{
		cw_sgdfkjl_skksj=cw_sgdfkjl_skksj.trim();
		if (!(cw_sgdfkjl_skksj.equals("")))	wheresql+="  and (cw_sgdfkjl.skksj<=TO_DATE('"+cw_sgdfkjl_skksj+"','YYYY/MM/DD'))";
	}
	cw_sgdfkjl_zt=request.getParameter("cw_sgdfkjl_zt");
	if (cw_sgdfkjl_zt!=null)
	{
		cw_sgdfkjl_zt=cf.GB2Uni(cw_sgdfkjl_zt);
		if (!(cw_sgdfkjl_zt.equals("")))	wheresql+=" and  (cw_sgdfkjl.zt='"+cw_sgdfkjl_zt+"')";
	}
	cw_sgdfkjl_lrr=request.getParameter("cw_sgdfkjl_lrr");
	if (cw_sgdfkjl_lrr!=null)
	{
		cw_sgdfkjl_lrr=cf.GB2Uni(cw_sgdfkjl_lrr);
		if (!(cw_sgdfkjl_lrr.equals("")))	wheresql+=" and  (cw_sgdfkjl.lrr='"+cw_sgdfkjl_lrr+"')";
	}
	cw_sgdfkjl_lrsj=request.getParameter("cw_sgdfkjl_lrsj");
	if (cw_sgdfkjl_lrsj!=null)
	{
		cw_sgdfkjl_lrsj=cw_sgdfkjl_lrsj.trim();
		if (!(cw_sgdfkjl_lrsj.equals("")))	wheresql+="  and (cw_sgdfkjl.lrsj>=TO_DATE('"+cw_sgdfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdfkjl_lrsj=request.getParameter("cw_sgdfkjl_lrsj2");
	if (cw_sgdfkjl_lrsj!=null)
	{
		cw_sgdfkjl_lrsj=cw_sgdfkjl_lrsj.trim();
		if (!(cw_sgdfkjl_lrsj.equals("")))	wheresql+="  and (cw_sgdfkjl.lrsj<=TO_DATE('"+cw_sgdfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdfkjl_lrbm=request.getParameter("cw_sgdfkjl_lrbm");
	if (cw_sgdfkjl_lrbm!=null)
	{
		cw_sgdfkjl_lrbm=cf.GB2Uni(cw_sgdfkjl_lrbm);
		if (!(cw_sgdfkjl_lrbm.equals("")))	wheresql+=" and  (cw_sgdfkjl.lrbm='"+cw_sgdfkjl_lrbm+"')";
	}
	cw_sgdfkjl_scbz=request.getParameter("cw_sgdfkjl_scbz");
	if (cw_sgdfkjl_scbz!=null)
	{
		cw_sgdfkjl_scbz=cf.GB2Uni(cw_sgdfkjl_scbz);
		if (!(cw_sgdfkjl_scbz.equals("")))	wheresql+=" and  (cw_sgdfkjl.scbz='"+cw_sgdfkjl_scbz+"')";
	}
	cw_sgdfkjl_scr=request.getParameter("cw_sgdfkjl_scr");
	if (cw_sgdfkjl_scr!=null)
	{
		cw_sgdfkjl_scr=cf.GB2Uni(cw_sgdfkjl_scr);
		if (!(cw_sgdfkjl_scr.equals("")))	wheresql+=" and  (cw_sgdfkjl.scr='"+cw_sgdfkjl_scr+"')";
	}
	cw_sgdfkjl_scsj=request.getParameter("cw_sgdfkjl_scsj");
	if (cw_sgdfkjl_scsj!=null)
	{
		cw_sgdfkjl_scsj=cw_sgdfkjl_scsj.trim();
		if (!(cw_sgdfkjl_scsj.equals("")))	wheresql+="  and (cw_sgdfkjl.scsj=TO_DATE('"+cw_sgdfkjl_scsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT cw_sgdfkjl.fkjlh,cw_sgdfkjl.fdbh,DECODE(cw_sgdfkjl.zt,'1','未审核','2','审核','3','结算'),sgdmc,sgbz,cw_sgdfkjl.fksj,cw_sgdfkjl.fkr,cw_sgdfkjl.fkje,cw_sgdfkjl.fkyy, cw_sgdfkjl.lrr,cw_sgdfkjl.lrsj,dwmc,cw_sgdfkjl.bz";
	ls_sql+=" FROM cw_sgdfkjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_sgdfkjl.sgd=sq_sgd.sgd(+) and cw_sgdfkjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdfkjl.jsbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdfkjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdfkjlList.jsp","","","EditCw_sgdfkjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fkjlh","cw_sgdfkjl_sgd","cw_sgdfkjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","cw_sgdfkjl_fksj","cw_sgdfkjl_fkr","cw_sgdfkjl_fkje","cw_sgdfkjl_fkyy","cw_sgdfkjl_shr","cw_sgdfkjl_shsj","cw_sgdfkjl_shsm","cw_sgdfkjl_skkr","cw_sgdfkjl_skksj","cw_sgdfkjl_skksm","cw_sgdfkjl_zt","cw_sgdfkjl_lrr","cw_sgdfkjl_lrsj","cw_sgdfkjl_lrbm","cw_sgdfkjl_scbz","cw_sgdfkjl_scr","cw_sgdfkjl_scsj","cw_sgdfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fkjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_sgdfkjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] fkjlh = request.getParameterValues("fkjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fkjlh,"fkjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_sgdfkjl where zt='1' and  "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队罚款－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">罚款记录</td>
	<td  width="4%">罚单编号</td>
	<td  width="5%">状态</td>
	<td  width="5%">施工队</td>
	<td  width="5%">施工班长</td>
	<td  width="6%">罚款时间</td>
	<td  width="5%">罚款人</td>
	<td  width="6%">罚款金额</td>
	<td  width="27%">罚款原因</td>
	<td  width="5%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="13%">备注</td>
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