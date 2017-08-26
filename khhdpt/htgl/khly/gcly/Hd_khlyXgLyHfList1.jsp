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
	String hd_khly_lyxh=null;
	String hd_khly_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_sgbz=null;
	String crm_khxx_dwbh=null;
	String hd_khly_lyr=null;
	String hd_khly_lysj=null;
	String hd_khly_lylx=null;
	String hd_khly_lysfyck=null;
	String hd_khly_lyckr=null;
	String hd_khly_lycksj=null;

	String sfyqhf=null;
	sfyqhf=request.getParameter("sfyqhf");
	if (sfyqhf!=null)
	{
		if (!(sfyqhf.equals("")))	wheresql+=" and  (hd_khly.sfyqhf='"+sfyqhf+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	hd_khly_lyxh=request.getParameter("hd_khly_lyxh");
	if (hd_khly_lyxh!=null)
	{
		hd_khly_lyxh=cf.GB2Uni(hd_khly_lyxh);
		if (!(hd_khly_lyxh.equals("")))	wheresql+=" and  (hd_khly.lyxh='"+hd_khly_lyxh+"')";
	}
	hd_khly_khbh=request.getParameter("hd_khly_khbh");
	if (hd_khly_khbh!=null)
	{
		hd_khly_khbh=cf.GB2Uni(hd_khly_khbh);
		if (!(hd_khly_khbh.equals("")))	wheresql+=" and  (hd_khly.khbh='"+hd_khly_khbh+"')";
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
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
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
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	hd_khly_lyr=request.getParameter("hd_khly_lyr");
	if (hd_khly_lyr!=null)
	{
		hd_khly_lyr=cf.GB2Uni(hd_khly_lyr);
		if (!(hd_khly_lyr.equals("")))	wheresql+=" and  (hd_khly.lyr='"+hd_khly_lyr+"')";
	}
	hd_khly_lysj=request.getParameter("hd_khly_lysj");
	if (hd_khly_lysj!=null)
	{
		hd_khly_lysj=hd_khly_lysj.trim();
		if (!(hd_khly_lysj.equals("")))	wheresql+="  and (hd_khly.lysj>=TO_DATE('"+hd_khly_lysj+"','YYYY/MM/DD'))";
	}
	hd_khly_lysj=request.getParameter("hd_khly_lysj2");
	if (hd_khly_lysj!=null)
	{
		hd_khly_lysj=hd_khly_lysj.trim();
		if (!(hd_khly_lysj.equals("")))	wheresql+="  and (hd_khly.lysj<=TO_DATE('"+hd_khly_lysj+"','YYYY/MM/DD'))";
	}
	hd_khly_lylx=request.getParameter("hd_khly_lylx");
	if (hd_khly_lylx!=null)
	{
		hd_khly_lylx=cf.GB2Uni(hd_khly_lylx);
		if (!(hd_khly_lylx.equals("")))	wheresql+=" and  (hd_khly.lylx='"+hd_khly_lylx+"')";
	}
	hd_khly_lysfyck=request.getParameter("hd_khly_lysfyck");
	if (hd_khly_lysfyck!=null)
	{
		hd_khly_lysfyck=cf.GB2Uni(hd_khly_lysfyck);
		if (!(hd_khly_lysfyck.equals("")))	wheresql+=" and  (hd_khly.lysfyck='"+hd_khly_lysfyck+"')";
	}
	hd_khly_lyckr=request.getParameter("hd_khly_lyckr");
	if (hd_khly_lyckr!=null)
	{
		hd_khly_lyckr=cf.GB2Uni(hd_khly_lyckr);
		if (!(hd_khly_lyckr.equals("")))	wheresql+=" and  (hd_khly.lyckr='"+hd_khly_lyckr+"')";
	}
	hd_khly_lycksj=request.getParameter("hd_khly_lycksj");
	if (hd_khly_lycksj!=null)
	{
		hd_khly_lycksj=hd_khly_lycksj.trim();
		if (!(hd_khly_lycksj.equals("")))	wheresql+="  and (hd_khly.lycksj>=TO_DATE('"+hd_khly_lycksj+"','YYYY/MM/DD'))";
	}
	hd_khly_lycksj=request.getParameter("hd_khly_lycksj2");
	if (hd_khly_lycksj!=null)
	{
		hd_khly_lycksj=hd_khly_lycksj.trim();
		if (!(hd_khly_lycksj.equals("")))	wheresql+="  and (hd_khly.lycksj<=TO_DATE('"+hd_khly_lycksj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT hd_khly.lyxh,DECODE(hd_khly.lylx,'1','工程留言','2','集成留言','3','客户投诉','4','客户表扬','5','客户建议','6','总经理信箱','9','其它留言'),DECODE(hd_khly.sfyqhf,'1','不需回复','2','必须回复','3','无要求'),DECODE(hd_khly.lysfyck,'N','未查看','Y','已看'),crm_khxx.khxm,crm_khxx.fwdz,hd_khly.lysj,hd_khly.lynr,hd_khly.lyckr,hd_khly.lycksj,hd_khly.lyhfnr,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,sgdmc,crm_khxx.zjxm,dwmc";
	ls_sql+=" FROM crm_khxx,hd_khly,sq_dwxx,sq_sgd  ";
    ls_sql+=" where hd_khly.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hd_khly.lyxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hd_khlyXgLyHfList1.jsp","SelectXgLyHfHd_khly1.jsp","","XgLyHfHd_khly.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lyxh","hd_khly_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_sgbz","crm_khxx_dwbh","hd_khly_lyr","hd_khly_lysj","hd_khly_lynr","hd_khly_lylx","hd_khly_lysfyck","hd_khly_lyckr","hd_khly_lycksj","hd_khly_lyhfnr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lyxh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除留言回复"};//按钮的显示名称
	String[] buttonLink={"Hd_khlyXgLyHfList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] lyxh = request.getParameterValues("lyxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(lyxh,"lyxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update hd_khly set lysfyck='N',lyckr=null,lycksj=null,lyhfnr=null  where "+chooseitem;
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
  <B><font size="3">工程留言---修改回复</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">留言序号</td>
	<td  width="3%">留言类型</td>
	<td  width="3%">是否要求回复</td>
	<td  width="3%">留言是否已查看</td>
	<td  width="3%">客户姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="4%">留言时间</td>
	<td  width="19%">留言内容</td>
	<td  width="3%">留言查看人</td>
	<td  width="4%">留言查看时间</td>
	<td  width="19%">留言回复内容</td>
	<td  width="4%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="4%">签约日期</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检</td>
	<td  width="5%">签约店面</td>
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