<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String sqygbh=(String)session.getAttribute("ygbh");
String sqfgs=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ygbh=null;
	String yhmc=null;
	String bianhao=null;
	String sfzh=null;
	String xzzwbm=null;
	String dwbh=null;
	String ssfgs=null;

	String sfcjbx=null;
	sfcjbx=request.getParameter("sfcjbx");
	if (sfcjbx!=null)
	{
		if (!(sfcjbx.equals("")))	wheresql+=" and  (rs_ygsbxx.sfcjbx='"+sfcjbx+"')";
	}
	String ylbx=null;
	ylbx=request.getParameter("ylbx");
	if (ylbx!=null)
	{
		if (!(ylbx.equals("")))	wheresql+=" and  (rs_sbbljl.ylbx='"+ylbx+"')";
	}
	String jylbx=null;
	jylbx=request.getParameter("jylbx");
	if (jylbx!=null)
	{
		if (!(jylbx.equals("")))	wheresql+=" and  (rs_sbbljl.jylbx='"+jylbx+"')";
	}
	String sybx=null;
	sybx=request.getParameter("sybx");
	if (sybx!=null)
	{
		if (!(sybx.equals("")))	wheresql+=" and  (rs_sbbljl.sybx='"+sybx+"')";
	}
	String gsby=null;
	gsby=request.getParameter("gsby");
	if (gsby!=null)
	{
		if (!(gsby.equals("")))	wheresql+=" and  (rs_sbbljl.gsby='"+gsby+"')";
	}
	String syx=null;
	syx=request.getParameter("syx");
	if (syx!=null)
	{
		if (!(syx.equals("")))	wheresql+=" and  (rs_sbbljl.syx='"+syx+"')";
	}
	String shbxh=null;
	shbxh=request.getParameter("shbxh");
	if (shbxh!=null)
	{
		shbxh=cf.GB2Uni(shbxh);
		if (!(shbxh.equals("")))	wheresql+=" and  (rs_sbbljl.shbxh='"+shbxh+"')";
	}
	String yjsxe=null;
	yjsxe=request.getParameter("yjsxe");
	if (yjsxe!=null)
	{
		yjsxe=cf.GB2Uni(yjsxe);
		if (!(yjsxe.equals("")))	wheresql+=" and  (rs_sbbljl.yjsxe='"+yjsxe+"')";
	}
	String sbblsj=null;
	sbblsj=request.getParameter("sbblsj");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (rs_sbbljl.sbblsj>=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}
	sbblsj=request.getParameter("sbblsj2");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (rs_sbbljl.sbblsj<=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}

	
	String ldhtbh=null;
	ldhtbh=request.getParameter("ldhtbh");
	if (ldhtbh!=null)
	{
		if (!(ldhtbh.equals("")))	wheresql+=" and  (sq_yhxx.ldhtbh='"+ldhtbh+"')";
	}
	String ldhtlx=null;
	ldhtlx=request.getParameter("ldhtlx");
	if (ldhtlx!=null)
	{
		ldhtlx=cf.GB2Uni(ldhtlx);
		if (!(ldhtlx.equals("")))	wheresql+=" and  (sq_yhxx.ldhtlx='"+ldhtlx+"')";
	}
	String ldhtqx=null;
	ldhtqx=request.getParameter("ldhtqx");
	if (ldhtqx!=null)
	{
		ldhtqx=cf.GB2Uni(ldhtqx);
		if (!(ldhtqx.equals("")))	wheresql+=" and  (sq_yhxx.ldhtqx='"+ldhtqx+"')";
	}
	String htksrq=null;
	htksrq=request.getParameter("htksrq");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (sq_yhxx.htksrq>=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	htksrq=request.getParameter("htksrq2");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (sq_yhxx.htksrq<=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	String htdqrq=null;
	htdqrq=request.getParameter("htdqrq");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq>=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}
	htdqrq=request.getParameter("htdqrq2");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq<=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}

	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (rs_sbbljl.ygbh="+ygbh+") ";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (rs_sbbljl.yhmc like '%"+yhmc+"%')";
	}
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (rs_sbbljl.bianhao='"+bianhao+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (sq_yhxx.sfzh='"+sfzh+"')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";


	ls_sql="SELECT rs_sbbljl.sbbljlh,DECODE(rs_sbbljl.lx,'1','办理','2','变更','2','停保','3','转出'),rs_sbbljl.ygbh,DECODE(sq_yhxx.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退'),rs_sbbljl.bianhao,rs_sbbljl.yhmc,DECODE(rs_ygsbxx.sfcjbx,'Y','参保','N','未办理','T','停保','Z','转出'),rs_sbbljl.shbxh,rs_sbbljl.sbblsj, DECODE(rs_sbbljl.ylbx,'Y','是','N','否'), DECODE(rs_sbbljl.jylbx,'Y','是','N','否'), DECODE(rs_sbbljl.sybx,'Y','是','N','否'), DECODE(rs_sbbljl.gsby,'Y','是','N','否'), DECODE(rs_sbbljl.syx,'Y','是','N','否'),rs_sbbljl.jbxdd,rs_sbbljl.sbzrjs,rs_sbbljl.sbzcjs,rs_sbbljl.bxtjsj,rs_sbbljl.bxzcsj,rs_sbbljl.yjsxe,rs_sbbljl.gsjbfe,rs_sbbljl.grjbfe, DECODE(rs_sbbljl.sfjgjj,'Y','是','N','否'),rs_sbbljl.gsjgjj,rs_sbbljl.grjgjj,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs,rs_sbbljl.lrr,rs_sbbljl.lrsj,rs_sbbljl.bz   ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,rs_sbbljl,rs_ygsbxx  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh";
	ls_sql+=" and sq_yhxx.ygbh=rs_ygsbxx.ygbh(+)";
    ls_sql+=" and sq_yhxx.ygbh=rs_sbbljl.ygbh";
	if (sqfgs.equals("1") || sqfgs.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+sqygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+sqygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by rs_sbbljl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_sbbljlCxList.jsp","SelectCxRs_sbbljl.jsp","","");
	pageObj.setPageRow(24);
/*
//设置显示列
	String[] disColName={"xh","ygbh","yhmc","bianhao","sfzh","xzzwbm","lzrq","lzyy","dwbh","ssfgs","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);



//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yhmc",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">社保办理记录查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">社保办理记录号</td>
	<td  width="2%">类型</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工状态</td>
	<td  width="3%">工号</td>
	<td  width="3%">员工名称</td>
	<td  width="2%">是否参加保险</td>
	<td  width="4%">社会保险号</td>
	<td  width="3%">社保办理时间</td>
	<td  width="2%">是否缴纳医疗保险</td>
	<td  width="2%">是否缴纳养老保险</td>
	<td  width="2%">是否缴纳失业保险</td>
	<td  width="2%">是否缴纳工伤保险</td>
	<td  width="2%">是否缴纳生育保险</td>
	<td  width="6%">缴保险地点</td>
	<td  width="2%">转入基数</td>
	<td  width="2%">转出基数</td>
	<td  width="2%">保险停缴时间</td>
	<td  width="2%">保险转出时间</td>
	<td  width="2%">交纳基数</td>
	<td  width="2%">公司交保费额</td>
	<td  width="2%">个人交保费额</td>
	<td  width="2%">是否缴住房公积金</td>
	<td  width="2%">公司交住房公积金</td>
	<td  width="2%">个人交住房公积金</td>
	<td  width="6%">身份证号</td>
	<td  width="4%">行政职务</td>
	<td  width="5%">所属部门</td>
	<td  width="5%">所属公司</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="12%">备注</td>
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