<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%

String ssfgs=request.getParameter("ssfgs");
String dwbh=request.getParameter("dwbh");
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
String yhmc=cf.GB2Uni(request.getParameter("yhmc"));
String sfzh=cf.GB2Uni(request.getParameter("sfzh"));
String wenti=cf.GB2Uni(request.getParameter("wenti"));
String daan=cf.GB2Uni(request.getParameter("daan"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yhkl="0";
String sfzszg="";
String sfyxzhmm="";

try {
	conn=cf.getConnection();


	ls_sql="select yhkl,sfzszg,sfyxzhmm ";
	ls_sql+=" from sq_yhxx ";
	ls_sql+=" where sfzszg in('Y','N','C') and kdlxtbz='Y' and ssfgs='"+ssfgs+"' and dwbh='"+dwbh+"' and yhmc='"+yhmc+"' and sfzh='"+sfzh+"'";
	ls_sql+=" and yhdlm='"+yhdlm+"' and wenti='"+wenti+"' and daan='"+daan+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		yhkl=cf.fillNull(rs.getString("yhkl"));
		sfzszg=cf.fillNull(rs.getString("sfzszg"));
		sfyxzhmm=cf.fillNull(rs.getString("sfyxzhmm"));

		if (!sfyxzhmm.equals("Y"))
		{
			rs.close();
			ps.close();
			out.println("错误！未被授权找回密码");
			return;
		}

		if (yhkl.equals("111111"))
		{
		}
		else{
			yhkl=cf.makejm(yhkl);
		}

		out.println("用户登陆名："+yhdlm+"；用户口令："+yhkl);
	}
	else{
		rs.close();
		ps.close();
		out.println("错误！录入信息不正确，未取到口令");
		return;
	}
	rs.close();
	ps.close();

	ls_sql="update sq_yhxx set lxdlsbcs=0,sccgdlsj=SYSDATE ";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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