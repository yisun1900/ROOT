<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="Writeline" scope="session" class="ybl.common.Writeline"/>
<%
String qyrq=null;
String wheresql="";
String xsfs=null;
xsfs=request.getParameter("xsfs");
qyrq=request.getParameter("time1");
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	wheresql+="  and crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
}
qyrq=request.getParameter("time2");
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	wheresql+="  and crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
}
String ls_sql="";

try {
	ls_sql=" select sjs,sum(qye) sxje ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where (1=1) ";
	ls_sql+=wheresql;
	ls_sql+="  group by sjs order by sjs ";

//======================================将SQL语句传到后台,自动生成线型报表===============================
/************************************************
一定要注意SQL语句的写法,前面是名称,后面是值!!!!!!!!!
*************************************************/
	ArrayList vmllist=null;
	vmllist=Writeline.writeLine(ls_sql,xsfs);//xsfs 1:线图;2:柱图;3:饼图;
	for (int m=0;m<vmllist.size();m++)
		{
			out.print(vmllist.get(m));//将后台数据打印
		}
	}
//===================================================================================================
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
}
%>

