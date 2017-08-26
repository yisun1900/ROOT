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
	String crm_ycgl_ycdbh=null;
	String crm_ycgl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_ycgl_ycflbm=null;
	String crm_ycgl_ycfssj=null;
	String crm_ycgl_zrr=null;
	String crm_ycgl_ycqksm=null;
	String crm_ycgl_fazdr=null;
	String crm_ycgl_fazdsj=null;
	String crm_ycgl_jhjjsj=null;
	String crm_ycgl_jjfa=null;
	String crm_ycgl_sjclr=null;
	String crm_ycgl_sjclsj=null;
	String crm_ycgl_sjclqk=null;
	String crm_ycgl_wcsj=null;
	String crm_ycgl_sfjj=null;
	String crm_ycgl_lrr=null;
	String crm_ycgl_lrsj=null;
	String crm_ycgl_lrbm=null;
	String crm_ycgl_bz=null;
	crm_ycgl_ycdbh=request.getParameter("crm_ycgl_ycdbh");
	if (crm_ycgl_ycdbh!=null)
	{
		crm_ycgl_ycdbh=cf.GB2Uni(crm_ycgl_ycdbh);
		if (!(crm_ycgl_ycdbh.equals("")))	wheresql+=" and  (crm_ycgl.ycdbh='"+crm_ycgl_ycdbh+"')";
	}
	crm_ycgl_khbh=request.getParameter("crm_ycgl_khbh");
	if (crm_ycgl_khbh!=null)
	{
		crm_ycgl_khbh=cf.GB2Uni(crm_ycgl_khbh);
		if (!(crm_ycgl_khbh.equals("")))	wheresql+=" and  (crm_ycgl.khbh='"+crm_ycgl_khbh+"')";
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
	crm_ycgl_ycflbm=request.getParameter("crm_ycgl_ycflbm");
	if (crm_ycgl_ycflbm!=null)
	{
		crm_ycgl_ycflbm=cf.GB2Uni(crm_ycgl_ycflbm);
		if (!(crm_ycgl_ycflbm.equals("")))	wheresql+=" and  (crm_ycgl.ycflbm='"+crm_ycgl_ycflbm+"')";
	}
	crm_ycgl_ycfssj=request.getParameter("crm_ycgl_ycfssj");
	if (crm_ycgl_ycfssj!=null)
	{
		crm_ycgl_ycfssj=crm_ycgl_ycfssj.trim();
		if (!(crm_ycgl_ycfssj.equals("")))	wheresql+="  and (crm_ycgl.ycfssj=TO_DATE('"+crm_ycgl_ycfssj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_zrr=request.getParameter("crm_ycgl_zrr");
	if (crm_ycgl_zrr!=null)
	{
		crm_ycgl_zrr=cf.GB2Uni(crm_ycgl_zrr);
		if (!(crm_ycgl_zrr.equals("")))	wheresql+=" and  (crm_ycgl.zrr='"+crm_ycgl_zrr+"')";
	}
	crm_ycgl_ycqksm=request.getParameter("crm_ycgl_ycqksm");
	if (crm_ycgl_ycqksm!=null)
	{
		crm_ycgl_ycqksm=cf.GB2Uni(crm_ycgl_ycqksm);
		if (!(crm_ycgl_ycqksm.equals("")))	wheresql+=" and  (crm_ycgl.ycqksm='"+crm_ycgl_ycqksm+"')";
	}
	crm_ycgl_fazdr=request.getParameter("crm_ycgl_fazdr");
	if (crm_ycgl_fazdr!=null)
	{
		crm_ycgl_fazdr=cf.GB2Uni(crm_ycgl_fazdr);
		if (!(crm_ycgl_fazdr.equals("")))	wheresql+=" and  (crm_ycgl.fazdr='"+crm_ycgl_fazdr+"')";
	}
	crm_ycgl_fazdsj=request.getParameter("crm_ycgl_fazdsj");
	if (crm_ycgl_fazdsj!=null)
	{
		crm_ycgl_fazdsj=crm_ycgl_fazdsj.trim();
		if (!(crm_ycgl_fazdsj.equals("")))	wheresql+="  and (crm_ycgl.fazdsj=TO_DATE('"+crm_ycgl_fazdsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_jhjjsj=request.getParameter("crm_ycgl_jhjjsj");
	if (crm_ycgl_jhjjsj!=null)
	{
		crm_ycgl_jhjjsj=crm_ycgl_jhjjsj.trim();
		if (!(crm_ycgl_jhjjsj.equals("")))	wheresql+="  and (crm_ycgl.jhjjsj=TO_DATE('"+crm_ycgl_jhjjsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_jjfa=request.getParameter("crm_ycgl_jjfa");
	if (crm_ycgl_jjfa!=null)
	{
		crm_ycgl_jjfa=cf.GB2Uni(crm_ycgl_jjfa);
		if (!(crm_ycgl_jjfa.equals("")))	wheresql+=" and  (crm_ycgl.jjfa='"+crm_ycgl_jjfa+"')";
	}
	crm_ycgl_sjclr=request.getParameter("crm_ycgl_sjclr");
	if (crm_ycgl_sjclr!=null)
	{
		crm_ycgl_sjclr=cf.GB2Uni(crm_ycgl_sjclr);
		if (!(crm_ycgl_sjclr.equals("")))	wheresql+=" and  (crm_ycgl.sjclr='"+crm_ycgl_sjclr+"')";
	}
	crm_ycgl_sjclsj=request.getParameter("crm_ycgl_sjclsj");
	if (crm_ycgl_sjclsj!=null)
	{
		crm_ycgl_sjclsj=crm_ycgl_sjclsj.trim();
		if (!(crm_ycgl_sjclsj.equals("")))	wheresql+="  and (crm_ycgl.sjclsj=TO_DATE('"+crm_ycgl_sjclsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_sjclqk=request.getParameter("crm_ycgl_sjclqk");
	if (crm_ycgl_sjclqk!=null)
	{
		crm_ycgl_sjclqk=cf.GB2Uni(crm_ycgl_sjclqk);
		if (!(crm_ycgl_sjclqk.equals("")))	wheresql+=" and  (crm_ycgl.sjclqk='"+crm_ycgl_sjclqk+"')";
	}
	crm_ycgl_wcsj=request.getParameter("crm_ycgl_wcsj");
	if (crm_ycgl_wcsj!=null)
	{
		crm_ycgl_wcsj=crm_ycgl_wcsj.trim();
		if (!(crm_ycgl_wcsj.equals("")))	wheresql+="  and (crm_ycgl.wcsj=TO_DATE('"+crm_ycgl_wcsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_sfjj=request.getParameter("crm_ycgl_sfjj");
	if (crm_ycgl_sfjj!=null)
	{
		crm_ycgl_sfjj=cf.GB2Uni(crm_ycgl_sfjj);
		if (!(crm_ycgl_sfjj.equals("")))	wheresql+=" and  (crm_ycgl.sfjj='"+crm_ycgl_sfjj+"')";
	}
	crm_ycgl_lrr=request.getParameter("crm_ycgl_lrr");
	if (crm_ycgl_lrr!=null)
	{
		crm_ycgl_lrr=cf.GB2Uni(crm_ycgl_lrr);
		if (!(crm_ycgl_lrr.equals("")))	wheresql+=" and  (crm_ycgl.lrr='"+crm_ycgl_lrr+"')";
	}
	crm_ycgl_lrsj=request.getParameter("crm_ycgl_lrsj");
	if (crm_ycgl_lrsj!=null)
	{
		crm_ycgl_lrsj=crm_ycgl_lrsj.trim();
		if (!(crm_ycgl_lrsj.equals("")))	wheresql+="  and (crm_ycgl.lrsj=TO_DATE('"+crm_ycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_lrbm=request.getParameter("crm_ycgl_lrbm");
	if (crm_ycgl_lrbm!=null)
	{
		crm_ycgl_lrbm=cf.GB2Uni(crm_ycgl_lrbm);
		if (!(crm_ycgl_lrbm.equals("")))	wheresql+=" and  (crm_ycgl.lrbm='"+crm_ycgl_lrbm+"')";
	}
	crm_ycgl_bz=request.getParameter("crm_ycgl_bz");
	if (crm_ycgl_bz!=null)
	{
		crm_ycgl_bz=cf.GB2Uni(crm_ycgl_bz);
		if (!(crm_ycgl_bz.equals("")))	wheresql+=" and  (crm_ycgl.bz='"+crm_ycgl_bz+"')";
	}
	ls_sql="SELECT crm_ycgl.ycdbh,crm_ycgl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_ycgl.ycflbm,crm_ycgl.ycfssj,crm_ycgl.zrr,crm_ycgl.ycqksm,crm_ycgl.fazdr,crm_ycgl.fazdsj,crm_ycgl.jhjjsj,crm_ycgl.jjfa,crm_ycgl.sjclr,crm_ycgl.sjclsj,crm_ycgl.sjclqk,crm_ycgl.wcsj, DECODE(crm_ycgl.sfjj,'1','录入异常','2','制订方案','3','解决'),crm_ycgl.lrr,crm_ycgl.lrsj,crm_ycgl.lrbm,crm_ycgl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_ycgl  ";
    ls_sql+=" where crm_ycgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_ycglList.jsp","","","EditCrm_ycgl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ycdbh","crm_ycgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_ycgl_ycflbm","crm_ycgl_ycfssj","crm_ycgl_zrr","crm_ycgl_ycqksm","crm_ycgl_fazdr","crm_ycgl_fazdsj","crm_ycgl_jhjjsj","crm_ycgl_jjfa","crm_ycgl_sjclr","crm_ycgl_sjclsj","crm_ycgl_sjclqk","crm_ycgl_wcsj","crm_ycgl_sfjj","crm_ycgl_lrr","crm_ycgl_lrsj","crm_ycgl_lrbm","crm_ycgl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ycdbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_ycglList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] ycdbh = request.getParameterValues("ycdbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ycdbh,"ycdbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_ycgl where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="3%">异常单编号</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="3%">异常分类</td>
	<td  width="3%">异常发生时间</td>
	<td  width="3%">责任人</td>
	<td  width="3%">异常情况说明</td>
	<td  width="3%">方案制订人</td>
	<td  width="3%">方案制订时间</td>
	<td  width="3%">计划解决时间</td>
	<td  width="3%">解决方案</td>
	<td  width="3%">实际处理人</td>
	<td  width="3%">实际处理时间</td>
	<td  width="3%">实际处理情况</td>
	<td  width="3%">完成时间</td>
	<td  width="3%">是否解决</td>
	<td  width="3%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="3%">备注</td>
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