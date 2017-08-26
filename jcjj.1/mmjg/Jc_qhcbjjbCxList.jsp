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
	String jc_qhcbjjb_mmdglxbm=null;
	String jc_qhcbjjb_qhjgqjbm=null;
	String jc_qhcbjjb_mmjjl=null;
	jc_qhcbjjb_mmdglxbm=request.getParameter("jc_qhcbjjb_mmdglxbm");
	if (jc_qhcbjjb_mmdglxbm!=null)
	{
		jc_qhcbjjb_mmdglxbm=cf.GB2Uni(jc_qhcbjjb_mmdglxbm);
		if (!(jc_qhcbjjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_qhcbjjb.mmdglxbm='"+jc_qhcbjjb_mmdglxbm+"')";
	}
	jc_qhcbjjb_qhjgqjbm=request.getParameter("jc_qhcbjjb_qhjgqjbm");
	if (jc_qhcbjjb_qhjgqjbm!=null)
	{
		jc_qhcbjjb_qhjgqjbm=cf.GB2Uni(jc_qhcbjjb_qhjgqjbm);
		if (!(jc_qhcbjjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_qhcbjjb.qhjgqjbm='"+jc_qhcbjjb_qhjgqjbm+"')";
	}
	jc_qhcbjjb_mmjjl=request.getParameter("jc_qhcbjjb_mmjjl");
	if (jc_qhcbjjb_mmjjl!=null)
	{
		jc_qhcbjjb_mmjjl=jc_qhcbjjb_mmjjl.trim();
		if (!(jc_qhcbjjb_mmjjl.equals("")))	wheresql+=" and  (jc_qhcbjjb.mmjjl="+jc_qhcbjjb_mmjjl+") ";
	}
	ls_sql="SELECT jc_qhcbjjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_qhcbjjb.qhjgqjbm as qhjgqjbm,jdm_qhjgqj.qhjgqj as jdm_qhjgqj_qhjgqj,jc_qhcbjjb.mmjjl||'%' jc_qhcbjjb_mmjjl  ";
	ls_sql+=" FROM jdm_qhjgqj,jc_mmdglx,jc_qhcbjjb  ";
    ls_sql+=" where jc_qhcbjjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_qhcbjjb.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_qhcbjjb.qhjgqjbm,jc_qhcbjjb.mmdglxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_qhcbjjbCxList.jsp","SelectCxJc_qhcbjjb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"jc_mmdglx_mmdglxmc","jdm_qhjgqj_qhjgqj","jc_qhcbjjb_mmjjl"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"mmdglxbm","qhjgqjbm"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
	<td  width="20%">木门订购类型</td>
	<td  width="20%">墙厚价格区间</td>
	<td  width="10%">每米加价率</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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