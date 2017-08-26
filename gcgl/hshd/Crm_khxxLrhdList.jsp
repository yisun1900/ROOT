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
	String khbh=null;
	String khxm=null;
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
	String pdlx=null;
	String zpsgd=null;
	String zpyy=null;
	String pdclzt=null;
	String hdbz=null;
	String zt=null;
	String khlxbm=null;
	String lrr=null;
	String lrsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	
	String hdr=null;
	hdr=request.getParameter("hdr");
	if (hdr!=null)
	{
		hdr=cf.GB2Uni(hdr);
		if (!(hdr.equals("")))	wheresql+=" and  (hdr like '%"+hdr+"%')";
	}
	String cgdz=null;
	cgdz=request.getParameter("cgdz");
	if (cgdz!=null)
	{
		cgdz=cf.GB2Uni(cgdz);
		if (!(cgdz.equals("")))	wheresql+=" and  (cgdz like '%"+cgdz+"%')";
	}
	String hdsfss=null;
	hdsfss=request.getParameter("hdsfss");
	if (hdsfss!=null)
	{
		hdsfss=cf.GB2Uni(hdsfss);
		if (!(hdsfss.equals("")))	wheresql+=" and  (hdsfss='"+hdsfss+"')";
	}
	
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	String cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (cqbm='"+cqbm+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm='"+khxm+"')";
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
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))	wheresql+=" and  (pdclzt='"+pdclzt+"')";
	}
	hdbz=request.getParameter("hdbz");
	if (hdbz!=null)
	{
		hdbz=cf.GB2Uni(hdbz);
		if (!(hdbz.equals("")))	wheresql+=" and  (hdbz='"+hdbz+"')";
	}
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		zt=cf.GB2Uni(zt);
		if (!(zt.equals("")))	wheresql+=" and  (zt='"+zt+"')";
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
	ls_sql="SELECT DECODE(hdsfss,'0','未核实','Y','属实','N','不属实'), DECODE(hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') as hdbz,hdr,cgdz  ,khbh,khxm, DECODE(xb,'M','男','W','女') as xb,fwdz,lxfs,qyrq,dwmc,lrsj";
	ls_sql+=" FROM crm_khxx,sq_dwxx  ";
    ls_sql+=" where (crm_khxx.dwbh=sq_dwxx.dwbh(+))";
    ls_sql+=wheresql;
	ls_sql+=" order by lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxLrhdList.jsp","SelectLrhdCrm_khxx.jsp","LrhdCrm_khxx.jsp","");
	pageObj.setViewStr("录入");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","lrsj","hdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
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
  <B><font size="3">录入回单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">回单是否属实</td>
	<td  width="6%">回单标志</td>
	<td  width="4%">回单人</td>
	<td  width="17%">参观地址</td>
	<td  width="5%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="3%">性别</td>
	<td  width="20%">房屋地址</td>
	<td  width="12%">联系方式</td>
	<td  width="6%">签约日期</td>
	<td  width="10%">签约店面</td>
	<td  width="6%">录入时间</td>
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