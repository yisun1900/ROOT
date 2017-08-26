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
	String bj_ysshjl_ysshjl=null;
	String bj_ysshjl_lrr=null;
	String bj_ysshjl_lrsj=null;
	String bj_ysshjl_ysshbz=null;
	String bj_ysshjl_slr=null;
	String bj_ysshjl_slsj=null;
	String bj_ysshjl_ysshr=null;
	String bj_ysshjl_ysshsj=null;
	String bj_ysshjl_jygq=null;
	String bj_ysshjl_jykgsj=null;
	String bj_ysshjl_jyjgsj=null;
	String bj_ysshjl_shdf=null;
	String bj_ysshjl_zxbz=null;
	String bj_ysshjl_yysshjl=null;


	String crm_zxkhxx_zxzt=null;
	crm_zxkhxx_zxzt=request.getParameter("crm_zxkhxx_zxzt");
	if (crm_zxkhxx_zxzt!=null)
	{
		crm_zxkhxx_zxzt=cf.GB2Uni(crm_zxkhxx_zxzt);
		if (!(crm_zxkhxx_zxzt.equals("")))	wheresql+=" and  (crm_zxkhxx.zxzt='"+crm_zxkhxx_zxzt+"')";
	}

	String jsy=null;
	jsy=request.getParameter("jsy");
	if (jsy!=null)
	{
		jsy=cf.GB2Uni(jsy);
		if (!(jsy.equals("")))	wheresql+=" and  (bj_ysshjl.jsy='"+jsy+"')";
	}

	
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";
	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (zxdm!=null)
	{
		zxdm=cf.GB2Uni(zxdm);
		if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";
	}
	
	
	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	String xb=null;
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+xb+"')";
	}

	
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}



	bj_ysshjl_ysshjl=request.getParameter("bj_ysshjl_ysshjl");
	if (bj_ysshjl_ysshjl!=null)
	{
		bj_ysshjl_ysshjl=cf.GB2Uni(bj_ysshjl_ysshjl);
		if (!(bj_ysshjl_ysshjl.equals("")))	wheresql+=" and  (bj_ysshjl.ysshjl='"+bj_ysshjl_ysshjl+"')";
	}
	bj_ysshjl_lrr=request.getParameter("bj_ysshjl_lrr");
	if (bj_ysshjl_lrr!=null)
	{
		bj_ysshjl_lrr=cf.GB2Uni(bj_ysshjl_lrr);
		if (!(bj_ysshjl_lrr.equals("")))	wheresql+=" and  (bj_ysshjl.lrr='"+bj_ysshjl_lrr+"')";
	}
	bj_ysshjl_lrsj=request.getParameter("bj_ysshjl_lrsj");
	if (bj_ysshjl_lrsj!=null)
	{
		bj_ysshjl_lrsj=bj_ysshjl_lrsj.trim();
		if (!(bj_ysshjl_lrsj.equals("")))	wheresql+="  and (bj_ysshjl.lrsj>=TO_DATE('"+bj_ysshjl_lrsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_lrsj=request.getParameter("bj_ysshjl_lrsj2");
	if (bj_ysshjl_lrsj!=null)
	{
		bj_ysshjl_lrsj=bj_ysshjl_lrsj.trim();
		if (!(bj_ysshjl_lrsj.equals("")))	wheresql+="  and (bj_ysshjl.lrsj<=TO_DATE('"+bj_ysshjl_lrsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_ysshbz=request.getParameter("bj_ysshjl_ysshbz");
	if (bj_ysshjl_ysshbz!=null)
	{
		bj_ysshjl_ysshbz=cf.GB2Uni(bj_ysshjl_ysshbz);
		if (!(bj_ysshjl_ysshbz.equals("")))	wheresql+=" and  (bj_ysshjl.ysshbz='"+bj_ysshjl_ysshbz+"')";
	}
	bj_ysshjl_slr=request.getParameter("bj_ysshjl_slr");
	if (bj_ysshjl_slr!=null)
	{
		bj_ysshjl_slr=cf.GB2Uni(bj_ysshjl_slr);
		if (!(bj_ysshjl_slr.equals("")))	wheresql+=" and  (bj_ysshjl.slr='"+bj_ysshjl_slr+"')";
	}
	bj_ysshjl_slsj=request.getParameter("bj_ysshjl_slsj");
	if (bj_ysshjl_slsj!=null)
	{
		bj_ysshjl_slsj=bj_ysshjl_slsj.trim();
		if (!(bj_ysshjl_slsj.equals("")))	wheresql+="  and (bj_ysshjl.slsj>=TO_DATE('"+bj_ysshjl_slsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_slsj=request.getParameter("bj_ysshjl_slsj2");
	if (bj_ysshjl_slsj!=null)
	{
		bj_ysshjl_slsj=bj_ysshjl_slsj.trim();
		if (!(bj_ysshjl_slsj.equals("")))	wheresql+="  and (bj_ysshjl.slsj<=TO_DATE('"+bj_ysshjl_slsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_ysshr=request.getParameter("bj_ysshjl_ysshr");
	if (bj_ysshjl_ysshr!=null)
	{
		bj_ysshjl_ysshr=cf.GB2Uni(bj_ysshjl_ysshr);
		if (!(bj_ysshjl_ysshr.equals("")))	wheresql+=" and  (bj_ysshjl.ysshr='"+bj_ysshjl_ysshr+"')";
	}
	bj_ysshjl_ysshsj=request.getParameter("bj_ysshjl_ysshsj");
	if (bj_ysshjl_ysshsj!=null)
	{
		bj_ysshjl_ysshsj=bj_ysshjl_ysshsj.trim();
		if (!(bj_ysshjl_ysshsj.equals("")))	wheresql+="  and (bj_ysshjl.ysshsj>=TO_DATE('"+bj_ysshjl_ysshsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_ysshsj=request.getParameter("bj_ysshjl_ysshsj2");
	if (bj_ysshjl_ysshsj!=null)
	{
		bj_ysshjl_ysshsj=bj_ysshjl_ysshsj.trim();
		if (!(bj_ysshjl_ysshsj.equals("")))	wheresql+="  and (bj_ysshjl.ysshsj<=TO_DATE('"+bj_ysshjl_ysshsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_jygq=request.getParameter("bj_ysshjl_jygq");
	if (bj_ysshjl_jygq!=null)
	{
		bj_ysshjl_jygq=bj_ysshjl_jygq.trim();
		if (!(bj_ysshjl_jygq.equals("")))	wheresql+=" and (bj_ysshjl.jygq="+bj_ysshjl_jygq+") ";
	}
	bj_ysshjl_jykgsj=request.getParameter("bj_ysshjl_jykgsj");
	if (bj_ysshjl_jykgsj!=null)
	{
		bj_ysshjl_jykgsj=bj_ysshjl_jykgsj.trim();
		if (!(bj_ysshjl_jykgsj.equals("")))	wheresql+="  and (bj_ysshjl.jykgsj=TO_DATE('"+bj_ysshjl_jykgsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_jyjgsj=request.getParameter("bj_ysshjl_jyjgsj");
	if (bj_ysshjl_jyjgsj!=null)
	{
		bj_ysshjl_jyjgsj=bj_ysshjl_jyjgsj.trim();
		if (!(bj_ysshjl_jyjgsj.equals("")))	wheresql+="  and (bj_ysshjl.jyjgsj=TO_DATE('"+bj_ysshjl_jyjgsj+"','YYYY/MM/DD'))";
	}
	bj_ysshjl_shdf=request.getParameter("bj_ysshjl_shdf");
	if (bj_ysshjl_shdf!=null)
	{
		bj_ysshjl_shdf=bj_ysshjl_shdf.trim();
		if (!(bj_ysshjl_shdf.equals("")))	wheresql+=" and  (bj_ysshjl.shdf="+bj_ysshjl_shdf+") ";
	}
	bj_ysshjl_zxbz=request.getParameter("bj_ysshjl_zxbz");
	if (bj_ysshjl_zxbz!=null)
	{
		bj_ysshjl_zxbz=cf.GB2Uni(bj_ysshjl_zxbz);
		if (!(bj_ysshjl_zxbz.equals("")))	wheresql+=" and  (bj_ysshjl.zxbz='"+bj_ysshjl_zxbz+"')";
	}
	bj_ysshjl_yysshjl=request.getParameter("bj_ysshjl_yysshjl");
	if (bj_ysshjl_yysshjl!=null)
	{
		bj_ysshjl_yysshjl=cf.GB2Uni(bj_ysshjl_yysshjl);
		if (!(bj_ysshjl_yysshjl.equals("")))	wheresql+=" and  (bj_ysshjl.yysshjl='"+bj_ysshjl_yysshjl+"')";
	}
	ls_sql="SELECT bj_ysshjl.ysshjl, DECODE(bj_ysshjl.ysshbz,'B','申请审核','C','受理申请','Y','审核通过','M','未通过','S','修改方案授权') ysshbz,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过'),bj_ysshjl.jsy,bj_ysshjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.ysshdf,bj_ysshjl.shdf,bj_ysshjl.ysshr,bj_ysshjl.ysshsj,crm_zxkhxx.sjs,crm_zxkhxx.fwdz,bj_ysshjl.lrr,bj_ysshjl.lrsj,bj_ysshjl.sqsm,bj_ysshjl.slr,bj_ysshjl.slsj,bj_ysshjl.slsm,bj_ysshjl.ysshyj,bj_ysshjl.jygq,bj_ysshjl.jykgsj,bj_ysshjl.jyjgsj, DECODE(bj_ysshjl.zxbz,'Y','是','N','否') zxbz,bj_ysshjl.xgfasqr,bj_ysshjl.xgfasqsj,bj_ysshjl.xgfasqsm,bj_ysshjl.bz  ";
	ls_sql+=" FROM bj_ysshjl,crm_zxkhxx  ";
    ls_sql+=" where bj_ysshjl.khbh=crm_zxkhxx.khbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxCxSqList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"ysshjl"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/yssh/ViewBj_ysshmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysshjl",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询预算审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">预算审核记录</td>
	<td  width="3%">审核状态</td>
	<td  width="2%">签单状态</td>
	<td  width="2%">价审员</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">最终得分</td>
	<td  width="2%">本次扣分</td>
	
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="2%">设计师</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="10%">申请说明</td>
	<td  width="2%">受理人</td>
	<td  width="3%">受理时间</td>
	<td  width="10%">受理说明</td>
	
	<td  width="8%">审核意见</td>
	<td  width="2%">建议工期</td>
	<td  width="3%">建议开工时间</td>
	<td  width="3%">建议竣工时间</td>
	
	<td  width="2%">是否最新审核记录</td>
	<td  width="2%">修改方案授权人</td>
	<td  width="3%">修改方案授权时间</td>
	<td  width="8%">修改方案授权说明</td>
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