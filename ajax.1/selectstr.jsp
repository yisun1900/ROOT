<%@ page contentType="text/html;charset=GBK" %>

<%
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

	String sql=cf.GB2Uni(cf.getParameter(request,"sql"));
//	out.print("SQL="+sql);

	String rowDiv="%"; //�зָ��
	String colDiv="+"; //�зָ��

	String retStr=cf.getSQLData(sql,rowDiv,colDiv);//��SQL�Ĳ�ѯ���ת���ַ���
    out.print(retStr);  
%>