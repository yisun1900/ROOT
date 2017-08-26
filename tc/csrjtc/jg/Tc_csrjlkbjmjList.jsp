<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String dqbm=null;
	String bjjbbm=null;
	String tccplbbm=null;
	String tccpdlbm=null;
	String sfyqxtpp=null;
	String jldw=null;
	String sfkjm=null;
	String jmdj=null;
	String lrr=null;
	String lrsj=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (tc_csrjlkbjmj.dqbm='"+dqbm+"')";
	}
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (tc_csrjlkbjmj.bjjbbm='"+bjjbbm+"')";
	}
	tccplbbm=request.getParameter("tccplbbm");
	if (tccplbbm!=null)
	{
		tccplbbm=tccplbbm.trim();
		if (!(tccplbbm.equals("")))	wheresql+=" and (tc_csrjlkbjmj.tccplbbm="+tccplbbm+") ";
	}
	tccpdlbm=request.getParameter("tccpdlbm");
	if (tccpdlbm!=null)
	{
		tccpdlbm=tccpdlbm.trim();
		if (!(tccpdlbm.equals("")))	wheresql+=" and (tc_csrjlkbjmj.tccpdlbm="+tccpdlbm+") ";
	}
	sfyqxtpp=request.getParameter("sfyqxtpp");
	if (sfyqxtpp!=null)
	{
		sfyqxtpp=cf.GB2Uni(sfyqxtpp);
		if (!(sfyqxtpp.equals("")))	wheresql+=" and  (tc_csrjlkbjmj.sfyqxtpp='"+sfyqxtpp+"')";
	}
	jldw=request.getParameter("jldw");
	if (jldw!=null)
	{
		jldw=cf.GB2Uni(jldw);
		if (!(jldw.equals("")))	wheresql+=" and  (tc_csrjlkbjmj.jldw='"+jldw+"')";
	}
	sfkjm=request.getParameter("sfkjm");
	if (sfkjm!=null)
	{
		sfkjm=cf.GB2Uni(sfkjm);
		if (!(sfkjm.equals("")))	wheresql+=" and  (tc_csrjlkbjmj.sfkjm='"+sfkjm+"')";
	}
	jmdj=request.getParameter("jmdj");
	if (jmdj!=null)
	{
		jmdj=jmdj.trim();
		if (!(jmdj.equals("")))	wheresql+=" and  (tc_csrjlkbjmj.jmdj="+jmdj+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (tc_csrjlkbjmj.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (tc_csrjlkbjmj.lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_csrjlkbjmj.dqbm,dm_dqbm.dqmc,tc_csrjlkbjmj.bjjbbm,bdm_bjjbbm.bjjbmc,tc_csrjlkbjmj.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_csrjlkbjmj.sfyqxtpp,'Y','是','N','否') sfyqxtpp,tc_csrjlkbjmj.jldw, DECODE(tc_csrjlkbjmj.sfkjm,'1','不可减免','2','可减免') sfkjm,tc_csrjlkbjmj.jmdj,DECODE(tcnbz,'Y','套餐内','N','否') tcnbz,DECODE(sfbxx,'Y','必选项','N','否') sfbxx,tc_csrjlkbjmj.lrr,tc_csrjlkbjmj.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_csrjlkbjmj,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_csrjlkbjmj.dqbm=dm_dqbm.dqbm(+) and tc_csrjlkbjmj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjlkbjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjlkbjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and tc_csrjlkbjmj.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and tc_csrjlkbjmj.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjlkbjmj.dqbm,tc_csrjlkbjmj.bjjbbm,tc_csrjlkbjmj.tccpdlbm,tc_csrjlkbjmj.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_csrjlkbjmjList.jsp","","","EditTc_csrjlkbjmj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","clxlmc","cldlmc","sfyqxtpp","jldw","sfkjm","jmdj","tcnbz","sfbxx","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_csrjlkbjmjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tc_csrjlkbjmj where "+chooseitem;
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
  <B><font size="3">套餐铝扣板减免价－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">地区</td>
	<td  width="9%">报价级别</td>
	<td  width="16%">产品类别</td>
	<td  width="14%">产品大类</td>
	<td  width="8%">是否要求相同品牌</td>
	<td  width="7%">计量单位</td>
	<td  width="7%">是否可减免</td>
	<td  width="7%">减免单价</td>
	<td  width="6%">套餐内标志</td>
	<td  width="6%">是否必选项</td>
	<td  width="7%">录入人</td>
	<td  width="9%">录入时间</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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