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
	String jzph=null;
	String dwbh=null;
	String jzrq=null;
	String jzr=null;
	jzph=request.getParameter("jzph");
	if (jzph!=null)
	{
		jzph=cf.GB2Uni(jzph);
		if (!(jzph.equals("")))	wheresql+=" and  (jzph='"+jzph+"')";
	}
	dwbh=request.getParameter("fgs");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_ydjz.dwbh='"+dwbh+"')";
	}
	jzrq=request.getParameter("jzrq");
	if (jzrq!=null)
	{
		jzrq=jzrq.trim();
		if (!(jzrq.equals("")))	wheresql+="  and (jzrq>=TO_DATE('"+jzrq+"','YYYY/MM/DD'))";
	}
	jzrq=request.getParameter("jzrq2");
	if (jzrq!=null)
	{
		jzrq=jzrq.trim();
		if (!(jzrq.equals("")))	wheresql+="  and (jzrq<=TO_DATE('"+jzrq+"','YYYY/MM/DD'))";
	}
	jzr=request.getParameter("jzr");
	if (jzr!=null)
	{
		jzr=cf.GB2Uni(jzr);
		if (!(jzr.equals("")))	wheresql+=" and  (jzr='"+jzr+"')";
	}

	ls_sql="SELECT jzph,dwmc,sqjzrq,jzrq,jzr ";
	ls_sql+=" FROM rs_ydjz,sq_dwxx ";
    ls_sql+=" where rs_ydjz.dwbh=sq_dwxx.dwbh ";
    ls_sql+=wheresql;
    ls_sql+=" order by jzrq desc,jzph";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ydjzList.jsp","SelectRs_ydjz.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jzph","clbm","dwbh","jzrq","clmc","clgg","cldj","fgsdj","jldwbm","cldlbm","rksl","rkje","cksl","ckje","kcsl"};
	pageObj.setDisColName(disColName);
*/
//设置主键
	String[] keyName={"jzph"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteYdjz.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jzph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_ydjz.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jzph",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">结转批号</td>
	<td  width="8%">结转单位</td>
	<td  width="6%">上期结转日期</td>
	<td  width="6%">结转日期</td>
	<td  width="6%">结转人</td>
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