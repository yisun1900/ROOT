<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";



	if (zwbm.equals("31"))//监理主管，只能看本小组工地
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
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

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	String sgdmc=null;
	sgdmc=request.getParameter("sgdmc");
	if (sgdmc!=null)
	{
		sgdmc=cf.GB2Uni(sgdmc);
		if (!(sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sgdmc+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}







	String kp_xjgdjl_xjjlh=null;
	String kp_xjgdjl_khbh=null;
	String kp_xjgdjl_xjr=null;
	String kp_xjgdjl_xjsj=null;
	String xjlxbm=null;
	String kp_xjgdjl_lrr=null;
	String kp_xjgdjl_lrsj=null;



	String xjjgbm=null;
	xjjgbm=request.getParameter("xjjgbm");
	if (xjjgbm!=null)
	{
		if (!(xjjgbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjgbm='"+xjjgbm+"')";
	}

	String lrdw=null;
	lrdw=request.getParameter("lrdw");
	if (lrdw!=null)
	{
		if (!(lrdw.equals("")))	wheresql+=" and  (kp_xjgdjl.lrdw='"+lrdw+"')";
	}

	String cfspbz=null;
	cfspbz=request.getParameter("cfspbz");
	if (cfspbz!=null)
	{
		if (!(cfspbz.equals("")))	wheresql+=" and  (kp_xjgdjl.cfspbz='"+cfspbz+"')";
	}

	String kpbz=null;
	kpbz=request.getParameter("kpbz");
	if (kpbz!=null)
	{
		if (!(kpbz.equals("")))	wheresql+=" and  (kp_xjgdjl.kpbz='"+kpbz+"')";
	}
	
	
	kp_xjgdjl_xjjlh=request.getParameter("kp_xjgdjl_xjjlh");
	if (kp_xjgdjl_xjjlh!=null)
	{
		kp_xjgdjl_xjjlh=cf.GB2Uni(kp_xjgdjl_xjjlh);
		if (!(kp_xjgdjl_xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjlh='"+kp_xjgdjl_xjjlh+"')";
	}
	kp_xjgdjl_khbh=request.getParameter("kp_xjgdjl_khbh");
	if (kp_xjgdjl_khbh!=null)
	{
		kp_xjgdjl_khbh=cf.GB2Uni(kp_xjgdjl_khbh);
		if (!(kp_xjgdjl_khbh.equals("")))	wheresql+=" and  (kp_xjgdjl.khbh='"+kp_xjgdjl_khbh+"')";
	}
	kp_xjgdjl_xjr=request.getParameter("kp_xjgdjl_xjr");
	if (kp_xjgdjl_xjr!=null)
	{
		kp_xjgdjl_xjr=cf.GB2Uni(kp_xjgdjl_xjr);
		if (!(kp_xjgdjl_xjr.equals("")))	wheresql+=" and  (kp_xjgdjl.xjr='"+kp_xjgdjl_xjr+"')";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj>=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj2");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj<=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	xjlxbm=request.getParameter("xjlxbm");
	if (xjlxbm!=null)
	{
		xjlxbm=cf.GB2Uni(xjlxbm);
		if (!(xjlxbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjlxbm='"+xjlxbm+"')";
	}
	kp_xjgdjl_lrr=request.getParameter("kp_xjgdjl_lrr");
	if (kp_xjgdjl_lrr!=null)
	{
		kp_xjgdjl_lrr=cf.GB2Uni(kp_xjgdjl_lrr);
		if (!(kp_xjgdjl_lrr.equals("")))	wheresql+=" and  (kp_xjgdjl.lrr='"+kp_xjgdjl_lrr+"')";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj>=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj2");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj<=TO_DATE('"+kp_xjgdjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String fkbm=null;
	fkbm=request.getParameter("fkbm");
	if (fkbm!=null)
	{
		fkbm=cf.GB2Uni(fkbm);
		if (!(fkbm.equals("")))	wheresql+=" and  (kp_zggdmx.fkbm='"+fkbm+"')";
	}
	String fkbmjsr=null;
	fkbmjsr=request.getParameter("fkbmjsr");
	if (fkbmjsr!=null)
	{
		fkbmjsr=cf.GB2Uni(fkbmjsr);
		if (!(fkbmjsr.equals("")))	wheresql+=" and  (kp_zggdmx.fkbmjsr='"+fkbmjsr+"')";
	}

	ls_sql="SELECT zgjlh,decode(kp_zggdmx.clzt,'1','未接收','2','已接受','3','在处理','4','已解决','5','验收通过','6','验收未通过')  clzt,kp_xjgdjl.xjjlh,kp_zggdmx.yqjjsj,kp_zggdmx.zgxm,dwmc,kp_zggdmx.fkbmjsr,sgdmc,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,crm_khxx.khbh,kp_zggdmx.zgsm,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,xjjgmc,kp_xjgdjl.bz   ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm,dm_xjjgbm,kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+) ";
    ls_sql+=" and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm(+) ";
    ls_sql+=" and kp_xjgdjl.xjjlh=kp_zggdmx.xjjlh(+) ";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.clzt in ('1','6') ";//1:未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
    ls_sql+=" and kp_xjgdjl.wtclbz in('N','C')  ";//B：无整改；N：整改未接收；C：在处理；Y：已解决
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_xjgdjlJsList.jsp","","","JsKp_xjgdjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setEditStr("接收");
/*
//设置显示列
	String[] disColName={"xjjlh","kp_xjgdjl_khbh","kp_xjgdjl_xjr","kp_xjgdjl_xjsj","xjlxbm","dm_xjjgbm_xjjgmc","kp_xjgdjl_lrr","kp_xjgdjl_lrsj","kp_xjgdjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zgjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xjjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_xjgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xjjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
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

	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">整改问题－接收</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">整改记录号</td>
	<td  width="3%">整改处理状态</td>
	<td  width="4%">检查记录号</td>
	<td  width="4%">要求解决时间</td>
	<td  width="9%">整改项目</td>
	<td  width="5%">反馈部门</td>
	<td  width="3%">反馈部门接收人</td>
	<td  width="3%">施工队</td>
	<td  width="4%">客户姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="3%">质检</td>
	<td  width="4%">客户编号</td>
	<td  width="12%">整改说明</td>
	<td  width="3%">检查人</td>
	<td  width="4%">检查时间</td>
	<td  width="5%">检查类型</td>
	<td  width="3%">检查结果</td>
	<td  width="12%">情况说明</td>
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