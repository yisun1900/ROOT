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
	String jxc_db_dbph=null;
	String jxc_db_dbcllx=null;
	String jxc_db_dbyy=null;
	String jxc_db_dcdq=null;
	String jxc_db_dcgs=null;
	String jxc_db_drdq=null;
	String jxc_db_drgs=null;
	String jxc_db_jgzyk=null;
	String jxc_db_djck=null;
	String jxc_db_shr=null;
	String jxc_db_shrq=null;
	String jxc_db_dbdzt=null;
	String jxc_db_lrr=null;
	String jxc_db_lrsj=null;
	jxc_db_dbph=request.getParameter("jxc_db_dbph");
	if (jxc_db_dbph!=null)
	{
		jxc_db_dbph=cf.GB2Uni(jxc_db_dbph);
		if (!(jxc_db_dbph.equals("")))	wheresql+=" and  (jxc_db.dbph='"+jxc_db_dbph+"')";
	}
	jxc_db_dbcllx=request.getParameter("jxc_db_dbcllx");
	if (jxc_db_dbcllx!=null)
	{
		jxc_db_dbcllx=cf.GB2Uni(jxc_db_dbcllx);
		if (!(jxc_db_dbcllx.equals("")))	wheresql+=" and  (jxc_db.dbcllx='"+jxc_db_dbcllx+"')";
	}
	jxc_db_dbyy=request.getParameter("jxc_db_dbyy");
	if (jxc_db_dbyy!=null)
	{
		jxc_db_dbyy=cf.GB2Uni(jxc_db_dbyy);
		if (!(jxc_db_dbyy.equals("")))	wheresql+=" and  (jxc_db.dbyy='"+jxc_db_dbyy+"')";
	}
	jxc_db_dcdq=request.getParameter("jxc_db_dcdq");
	if (jxc_db_dcdq!=null)
	{
		jxc_db_dcdq=cf.GB2Uni(jxc_db_dcdq);
		if (!(jxc_db_dcdq.equals("")))	wheresql+=" and  (jxc_db.dcdq='"+jxc_db_dcdq+"')";
	}
	jxc_db_dcgs=request.getParameter("jxc_db_dcgs");
	if (jxc_db_dcgs!=null)
	{
		jxc_db_dcgs=cf.GB2Uni(jxc_db_dcgs);
		if (!(jxc_db_dcgs.equals("")))	wheresql+=" and  (jxc_db.dcgs='"+jxc_db_dcgs+"')";
	}
	jxc_db_drdq=request.getParameter("jxc_db_drdq");
	if (jxc_db_drdq!=null)
	{
		jxc_db_drdq=cf.GB2Uni(jxc_db_drdq);
		if (!(jxc_db_drdq.equals("")))	wheresql+=" and  (jxc_db.drdq='"+jxc_db_drdq+"')";
	}
	jxc_db_drgs=request.getParameter("jxc_db_drgs");
	if (jxc_db_drgs!=null)
	{
		jxc_db_drgs=cf.GB2Uni(jxc_db_drgs);
		if (!(jxc_db_drgs.equals("")))	wheresql+=" and  (jxc_db.drgs='"+jxc_db_drgs+"')";
	}
	jxc_db_jgzyk=request.getParameter("jxc_db_jgzyk");
	if (jxc_db_jgzyk!=null)
	{
		jxc_db_jgzyk=cf.GB2Uni(jxc_db_jgzyk);
		if (!(jxc_db_jgzyk.equals("")))	wheresql+=" and  (jxc_db.jgzyk='"+jxc_db_jgzyk+"')";
	}
	jxc_db_djck=request.getParameter("jxc_db_djck");
	if (jxc_db_djck!=null)
	{
		jxc_db_djck=cf.GB2Uni(jxc_db_djck);
		if (!(jxc_db_djck.equals("")))	wheresql+=" and  (jxc_db.djck='"+jxc_db_djck+"')";
	}
	jxc_db_shr=request.getParameter("jxc_db_shr");
	if (jxc_db_shr!=null)
	{
		jxc_db_shr=cf.GB2Uni(jxc_db_shr);
		if (!(jxc_db_shr.equals("")))	wheresql+=" and  (jxc_db.shr='"+jxc_db_shr+"')";
	}
	jxc_db_shrq=request.getParameter("jxc_db_shrq");
	if (jxc_db_shrq!=null)
	{
		jxc_db_shrq=jxc_db_shrq.trim();
		if (!(jxc_db_shrq.equals("")))	wheresql+="  and (jxc_db.shrq>=TO_DATE('"+jxc_db_shrq+"','YYYY/MM/DD'))";
	}
	jxc_db_shrq=request.getParameter("jxc_db_shrq2");
	if (jxc_db_shrq!=null)
	{
		jxc_db_shrq=jxc_db_shrq.trim();
		if (!(jxc_db_shrq.equals("")))	wheresql+="  and (jxc_db.shrq<=TO_DATE('"+jxc_db_shrq+"','YYYY/MM/DD'))";
	}
	jxc_db_dbdzt=request.getParameter("jxc_db_dbdzt");
	if (jxc_db_dbdzt!=null)
	{
		jxc_db_dbdzt=cf.GB2Uni(jxc_db_dbdzt);
		if (!(jxc_db_dbdzt.equals("")))	wheresql+=" and  (jxc_db.dbdzt='"+jxc_db_dbdzt+"')";
	}
	jxc_db_lrr=request.getParameter("jxc_db_lrr");
	if (jxc_db_lrr!=null)
	{
		jxc_db_lrr=cf.GB2Uni(jxc_db_lrr);
		if (!(jxc_db_lrr.equals("")))	wheresql+=" and  (jxc_db.lrr='"+jxc_db_lrr+"')";
	}
	jxc_db_lrsj=request.getParameter("jxc_db_lrsj");
	if (jxc_db_lrsj!=null)
	{
		jxc_db_lrsj=jxc_db_lrsj.trim();
		if (!(jxc_db_lrsj.equals("")))	wheresql+="  and (jxc_db.lrsj>=TO_DATE('"+jxc_db_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_db_lrsj=request.getParameter("jxc_db_lrsj2");
	if (jxc_db_lrsj!=null)
	{
		jxc_db_lrsj=jxc_db_lrsj.trim();
		if (!(jxc_db_lrsj.equals("")))	wheresql+="  and (jxc_db.lrsj<=TO_DATE('"+jxc_db_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT jxc_db.dbph,DECODE(jxc_db.dbdzt,'0','未提交','1','提交等待审核','2','审核通过等待出库','3','已出库等待入库','7','审核未通过','9','入库完成'), DECODE(jxc_db.dbcllx,'0','主材','1','辅材'), DECODE(jxc_db.dbyy,'0','集团调货','1','退货调拨'),c.dqmc dcdq,a.dwmc dcgs,d.dqmc drdq,b.dwmc drgs,jxc_db.dbzsl, DECODE(jxc_db.jgzyk,'N','不经过','Y','经过'),ckmc,jxc_db.shr,jxc_db.shrq,jxc_db.shyj,jxc_db.lrr,jxc_db.lrsj,e.dwmc lrbm,jxc_db.bz  ";
	ls_sql+=" FROM jxc_db,sq_dwxx a,sq_dwxx b,dm_dqbm c,dm_dqbm d,sq_dwxx e,jxc_ckmc ";
    ls_sql+=" where jxc_db.dcgs=a.dwbh(+) and jxc_db.drgs=b.dwbh(+)";
    ls_sql+=" and jxc_db.dcdq=c.dqbm(+) and jxc_db.drdq=d.dqbm(+)";
    ls_sql+=" and jxc_db.lrbm=e.dwbh(+) ";
    ls_sql+=" and jxc_db.djck=jxc_ckmc.ckbh(+) ";
    ls_sql+=" and jxc_db.dbdzt in('2','7') ";
    ls_sql+=" and jxc_db.dbcllx='1'";//0：主材；1：辅材
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_db.dcgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_db.dcgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_db.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_dbXgShList.jsp","","","XgShJxc_db.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"dbph"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("审核");
//设置按钮参数
	String[] buttonName={"删除审核"};//按钮的显示名称
	String[] buttonLink={"DeleteShJxc_db.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);



//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dbph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_db.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("dbph",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">调拨单－审核维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">调拨批号</td>
	<td  width="6%">调拨单状态</td>
	<td  width="3%">材料类型</td>
	<td  width="4%">调拨原因</td>
	<td  width="3%">调出地区</td>
	<td  width="5%">调出公司</td>
	<td  width="3%">调入地区</td>
	<td  width="5%">调入公司</td>
	<td  width="4%">调拨总数量</td>
	<td  width="4%">是否经过总部中央库</td>
	<td  width="7%">调经仓库</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核日期</td>
	<td  width="14%">审核意见</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="13%">备注</td>
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