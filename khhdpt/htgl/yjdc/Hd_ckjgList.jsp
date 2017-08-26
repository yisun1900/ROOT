<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String ckjgbz=(String)session.getAttribute("ckjgbz");


int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
		String ls_sql=null;
	String wheresql="";
	String wtbh=null;
	String dcqs=null;
	String wtmc=null;
	String sfkdx=null;
	String wtsfgq=null;
	String wtfl=null;
	String xwtsm=null;
	String lrsj1=null;
	String lrsj2=null;
	lrsj1=request.getParameter("zdsj1");
	lrsj2=request.getParameter("zdsj2");

	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		wtbh=cf.GB2Uni(wtbh);
		if (!(wtbh.equals("")))	wheresql+=" and  (hd_scdcwt.wtbh='"+wtbh+"')";
	}
	dcqs=request.getParameter("dcqs");
	if (dcqs!=null)
	{
		dcqs=cf.GB2Uni(dcqs);
		if (!(dcqs.equals("")))	wheresql+=" and  (hd_scdcwt.dcqs='"+dcqs+"')";
	}
	wtmc=request.getParameter("wtmc");
	if (wtmc!=null)
	{
		wtmc=cf.GB2Uni(wtmc);
		if (!(wtmc.equals("")))	wheresql+=" and  (hd_scdcwt.wtmc='"+wtmc+"')";
	}
	sfkdx=request.getParameter("sfkdx");
	if (sfkdx!=null)
	{
		sfkdx=cf.GB2Uni(sfkdx);
		if (!(sfkdx.equals("")))	wheresql+=" and  (hd_scdcwt.sfkdx='"+sfkdx+"')";
	}
	wtsfgq=request.getParameter("wtsfgq");
	if (wtsfgq!=null)
	{
		wtsfgq=cf.GB2Uni(wtsfgq);
		if (!(wtsfgq.equals("")))	wheresql+=" and  (hd_scdcwt.wtsfgq='"+wtsfgq+"')";
	}
	wtfl=request.getParameter("wtfl");
	if (wtfl!=null)
	{
		wtfl=cf.GB2Uni(wtfl);
		if (!(wtfl.equals("")))	wheresql+=" and  (hd_scdcwt.wtfl='"+wtfl+"')";
	}
	xwtsm=request.getParameter("xwtsm");
	if (xwtsm!=null)
	{
		xwtsm=cf.GB2Uni(xwtsm);
		if (!(xwtsm.equals("")))	wheresql+=" and  (hd_scdcwt.xwtsm='"+xwtsm+"')";
	}
	

	
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,wtmc,wtkxda,dcqs,zdsj ";
	ls_sql+=" FROM crm_khxx,hd_scdcjg,hd_scdcwt";
    ls_sql+=" where hd_scdcjg.khbh=crm_khxx.khbh(+) and hd_scdcjg.wtbh=hd_scdcwt.wtbh";
	 if (lrsj1!=null && (!(lrsj1.equals(""))))
	{
			ls_sql+=" and zdsj>=to_Date('"+lrsj1+"','YYYY-MM-DD') ";
	}
	if (lrsj2!=null && (!(lrsj2.equals(""))))
	{
				ls_sql+=" and zdsj<=to_Date('"+lrsj2+"23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hd_ckjgList.jsp","yjdcjg.jsp","","");
	//pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_xb","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qye","crm_khxx_jcjjqye","crm_khxx_qyrq","crm_khxx_jsje","crm_khxx_gcjdbm","sq_dwxx_dwmc","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.alignStr[6]="align='left'";

	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("wtmc","1");//列参数对象加入Hash表
	
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">客户调查结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="6%">合同号</td>
	<td  width="21%">问题名称</td>
	<td  width="21%">问题答案</td>
	<td  width="15%">调查期数</td>
	<td  width="7%">做答时间</td>
</tr>
<%
	pageObj.displayDate();
//	pageObj.printSum();
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