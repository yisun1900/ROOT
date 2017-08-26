<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150102'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[标准项目维护]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String yhdlm=(String)session.getAttribute("yhdlm");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_jzbjb_dqbm=null;
	String bj_jzbjb_xmbh=null;
	String bj_jzbjb_xmmc=null;
	String[] bj_jzbjb_xmdlbm=null;
	String[] bj_jzbjb_xmxlbm=null;
	String bj_jzbjb_smbm=null;
	String bj_jzbjb_jldwbm=null;

	String xmflbm=null;
	xmflbm=request.getParameter("xmflbm");
	if (xmflbm!=null)
	{
		xmflbm=cf.GB2Uni(xmflbm);
		if (!(xmflbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmflbm='"+xmflbm+"')";
	}

	String sfxycl=null;
	sfxycl=request.getParameter("sfxycl");
	if (sfxycl!=null)
	{
		sfxycl=cf.GB2Uni(sfxycl);
		if (!(sfxycl.equals("")))	wheresql+=" and  (bj_jzbjb.sfxycl='"+sfxycl+"')";
	}
	String sfxyyjd=null;
	sfxyyjd=request.getParameter("sfxyyjd");
	if (sfxyyjd!=null)
	{
		sfxyyjd=cf.GB2Uni(sfxyyjd);
		if (!(sfxyyjd.equals("")))	wheresql+=" and  (bj_jzbjb.sfxyyjd='"+sfxyyjd+"')";
	}

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzbjb.bjbbh='"+bjbbh+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_jzbjb.sfbxx='"+sfbxx+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzbjb.bjjbbm='"+bjjbbm+"')";
	}
	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_jzbjb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (bj_jzbjb.lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_jzbjb.gycl like '%"+gycl+"%')";
	}
	
	
	bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	if (!(bj_jzbjb_dqbm.equals("")))	wheresql+=" and  (bj_jzbjb.dqbm='"+bj_jzbjb_dqbm+"')";

	bj_jzbjb_xmbh=request.getParameter("bj_jzbjb_xmbh");
	if (bj_jzbjb_xmbh!=null)
	{
		bj_jzbjb_xmbh=cf.GB2Uni(bj_jzbjb_xmbh);
		if (!(bj_jzbjb_xmbh.equals("")))	wheresql+=" and  (bj_jzbjb.xmbh='"+bj_jzbjb_xmbh+"')";
	}
	bj_jzbjb_xmmc=request.getParameter("bj_jzbjb_xmmc");
	if (bj_jzbjb_xmmc!=null)
	{
		bj_jzbjb_xmmc=cf.GB2Uni(bj_jzbjb_xmmc);
		if (!(bj_jzbjb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+bj_jzbjb_xmmc+"%')";
	}
	bj_jzbjb_xmdlbm=request.getParameterValues("bj_jzbjb_xmdlbm");
	if (bj_jzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmdlbm,"bj_jzbjb.xmdlbm");
	}
	bj_jzbjb_xmxlbm=request.getParameterValues("bj_jzbjb_xmxlbm");
	if (bj_jzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmxlbm,"bj_jzbjb.xmxlbm");
	}
	bj_jzbjb_smbm=request.getParameter("bj_jzbjb_smbm");
	if (bj_jzbjb_smbm!=null)
	{
		bj_jzbjb_smbm=cf.GB2Uni(bj_jzbjb_smbm);
		if (!(bj_jzbjb_smbm.equals("")))	wheresql+=" and  (bj_jzbjb.smbm='"+bj_jzbjb_smbm+"')";
	}
	bj_jzbjb_jldwbm=request.getParameter("bj_jzbjb_jldwbm");
	if (bj_jzbjb_jldwbm!=null)
	{
		bj_jzbjb_jldwbm=cf.GB2Uni(bj_jzbjb_jldwbm);
		if (!(bj_jzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_jzbjb.jldwbm='"+bj_jzbjb_jldwbm+"')";
	}

	ls_sql="SELECT bj_jzbjb.glxmbh,bj_jzbjb.bjbbh,bj_jzbjb.dqbm,dqmc,xmdlmc,xmxlmc,xmflmc,bj_jzbjb.gcjcbjxs,bj_jzbjb.sgcbbjxs,bj_jzbjb.khbjxs,bj_jzbjb.xh,bj_jzbjb.xmbh,DECODE(bj_jzbjb.sfbxx,'1','<font color=\"#FF0000\">必报项</font>','2','<font color=\"#CC00CC\">必列项</font>','3','可选项','9','<font color=\"#0000FF\">作废项</font>') sfbxx,bj_jzbjb.bjjbbm,bjjbmc,bj_jzbjb.xmmc,smmc,jdm_jldwbm.jldwmc,bj_jzbjb.bj,bj_jzbjb.clbj,bj_jzbjb.rgbj,bj_jzbjb.jxbj,bj_jzbjb.zcf,bj_jzbjb.shf,bj_jzbjb.ysf,bj_jzbjb.qtf,bj_jzbjb.sgdbj,DECODE(bj_jzbjb.sfyxdz,'Y','允许','N','否') sfyxdz,bj_jzbjb.zdzk,bj_jzbjb.clcb,bj_jzbjb.rgcb,bj_jzbjb.jxcb,bj_jzbjb.cbenj,bj_jzbjb.sgcbj,DECODE(bj_jzbjb.sfxycl,'Y','需要','N','否') sfxycl,DECODE(bj_jzbjb.sfxyyjd,'Y','需要','N','否') sfxyyjd,lrr,lrsj,gycl,flmcgg,bz";
	ls_sql+=" FROM bj_jzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm,bdm_xmflbm  ";
    ls_sql+=" where bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_jzbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.dqbm=dm_dqbm.dqbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_jzbjb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	
	ls_sql+=" and bj_jzbjb.bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and bj_jzbjb.dqbm in(select sq_dwxx.dqbm from sq_sqfgs,sq_dwxx where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and bj_jzbjb.dqbm in(select sq_dwxx.dqbm from sq_sqbm,sq_dwxx where sq_sqbm.dwbh=sq_dwxx.dwbh and ygbh='"+ygbh+"' )";
	}
	
	ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjb.bjbbh,bj_jzbjb.dqbm,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xh,bj_jzbjb.xmbh,bj_jzbjb.bjjbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_jzbjbList.jsp","","","EditBj_jzbjb.jsp?bjbbh="+bjbbh+"&dqbm="+bj_jzbjb_dqbm+"&bjjbbm="+bjjbbm);
	pageObj.setPageRow(200);//设置每页显示记录数
