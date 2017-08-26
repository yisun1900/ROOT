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
	String gdm_gdjcjl_jcjlh=null;
	String gdm_gdjcjl_khbh=null;
	String gdm_gdjcjl_xjr=null;
	String gdm_gdjcjl_xjsj=null;
	String jclxbm=null;
	String gdm_gdjcjl_lrr=null;
	String gdm_gdjcjl_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String jcjgbm=null;
	jcjgbm=request.getParameter("jcjgbm");
	if (jcjgbm!=null)
	{
		if (!(jcjgbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjgbm='"+jcjgbm+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String lrdw=null;
	lrdw=request.getParameter("lrdw");
	if (lrdw!=null)
	{
		if (!(lrdw.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrdw='"+lrdw+"')";
	}

	String cfspbz=null;
	cfspbz=request.getParameter("cfspbz");
	if (cfspbz!=null)
	{
		if (!(cfspbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.cfspbz='"+cfspbz+"')";
	}

	String kpbz=null;
	kpbz=request.getParameter("kpbz");
	if (kpbz!=null)
	{
		if (!(kpbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.kpbz='"+kpbz+"')";
	}
	
	
	gdm_gdjcjl_jcjlh=request.getParameter("gdm_gdjcjl_jcjlh");
	if (gdm_gdjcjl_jcjlh!=null)
	{
		gdm_gdjcjl_jcjlh=cf.GB2Uni(gdm_gdjcjl_jcjlh);
		if (!(gdm_gdjcjl_jcjlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjlh='"+gdm_gdjcjl_jcjlh+"')";
	}
	gdm_gdjcjl_khbh=request.getParameter("gdm_gdjcjl_khbh");
	if (gdm_gdjcjl_khbh!=null)
	{
		gdm_gdjcjl_khbh=cf.GB2Uni(gdm_gdjcjl_khbh);
		if (!(gdm_gdjcjl_khbh.equals("")))	wheresql+=" and  (gdm_gdjcjl.khbh='"+gdm_gdjcjl_khbh+"')";
	}
	gdm_gdjcjl_xjr=request.getParameter("gdm_gdjcjl_xjr");
	if (gdm_gdjcjl_xjr!=null)
	{
		gdm_gdjcjl_xjr=cf.GB2Uni(gdm_gdjcjl_xjr);
		if (!(gdm_gdjcjl_xjr.equals("")))	wheresql+=" and  (gdm_gdjcjl.xjr='"+gdm_gdjcjl_xjr+"')";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj>=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj2");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj<=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	jclxbm=request.getParameter("jclxbm");
	if (jclxbm!=null)
	{
		jclxbm=cf.GB2Uni(jclxbm);
		if (!(jclxbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jclxbm='"+jclxbm+"')";
	}
	gdm_gdjcjl_lrr=request.getParameter("gdm_gdjcjl_lrr");
	if (gdm_gdjcjl_lrr!=null)
	{
		gdm_gdjcjl_lrr=cf.GB2Uni(gdm_gdjcjl_lrr);
		if (!(gdm_gdjcjl_lrr.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrr='"+gdm_gdjcjl_lrr+"')";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj>=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj2");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj<=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
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
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (gdm_gdjcjl.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	ls_sql="SELECT gdm_gdjcjl.jcjlh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.zjxm,fkze,kfzs,jlje,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,jclxmc,jcjgmc,DECODE(gdm_gdjcjl.cfspbz,'1','不需审批','2','未审批','3','审批通过','4','审批未通过'),gdm_gdjcjl.bz  ";
	ls_sql+=" FROM gdm_gdjcjl,crm_khxx,sq_sgd,gdm_jclxbm,gdm_jcjgbm  ";
    ls_sql+=" where gdm_gdjcjl.sgd=sq_sgd.sgd(+) and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
//    ls_sql+=" and gdm_gdjcjl.cfspbz in('1','2')";
//    ls_sql+=" and gdm_gdjcjl.clzt='1'";//1：未接收
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_gdjcjl.lrsj desc,gdm_gdjcjl.jcjlh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Gdm_gdjcjlList.jsp","","","EditGdm_gdjcjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jcjlh","gdm_gdjcjl_khbh","gdm_gdjcjl_xjr","gdm_gdjcjl_xjsj","jclxbm","gdm_jcjgbm_xjjgmc","gdm_gdjcjl_lrr","gdm_gdjcjl_lrsj","gdm_gdjcjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Gdm_gdjcjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jcjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewGdm_gdjcjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jcjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] jcjlh = request.getParameterValues("jcjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jcjlh,"jcjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from gdm_jcjlmx where "+chooseitem;
		sql[1]="delete from gdm_jcjlzp where "+chooseitem;
		sql[2]="delete from gdm_gdjcjl where "+chooseitem;
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
  <B><font size="3">工地监察记录--维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">检查记录号</td>
	<td  width="5%">合同号</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">施工队</td>
	<td  width="4%">工程担当</td>
	<td  width="6%">罚款总额</td>
	<td  width="4%">扣分</td>
	<td  width="5%">奖励金额</td>
	<td  width="4%">检查人</td>
	<td  width="5%">检查时间</td>
	<td  width="6%">检查类型</td>
	<td  width="6%">检查结果</td>
	<td  width="4%">审批标志</td>
	<td  width="16%">备注</td>
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