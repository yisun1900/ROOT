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



	String cw_jrsgdjs_jsjlh=null;
	String cw_jrsgdjs_sgd=null;
	String cw_jrsgdjs_sgbz=null;
	String cw_jrsgdjs_jsrq=null;
	String cw_jrsgdjs_lx=null;
	String cw_jrsgdjs_clzt=null;
	String cw_jrsgdjs_spr=null;
	String cw_jrsgdjs_spsj=null;
	String cw_jrsgdjs_lrr=null;
	String cw_jrsgdjs_lrsj=null;
	String cw_jrsgdjs_lrbm=null;
	cw_jrsgdjs_jsjlh=request.getParameter("cw_jrsgdjs_jsjlh");
	if (cw_jrsgdjs_jsjlh!=null)
	{
		cw_jrsgdjs_jsjlh=cf.GB2Uni(cw_jrsgdjs_jsjlh);
		if (!(cw_jrsgdjs_jsjlh.equals("")))	wheresql+=" and  (cw_jrsgdjs.jsjlh='"+cw_jrsgdjs_jsjlh+"')";
	}
	cw_jrsgdjs_sgd=request.getParameter("cw_jrsgdjs_sgd");
	if (cw_jrsgdjs_sgd!=null)
	{
		cw_jrsgdjs_sgd=cf.GB2Uni(cw_jrsgdjs_sgd);
		if (!(cw_jrsgdjs_sgd.equals("")))	wheresql+=" and  (cw_jrsgdjs.sgd='"+cw_jrsgdjs_sgd+"')";
	}
	cw_jrsgdjs_sgbz=request.getParameter("cw_jrsgdjs_sgbz");
	if (cw_jrsgdjs_sgbz!=null)
	{
		cw_jrsgdjs_sgbz=cf.GB2Uni(cw_jrsgdjs_sgbz);
		if (!(cw_jrsgdjs_sgbz.equals("")))	wheresql+=" and  (cw_jrsgdjs.sgbz='"+cw_jrsgdjs_sgbz+"')";
	}
	cw_jrsgdjs_jsrq=request.getParameter("cw_jrsgdjs_jsrq");
	if (cw_jrsgdjs_jsrq!=null)
	{
		cw_jrsgdjs_jsrq=cw_jrsgdjs_jsrq.trim();
		if (!(cw_jrsgdjs_jsrq.equals("")))	wheresql+="  and (cw_jrsgdjs.jsrq>=TO_DATE('"+cw_jrsgdjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_jsrq=request.getParameter("cw_jrsgdjs_jsrq2");
	if (cw_jrsgdjs_jsrq!=null)
	{
		cw_jrsgdjs_jsrq=cw_jrsgdjs_jsrq.trim();
		if (!(cw_jrsgdjs_jsrq.equals("")))	wheresql+="  and (cw_jrsgdjs.jsrq<=TO_DATE('"+cw_jrsgdjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lx=request.getParameter("cw_jrsgdjs_lx");
	if (cw_jrsgdjs_lx!=null)
	{
		cw_jrsgdjs_lx=cf.GB2Uni(cw_jrsgdjs_lx);
		if (!(cw_jrsgdjs_lx.equals("")))	wheresql+=" and  (cw_jrsgdjs.lx='"+cw_jrsgdjs_lx+"')";
	}
	cw_jrsgdjs_clzt=request.getParameter("cw_jrsgdjs_clzt");
	if (cw_jrsgdjs_clzt!=null)
	{
		cw_jrsgdjs_clzt=cf.GB2Uni(cw_jrsgdjs_clzt);
		if (!(cw_jrsgdjs_clzt.equals("")))	wheresql+=" and  (cw_jrsgdjs.clzt='"+cw_jrsgdjs_clzt+"')";
	}
	cw_jrsgdjs_spr=request.getParameter("cw_jrsgdjs_spr");
	if (cw_jrsgdjs_spr!=null)
	{
		cw_jrsgdjs_spr=cf.GB2Uni(cw_jrsgdjs_spr);
		if (!(cw_jrsgdjs_spr.equals("")))	wheresql+=" and  (cw_jrsgdjs.spr='"+cw_jrsgdjs_spr+"')";
	}
	cw_jrsgdjs_spsj=request.getParameter("cw_jrsgdjs_spsj");
	if (cw_jrsgdjs_spsj!=null)
	{
		cw_jrsgdjs_spsj=cw_jrsgdjs_spsj.trim();
		if (!(cw_jrsgdjs_spsj.equals("")))	wheresql+="  and (cw_jrsgdjs.spsj>=TO_DATE('"+cw_jrsgdjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_spsj=request.getParameter("cw_jrsgdjs_spsj2");
	if (cw_jrsgdjs_spsj!=null)
	{
		cw_jrsgdjs_spsj=cw_jrsgdjs_spsj.trim();
		if (!(cw_jrsgdjs_spsj.equals("")))	wheresql+="  and (cw_jrsgdjs.spsj<=TO_DATE('"+cw_jrsgdjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lrr=request.getParameter("cw_jrsgdjs_lrr");
	if (cw_jrsgdjs_lrr!=null)
	{
		cw_jrsgdjs_lrr=cf.GB2Uni(cw_jrsgdjs_lrr);
		if (!(cw_jrsgdjs_lrr.equals("")))	wheresql+=" and  (cw_jrsgdjs.lrr='"+cw_jrsgdjs_lrr+"')";
	}
	cw_jrsgdjs_lrsj=request.getParameter("cw_jrsgdjs_lrsj");
	if (cw_jrsgdjs_lrsj!=null)
	{
		cw_jrsgdjs_lrsj=cw_jrsgdjs_lrsj.trim();
		if (!(cw_jrsgdjs_lrsj.equals("")))	wheresql+="  and (cw_jrsgdjs.lrsj>=TO_DATE('"+cw_jrsgdjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lrsj=request.getParameter("cw_jrsgdjs_lrsj2");
	if (cw_jrsgdjs_lrsj!=null)
	{
		cw_jrsgdjs_lrsj=cw_jrsgdjs_lrsj.trim();
		if (!(cw_jrsgdjs_lrsj.equals("")))	wheresql+="  and (cw_jrsgdjs.lrsj<=TO_DATE('"+cw_jrsgdjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrsgdjs_lrbm=request.getParameter("cw_jrsgdjs_lrbm");
	if (cw_jrsgdjs_lrbm!=null)
	{
		cw_jrsgdjs_lrbm=cf.GB2Uni(cw_jrsgdjs_lrbm);
		if (!(cw_jrsgdjs_lrbm.equals("")))	wheresql+=" and  (cw_jrsgdjs.lrbm='"+cw_jrsgdjs_lrbm+"')";
	}
	ls_sql="SELECT cw_jrsgdjs.jsjlh,gdjsjdmc, DECODE(cw_jrsgdjs.clzt,'1','结算','2','审批同意','3','审批不同意'),crm_khxx.khxm,crm_khxx.fwdz,bjjbmc,sgdmc,cw_jrsgdjs.bcfkhj,cw_jrsgdjs.jsrq,cw_jrsgdjs.sgbz,crm_khxx.hth,cw_jrsgdjs.khbh,TO_CHAR(cw_jrsgdjs.ysglk),TO_CHAR(cw_jrsgdjs.zjsge),TO_CHAR(cw_jrsgdjs.cfje),TO_CHAR(cw_jrsgdjs.jsglk),cw_jrsgdjs.rgfbfb||'%',TO_CHAR(cw_jrsgdjs.yfrgf),cw_jrsgdjs.bcrgf,cw_jrsgdjs.flkbfb||'%',TO_CHAR(cw_jrsgdjs.ycflk),TO_CHAR(cw_jrsgdjs.kjflk),cw_jrsgdjs.bcflk,cw_jrsgdjs.gsfl,cw_jrsgdjs.psfl,cw_jrsgdjs.kzbjbl||'%',cw_jrsgdjs.kzbj,cw_jrsgdjs.fk,cw_jrsgdjs.bx,cw_jrsgdjs.rybx,cw_jrsgdjs.pck,cw_jrsgdjs.kqtk,cw_jrsgdjs.kqtksm,cw_jrsgdjs.spr,cw_jrsgdjs.spsj,cw_jrsgdjs.spyj,cw_jrsgdjs.lrr,cw_jrsgdjs.lrsj,dwmc,cw_jrsgdjs.bz  ";
	ls_sql+=" FROM crm_khxx,cw_jrsgdjs,dm_gdjsjd,sq_sgd,sq_dwxx,bdm_bjjbbm  ";
    ls_sql+=" where cw_jrsgdjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_jrsgdjs.lx=dm_gdjsjd.gdjsjd(+)";
    ls_sql+=" and cw_jrsgdjs.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_jrsgdjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and cw_jrsgdjs.clzt='1'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrsgdjs.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrsgdjsList.jsp","","","EditCw_jrsgdjs.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_jrsgdjs_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_jrsgdjs_sgd","cw_jrsgdjs_sgbz","cw_jrsgdjs_jsrq","cw_jrsgdjs_ysglk","cw_jrsgdjs_zjsge","cw_jrsgdjs_cfje","cw_jrsgdjs_jsglk","cw_jrsgdjs_rgfbfb","cw_jrsgdjs_yfrgf","cw_jrsgdjs_bcrgf","cw_jrsgdjs_flkbfb","cw_jrsgdjs_ycflk","cw_jrsgdjs_bcflk","cw_jrsgdjs_gsfl","cw_jrsgdjs_psfl","cw_jrsgdjs_kzbjbl","cw_jrsgdjs_kzbj","cw_jrsgdjs_fk","cw_jrsgdjs_kqtk","cw_jrsgdjs_kqtksm","cw_jrsgdjs_bcfkhj","cw_jrsgdjs_lx","cw_jrsgdjs_clzt","cw_jrsgdjs_spr","cw_jrsgdjs_spsj","cw_jrsgdjs_spyj","cw_jrsgdjs_lrr","cw_jrsgdjs_lrsj","cw_jrsgdjs_lrbm","cw_jrsgdjs_bz","cw_jrsgdjs_bx","cw_jrsgdjs_pck"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_jrsgdjs.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">完工结算－修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(430);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">结算记录号</td>
	<td  width="2%">类型</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">客户姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="2%">报价级别</td>
	<td  width="2%">施工队</td>
	<td  width="3%">本次付款合计</td>
	<td  width="2%">拨付日期</td>
	<td  width="2%">施工班长</td>
	<td  width="2%">合同号</td>
	<td  width="2%">客户编号</td>
	<td  width="3%">预算工料款</td>
	<td  width="2%">增减施工额</td>
	<td  width="2%">拆除金额</td>
	<td  width="2%">结算工料款</td>
	<td  width="2%">人工费百分比</td>
	<td  width="2%">已付人工费</td>
	<td  width="2%">本次应付人工费</td>
	<td  width="2%">辅料款百分比</td>
	<td  width="2%">已冲辅料款</td>
	<td  width="2%">扣减辅料款</td>
	<td  width="2%">本次应补退辅料款</td>
	<td  width="2%">公司辅料</td>
	<td  width="2%">配送辅料</td>
	<td  width="2%">扣质保金比例</td>
	<td  width="2%">扣质保金</td>
	<td  width="2%">罚款</td>
	<td  width="2%">场地保险</td>
	<td  width="2%">人员保险</td>
	<td  width="2%">赔偿款</td>
	<td  width="2%">扣其它款</td>
	<td  width="6%">扣其它款说明</td>
	<td  width="2%">审批人</td>
	<td  width="2%">审批时间</td>
	<td  width="7%">审批意见</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="9%">备注</td>
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