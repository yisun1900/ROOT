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


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}


	String khbh=null;
	String hth=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	
	
	String crm_khxx_khxm=null;
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	String crm_khxx_khxm2=null;
	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	String crm_khxx_fwdz=null;
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	String crm_khxx_fwdz2=null;
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}
	String crm_khxx_lxfs=null;
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	String crm_khxx_lxfs2=null;
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
	}




	String jlh=null;
	String fqmc=null;
	String fqbh=null;
	String yxrq=null;
	String lrr=null;
	String lrsj=null;
	String sybz=null;
	String syjlh=null;
	String scbz=null;
	String scr=null;
	String scsj=null;
	jlh=request.getParameter("jlh");
	if (jlh!=null)
	{
		jlh=cf.GB2Uni(jlh);
		if (!(jlh.equals("")))	wheresql+=" and  (cw_khfqdj.jlh='"+jlh+"')";
	}
	fqmc=request.getParameter("fqmc");
	if (fqmc!=null)
	{
		fqmc=cf.GB2Uni(fqmc);
		if (!(fqmc.equals("")))	wheresql+=" and  (cw_khfqdj.fqmc='"+fqmc+"')";
	}
	fqbh=request.getParameter("fqbh");
	if (fqbh!=null)
	{
		fqbh=cf.GB2Uni(fqbh);
		if (!(fqbh.equals("")))	wheresql+=" and  (cw_khfqdj.fqbh='"+fqbh+"')";
	}
	yxrq=request.getParameter("yxrq");
	if (yxrq!=null)
	{
		yxrq=yxrq.trim();
		if (!(yxrq.equals("")))	wheresql+="  and (cw_khfqdj.yxrq>=TO_DATE('"+yxrq+"','YYYY/MM/DD'))";
	}
	yxrq=request.getParameter("yxrq2");
	if (yxrq!=null)
	{
		yxrq=yxrq.trim();
		if (!(yxrq.equals("")))	wheresql+="  and (cw_khfqdj.yxrq<=TO_DATE('"+yxrq+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cw_khfqdj.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_khfqdj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_khfqdj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	sybz=request.getParameter("sybz");
	if (sybz!=null)
	{
		sybz=cf.GB2Uni(sybz);
		if (!(sybz.equals("")))	wheresql+=" and  (cw_khfqdj.sybz='"+sybz+"')";
	}
	syjlh=request.getParameter("syjlh");
	if (syjlh!=null)
	{
		syjlh=cf.GB2Uni(syjlh);
		if (!(syjlh.equals("")))	wheresql+=" and  (cw_khfqdj.syjlh='"+syjlh+"')";
	}
	scbz=request.getParameter("scbz");
	if (scbz!=null)
	{
		scbz=cf.GB2Uni(scbz);
		if (!(scbz.equals("")))	wheresql+=" and  (cw_khfqdj.scbz='"+scbz+"')";
	}
	scr=request.getParameter("scr");
	if (scr!=null)
	{
		scr=cf.GB2Uni(scr);
		if (!(scr.equals("")))	wheresql+=" and  (cw_khfqdj.scr='"+scr+"')";
	}
	scsj=request.getParameter("scsj");
	if (scsj!=null)
	{
		scsj=scsj.trim();
		if (!(scsj.equals("")))	wheresql+="  and (cw_khfqdj.scsj>=TO_DATE('"+scsj+"','YYYY/MM/DD'))";
	}
	scsj=request.getParameter("scsj2");
	if (scsj!=null)
	{
		scsj=scsj.trim();
		if (!(scsj.equals("")))	wheresql+="  and (cw_khfqdj.scsj<=TO_DATE('"+scsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT khxm,fwdz,sgdmc,a.dwmc dm,fqmc,fqbh,fqje,yxrq,cw_khfqdj.jlh,cw_khfqdj.khbh,cw_khfqdj.lrr,cw_khfqdj.lrsj,b.dwmc lrbm, DECODE(sybz,'1','未用','2','已使用'),syjlh, DECODE(scbz,'N','未删除','Y','已删除'),scr,scsj,cw_khfqdj.bz  ";
	ls_sql+=" FROM cw_khfqdj,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where cw_khfqdj.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.dwbh=a.dwbh(+) ";
    ls_sql+=" and cw_khfqdj.lrbm=b.dwbh(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)  ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_khfqdj.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_khfqdjList.jsp","","","EditCw_khfqdj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jlh","khbh","fqmc","fqbh","fqje","yxrq","lrr","lrsj","lrbm","sybz","syjlh","scbz","scr","scsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_khfqdjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] jlh = request.getParameterValues("jlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jlh,"jlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_khfqdj where sybz='1' and scbz='N' and "+chooseitem;
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
  <B><font size="3">客户返券登记－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="3%">施工队</td>
	<td  width="5%">签约店面</td>
	<td  width="6%">返券名称</td>
	<td  width="6%">返券编号</td>
	<td  width="4%">返券金额</td>
	<td  width="4%">有效日期</td>
	<td  width="4%">记录号</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="3%">使用标志</td>
	<td  width="5%">使用记录号</td>
	<td  width="3%">删除标志</td>
	<td  width="3%">删除人</td>
	<td  width="4%">删除时间</td>
	<td  width="15%">备注</td>
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