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
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
		
	crm_khxx_qyrq=request.getParameter("sjfw");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("sjfw2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	
	crm_khxx_sgd=request.getParameter("csmc");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	
		
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm, DECODE(crm_khxx.xb,'M','男','W','女'),crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs,b.dwmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.qye,crm_khxx.jcjjqye,crm_khxx.jsje,gcjdmc  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,dm_gcjdbm,dm_xqbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=b.dwbh(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and crm_khxx.xqbm=dm_xqbm.xqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by khbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxCxList.jsp","SelectCxCrm_khxx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
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

	
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="3%">性别</td>
	<td  width="15%">房屋地址</td>
	<td  width="10%">联系方式</td>
	<td  width="5%">合同号</td>
	<td  width="5%">设计师</td>
	<td  width="5%" bgcolor="#FF0000" ><font color="#0000FF">施工队</td>
	<td  width="5%">质检</td>
	<td  width="8%">签约店面</td>
	<td  width="7%">签约日期</td>
	<td  width="6%">工程签约额</td>
	<td  width="6%">集成家居签约额</td>
	<td  width="6%">结算金额</td>
	<td  width="5%">工程进度</td>
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