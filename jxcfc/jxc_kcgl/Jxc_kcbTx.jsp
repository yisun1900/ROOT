<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="Writeline" scope="session" class="ybl.common.Writeline"/>
<%
String ls_sql=null;
String wheresql=null;
String xsfs="3";
String jxc_kcb_dqbm=request.getParameter("jxc_kcb_dqbm");
	if (jxc_kcb_dqbm!=null)
	{
		jxc_kcb_dqbm=cf.GB2Uni(jxc_kcb_dqbm);
		if (!(jxc_kcb_dqbm.equals("")))	
		{wheresql+=" and  (jxc_cljgb.dqbm='"+jxc_kcb_dqbm+"')";}
	}
try {
	ls_sql="SELECT scsmc,sum(zcpzsl) ";

	ls_sql+=" FROM jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm and zcpzsl>0 and cllb='1' ";
	ls_sql+=" group by scsmc ";
//	ls_sql+=ordersql;
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