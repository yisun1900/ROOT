<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="Writeline" scope="session" class="ybl.common.Writeline"/>
<%
String xsrq=null;
String wheresql="";
String xsfs=null;
xsfs=request.getParameter("xsfs");
xsrq=request.getParameter("time1");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and dm_xsjl.xsrq>=TO_DATE('"+xsrq+"','YYYY-MM-DD')";
	}
xsrq=request.getParameter("time2");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and dm_xsjl.xsrq<=TO_DATE('"+xsrq+"','YYYY-MM-DD')";
	}
String ls_sql="";
try {
	ls_sql=" select to_char(xsrq,'yyyy-mm-dd') xsrq,sum(sxj) sxje ";
	ls_sql+=" from dm_xsjl";
	ls_sql+=" where (1=1) and dwbh='N000A' ";
	ls_sql+=wheresql;
	ls_sql+="  group by xsrq order by xsrq ";
//======================================��SQL��䴫����̨,�Զ��������ͱ���===============================
/************************************************
һ��Ҫע��SQL����д��,ǰ��������,������ֵ!!!!!!!!!
*************************************************/
	ArrayList vmllist=null;
	vmllist=Writeline.writeLine(ls_sql,xsfs);//xsfs 1:��ͼ;2:��ͼ;3:��ͼ;
	for (int m=0;m<vmllist.size();m++)
		{
			out.print(vmllist.get(m));//����̨���ݴ�ӡ
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

