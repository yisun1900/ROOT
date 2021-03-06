<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_zdyxmb_dqbm=null;
	String bj_zdyxmb_xmbh=null;
	String bj_zdyxmb_xmmc=null;
	String[] bj_zdyxmb_xmdlbm=null;
	String[] bj_zdyxmb_xmxlbm=null;
	String bj_zdyxmb_smbm=null;
	String bj_zdyxmb_jldwbm=null;

	String xmflbm=null;
	xmflbm=request.getParameter("xmflbm");
	if (xmflbm!=null)
	{
		xmflbm=cf.GB2Uni(xmflbm);
		if (!(xmflbm.equals("")))	wheresql+=" and  (bj_zdyxmb.xmflbm='"+xmflbm+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_zdyxmb.bjjbbm='"+bjjbbm+"')";
	}


	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		if (!(shbz.equals("")))	wheresql+=" and  (bj_zdyxmb.shbz='"+shbz+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_zdyxmb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (bj_zdyxmb.lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_zdyxmb.gycl like '%"+gycl+"%')";
	}
	
	bj_zdyxmb_dqbm=request.getParameter("bj_zdyxmb_dqbm");
	if (!(bj_zdyxmb_dqbm.equals("")))	wheresql+=" and  (bj_zdyxmb.dqbm='"+bj_zdyxmb_dqbm+"')";

	bj_zdyxmb_xmbh=request.getParameter("bj_zdyxmb_xmbh");
	if (bj_zdyxmb_xmbh!=null)
	{
		bj_zdyxmb_xmbh=cf.GB2Uni(bj_zdyxmb_xmbh);
		if (!(bj_zdyxmb_xmbh.equals("")))	wheresql+=" and  (bj_zdyxmb.xmbh='"+bj_zdyxmb_xmbh+"')";
	}
	bj_zdyxmb_xmmc=request.getParameter("bj_zdyxmb_xmmc");
	if (bj_zdyxmb_xmmc!=null)
	{
		bj_zdyxmb_xmmc=cf.GB2Uni(bj_zdyxmb_xmmc);
		if (!(bj_zdyxmb_xmmc.equals("")))	wheresql+=" and  (bj_zdyxmb.xmmc like '%"+bj_zdyxmb_xmmc+"%')";
	}
	bj_zdyxmb_xmdlbm=request.getParameterValues("bj_zdyxmb_xmdlbm");
	if (bj_zdyxmb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_zdyxmb_xmdlbm,"bj_zdyxmb.xmdlbm");
	}
	bj_zdyxmb_xmxlbm=request.getParameterValues("bj_zdyxmb_xmxlbm");
	if (bj_zdyxmb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_zdyxmb_xmxlbm,"bj_zdyxmb.xmxlbm");
	}
	bj_zdyxmb_smbm=request.getParameter("bj_zdyxmb_smbm");
	if (bj_zdyxmb_smbm!=null)
	{
		bj_zdyxmb_smbm=cf.GB2Uni(bj_zdyxmb_smbm);
		if (!(bj_zdyxmb_smbm.equals("")))	wheresql+=" and  (bj_zdyxmb.smbm='"+bj_zdyxmb_smbm+"')";
	}
	bj_zdyxmb_jldwbm=request.getParameter("bj_zdyxmb_jldwbm");
	if (bj_zdyxmb_jldwbm!=null)
	{
		bj_zdyxmb_jldwbm=cf.GB2Uni(bj_zdyxmb_jldwbm);
		if (!(bj_zdyxmb_jldwbm.equals("")))	wheresql+=" and  (bj_zdyxmb.jldwbm='"+bj_zdyxmb_jldwbm+"')";
	}

	ls_sql="SELECT DECODE(bj_zdyxmb.shbz,'N','申请','S','受理','Y',' 审核通过','W','未通过','C','重新申请') shbz,DECODE(bj_zdyshjl.sfbxg,'Y','是','N','否'),bj_zdyxmb.xmbh,bj_zdyxmb.xmmc,bjjbmc,bj_zdyxmb.zdyxmyxq,jdm_jldwbm.jldwmc,bj_zdyxmb.bj,bj_zdyxmb.clbj,bj_zdyxmb.rgbj,bj_zdyxmb.lrr,bj_zdyxmb.lrsj,dqmc,bj_zdyxmb.gycl,bj_zdyxmb.flmcgg,bj_zdyxmb.bz,xmdlmc,xmxlmc,xmflmc,smmc,bj_zdyxmb.ckxm,bj_zdyxmb.sqjl,bj_zdyshjl.slr,bj_zdyshjl.slsj,bj_zdyshjl.slsm,bj_zdyshjl.shr,bj_zdyshjl.shsj,bj_zdyshjl.shyj,DECODE(bj_zdyxmb.sfxycl,'Y','需要','N','否') sfxycl,DECODE(bj_zdyxmb.sfxyyjd,'Y','需要','N','否') sfxyyjd";
	ls_sql+=" FROM bj_zdyxmb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm,bj_zdyshjl,bdm_xmflbm   ";
	ls_sql+=" where bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_zdyxmb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyxmb.smbm=bdm_smbm.smbm(+) and bj_zdyxmb.dqbm=dm_dqbm.dqbm(+) and bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_zdyxmb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	
	ls_sql+=" and bj_zdyxmb.bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"')";
	ls_sql+=" and bj_zdyxmb.sqjl=bj_zdyshjl.sqjl(+) ";
	ls_sql+=wheresql;
	ls_sql+=" order by bj_zdyxmb.lrsj desc";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Bj_zdyxmbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"lrr","xmbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewBj_zdyshjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xmbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">自定义项目查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(470);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审核标志</td>
	<td  width="1%">是否修改</td>
	<td  width="3%">项目编号</td>
	<td  width="6%">项目名称</td>
	<td  width="2%">报价级别</td>
	<td  width="2%">自定义项目有效期</td>
	<td  width="1%">计量单位</td>
	<td  width="2%">工程预算价</td>
	<td  width="2%">材料费</td>
	<td  width="2%">人工费</td>
	<td  width="3%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="2%">地区</td>
	<td  width="15%">工艺材料简介</td>
	<td  width="9%">辅料名称规格</td>
	<td  width="8%">备注</td>
	<td  width="3%">项目大类</td>
	<td  width="4%">项目小类</td>
	<td  width="3%">项目分类</td>
	<td  width="2%">饰面</td>
	<td  width="3%">参考项目</td>
	<td  width="2%">申请记录</td>
	<td  width="2%">受理人</td>
	<td  width="2%">受理时间</td>
	<td  width="6%">受理说明</td>
	<td  width="2%">审核人</td>
	<td  width="2%">审核时间</td>
	<td  width="5%">审核意见</td>
	<td  width="1%">需要材料</td>
	<td  width="1%">需预交底</td>
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