<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="Writeline" scope="session" class="ybl.common.Writeline"/>
<%
String ls_sql=null;
String wheresql=null;
String xsfs="3";
try {
	ls_sql="SELECT clmc,sum(zcpzsl) ";

	ls_sql+=" FROM jxc_cljgb,jxc_clbm";
	ls_sql+=" where dqbm='01' and jxc_cljgb.clbm=jxc_clbm.clbm and zcpzsl>0 ";
	ls_sql+=" group by clmc ";
//	ls_sql+=ordersql;
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