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
	String rq=null;
	String nian=null;
	String yue=null;
	String ri=null;
	String jjrbz=null;
	String jjrlx=null;
	rq=request.getParameter("rq");
	if (rq!=null)
	{
		rq=rq.trim();
		if (!(rq.equals("")))	wheresql+="  and (rq>=TO_DATE('"+rq+"','YYYY/MM/DD'))";
	}
	rq=request.getParameter("rq2");
	if (rq!=null)
	{
		rq=rq.trim();
		if (!(rq.equals("")))	wheresql+="  and (rq<=TO_DATE('"+rq+"','YYYY/MM/DD'))";
	}
	nian=request.getParameter("nian");
	if (nian!=null)
	{
		nian=cf.GB2Uni(nian);
		if (!(nian.equals("")))	wheresql+=" and  (nian='"+nian+"')";
	}
	yue=request.getParameter("yue");
	if (yue!=null)
	{
		yue=cf.GB2Uni(yue);
		if (!(yue.equals("")))	wheresql+=" and  (yue='"+yue+"')";
	}
	ri=request.getParameter("ri");
	if (ri!=null)
	{
		ri=cf.GB2Uni(ri);
		if (!(ri.equals("")))	wheresql+=" and  (ri='"+ri+"')";
	}
	jjrbz=request.getParameter("jjrbz");
	if (jjrbz!=null)
	{
		jjrbz=cf.GB2Uni(jjrbz);
		if (!(jjrbz.equals("")))	wheresql+=" and  (jjrbz='"+jjrbz+"')";
	}
	jjrlx=request.getParameter("jjrlx");
	if (jjrlx!=null)
	{
		jjrlx=cf.GB2Uni(jjrlx);
		if (!(jjrlx.equals("")))	wheresql+=" and  (jjrlx='"+jjrlx+"')";
	}
	ls_sql="SELECT rq,nian,yue,ri, DECODE(jjrbz,'Y','节假日','N','否'), DECODE(jjrlx,'1','周末（周六）','2','周末（周日）','3','节日','8','其它')  ";
	ls_sql+=" FROM dm_gzrl  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by rq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_gzrlList.jsp","","","EditDm_gzrl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"rq","nian","yue","ri","jjrbz","jjrlx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"rq"};
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
  <B><font size="3">工作日历</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="14%">日期</td>
	<td  width="14%">年</td>
	<td  width="14%">月</td>
	<td  width="14%">日</td>
	<td  width="10%">节假日标志</td>
	<td  width="20%">节假日类型</td>
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