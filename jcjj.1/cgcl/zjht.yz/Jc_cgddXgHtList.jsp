<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String yhdlm=(String)session.getAttribute("yhdlm");
	String jjsjsmc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='12'");
	if (jjsjsmc==null)
	{
		jjsjsmc="";
	}
	String jcddglbz=(String)session.getAttribute("jcddglbz");
	if (jcddglbz.equals("N"))//过滤标志
	{
		jjsjsmc="";
	}

	String ls_sql=null;
	String wheresql="";

	String ddbh=null;
	String khbh=null;
	String dwbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String cgsjs=null;
	String clzt=null;
	String khlx=null;
	String fgs=null;

	String crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	
	String pdgc=null;
	pdgc=request.getParameter("pdgc");
	if (pdgc!=null)
	{
		pdgc=cf.GB2Uni(pdgc);
		if (!(pdgc.equals("")))	wheresql+=" and  (jc_cgdd.pdgc='"+pdgc+"')";
	}
	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		sfpsjs=cf.GB2Uni(sfpsjs);
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_cgdd.sfpsjs='"+sfpsjs+"')";
	}


	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+dwbh+"')";
	}
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+ddbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs='"+cgsjs+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+clzt+"')";
	}
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+=" and  (jc_cgdd.khlx='"+khlx+"')";
	}


	ls_sql="SELECT jc_cgdd.ddbh as ddbh,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,pdgcmc,DECODE(jc_cgdd.sfpsjs,'1','是','2','否') sfpsjs,jc_cgdd.khbh as khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs,clztmc,DECODE(jc_cgdd.khlx,'2','家装客户','4','非家装') as jc_cgdd_khlx,jc_cgdd.pdsj,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.kjxsj,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,a.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_dwxx a";
    ls_sql+=" where jc_cgdd.dwbh=a.dwbh";
    ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
	if (!jjsjsmc.equals(""))
	{
		ls_sql+=" and (jc_cgdd.cgsjs='"+jjsjsmc+"')";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdd.qhtsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","XgHtJc_cgdd.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
//	pageObj.setEditStr("合同");//设置每页显示记录数
//设置显示列
	String[] disColName={"ddbh","clztmc","hth","khxm","sdks","xtbc","cghs","tmpp","tmhs","blcz","jiaolian","htze","gtbfje","tmbfje","wjhtze","dqhtze","pdgcmc","sfpsjs","jc_cgdd_cgsjs","pdsj","sccsj","sfcsj","qhtsj","jhazrq","kjxsj","jc_cgdd_khlx","fwdz","clgw","ztjjgw","xmzy","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除合同信息"};//按钮的显示名称
	String[] buttonLink={"DeleteHtJc_cgdd.jsp"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("jc_cgdd_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改合同</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">橱柜款式</td>
	<td  width="3%">箱体板材</td>
	<td  width="3%">橱柜花色</td>
	<td  width="3%">台面品牌</td>
	<td  width="3%">台面花色</td>
	<td  width="3%">玻璃材质</td>
	<td  width="3%">铰链</td>
	<td  width="4%">合同总额</td>
	<td  width="3%">柜体合同金额</td>
	<td  width="3%">台面合同金额</td>
	<td  width="3%">五金合同金额</td>
	<td  width="3%">电器合同金额</td>
	<td  width="4%">派单工厂</td>
	<td  width="2%">是否派设计师 </td>
	<td  width="2%">家居设计师</td>
	<td  width="3%">派单时间</td>
	<td  width="3%">实初测时间</td>
	<td  width="3%">实复测时间</td>
	<td  width="3%">签合同时间</td>
	<td  width="3%">计划安装日期</td>
	<td  width="3%">可减项截止时间</td>
	<td  width="3%">客户类型</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="5%">录入部门</td>
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