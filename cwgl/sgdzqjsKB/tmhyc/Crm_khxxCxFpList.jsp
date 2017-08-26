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
	
	String sgd=null;
	String sgbz=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgd='"+sgd+"')";
	}
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgbz='"+sgbz+"')";
	}
	
	
	String cw_sgdzqjsjlkb_jsjlh=null;
	String cw_sgdzqjsjlkb_jsrq=null;
	String cw_sgdzqjsjlkb_jsbl=null;
	String cw_sgdzqjsjlkb_lrr=null;
	String cw_sgdzqjsjlkb_lrsj=null;
	cw_sgdzqjsjlkb_jsjlh=request.getParameter("cw_sgdzqjsjlkb_jsjlh");
	if (cw_sgdzqjsjlkb_jsjlh!=null)
	{
		cw_sgdzqjsjlkb_jsjlh=cf.GB2Uni(cw_sgdzqjsjlkb_jsjlh);
		if (!(cw_sgdzqjsjlkb_jsjlh.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsjlh='"+cw_sgdzqjsjlkb_jsjlh+"')";
	}
	cw_sgdzqjsjlkb_jsrq=request.getParameter("cw_sgdzqjsjlkb_jsrq");
	if (cw_sgdzqjsjlkb_jsrq!=null)
	{
		cw_sgdzqjsjlkb_jsrq=cw_sgdzqjsjlkb_jsrq.trim();
		if (!(cw_sgdzqjsjlkb_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.jsrq>=TO_DATE('"+cw_sgdzqjsjlkb_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_jsrq=request.getParameter("cw_sgdzqjsjlkb_jsrq2");
	if (cw_sgdzqjsjlkb_jsrq!=null)
	{
		cw_sgdzqjsjlkb_jsrq=cw_sgdzqjsjlkb_jsrq.trim();
		if (!(cw_sgdzqjsjlkb_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.jsrq<=TO_DATE('"+cw_sgdzqjsjlkb_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_jsbl=request.getParameter("cw_sgdzqjsjlkb_jsbl");
	if (cw_sgdzqjsjlkb_jsbl!=null)
	{
		cw_sgdzqjsjlkb_jsbl=cw_sgdzqjsjlkb_jsbl.trim();
		if (!(cw_sgdzqjsjlkb_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsbl>="+cw_sgdzqjsjlkb_jsbl+") ";
	}
	cw_sgdzqjsjlkb_jsbl=request.getParameter("cw_sgdzqjsjlkb_jsbl");
	if (cw_sgdzqjsjlkb_jsbl!=null)
	{
		cw_sgdzqjsjlkb_jsbl=cw_sgdzqjsjlkb_jsbl.trim();
		if (!(cw_sgdzqjsjlkb_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsbl<="+cw_sgdzqjsjlkb_jsbl+") ";
	}
	cw_sgdzqjsjlkb_lrsj=request.getParameter("cw_sgdzqjsjlkb_lrsj");
	if (cw_sgdzqjsjlkb_lrsj!=null)
	{
		cw_sgdzqjsjlkb_lrsj=cw_sgdzqjsjlkb_lrsj.trim();
		if (!(cw_sgdzqjsjlkb_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.lrsj>=TO_DATE('"+cw_sgdzqjsjlkb_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_lrsj=request.getParameter("cw_sgdzqjsjlkb_lrsj2");
	if (cw_sgdzqjsjlkb_lrsj!=null)
	{
		cw_sgdzqjsjlkb_lrsj=cw_sgdzqjsjlkb_lrsj.trim();
		if (!(cw_sgdzqjsjlkb_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.lrsj<=TO_DATE('"+cw_sgdzqjsjlkb_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_lrr=request.getParameter("cw_sgdzqjsjlkb_lrr");
	if (cw_sgdzqjsjlkb_lrr!=null)
	{
		cw_sgdzqjsjlkb_lrr=cf.GB2Uni(cw_sgdzqjsjlkb_lrr);
		if (!(cw_sgdzqjsjlkb_lrr.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.lrr='"+cw_sgdzqjsjlkb_lrr+"')";
	}

	ls_sql="SELECT cw_sgdzqjsjlkb.jsjlh,cw_sgdzqjsjlkb.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,sgdmc,cw_sgdzqjsjlkb.sgbz,cw_sgdzqjsjlkb.jsrq,cw_sgdzqjsjlkb.jsje,cw_sgdzqjsjlkb.jsbl||'%',cw_sgdzqjsjlkb.jskjs,crm_khxx.sjs,cw_sgdzqjsjlkb.lrr,cw_sgdzqjsjlkb.lrsj,dwmc,cw_sgdzqjsjlkb.bz  ";
	ls_sql+=" FROM crm_khxx,cw_sgdzqjsjlkb,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_sgdzqjsjlkb.khbh=crm_khxx.khbh(+) and cw_sgdzqjsjlkb.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lx='5'";//5:钛马赫首次结算
    ls_sql+=" and crm_khxx.gdjsjd='5'";//5:钛马赫首次结算

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
	ls_sql+=" order by cw_sgdzqjsjlkb.jsrq desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxCxFpList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sgdzqjsjlkb_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","sgd","sgbz","cw_sgdzqjsjlkb_jsrq","cw_sgdzqjsjlkb_jskjs","cw_sgdzqjsjlkb_jsbl","cw_sgdzqjsjlkb_jsje","cw_sgdzqjsjlkb_lrr","cw_sgdzqjsjlkb_lrsj","cw_sgdzqjsjlkb_lrbm","cw_sgdzqjsjlkb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"登记"};//按钮的显示名称
	String[] buttonLink={"SaveJsFp.jsp"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">钛马赫首次结算－－已交发票</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">结算记录号</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="4%">施工队</td>
	<td  width="4%">现场负责人</td>
	<td  width="5%">结算日期</td>
	<td  width="6%">结算金额</td>
	<td  width="4%">结算比例</td>
	<td  width="6%">结算款基数</td>
	<td  width="4%">设计师</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="18%">备注</td>
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