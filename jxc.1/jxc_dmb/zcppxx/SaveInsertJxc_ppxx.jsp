<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ppmc=null;
String pplb=null;
String scsmc=null;
String bz=null;
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
pplb=cf.GB2Uni(request.getParameter("pplb"));
scsmc=cf.GB2Uni(request.getParameter("scsmc"));
bz=cf.GB2Uni(request.getParameter("bz"));

String sfyyh=null;
java.sql.Date yhkssj=null;
java.sql.Date yhjzsj=null;
sfyyh=request.getParameter("sfyyh");
ls=request.getParameter("yhkssj");
try{
	if (!(ls.equals("")))  yhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݿ�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yhjzsj");
try{
	if (!(ls.equals("")))  yhjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhjzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݽ���ʱ��]����ת����������:"+e);
	return;
}
String yhnr=cf.GB2Uni(request.getParameter("yhnr"));
String cwdm=cf.GB2Uni(request.getParameter("cwdm"));
String ppfzr=cf.GB2Uni(request.getParameter("ppfzr"));
int mrazhs=0;
ls=request.getParameter("mrazhs");
try{
	if (!(ls.equals("")))  mrazhs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mrazhs������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿ�հ�װ��������]����ת����������:"+e);
	return;
}
String cldl=cf.GB2Uni(request.getParameter("cldl"));

double tcycf=0;
ls=request.getParameter("tcycf");
try{
	if (!(ls.equals("")))  tcycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tcycf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײ�Զ�̷�]����ת����������:"+e);
	return;
}
String sfxcl=cf.GB2Uni(request.getParameter("sfxcl"));
String sfkgtcsl=cf.GB2Uni(request.getParameter("sfkgtcsl"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("������Ʒ���Ѵ���");
		return;
	}

	int ppbm=0;
	ls_sql="select NVL(max(ppbm),0)";
	ls_sql+=" from  jxc_ppxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppbm=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ppbm++;
	
	conn.setAutoCommit(false);

	ls_sql="insert into jxc_ppxx ( ppbm,ppmc,pplb,scsmc,bz,sfyyh,yhkssj,yhjzsj,yhnr,cwdm,mrazhs,ppfzr,cldl,tcycf,sfxcl,sfkgtcsl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,pplb);
	ps.setString(4,scsmc);
	ps.setString(5,bz);
	ps.setString(6,sfyyh);
	ps.setDate(7,yhkssj);
	ps.setDate(8,yhjzsj);
	ps.setString(9,yhnr);
	ps.setString(10,cwdm);
	ps.setInt(11,mrazhs);
	ps.setString(12,ppfzr);
	ps.setString(13,cldl);
	ps.setDouble(14,tcycf);
	ps.setString(15,sfxcl);
	ps.setString(16,sfkgtcsl);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where ppbm not in(select ppbm from jxc_ppxx) ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ��������µ���Ʒ�Ʊ���Ϊ��<%=ppbm%>");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>