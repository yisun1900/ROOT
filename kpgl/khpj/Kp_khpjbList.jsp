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
	String kp_khpjb_khbh=null;
	String kp_khpjb_sgzl=null;
	String kp_khpjb_gcjd=null;
	String kp_khpjb_wmsgcd=null;
	String kp_khpjb_ctfw=null;
	String kp_khpjb_pscl=null;
	String kp_khpjb_dmcl=null;
	String kp_khpjb_sjxg=null;
	String kp_khpjb_sjfw=null;
	String kp_khpjb_jlfw=null;
	String kp_khpjb_lrr=null;
	String kp_khpjb_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	kp_khpjb_khbh=request.getParameter("kp_khpjb_khbh");
	if (kp_khpjb_khbh!=null)
	{
		kp_khpjb_khbh=cf.GB2Uni(kp_khpjb_khbh);
		if (!(kp_khpjb_khbh.equals("")))	wheresql+=" and  (kp_khpjb.khbh='"+kp_khpjb_khbh+"')";
	}
	kp_khpjb_sgzl=request.getParameter("kp_khpjb_sgzl");
	if (kp_khpjb_sgzl!=null)
	{
		kp_khpjb_sgzl=cf.GB2Uni(kp_khpjb_sgzl);
		if (!(kp_khpjb_sgzl.equals("")))	wheresql+=" and  (kp_khpjb.sgzl='"+kp_khpjb_sgzl+"')";
	}
	kp_khpjb_gcjd=request.getParameter("kp_khpjb_gcjd");
	if (kp_khpjb_gcjd!=null)
	{
		kp_khpjb_gcjd=cf.GB2Uni(kp_khpjb_gcjd);
		if (!(kp_khpjb_gcjd.equals("")))	wheresql+=" and  (kp_khpjb.gcjd='"+kp_khpjb_gcjd+"')";
	}
	kp_khpjb_wmsgcd=request.getParameter("kp_khpjb_wmsgcd");
	if (kp_khpjb_wmsgcd!=null)
	{
		kp_khpjb_wmsgcd=cf.GB2Uni(kp_khpjb_wmsgcd);
		if (!(kp_khpjb_wmsgcd.equals("")))	wheresql+=" and  (kp_khpjb.wmsgcd='"+kp_khpjb_wmsgcd+"')";
	}
	kp_khpjb_ctfw=request.getParameter("kp_khpjb_ctfw");
	if (kp_khpjb_ctfw!=null)
	{
		kp_khpjb_ctfw=cf.GB2Uni(kp_khpjb_ctfw);
		if (!(kp_khpjb_ctfw.equals("")))	wheresql+=" and  (kp_khpjb.ctfw='"+kp_khpjb_ctfw+"')";
	}
	kp_khpjb_pscl=request.getParameter("kp_khpjb_pscl");
	if (kp_khpjb_pscl!=null)
	{
		kp_khpjb_pscl=cf.GB2Uni(kp_khpjb_pscl);
		if (!(kp_khpjb_pscl.equals("")))	wheresql+=" and  (kp_khpjb.pscl='"+kp_khpjb_pscl+"')";
	}
	kp_khpjb_dmcl=request.getParameter("kp_khpjb_dmcl");
	if (kp_khpjb_dmcl!=null)
	{
		kp_khpjb_dmcl=cf.GB2Uni(kp_khpjb_dmcl);
		if (!(kp_khpjb_dmcl.equals("")))	wheresql+=" and  (kp_khpjb.dmcl='"+kp_khpjb_dmcl+"')";
	}
	kp_khpjb_sjxg=request.getParameter("kp_khpjb_sjxg");
	if (kp_khpjb_sjxg!=null)
	{
		kp_khpjb_sjxg=cf.GB2Uni(kp_khpjb_sjxg);
		if (!(kp_khpjb_sjxg.equals("")))	wheresql+=" and  (kp_khpjb.sjxg='"+kp_khpjb_sjxg+"')";
	}
	kp_khpjb_sjfw=request.getParameter("kp_khpjb_sjfw");
	if (kp_khpjb_sjfw!=null)
	{
		kp_khpjb_sjfw=cf.GB2Uni(kp_khpjb_sjfw);
		if (!(kp_khpjb_sjfw.equals("")))	wheresql+=" and  (kp_khpjb.sjfw='"+kp_khpjb_sjfw+"')";
	}
	kp_khpjb_jlfw=request.getParameter("kp_khpjb_jlfw");
	if (kp_khpjb_jlfw!=null)
	{
		kp_khpjb_jlfw=cf.GB2Uni(kp_khpjb_jlfw);
		if (!(kp_khpjb_jlfw.equals("")))	wheresql+=" and  (kp_khpjb.jlfw='"+kp_khpjb_jlfw+"')";
	}
	kp_khpjb_lrr=request.getParameter("kp_khpjb_lrr");
	if (kp_khpjb_lrr!=null)
	{
		kp_khpjb_lrr=cf.GB2Uni(kp_khpjb_lrr);
		if (!(kp_khpjb_lrr.equals("")))	wheresql+=" and  (kp_khpjb.lrr='"+kp_khpjb_lrr+"')";
	}
	kp_khpjb_lrsj=request.getParameter("kp_khpjb_lrsj");
	if (kp_khpjb_lrsj!=null)
	{
		kp_khpjb_lrsj=kp_khpjb_lrsj.trim();
		if (!(kp_khpjb_lrsj.equals("")))	wheresql+="  and (kp_khpjb.lrsj>=TO_DATE('"+kp_khpjb_lrsj+"','YYYY/MM/DD'))";
	}
	kp_khpjb_lrsj=request.getParameter("kp_khpjb_lrsj2");
	if (kp_khpjb_lrsj!=null)
	{
		kp_khpjb_lrsj=kp_khpjb_lrsj.trim();
		if (!(kp_khpjb_lrsj.equals("")))	wheresql+="  and (kp_khpjb.lrsj<=TO_DATE('"+kp_khpjb_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
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
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
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
	ls_sql="SELECT kp_khpjb.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,crm_khxx.dwbh,crm_khxx.sgd,crm_khxx.zjxm  , DECODE(kp_khpjb.sgzl,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.gcjd,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.wmsgcd,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.ctfw,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.pscl,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.dmcl,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.sjxg,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.sjfw,'1','满意','2','基本满意','3','不满意'), DECODE(kp_khpjb.jlfw,'1','满意','2','基本满意','3','不满意'),kp_khpjb.lrr,kp_khpjb.lrsj,kp_khpjb.bz";
	ls_sql+=" FROM crm_khxx,kp_khpjb  ";
    ls_sql+=" where kp_khpjb.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_khpjbList.jsp","SelectKp_khpjb.jsp","","EditKp_khpjb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","kp_khpjb_sgzl","kp_khpjb_gcjd","kp_khpjb_wmsgcd","kp_khpjb_ctfw","kp_khpjb_pscl","kp_khpjb_dmcl","kp_khpjb_sjxg","kp_khpjb_sjfw","kp_khpjb_jlfw","kp_khpjb_lrr","kp_khpjb_lrsj","kp_khpjb_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_khpjbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from kp_khpjb where "+chooseitem;
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
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="4%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="5%">签约日期</td>
	<td  width="4%">签约店面</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检</td>
	<td  width="4%">施工质量</td>
	<td  width="4%">工程进度</td>
	<td  width="4%">工人文明施工程度</td>
	<td  width="4%">施工队整体服务</td>
	<td  width="4%">公司配送材料</td>
	<td  width="4%">施工队代买材料</td>
	<td  width="4%">设计效果</td>
	<td  width="4%">设计服务</td>
	<td  width="4%">监理服务</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="11%">备注</td>
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