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

	String bgfjlh=null;
	bgfjlh=request.getParameter("bgfjlh");
	if (bgfjlh!=null)
	{
		bgfjlh=cf.GB2Uni(bgfjlh);
		if (!(bgfjlh.equals("")))	wheresql+=" and  (cw_lfbgfjl.bgfjlh='"+bgfjlh+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cw_lfbgfjl.lrr='"+lrr+"')";
	}
	String bfcs=null;
	bfcs=request.getParameter("bfcs");
	if (bfcs!=null)
	{
		bfcs=cf.GB2Uni(bfcs);
		if (!(bfcs.equals("")))	wheresql+=" and  (cw_lfbgfjl.bfcs='"+bfcs+"')";
	}
	String bfjs=null;
	bfjs=request.getParameter("bfjs");
	if (bfjs!=null)
	{
		bfjs=cf.GB2Uni(bfjs);
		if (!(bfjs.equals("")))	wheresql+=" and  (cw_lfbgfjl.bfjs='"+bfjs+"')";
	}
	String bfrq=null;
	bfrq=request.getParameter("bfrq");
	if (bfrq!=null)
	{
		bfrq=bfrq.trim();
		if (!(bfrq.equals("")))	wheresql+="  and (cw_lfbgfjl.bfrq>=TO_DATE('"+bfrq+"','YYYY-MM-DD'))";
	}
	bfrq=request.getParameter("bfrq2");
	if (bfrq!=null)
	{
		bfrq=bfrq.trim();
		if (!(bfrq.equals("")))	wheresql+="  and (cw_lfbgfjl.bfrq<=TO_DATE('"+bfrq+"','YYYY-MM-DD'))";
	}

	ls_sql="SELECT cw_lfbgfjl.bgfjlh,gdjsjdmc,cw_lfbgfjl.bfbl||'%',TO_CHAR(cw_lfbgfjl.zqgcf),TO_CHAR(cw_lfbgfjl.zhgcf),DECODE(cw_lfbgfjl.bfjs,'1','折前工程费','2','折后工程费','3','实收款'),TO_CHAR(cw_lfbgfjl.bfje),TO_CHAR(cw_lfbgfjl.yfgf),cw_lfbgfjl.sjbk,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.khbh,gcjdmc,sgdmc,cw_lfbgfjl.sgbz,dwmc,cw_lfbgfjl.bfrq  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm,dm_gdjsjd,cw_lfbgfjl ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and cw_lfbgfjl.sgd=sq_sgd.sgd(+)  ";
    ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_lfbgfjl.bfcs=dm_gdjsjd.gdjsjd(+)";
    ls_sql+=" and crm_khxx.khbh=cw_lfbgfjl.khbh";


	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_lfbgfjl.lrsj desc,cw_lfbgfjl.khbh,cw_lfbgfjl.bfcs";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_lfbgfjlList.jsp","","","EditCw_lfbgfjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"bgfjlh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_lfbgfjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">拨工费－修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">拨工费记录号</td>
	<td  width="6%">拨工费次数</td>
	<td  width="4%">拨付比例</td>
	<td  width="6%">折前工程费</td>
	<td  width="6%">折后工程费</td>
	<td  width="6%">拨付基数</td>
	<td  width="5%">拨付金额</td>
	<td  width="5%">已付工费</td>
	<td  width="6%">本次实际拨款</td>

	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="4%">客户编号</td>
	<td  width="5%">工程进度</td>
	<td  width="4%">施工队</td>
	<td  width="4%">班长</td>
	<td  width="7%">签约店面</td>
	<td  width="6%">拨付日期</td>
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