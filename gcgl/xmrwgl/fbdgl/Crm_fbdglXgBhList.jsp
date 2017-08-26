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
	String crm_fbdgl_fbdbh=null;

	String crm_fbdgl_cpflbm=null;
	String crm_fbdgl_cpjkr=null;
	String crm_fbdgl_fssj=null;
	String crm_fbdgl_jhbhwcsj=null;
	String crm_fbdgl_jhazsj=null;
	String crm_fbdgl_falrr=null;
	String crm_fbdgl_falrsj=null;
	String crm_fbdgl_xdsj=null;
	String crm_fbdgl_bhwcrq=null;
	String crm_fbdgl_zt=null;
	String crm_fbdgl_lrr=null;
	String crm_fbdgl_lrsj=null;
	String crm_fbdgl_lrbm=null;

	
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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}

	
	
	crm_fbdgl_fbdbh=request.getParameter("crm_fbdgl_fbdbh");
	if (crm_fbdgl_fbdbh!=null)
	{
		crm_fbdgl_fbdbh=cf.GB2Uni(crm_fbdgl_fbdbh);
		if (!(crm_fbdgl_fbdbh.equals("")))	wheresql+=" and  (crm_fbdgl.fbdbh='"+crm_fbdgl_fbdbh+"')";
	}

	crm_fbdgl_cpflbm=request.getParameter("crm_fbdgl_cpflbm");
	if (crm_fbdgl_cpflbm!=null)
	{
		crm_fbdgl_cpflbm=cf.GB2Uni(crm_fbdgl_cpflbm);
		if (!(crm_fbdgl_cpflbm.equals("")))	wheresql+=" and  (crm_fbdgl.cpflbm='"+crm_fbdgl_cpflbm+"')";
	}
	crm_fbdgl_cpjkr=request.getParameter("crm_fbdgl_cpjkr");
	if (crm_fbdgl_cpjkr!=null)
	{
		crm_fbdgl_cpjkr=cf.GB2Uni(crm_fbdgl_cpjkr);
		if (!(crm_fbdgl_cpjkr.equals("")))	wheresql+=" and  (crm_fbdgl.cpjkr='"+crm_fbdgl_cpjkr+"')";
	}
	crm_fbdgl_fssj=request.getParameter("crm_fbdgl_fssj");
	if (crm_fbdgl_fssj!=null)
	{
		crm_fbdgl_fssj=crm_fbdgl_fssj.trim();
		if (!(crm_fbdgl_fssj.equals("")))	wheresql+="  and (crm_fbdgl.fssj>=TO_DATE('"+crm_fbdgl_fssj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_fssj=request.getParameter("crm_fbdgl_fssj2");
	if (crm_fbdgl_fssj!=null)
	{
		crm_fbdgl_fssj=crm_fbdgl_fssj.trim();
		if (!(crm_fbdgl_fssj.equals("")))	wheresql+="  and (crm_fbdgl.fssj<=TO_DATE('"+crm_fbdgl_fssj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhbhwcsj=request.getParameter("crm_fbdgl_jhbhwcsj");
	if (crm_fbdgl_jhbhwcsj!=null)
	{
		crm_fbdgl_jhbhwcsj=crm_fbdgl_jhbhwcsj.trim();
		if (!(crm_fbdgl_jhbhwcsj.equals("")))	wheresql+="  and (crm_fbdgl.jhbhwcsj>=TO_DATE('"+crm_fbdgl_jhbhwcsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhbhwcsj=request.getParameter("crm_fbdgl_jhbhwcsj2");
	if (crm_fbdgl_jhbhwcsj!=null)
	{
		crm_fbdgl_jhbhwcsj=crm_fbdgl_jhbhwcsj.trim();
		if (!(crm_fbdgl_jhbhwcsj.equals("")))	wheresql+="  and (crm_fbdgl.jhbhwcsj<=TO_DATE('"+crm_fbdgl_jhbhwcsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhazsj=request.getParameter("crm_fbdgl_jhazsj");
	if (crm_fbdgl_jhazsj!=null)
	{
		crm_fbdgl_jhazsj=crm_fbdgl_jhazsj.trim();
		if (!(crm_fbdgl_jhazsj.equals("")))	wheresql+="  and (crm_fbdgl.jhazsj>=TO_DATE('"+crm_fbdgl_jhazsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_jhazsj=request.getParameter("crm_fbdgl_jhazsj2");
	if (crm_fbdgl_jhazsj!=null)
	{
		crm_fbdgl_jhazsj=crm_fbdgl_jhazsj.trim();
		if (!(crm_fbdgl_jhazsj.equals("")))	wheresql+="  and (crm_fbdgl.jhazsj<=TO_DATE('"+crm_fbdgl_jhazsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_falrr=request.getParameter("crm_fbdgl_falrr");
	if (crm_fbdgl_falrr!=null)
	{
		crm_fbdgl_falrr=cf.GB2Uni(crm_fbdgl_falrr);
		if (!(crm_fbdgl_falrr.equals("")))	wheresql+=" and  (crm_fbdgl.falrr='"+crm_fbdgl_falrr+"')";
	}
	crm_fbdgl_falrsj=request.getParameter("crm_fbdgl_falrsj");
	if (crm_fbdgl_falrsj!=null)
	{
		crm_fbdgl_falrsj=crm_fbdgl_falrsj.trim();
		if (!(crm_fbdgl_falrsj.equals("")))	wheresql+="  and (crm_fbdgl.falrsj=TO_DATE('"+crm_fbdgl_falrsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_xdsj=request.getParameter("crm_fbdgl_xdsj");
	if (crm_fbdgl_xdsj!=null)
	{
		crm_fbdgl_xdsj=crm_fbdgl_xdsj.trim();
		if (!(crm_fbdgl_xdsj.equals("")))	wheresql+="  and (crm_fbdgl.xdsj>=TO_DATE('"+crm_fbdgl_xdsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_xdsj=request.getParameter("crm_fbdgl_xdsj2");
	if (crm_fbdgl_xdsj!=null)
	{
		crm_fbdgl_xdsj=crm_fbdgl_xdsj.trim();
		if (!(crm_fbdgl_xdsj.equals("")))	wheresql+="  and (crm_fbdgl.xdsj<=TO_DATE('"+crm_fbdgl_xdsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_bhwcrq=request.getParameter("crm_fbdgl_bhwcrq");
	if (crm_fbdgl_bhwcrq!=null)
	{
		crm_fbdgl_bhwcrq=crm_fbdgl_bhwcrq.trim();
		if (!(crm_fbdgl_bhwcrq.equals("")))	wheresql+="  and (crm_fbdgl.bhwcrq>=TO_DATE('"+crm_fbdgl_bhwcrq+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_bhwcrq=request.getParameter("crm_fbdgl_bhwcrq2");
	if (crm_fbdgl_bhwcrq!=null)
	{
		crm_fbdgl_bhwcrq=crm_fbdgl_bhwcrq.trim();
		if (!(crm_fbdgl_bhwcrq.equals("")))	wheresql+="  and (crm_fbdgl.bhwcrq<=TO_DATE('"+crm_fbdgl_bhwcrq+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_zt=request.getParameter("crm_fbdgl_zt");
	if (crm_fbdgl_zt!=null)
	{
		crm_fbdgl_zt=cf.GB2Uni(crm_fbdgl_zt);
		if (!(crm_fbdgl_zt.equals("")))	wheresql+=" and  (crm_fbdgl.zt='"+crm_fbdgl_zt+"')";
	}
	crm_fbdgl_lrr=request.getParameter("crm_fbdgl_lrr");
	if (crm_fbdgl_lrr!=null)
	{
		crm_fbdgl_lrr=cf.GB2Uni(crm_fbdgl_lrr);
		if (!(crm_fbdgl_lrr.equals("")))	wheresql+=" and  (crm_fbdgl.lrr='"+crm_fbdgl_lrr+"')";
	}
	crm_fbdgl_lrsj=request.getParameter("crm_fbdgl_lrsj");
	if (crm_fbdgl_lrsj!=null)
	{
		crm_fbdgl_lrsj=crm_fbdgl_lrsj.trim();
		if (!(crm_fbdgl_lrsj.equals("")))	wheresql+="  and (crm_fbdgl.lrsj>=TO_DATE('"+crm_fbdgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_lrsj=request.getParameter("crm_fbdgl_lrsj2");
	if (crm_fbdgl_lrsj!=null)
	{
		crm_fbdgl_lrsj=crm_fbdgl_lrsj.trim();
		if (!(crm_fbdgl_lrsj.equals("")))	wheresql+="  and (crm_fbdgl.lrsj<=TO_DATE('"+crm_fbdgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fbdgl_lrbm=request.getParameter("crm_fbdgl_lrbm");
	if (crm_fbdgl_lrbm!=null)
	{
		crm_fbdgl_lrbm=cf.GB2Uni(crm_fbdgl_lrbm);
		if (!(crm_fbdgl_lrbm.equals("")))	wheresql+=" and  (crm_fbdgl.lrbm='"+crm_fbdgl_lrbm+"')";
	}
	ls_sql="SELECT crm_fbdgl.fbdbh,DECODE(crm_fbdgl.zt,'1','录入','2','出方案','3','下单','4','备货完成','9','安装完成'),cpflmc,crm_fbdgl.fssj,crm_fbdgl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_fbdgl.qksm,crm_fbdgl.cpjkr,crm_fbdgl.cpkf,crm_fbdgl.vipkf,crm_fbdgl.cplhsj,crm_fbdgl.jhbhwcsj,crm_fbdgl.jhazsj,crm_fbdgl.fbwxfa,crm_fbdgl.falrr,crm_fbdgl.falrsj,crm_fbdgl.xdsj,crm_fbdgl.xdr,crm_fbdgl.bhwcrq,crm_fbdgl.bhlrr,crm_fbdgl.lrr,crm_fbdgl.lrsj,dwmc,crm_fbdgl.bz ";
	ls_sql+=" FROM crm_fbdgl,crm_khxx,dm_cpflbm,sq_dwxx  ";
    ls_sql+=" where crm_fbdgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_fbdgl.cpflbm=dm_cpflbm.cpflbm(+)";
    ls_sql+=" and crm_fbdgl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_fbdgl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_fbdglXgBhList.jsp","","","XgBhCrm_fbdgl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fbdbh","crm_fbdgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_fbdgl_cpflbm","crm_fbdgl_cpjkr","crm_fbdgl_cpkf","crm_fbdgl_vipkf","crm_fbdgl_fssj","crm_fbdgl_cplhsj","crm_fbdgl_jhbhwcsj","crm_fbdgl_jhazsj","crm_fbdgl_fbwxfa","crm_fbdgl_falrr","crm_fbdgl_falrsj","crm_fbdgl_xdsj","crm_fbdgl_xdr","crm_fbdgl_bhwcrq","crm_fbdgl_bhlrr","crm_fbdgl_sjazsj","crm_fbdgl_azlrr","crm_fbdgl_azsfcg","crm_fbdgl_zt","crm_fbdgl_lrr","crm_fbdgl_lrsj","crm_fbdgl_lrbm","crm_fbdgl_bz","crm_fbdgl_qksm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fbdbh"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("备货 ");

//设置按钮参数
	String[] buttonName={"删除备货"};//按钮的显示名称
	String[] buttonLink={"Crm_fbdglXgBhList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] fbdbh = request.getParameterValues("fbdbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fbdbh,"fbdbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update crm_fbdgl set bhlrr=null,bhwcrq=null,zt='3' where zt='4' and "+chooseitem;
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
  <B><font size="3">返补维修单－－修改备货</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">返补单编号</td>
	<td  width="2%">状态</td>
	<td  width="6%">产品分类</td>
	<td  width="3%">返补维修发生时间</td>
	<td  width="2%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="2%">设计师</td>
	<td  width="10%">返补维修情况说明</td>
	<td  width="2%">产品接口人</td>
	<td  width="2%">产品客服</td>
	<td  width="2%">VIP客服</td>
	<td  width="3%">产品拉回时间</td>
	<td  width="3%">计划备货完成时间</td>
	<td  width="3%">计划安装时间</td>
	<td  width="10%">返补维修方案</td>
	<td  width="2%">方案录入人</td>
	<td  width="3%">方案录入时间</td>
	<td  width="3%">返补下单日期</td>
	<td  width="2%">下单人</td>
	<td  width="3%">备货完成日期</td>
	<td  width="2%">备货录入人</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="7%">备注</td>
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