//设置显示列
	String[] disColName={"xmbh","xmmc","bjbbh","bjjbmc","jldwmc","sfbxx","bj","cbenj","sgcbj","sfyxdz","zdzk","glxmbh","xmdlmc","xmxlmc","xmflmc","smmc","gycl","flmcgg","bz","sfxycl","sfxyyjd","lrr","lrsj","xh","dqmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"批量修改","删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"EnterTjgs.jsp?bjbbh="+bjbbh+"&dqbm="+bj_jzbjb_dqbm+"&bjjbbm="+bjjbbm,"Bj_jzbjbList.jsp?bjbbh="+bjbbh+"&dqbm="+bj_jzbjb_dqbm+"&bjjbbm="+bjjbbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//	pageObj.alignStr[13]="align='left'";

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dqbm","bjbbh","bjjbbm","xmbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewXmbhGlfx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xmbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String bjbbh=cf.GB2Uni(cf.getParameter(request,"bjbbh"));
	String dqbm=request.getParameter("dqbm");
	String bjjbbm=request.getParameter("bjjbbm");
	String[] xmbh = request.getParameterValues("xmbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmbh,"xmbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from bj_jzglfxb where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and ("+chooseitem+")";
		sql[1]="delete from bj_glxmb   where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and ("+chooseitem+")";
		sql[2]="delete from bj_jzbjb   where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and ("+chooseitem+")";
		pageObj.execDelete(sql,needCommit);
	}
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
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">项目编号</td>
	<td  width="8%">项目名称</td>
	<td  width="3%">报价版本号</td>
	<td  width="3%">报价级别</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">是否必选项</td>
	<td  width="3%">客户报价</td>
	<td  width="3%">成本价</td>
	<td  width="3%">施工成本价</td>
	<td  width="2%">是否允许打折</td>
	<td  width="2%">最低折扣</td>
	<td  width="7%">关联项目编号</td>
	<td  width="4%">项目大类</td>
	<td  width="5%">项目小类</td>
	<td  width="3%">项目分类</td>
	<td  width="3%">饰面</td>
	<td  width="14%">工艺材料简介</td>
	<td  width="7%">辅料名称规格</td>
	<td  width="6%">备注</td>
	<td  width="2%">需要材料</td>
	<td  width="2%">需预交底</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">序号</td>
	<td  width="2%">地区</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printPageLinkTr();
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