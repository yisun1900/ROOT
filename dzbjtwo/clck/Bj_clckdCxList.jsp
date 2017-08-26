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
	String bj_clckd_ckdh=null;
	String bj_clckd_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String bj_clckd_ckzsl=null;
	String bj_clckd_ckzje=null;
	String bj_clckd_clzt=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and (crm_khxx.dwbh='"+dwbh+"') ";
	}
	String cksj=null;
	cksj=request.getParameter("cksj");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (bj_clckd.cksj>=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}

	cksj=request.getParameter("cksj2");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (bj_clckd.cksj<=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}

	String bj_clckd_lrsj=null;
	bj_clckd_lrsj=request.getParameter("bj_clckd_lrsj");
	if (bj_clckd_lrsj!=null)
	{
		bj_clckd_lrsj=bj_clckd_lrsj.trim();
		if (!(bj_clckd_lrsj.equals("")))	wheresql+="  and (bj_clckd.lrsj>=TO_DATE('"+bj_clckd_lrsj+"','YYYY/MM/DD'))";
	}

	bj_clckd_lrsj=request.getParameter("bj_clckd_lrsj2");
	if (bj_clckd_lrsj!=null)
	{
		bj_clckd_lrsj=bj_clckd_lrsj.trim();
		if (!(bj_clckd_lrsj.equals("")))	wheresql+="  and (bj_clckd.lrsj<=TO_DATE('"+bj_clckd_lrsj+"','YYYY/MM/DD'))";
	}
	String ckr=null;
	ckr=request.getParameter("ckr");
	if (ckr!=null)
	{
		ckr=cf.GB2Uni(ckr);
		if (!(ckr.equals("")))	wheresql+=" and  (bj_clckd.ckr='"+ckr+"')";
	}
	String bj_clckd_lrr=null;
	bj_clckd_lrr=request.getParameter("bj_clckd_lrr");
	if (bj_clckd_lrr!=null)
	{
		bj_clckd_lrr=cf.GB2Uni(bj_clckd_lrr);
		if (!(bj_clckd_lrr.equals("")))	wheresql+=" and  (bj_clckd.lrr='"+bj_clckd_lrr+"')";
	}

	
	
	bj_clckd_ckdh=request.getParameter("bj_clckd_ckdh");
	if (bj_clckd_ckdh!=null)
	{
		bj_clckd_ckdh=cf.GB2Uni(bj_clckd_ckdh);
		if (!(bj_clckd_ckdh.equals("")))	wheresql+=" and  (bj_clckd.ckdh='"+bj_clckd_ckdh+"')";
	}
	bj_clckd_khbh=request.getParameter("bj_clckd_khbh");
	if (bj_clckd_khbh!=null)
	{
		bj_clckd_khbh=cf.GB2Uni(bj_clckd_khbh);
		if (!(bj_clckd_khbh.equals("")))	wheresql+=" and  (bj_clckd.khbh='"+bj_clckd_khbh+"')";
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
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	bj_clckd_ckzsl=request.getParameter("bj_clckd_ckzsl");
	if (bj_clckd_ckzsl!=null)
	{
		bj_clckd_ckzsl=bj_clckd_ckzsl.trim();
		if (!(bj_clckd_ckzsl.equals("")))	wheresql+=" and  (bj_clckd.ckzsl="+bj_clckd_ckzsl+") ";
	}
	bj_clckd_ckzje=request.getParameter("bj_clckd_ckzje");
	if (bj_clckd_ckzje!=null)
	{
		bj_clckd_ckzje=bj_clckd_ckzje.trim();
		if (!(bj_clckd_ckzje.equals("")))	wheresql+=" and  (bj_clckd.ckzje="+bj_clckd_ckzje+") ";
	}
	bj_clckd_clzt=request.getParameter("bj_clckd_clzt");
	if (bj_clckd_clzt!=null)
	{
		bj_clckd_clzt=cf.GB2Uni(bj_clckd_clzt);
		if (!(bj_clckd_clzt.equals("")))	wheresql+=" and  (bj_clckd.clzt='"+bj_clckd_clzt+"')";
	}


	ls_sql="SELECT bj_clckd.ckdh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,sgdmc,bj_clckd.ckzsl,bj_clckd.ckzje, DECODE(bj_clckd.clzt,'1','未审核','2','已审核'),bj_clckd.ckr,bj_clckd.cksj,bj_clckd.lrr,bj_clckd.lrsj,bj_clckd.bz  ";
	ls_sql+=" FROM crm_khxx,bj_clckd,sq_sgd  ";
    ls_sql+=" where bj_clckd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_clckd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_clckdCxList.jsp","SelectCxBj_clckd.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ckdh","bj_clckd_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","bj_clckd_ckzsl","bj_clckd_ckzje","bj_clckd_clzt","bj_clckd_lrr","bj_clckd_lrsj","bj_clckd_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ckdh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ckdh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewBj_clckd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ckdh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">出库单号</td>
	<td  width="5%">客户姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="6%">合同号</td>
	<td  width="4%">施工队</td>
	<td  width="6%">出库总数量</td>
	<td  width="7%">出库总金额</td>
	<td  width="4%">状态</td>
	<td  width="4%">出库人</td>
	<td  width="6%">出库时间</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="23%">备注</td>
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