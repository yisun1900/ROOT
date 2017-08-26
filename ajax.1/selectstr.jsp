<%@ page contentType="text/html;charset=GBK" %>

<%
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

	String sql=cf.GB2Uni(cf.getParameter(request,"sql"));
//	out.print("SQL="+sql);

	String rowDiv="%"; //行分割符
	String colDiv="+"; //列分割符

	String retStr=cf.getSQLData(sql,rowDiv,colDiv);//把SQL的查询结果转成字符串
    out.print(retStr);  
%>