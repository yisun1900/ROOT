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
	String psdh=null;
	String dwbh=null;
	String khbh=null;
	String pszsl=null;
	String pszje=null;
	String pszt=null;
	String lrr=null;
	String lrsj=null;
	String bz=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String fgs=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (cl_psd.lx='"+lx+"')";
	}

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=sgd.trim();
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String psfs=null;
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		if (!(psfs.equals("")))	wheresql+=" and  (cl_psd.psfs='"+psfs+"')";
	}
	String jhshsj=null;
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (cl_psd.jhshsj>=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (cl_psd.jhshsj<=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_psd.dwbh='"+fgs+"')";
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}
	psdh=request.getParameter("psdh");
	if (psdh!=null)
	{
		psdh=cf.GB2Uni(psdh);
		if (!(psdh.equals("")))	wheresql+=" and  (cl_psd.psdh='"+psdh+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cl_psd.dwbh='"+dwbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cl_psd.khbh='"+khbh+"')";
	}
	pszsl=request.getParameter("pszsl");
	if (pszsl!=null)
	{
		pszsl=pszsl.trim();
		if (!(pszsl.equals("")))	wheresql+=" and  (cl_psd.pszsl>="+pszsl+") ";
	}
	pszsl=request.getParameter("pszsl2");
	if (pszsl!=null)
	{
		pszsl=pszsl.trim();
		if (!(pszsl.equals("")))	wheresql+=" and  (cl_psd.pszsl<="+pszsl+") ";
	}
	pszje=request.getParameter("pszje");
	if (pszje!=null)
	{
		pszje=pszje.trim();
		if (!(pszje.equals("")))	wheresql+=" and  (cl_psd.pszje>="+pszje+") ";
	}
	pszje=request.getParameter("pszje2");
	if (pszje!=null)
	{
		pszje=pszje.trim();
		if (!(pszje.equals("")))	wheresql+=" and  (cl_psd.pszje<="+pszje+") ";
	}
	pszt=request.getParameter("pszt");
	if (pszt!=null)
	{
		pszt=cf.GB2Uni(pszt);
		if (!(pszt.equals("")))	wheresql+=" and  (cl_psd.pszt='"+pszt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cl_psd.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_psd.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_psd.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (bz='"+bz+"')";
	}
	ls_sql="SELECT cl_psd.psdh,crm_khxx.hth,DECODE(cl_psd.lx,'1','配货','2','退货') lx,DECODE(cl_psd.pszt,'1','未提交','2','已提交','3','已配送') pszt,DECODE(cl_psd.psfs,'1','配送','2','自提','9','其它'),cl_psd.jhshsj,cl_psd.fkje,cl_psd.yf,cl_psd.qtsf,cl_psd.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cl_psd.pszsl,cl_psd.pszje,cl_psd.lrr,cl_psd.lrsj,dwmc,cl_psd.bz ";
	ls_sql+=" FROM cl_psd,sq_dwxx,crm_khxx,sq_sgd ";
    ls_sql+=" where cl_psd.dwbh=sq_dwxx.dwbh(+) and cl_psd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_psd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_ckdCxList.jsp","SelectCxCl_ckd.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"psdh","dwbh","khbh","pszsl","pszje","pszt","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"psdh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"psdh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="viewckmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("psdh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">配送单号</td>
	<td  width="5%">合同号</td>
	<td  width="3%">类型</td>
	<td  width="4%">配送状态</td>
	<td  width="3%">配送方式</td>
	<td  width="5%">计划送货时间</td>
	<td  width="6%">返款金额</td>
	<td  width="6%">配送运费</td>
	<td  width="6%">其它收费</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="4%">施工队长</td>
	<td  width="5%">配送总数量</td>
	<td  width="6%">配送总金额</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">分公司</td>
	<td  width="17%">备注</td>
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