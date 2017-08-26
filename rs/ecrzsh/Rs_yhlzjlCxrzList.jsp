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

	String yhmc=null;
	String sfzh=null;

	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (sq_yhxx.sfzh='"+sfzh+"')";
	}

	String fgsbh=request.getParameter("fgsbh");

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,sq_yhxx.lzrq,sq_yhxx.lzyy,dwmc ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.sfzszg in('S','T')";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.lzrq desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_yhlzjlCxrzList.jsp","SelectCxrzRs_yhlzjl.jsp","","InsertRs_ecrzsqd.jsp?fgsbh="+fgsbh);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ygbh","yhmc","bianhao","sfzh","xzzwbm","lzrq","lzyy","dwbh","ssfgs","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
	pageObj.setEditStr("重新入职");

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
/*
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
  <B><font size="3">离职员工重新入职</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">员工序号</td>
	<td  width="7%">员工名称</td>
	<td  width="7%">工号</td>
	<td  width="13%">身份证号</td>
	<td  width="9%">行政职务</td>
	<td  width="7%">离职日期</td>
	<td  width="30%">离职原因</td>
	<td  width="9%">原所属部门</td>
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