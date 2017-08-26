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

	String sbyybm=null;
	String sbkhlx=null;
	String sbsj=null;
	String sjbshjl=null;
	String sjbshr=null;
	String sjbshsj=null;

	String hfjlh=null;
	String hfr=null;
	String hfsj=null;
	String hfsbyybm=null;
	String hfsbkhlx=null;
	String clzt=null;
	String lrr=null;
	String lrsj=null;
	String lrbm=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}



	String khbh=null;
	String khxm=null;
	String fwdz=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz+"%')";
	}

	sbyybm=request.getParameter("sbyybm");
	if (sbyybm!=null)
	{
		sbyybm=cf.GB2Uni(sbyybm);
		if (!(sbyybm.equals("")))	wheresql+=" and  (crm_qysbdj.sbyybm='"+sbyybm+"')";
	}
	sbkhlx=request.getParameter("sbkhlx");
	if (sbkhlx!=null)
	{
		sbkhlx=cf.GB2Uni(sbkhlx);
		if (!(sbkhlx.equals("")))	wheresql+=" and  (crm_qysbdj.sbkhlx='"+sbkhlx+"')";
	}
	sbsj=request.getParameter("sbsj");
	if (sbsj!=null)
	{
		sbsj=sbsj.trim();
		if (!(sbsj.equals("")))	wheresql+="  and (crm_qysbdj.sbsj>=TO_DATE('"+sbsj+"','YYYY/MM/DD'))";
	}
	sbsj=request.getParameter("sbsj2");
	if (sbsj!=null)
	{
		sbsj=sbsj.trim();
		if (!(sbsj.equals("")))	wheresql+="  and (crm_qysbdj.sbsj<=TO_DATE('"+sbsj+"','YYYY/MM/DD'))";
	}
	sjbshjl=request.getParameter("sjbshjl");
	if (sjbshjl!=null)
	{
		sjbshjl=cf.GB2Uni(sjbshjl);
		if (!(sjbshjl.equals("")))	wheresql+=" and  (crm_qysbdj.sjbshjl='"+sjbshjl+"')";
	}
	sjbshr=request.getParameter("sjbshr");
	if (sjbshr!=null)
	{
		sjbshr=cf.GB2Uni(sjbshr);
		if (!(sjbshr.equals("")))	wheresql+=" and  (crm_qysbdj.sjbshr='"+sjbshr+"')";
	}
	sjbshsj=request.getParameter("sjbshsj");
	if (sjbshsj!=null)
	{
		sjbshsj=sjbshsj.trim();
		if (!(sjbshsj.equals("")))	wheresql+="  and (crm_qysbdj.sjbshsj=TO_DATE('"+sjbshsj+"','YYYY/MM/DD'))";
	}


	hfjlh=request.getParameter("hfjlh");
	if (hfjlh!=null)
	{
		hfjlh=cf.GB2Uni(hfjlh);
		if (!(hfjlh.equals("")))	wheresql+=" and  (crm_qysbdj.hfjlh='"+hfjlh+"')";
	}
	hfr=request.getParameter("hfr");
	if (hfr!=null)
	{
		hfr=cf.GB2Uni(hfr);
		if (!(hfr.equals("")))	wheresql+=" and  (crm_qysbdj.hfr='"+hfr+"')";
	}
	hfsj=request.getParameter("hfsj");
	if (hfsj!=null)
	{
		hfsj=hfsj.trim();
		if (!(hfsj.equals("")))	wheresql+="  and (crm_qysbdj.hfsj>=TO_DATE('"+hfsj+"','YYYY/MM/DD'))";
	}
	hfsj=request.getParameter("hfsj2");
	if (hfsj!=null)
	{
		hfsj=hfsj.trim();
		if (!(hfsj.equals("")))	wheresql+="  and (crm_qysbdj.hfsj<=TO_DATE('"+hfsj+"','YYYY/MM/DD'))";
	}
	hfsbyybm=request.getParameter("hfsbyybm");
	if (hfsbyybm!=null)
	{
		hfsbyybm=cf.GB2Uni(hfsbyybm);
		if (!(hfsbyybm.equals("")))	wheresql+=" and  (crm_qysbdj.hfsbyybm='"+hfsbyybm+"')";
	}
	hfsbkhlx=request.getParameter("hfsbkhlx");
	if (hfsbkhlx!=null)
	{
		hfsbkhlx=cf.GB2Uni(hfsbkhlx);
		if (!(hfsbkhlx.equals("")))	wheresql+=" and  (crm_qysbdj.hfsbkhlx='"+hfsbkhlx+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (crm_qysbdj.clzt='"+clzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_qysbdj.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_qysbdj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_qysbdj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (crm_qysbdj.lrbm='"+lrbm+"')";
	}

	

	ls_sql="SELECT crm_zxkhxx.khbh,DECODE(crm_qysbdj.clzt,'1','设计师提交','2','审核','3','市场部审核','4','接待主管审核','5','回访'),a.dwmc zxdm,crm_qysbdj.sjs,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,c.sbyymc sbyybm,crm_qysbdj.sbkhlx,crm_qysbdj.sbyyxs,crm_qysbdj.sbsj,DECODE(crm_qysbdj.sjbshjl,'Y','通过','N','未通过') sjbshjl,crm_qysbdj.sjbshr,crm_qysbdj.sjbshsj,crm_qysbdj.sjbshyj,crm_qysbdj.hfjlh,crm_qysbdj.hfr,crm_qysbdj.hfsj,d.sbyymc hfsbyybm,crm_qysbdj.hfsbkhlx,crm_qysbdj.hfsbyyxs,crm_qysbdj.lrr,crm_qysbdj.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM crm_zxkhxx,crm_qysbdj,sq_dwxx a,sq_dwxx b,dm_sbyybm c,dm_sbyybm d";
    ls_sql+=" where crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_zxkhxx.zxdm=a.dwbh(+)";
    ls_sql+=" and crm_qysbdj.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_qysbdj.sbyybm=c.sbyybm(+)";
    ls_sql+=" and crm_qysbdj.hfsbyybm=d.sbyybm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_qysbdj.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_qysbdjCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

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
  <B><font size="3">飞单客户查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">状态</td>
	<td  width="4%">店面</td>
	<td  width="2%">设计师</td>
	<td  width="3%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="4%">飞单原因</td>
	<td  width="4%">飞单客户流向</td>
	<td  width="12%">飞单原因详述</td>
	<td  width="3%">飞单时间</td>
	<td  width="3%">审核结论</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="11%">审核意见</td>

	<td  width="3%">回访记录号</td>
	<td  width="2%">回访人</td>
	<td  width="3%">回访时间</td>
	<td  width="4%">回访飞单原因</td>
	<td  width="4%">回访飞单客户流向</td>
	<td  width="11%">回访飞单原因详述</td>

	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
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