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
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String sjs=null;
	String sgd=null;
	String zjxm=null;
	String hfrq=null;
	String hflxbm=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (v_khhf.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (v_khhf.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (v_khhf.fwdz='"+fwdz+"')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (v_khhf.lxfs='"+lxfs+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (v_khhf.sjs='"+sjs+"')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (v_khhf.sgd='"+sgd+"')";
	}
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (v_khhf.zjxm='"+zjxm+"')";
	}
	hfrq=request.getParameter("hfrq");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (v_khhf.hfrq>=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}
	hfrq=request.getParameter("hfrq2");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (v_khhf.hfrq<=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (v_khhf.hflxbm='"+hflxbm+"')";
	}
	ls_sql="SELECT v_khhf.hflxbm as hflxbm,hflxmc,hfrq,khbh,khxm,fwdz,lxfs,sjs,sgdmc,zjxm ";
	ls_sql+=" FROM v_khhf,sq_sgd,dm_hflxbm  ";
    ls_sql+=" where v_khhf.sgd=sq_sgd.sgd(+) and v_khhf.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by  hfrq ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxCxList.jsp","SelectCxCrm_khxx.jsp","khfw.jsp","");
	pageObj.setPageRow(50);//设置每页显示记录数
//设置显示列
	String[] disColName={"hflxmc","hfrq","khxm","fwdz","lxfs","sjs","sgdmc","zjxm"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"khbh","hflxbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("回访");
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="12%">回访类型</td>
	<td  width="10%">回访日期</td>
	<td  width="8%">姓名</td>
	<td  width="26%">房屋地址</td>
	<td  width="14%">联系方式</td>
	<td  width="8%">设计师</td>
	<td  width="8%">施工队</td>
	<td  width="8%">质检</td>
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