<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<%  
String ssfgs=request.getParameter("fgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

		String c1=null;
		String c2=null;
		String retStr="";

		retStr+="[value3]";

		ls_sql=" select dwbh,dwmc ";
		ls_sql+=" from sq_dwxx ";
		ls_sql+=" where  cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' ";
		ls_sql+=" order by dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			c1=rs.getString(1);
			c2=rs.getString(2);

			retStr+="%"+c1+"+"+c2;
		}
		rs.close();
		ps.close();

		retStr+="[value4]";

		ls_sql="select ygbh,yhmc||'（'||dwmc||'）'";
		ls_sql+=" from  sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sfzszg in('Y','N')";
		ls_sql+=" and sq_yhxx.ssfgs='"+ssfgs+"' ";
		ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			c1=rs.getString(1);
			c2=rs.getString(2);

			retStr+="%"+c1+"+"+c2;
		}
		rs.close();
		ps.close();

		out.print(retStr);  
	}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

