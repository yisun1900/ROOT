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
	String fshm=null;
	String jssj=null;
	String dxnr=null;
	fshm=request.getParameter("fshm");
	if (fshm!=null)
	{
		fshm=cf.GB2Uni(fshm);
		if (!(fshm.equals("")))	wheresql+=" and  (fshm='"+fshm+"')";
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
		if (!(jssj.equals("")))	wheresql+="  and (jssj<=TO_DATE('"+jssj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	dxnr=request.getParameter("dxnr");
	if (dxnr!=null)
	{
		dxnr=cf.GB2Uni(dxnr);
		if (!(dxnr.equals("")))	wheresql+=" and  (dxnr='"+dxnr+"')";
	}
	ls_sql="SELECT xh,fshm,to_char(jssj,'yyyy-MM-dd hh24:mi:ss'),dxnr  ";
	ls_sql+=" FROM dx_jsdx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	ls_sql+=" order by xh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dx_jsdxCxList.jsp","SelectCxDx_jsdx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","fshm","jssj","dxnr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[3]="align='left'";
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
  <B><font size="3">短信接收记录查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">序号</td>
	<td  width="11%">手机号码</td>
	<td  width="18%">发出时间</td>
	<td  width="65%">短信内容</td>
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