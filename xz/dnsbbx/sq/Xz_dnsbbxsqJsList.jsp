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
	String bxxh=null;
	String dwbh=null;
	String fgsbh=null;
	String sqr=null;
	String bxrq=null;
	String jhlqrq=null;
	String dnsbflmc=null;
	String bgr=null;
	String sfyzysj=null;
	String dnsbgzmc=null;
	String gsbh=null;
	String gdzcmc=null;
	String bmbh=null;
	String gdzcflmc=null;
	String xh=null;
	String pp=null;
	String pz1=null;
	String pz2=null;
	String pz3=null;
	String pz4=null;
	String pz5=null;
	String pz6=null;
	String jsr=null;
	String jssj=null;
	String wxr=null;
	String wxlrsj=null;
	String wcsj=null;
	String wxfy=null;
	String lrr=null;
	String clzt=null;
	bxxh=request.getParameter("bxxh");
	if (bxxh!=null)
	{
		bxxh=bxxh.trim();
		if (!(bxxh.equals("")))	wheresql+=" and (xz_dnsbbxsq.bxxh="+bxxh+") ";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dwbh='"+dwbh+"')";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.fgsbh='"+fgsbh+"')";
	}
	sqr=request.getParameter("sqr");
	if (sqr!=null)
	{
		sqr=cf.GB2Uni(sqr);
		if (!(sqr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.sqr='"+sqr+"')";
	}
	bxrq=request.getParameter("bxrq");
	if (bxrq!=null)
	{
		bxrq=bxrq.trim();
		if (!(bxrq.equals("")))	wheresql+="  and (bxrq>=TO_DATE('"+bxrq+"','YYYY/MM/DD'))";
	}
	bxrq=request.getParameter("bxrq2");
	if (bxrq!=null)
	{
		bxrq=bxrq.trim();
		if (!(bxrq.equals("")))	wheresql+="  and (bxrq<=TO_DATE('"+bxrq+"','YYYY/MM/DD'))";
	}
	jhlqrq=request.getParameter("jhlqrq");
	if (jhlqrq!=null)
	{
		jhlqrq=jhlqrq.trim();
		if (!(jhlqrq.equals("")))	wheresql+="  and (jhlqrq>=TO_DATE('"+jhlqrq+"','YYYY/MM/DD'))";
	}
	jhlqrq=request.getParameter("jhlqrq2");
	if (jhlqrq!=null)
	{
		jhlqrq=jhlqrq.trim();
		if (!(jhlqrq.equals("")))	wheresql+="  and (jhlqrq<=TO_DATE('"+jhlqrq+"','YYYY/MM/DD'))";
	}
	dnsbflmc=request.getParameter("dnsbflmc");
	if (dnsbflmc!=null)
	{
		dnsbflmc=cf.GB2Uni(dnsbflmc);
		if (!(dnsbflmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dnsbflmc='"+dnsbflmc+"')";
	}
	bgr=request.getParameter("bgr");
	if (bgr!=null)
	{
		bgr=cf.GB2Uni(bgr);
		if (!(bgr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.bgr='"+bgr+"')";
	}
	sfyzysj=request.getParameter("sfyzysj");
	if (sfyzysj!=null)
	{
		sfyzysj=cf.GB2Uni(sfyzysj);
		if (!(sfyzysj.equals("")))	wheresql+=" and  (xz_dnsbbxsq.sfyzysj='"+sfyzysj+"')";
	}
	dnsbgzmc=request.getParameter("dnsbgzmc");
	if (dnsbgzmc!=null)
	{
		dnsbgzmc=cf.GB2Uni(dnsbgzmc);
		if (!(dnsbgzmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dnsbgzmc='"+dnsbgzmc+"')";
	}
	gsbh=request.getParameter("gsbh");
	if (gsbh!=null)
	{
		gsbh=cf.GB2Uni(gsbh);
		if (!(gsbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gsbh='"+gsbh+"')";
	}
	gdzcmc=request.getParameter("gdzcmc");
	if (gdzcmc!=null)
	{
		gdzcmc=cf.GB2Uni(gdzcmc);
		if (!(gdzcmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gdzcmc='"+gdzcmc+"')";
	}
	bmbh=request.getParameter("bmbh");
	if (bmbh!=null)
	{
		bmbh=cf.GB2Uni(bmbh);
		if (!(bmbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.bmbh='"+bmbh+"')";
	}
	gdzcflmc=request.getParameter("gdzcflmc");
	if (gdzcflmc!=null)
	{
		gdzcflmc=cf.GB2Uni(gdzcflmc);
		if (!(gdzcflmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gdzcflmc='"+gdzcflmc+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.xh='"+xh+"')";
	}
	pp=request.getParameter("pp");
	if (pp!=null)
	{
		pp=cf.GB2Uni(pp);
		if (!(pp.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pp='"+pp+"')";
	}
	pz1=request.getParameter("pz1");
	if (pz1!=null)
	{
		pz1=cf.GB2Uni(pz1);
		if (!(pz1.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz1='"+pz1+"')";
	}
	pz2=request.getParameter("pz2");
	if (pz2!=null)
	{
		pz2=cf.GB2Uni(pz2);
		if (!(pz2.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz2='"+pz2+"')";
	}
	pz3=request.getParameter("pz3");
	if (pz3!=null)
	{
		pz3=cf.GB2Uni(pz3);
		if (!(pz3.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz3='"+pz3+"')";
	}
	pz4=request.getParameter("pz4");
	if (pz4!=null)
	{
		pz4=cf.GB2Uni(pz4);
		if (!(pz4.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz4='"+pz4+"')";
	}
	pz5=request.getParameter("pz5");
	if (pz5!=null)
	{
		pz5=cf.GB2Uni(pz5);
		if (!(pz5.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz5='"+pz5+"')";
	}
	pz6=request.getParameter("pz6");
	if (pz6!=null)
	{
		pz6=cf.GB2Uni(pz6);
		if (!(pz6.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz6='"+pz6+"')";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.jsr='"+jsr+"')";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	wxr=request.getParameter("wxr");
	if (wxr!=null)
	{
		wxr=cf.GB2Uni(wxr);
		if (!(wxr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.wxr='"+wxr+"')";
	}
	wxlrsj=request.getParameter("wxlrsj");
	if (wxlrsj!=null)
	{
		wxlrsj=wxlrsj.trim();
		if (!(wxlrsj.equals("")))	wheresql+="  and (wxlrsj>=TO_DATE('"+wxlrsj+"','YYYY/MM/DD'))";
	}
	wxlrsj=request.getParameter("wxlrsj2");
	if (wxlrsj!=null)
	{
		wxlrsj=wxlrsj.trim();
		if (!(wxlrsj.equals("")))	wheresql+="  and (wxlrsj<=TO_DATE('"+wxlrsj+"','YYYY/MM/DD'))";
	}
	wcsj=request.getParameter("wcsj");
	if (wcsj!=null)
	{
		wcsj=wcsj.trim();
		if (!(wcsj.equals("")))	wheresql+="  and (wcsj>=TO_DATE('"+wcsj+"','YYYY/MM/DD'))";
	}
	wcsj=request.getParameter("wcsj2");
	if (wcsj!=null)
	{
		wcsj=wcsj.trim();
		if (!(wcsj.equals("")))	wheresql+="  and (wcsj<=TO_DATE('"+wcsj+"','YYYY/MM/DD'))";
	}
	wxfy=request.getParameter("wxfy");
	if (wxfy!=null)
	{
		wxfy=wxfy.trim();
		if (!(wxfy.equals("")))	wheresql+=" and  (xz_dnsbbxsq.wxfy="+wxfy+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.lrr='"+lrr+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (xz_dnsbbxsq.clzt='"+clzt+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	
	ls_sql="SELECT bxxh,DECODE(clzt,'1','未接收','2','接收','3','维修中','4','采购中','5','送修中','6','完成'),a.dwmc bxbm,sqr,bxrq,jhlqrq,dnsbflmc,dnsbgzmc,bgr, DECODE(sfyzysj,'N','无','Y','有'),gzxxsm,lrr,gsbh,gdzcmc,bmbh,gdzcflmc,xh,pp,pz1,pz2,pz3,pz4,pz5,pz6,b.dwmc fgsmc  ";
	ls_sql+=" FROM xz_dnsbbxsq,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where xz_dnsbbxsq.dwbh=a.dwbh(+) and xz_dnsbbxsq.fgsbh=b.dwbh(+)";
	
	ls_sql+=" and xz_dnsbbxsq.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";

    ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_dnsbbxsqJsList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"bxxh","dwbh","fgsbh","sqr","bxrq","jhlqrq","dnsbflmc","bgr","sfyzysj","dnsbgzmc","gzxxsm","gsbh","gdzcmc","bmbh","gdzcflmc","xh","pp","pz1","pz2","pz3","pz4","pz5","pz6","jsr","jssj","jdjg","clqk","wxr","wxlrsj","wcsj","wxfy","lrr","lrrq","clzt"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bxxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"批量接收"};//按钮的显示名称
	String[] buttonLink={"Xz_dnsbbxsqJsList.jsp"};//按钮单击调用的网页，可以增加参数
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
	String yhmc=(String)session.getAttribute("yhmc");
	String[] bxxh = request.getParameterValues("bxxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(bxxh,"bxxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update xz_dnsbbxsq set clzt='2',jsr='"+yhmc+"',jssj=TRUNC(SYSDATE) where "+chooseitem+" and clzt='1'";
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
  <B><font size="3">报修申请－接收</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">报修序号</td>
	<td  width="3%">处理状态</td>
	<td  width="5%">报修部门</td>
	<td  width="3%">报修申请人</td>
	<td  width="3%">报修日期</td>
	<td  width="3%">希望完成日期</td>
	<td  width="4%">电脑及设备分类</td>
	<td  width="4%">电脑及设备故障分类</td>
	<td  width="3%">设备保管人</td>
	<td  width="3%">设备中是否有重要数据</td>
	<td  width="13%">故障详细说明</td>
	<td  width="3%">录入人</td>
	<td  width="3%">固定资产编号</td>
	<td  width="5%">固定资产名称</td>
	<td  width="3%">固定资产部门内编号</td>
	<td  width="4%">固定资产分类</td>
	<td  width="3%">型号</td>
	<td  width="3%">品牌</td>
	<td  width="4%">配置(CPU)</td>
	<td  width="4%">配置(内存)</td>
	<td  width="4%">配置(硬盘)</td>
	<td  width="4%">配置(主板)</td>
	<td  width="4%">配置(显卡)</td>
	<td  width="4%">配置(显示器)</td>
	<td  width="5%">报修分公司</td>
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