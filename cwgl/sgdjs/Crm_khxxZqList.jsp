<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
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
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}

	ls_sql="SELECT hth,khxm,DECODE(gdjsjd,'0','未结算','2','中期结算','1','完工结算'),qye,zjxje,sfke,ROUND((sfke-NVL(zjxje,0))*100/qye)||'%',fwdz,a.dwmc sbdm,sjkgrq,sjjgrq,sgdmc sgd,sjs,zjxm,khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and (gdjsjd='0' or gdjsjd is null) and qye>0";//0：未结算；1：完工结算；2：中期结算
    ls_sql+=wheresql;
    ls_sql+=" order by ROUND((sfke-NVL(zjxje,0))*100/qye) desc";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","InsertZqCw_gdjsjl.jsp","");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","sbrq","hdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("结算");
	pageObj.setViewBolt("");

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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队中期结算</font></B>
</CENTER>
<form method="POST" name="listform">
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">合同号</td>
	<td  width="5%">姓名</td>
	<td  width="5%">结算标志</td>
	<td  width="7%">签约额</td>
	<td  width="5%">增减项</td>
	<td  width="7%">实收款</td>
	<td  width="4%">收款率</td>
	<td  width="17%">房屋地址</td>
	<td  width="9%">签约店面</td>
	<td  width="7%">实开工日期</td>
	<td  width="7%">实竣工日期</td>
	<td  width="5%">施工队</td>
	<td  width="5%">设计师</td>
	<td  width="5%">质检员</td>
	<td  width="6%">客户编号</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.printSum();
	pageObj.displayFoot();
%> 

</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
