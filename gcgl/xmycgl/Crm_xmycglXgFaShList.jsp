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
	String gj=null;
	gj=request.getParameter("gj");
	if (gj!=null)
	{
		gj=cf.GB2Uni(gj);
		if (!(gj.equals("")))	wheresql+=" and  (crm_khxx.gj='"+gj+"')";
	}
	String dd=null;
	dd=request.getParameter("dd");
	if (dd!=null)
	{
		dd=cf.GB2Uni(dd);
		if (!(dd.equals("")))	wheresql+=" and  (crm_khxx.dd='"+dd+"')";
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
	
	
	String crm_xmycgl_djbh=null;
	String crm_xmycgl_cxwtsj=null;
	String crm_xmycgl_dsr=null;
	String crm_xmycgl_zt=null;
	String crm_xmycgl_lrr=null;
	String crm_xmycgl_lrsj=null;
	String crm_xmycgl_jjfazdr=null;
	String crm_xmycgl_jjfazdsj=null;
	String crm_xmycgl_jjfashr=null;
	String crm_xmycgl_jjfashsj=null;
	crm_xmycgl_djbh=request.getParameter("crm_xmycgl_djbh");
	if (crm_xmycgl_djbh!=null)
	{
		crm_xmycgl_djbh=cf.GB2Uni(crm_xmycgl_djbh);
		if (!(crm_xmycgl_djbh.equals("")))	wheresql+=" and  (crm_xmycgl.djbh='"+crm_xmycgl_djbh+"')";
	}
	crm_xmycgl_cxwtsj=request.getParameter("crm_xmycgl_cxwtsj");
	if (crm_xmycgl_cxwtsj!=null)
	{
		crm_xmycgl_cxwtsj=crm_xmycgl_cxwtsj.trim();
		if (!(crm_xmycgl_cxwtsj.equals("")))	wheresql+="  and (crm_xmycgl.cxwtsj>=TO_DATE('"+crm_xmycgl_cxwtsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_cxwtsj=request.getParameter("crm_xmycgl_cxwtsj2");
	if (crm_xmycgl_cxwtsj!=null)
	{
		crm_xmycgl_cxwtsj=crm_xmycgl_cxwtsj.trim();
		if (!(crm_xmycgl_cxwtsj.equals("")))	wheresql+="  and (crm_xmycgl.cxwtsj<=TO_DATE('"+crm_xmycgl_cxwtsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_dsr=request.getParameter("crm_xmycgl_dsr");
	if (crm_xmycgl_dsr!=null)
	{
		crm_xmycgl_dsr=cf.GB2Uni(crm_xmycgl_dsr);
		if (!(crm_xmycgl_dsr.equals("")))	wheresql+=" and  (crm_xmycgl.dsr='"+crm_xmycgl_dsr+"')";
	}
	crm_xmycgl_zt=request.getParameter("crm_xmycgl_zt");
	if (crm_xmycgl_zt!=null)
	{
		crm_xmycgl_zt=cf.GB2Uni(crm_xmycgl_zt);
		if (!(crm_xmycgl_zt.equals("")))	wheresql+=" and  (crm_xmycgl.zt='"+crm_xmycgl_zt+"')";
	}
	crm_xmycgl_lrr=request.getParameter("crm_xmycgl_lrr");
	if (crm_xmycgl_lrr!=null)
	{
		crm_xmycgl_lrr=cf.GB2Uni(crm_xmycgl_lrr);
		if (!(crm_xmycgl_lrr.equals("")))	wheresql+=" and  (crm_xmycgl.lrr='"+crm_xmycgl_lrr+"')";
	}
	crm_xmycgl_lrsj=request.getParameter("crm_xmycgl_lrsj");
	if (crm_xmycgl_lrsj!=null)
	{
		crm_xmycgl_lrsj=crm_xmycgl_lrsj.trim();
		if (!(crm_xmycgl_lrsj.equals("")))	wheresql+="  and (crm_xmycgl.lrsj>=TO_DATE('"+crm_xmycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_lrsj=request.getParameter("crm_xmycgl_lrsj2");
	if (crm_xmycgl_lrsj!=null)
	{
		crm_xmycgl_lrsj=crm_xmycgl_lrsj.trim();
		if (!(crm_xmycgl_lrsj.equals("")))	wheresql+="  and (crm_xmycgl.lrsj<=TO_DATE('"+crm_xmycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfazdr=request.getParameter("crm_xmycgl_jjfazdr");
	if (crm_xmycgl_jjfazdr!=null)
	{
		crm_xmycgl_jjfazdr=cf.GB2Uni(crm_xmycgl_jjfazdr);
		if (!(crm_xmycgl_jjfazdr.equals("")))	wheresql+=" and  (crm_xmycgl.jjfazdr='"+crm_xmycgl_jjfazdr+"')";
	}
	crm_xmycgl_jjfazdsj=request.getParameter("crm_xmycgl_jjfazdsj");
	if (crm_xmycgl_jjfazdsj!=null)
	{
		crm_xmycgl_jjfazdsj=crm_xmycgl_jjfazdsj.trim();
		if (!(crm_xmycgl_jjfazdsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfazdsj>=TO_DATE('"+crm_xmycgl_jjfazdsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfazdsj=request.getParameter("crm_xmycgl_jjfazdsj2");
	if (crm_xmycgl_jjfazdsj!=null)
	{
		crm_xmycgl_jjfazdsj=crm_xmycgl_jjfazdsj.trim();
		if (!(crm_xmycgl_jjfazdsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfazdsj<=TO_DATE('"+crm_xmycgl_jjfazdsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfashr=request.getParameter("crm_xmycgl_jjfashr");
	if (crm_xmycgl_jjfashr!=null)
	{
		crm_xmycgl_jjfashr=cf.GB2Uni(crm_xmycgl_jjfashr);
		if (!(crm_xmycgl_jjfashr.equals("")))	wheresql+=" and  (crm_xmycgl.jjfashr='"+crm_xmycgl_jjfashr+"')";
	}
	crm_xmycgl_jjfashsj=request.getParameter("crm_xmycgl_jjfashsj");
	if (crm_xmycgl_jjfashsj!=null)
	{
		crm_xmycgl_jjfashsj=crm_xmycgl_jjfashsj.trim();
		if (!(crm_xmycgl_jjfashsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfashsj>=TO_DATE('"+crm_xmycgl_jjfashsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfashsj=request.getParameter("crm_xmycgl_jjfashsj2");
	if (crm_xmycgl_jjfashsj!=null)
	{
		crm_xmycgl_jjfashsj=crm_xmycgl_jjfashsj.trim();
		if (!(crm_xmycgl_jjfashsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfashsj<=TO_DATE('"+crm_xmycgl_jjfashsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_xmycgl.djbh, DECODE(crm_xmycgl.zt,'1','异常录入','2','制订方案','3','方案审核','4','已处理','5','停工申请','6','停工审批','7','办理停工','8','办理复工'),crm_xmycgl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_xmycgl.jjfashr,crm_xmycgl.jjfashsj,crm_xmycgl.cxwtsj,crm_xmycgl.dsr,crm_xmycgl.cxwt,crm_xmycgl.jjfazdr,crm_xmycgl.jjfazdsj,crm_xmycgl.jjfa,crm_xmycgl.lrr,crm_xmycgl.lrsj,dwmc,crm_xmycgl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_xmycgl,sq_dwxx  ";
    ls_sql+=" where crm_xmycgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_xmycgl.lrbm=sq_dwxx.dwbh(+)";
 
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_xmycgl.jjfashsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_xmycglXgFaShList.jsp","","","XgFaShCrm_xmycgl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"djbh","crm_xmycgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_xmycgl_cxwtsj","crm_xmycgl_dsr","crm_xmycgl_cxwt","crm_xmycgl_jjfazdr","crm_xmycgl_jjfazdsj","crm_xmycgl_jjfa","crm_xmycgl_jjfashr","crm_xmycgl_jjfashsj","crm_xmycgl_clqklrr","crm_xmycgl_clqklrsj","crm_xmycgl_wtsfjj","crm_xmycgl_sjclqk","crm_xmycgl_tgsqr","crm_xmycgl_tgsqsj","crm_xmycgl_tgsqyy","crm_xmycgl_tgshr","crm_xmycgl_tgshsj","crm_xmycgl_tgshjg","crm_xmycgl_tgshsm","crm_xmycgl_tgyybm","crm_xmycgl_tgkssj","crm_xmycgl_gjfgsj","crm_xmycgl_tglrr","crm_xmycgl_tglrsj","crm_xmycgl_sjfgsj","crm_xmycgl_fglrr","crm_xmycgl_fglrsj","crm_xmycgl_fgsm","crm_xmycgl_zt","crm_xmycgl_lrr","crm_xmycgl_lrsj","crm_xmycgl_lrbm","crm_xmycgl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("方案");
//设置按钮参数
	String[] buttonName={"删除审核"};//按钮的显示名称
	String[] buttonLink={"Crm_xmycglXgFaShList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"djbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_xmycgl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("djbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] djbh = request.getParameterValues("djbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(djbh,"djbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update crm_xmycgl set zt='2',jjfashr=null,jjfashsj=null where zt='3' and "+chooseitem;
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
  <B><font size="3">方案审核－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">登记编号</td>
	<td  width="3%">状态</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="2%">设计师</td>
	<td  width="2%">方案审核人</td>
	<td  width="3%">方案审核时间</td>
	<td  width="3%">出现问题时间</td>
	<td  width="2%">当事人</td>
	<td  width="19%">出现问题</td>
	<td  width="2%">方案制订人</td>
	<td  width="3%">方案制订时间</td>
	<td  width="19%">解决方案</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="11%">备注</td>
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