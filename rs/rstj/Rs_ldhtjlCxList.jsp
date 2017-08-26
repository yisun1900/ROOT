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
	String fgs=null;
	String nian=null;
	fgs=request.getParameter("fgs");
	String ks=null;
	String js=null;
	ks=nian+"-01-01";
	js=nian+"-12-31";
	wheresql+="  and (htksrq>=TO_DATE('"+ks+"','YYYY/MM/DD'))";
	wheresql+="  and (htksrq<=TO_DATE('"+js+"','YYYY/MM/DD'))";
	ls_sql="SELECT ldhtbh,yhmc,bianhao,a.dwmc ssfgs,b.dwmc dwbh,rzsj,dm_ldhtqx.ldhtqx ldhtqx,htksrq,htdqrq,dm_ldhtlx.ldhtlx ldhtlx,rs_ldhtjl.bz   ";
	ls_sql+=" FROM rs_ldhtjl,sq_dwxx a,sq_dwxx b,dm_ldhtlx,dm_ldhtqx   ";
    ls_sql+=" where rs_ldhtjl.ssfgs=a.dwbh and rs_ldhtjl.dwbh=b.dwbh and dm_ldhtqx.ldhtqxbm=rs_ldhtjl.ldhtqx and dm_ldhtlx.ldhtlxbm=rs_ldhtjl.ldhtlx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ldhtjlCxList.jsp","SelectCxRs_ldhtjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ldhtbh","yhmc","bianhao","ssfgs","dwbh","rzsj","ldhtlx","ldhtqx","htksrq","htdqrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ldhtbh"};
	pageObj.setKey(keyName);
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
	<td  width="9%">劳动合同编号</td>
	<td  width="7%">员工名称</td>
	<td  width="7%">员工编号</td>
	<td  width="9%">所属分公司</td>
	<td  width="9%">所属单位编号</td>
	<td  width="10%">入职日期</td>
	<td  width="9%">劳动合同期限</td>
	<td  width="10%">合同开始日期</td>
	<td  width="10%">合同到期日期</td>
	<td  width="8%">签订类型</td>
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