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
	String khbh=null;
	String xb=null;
	String fwdz=null;
	String lxfs=null;
	String fgflbm=null;
	String zxjwbm=null;
	String hxmjbm=null;
	String ysbm=null;
	String hth=null;
	String sjs=null;
	String qye=null;
	String sfyyh=null;
	String qyrq=null;
	String kgrq=null;
	String skje=null;
	String skrq=null;
	String zkje=null;
	String fzxm=null;
	String dwbh=null;
	String pdlx=null;
	String zpsgd=null;
	String zpyy=null;
	String pdclzt=null;
	String hdbz=null;
	String zt=null;
	String khlxbm=null;
	String lrr=null;
	String lrsj=null;

	
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))
		{
			wheresql+=" and  (crm_khxx.pdclzt='"+pdclzt+"')";
		}
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

	String xqbm=null;
	xqbm=request.getParameter("xqbm");
	if (xqbm!=null)
	{
		xqbm=cf.GB2Uni(xqbm);
		if (!(xqbm.equals("")))	wheresql+=" and  (crm_khxx.xqbm like '%"+xqbm+"%')";
	}
	String sfzhm=null;
	sfzhm=request.getParameter("sfzhm");
	if (sfzhm!=null)
	{
		sfzhm=cf.GB2Uni(sfzhm);
		if (!(sfzhm.equals("")))	wheresql+=" and  (crm_khxx.sfzhm='"+sfzhm+"')";
	}

	String kgsjqd=null;
	kgsjqd=request.getParameter("kgsjqd");
	if (kgsjqd!=null)
	{
		kgsjqd=cf.GB2Uni(kgsjqd);
		if (!(kgsjqd.equals("")))	wheresql+=" and  (crm_khxx.kgsjqd='"+kgsjqd+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (cqbm='"+cqbm+"')";
	}
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (xb='"+xb+"')";
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
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs='"+lxfs+"')";
	}
	fgflbm=request.getParameter("fgflbm");
	if (fgflbm!=null)
	{
		fgflbm=cf.GB2Uni(fgflbm);
		if (!(fgflbm.equals("")))	wheresql+=" and  (fgflbm='"+fgflbm+"')";
	}
	zxjwbm=request.getParameter("zxjwbm");
	if (zxjwbm!=null)
	{
		zxjwbm=cf.GB2Uni(zxjwbm);
		if (!(zxjwbm.equals("")))	wheresql+=" and  (zxjwbm='"+zxjwbm+"')";
	}
	hxmjbm=request.getParameter("hxmjbm");
	if (hxmjbm!=null)
	{
		hxmjbm=cf.GB2Uni(hxmjbm);
		if (!(hxmjbm.equals("")))	wheresql+=" and  (hxmjbm='"+hxmjbm+"')";
	}
	ysbm=request.getParameter("ysbm");
	if (ysbm!=null)
	{
		ysbm=cf.GB2Uni(ysbm);
		if (!(ysbm.equals("")))	wheresql+=" and  (ysbm='"+ysbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (sjs='"+sjs+"')";
	}
	qye=request.getParameter("qye");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (qye>="+qye+") ";
	}
	qye=request.getParameter("qye2");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (qye<="+qye+") ";
	}
	sfyyh=request.getParameter("sfyyh");
	if (sfyyh!=null)
	{
		sfyyh=cf.GB2Uni(sfyyh);
		if (!(sfyyh.equals("")))	wheresql+=" and  (sfyyh='"+sfyyh+"')";
	}
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq>=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq2");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq<=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	skje=request.getParameter("skje");
	if (skje!=null)
	{
		skje=skje.trim();
		if (!(skje.equals("")))	wheresql+=" and (skje="+skje+") ";
	}
	skrq=request.getParameter("skrq");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (skrq>=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	skrq=request.getParameter("skrq2");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (skrq<=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	zkje=request.getParameter("zkje");
	if (zkje!=null)
	{
		zkje=zkje.trim();
		if (!(zkje.equals("")))	wheresql+=" and (zkje="+zkje+") ";
	}
	fzxm=request.getParameter("fzxm");
	if (fzxm!=null)
	{
		fzxm=cf.GB2Uni(fzxm);
		if (!(fzxm.equals("")))	wheresql+=" and  (fzxm='"+fzxm+"')";
	}

	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";

	pdlx=request.getParameter("pdlx");
	if (pdlx!=null)
	{
		pdlx=cf.GB2Uni(pdlx);
		if (!(pdlx.equals("")))	wheresql+=" and  (pdlx='"+pdlx+"')";
	}
	zpsgd=request.getParameter("zpsgd");
	if (zpsgd!=null)
	{
		zpsgd=cf.GB2Uni(zpsgd);
		if (!(zpsgd.equals("")))	wheresql+=" and  (zpsgd='"+zpsgd+"')";
	}
	zpyy=request.getParameter("zpyy");
	if (zpyy!=null)
	{
		zpyy=cf.GB2Uni(zpyy);
		if (!(zpyy.equals("")))	wheresql+=" and  (zpyy='"+zpyy+"')";
	}
	hdbz=request.getParameter("hdbz");
	if (hdbz!=null)
	{
		hdbz=cf.GB2Uni(hdbz);
		if (!(hdbz.equals("")))	wheresql+=" and  (hdbz='"+hdbz+"')";
	}
	
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (khlxbm='"+khlxbm+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT khbh,crm_khxx.hth,crm_khxx.khxm, crm_khxx.fwdz,DECODE(kgsjqd,'Y','已确定','N','<font color=\"#FF00FF\">未确定</font>'),pdsj,qyrq,dwmc,sjs";
	ls_sql+=" FROM crm_khxx,sq_dwxx  ";
    ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+)   ";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.pdsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","sbrq","hdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"生成选中二维码"};//按钮的显示名称
	String[] buttonLink={"ScEwm.jsp"};//按钮单击调用的网页，可以增加参数  DownloadEwm
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
/*
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewEwm.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">签单客户--二维码</B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">客户编号</td>
	<td  width="10%">合同号</td>
	<td  width="8%">客户姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="8%">开工时间</td>
	<td  width="8%">派单时间</td>
	<td  width="8%">签约日期</td>
	<td  width="15%">签约店面</td>
	<td  width="7%">设计师</td>
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
