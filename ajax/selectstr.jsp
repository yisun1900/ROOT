<%@ page contentType="text/html;charset=GBK" %>

<%
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

	String sql=request.getParameter("sql");
	sql=cf.SQLJM(sql);
//	out.print("SQL="+sql);

	String rowDiv="%"; //�зָ��
	String colDiv="+"; //�зָ��

	String retStr=cf.getSQLData(sql,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���
    out.print(retStr);  
%>