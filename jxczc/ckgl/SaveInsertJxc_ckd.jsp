<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ckph=null;
String dqbm=null;
String fgsbh=null;
String ckbh=null;
String cklx=null;
String khbh=null;
String ckfs=null;
String psfs=null;
java.sql.Date jhshsj=null;
String lydh=null;
String jsr=null;
String ckr=null;
java.sql.Date cksj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
cklx=cf.GB2Uni(request.getParameter("cklx"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ckfs=cf.GB2Uni(request.getParameter("ckfs"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ��ͻ�ʱ��]����ת����������:"+e);
	return;
}
lydh=cf.GB2Uni(request.getParameter("lydh"));
jsr=cf.GB2Uni(request.getParameter("jsr"));
ckr=cf.GB2Uni(request.getParameter("ckr"));
ls=request.getParameter("cksj");
try{
	if (!(ls.equals("")))  cksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cksj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ckjxz=cf.GB2Uni(request.getParameter("ckjxz"));
String mddqbm=cf.GB2Uni(request.getParameter("mddqbm"));

String ckcllx="0";//0�����ģ�1������
String nian=cf.today("YY");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt="";
	String shjl="";
	ls_sql=" SELECT psdzt,shjl ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+lydh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
		shjl=cf.fillNull(rs.getString("shjl"));
	}
	rs.close();
	ps.close();

	//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�������
	if (!psdzt.equals("2") && !psdzt.equals("5") && !(psdzt.equals("6") && shjl.equals("Y"))  )
	{
		out.print("�������͵�["+lydh+"]״̬����ȷ��ӦΪ��2���ȴ����� �� 5�����ֳ��⣻6������ˡ���");
		return;
	}

	//���ɳ������ţ�F��Z��C+XX(����)+XX(��) +XXXXX����ˮ��
	int count=0;
	ls_sql="select NVL(max(substr(ckph,7,5)),0)";
	ls_sql+=" from  jxc_ckd";
	ls_sql+=" where dqbm='"+dqbm+"' and ckcllx='"+ckcllx+"' and nian='"+nian+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ckph="ZC"+dqbm+nian+cf.addZero(count+1,5);


	ls_sql="insert into jxc_ckd ( ckph,dqbm,fgsbh,ckbh,ckcllx,cklx,khbh,ckfs,psfs,jhshsj,lydh,jsr,ckr,cksj,lrr,lrsj,lrbm,nian,bz,ckzsl,ckzje,ckzcb,ckdzt,sfth,sfjz,sfyfkc,ckjxz,mddqbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,?,?,0,0,0,'0','N','N','1',?,? ) ";//1���޸���棻2�������δ��⣻3����������
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckph);
	ps.setString(2,dqbm);
	ps.setString(3,fgsbh);
	ps.setString(4,ckbh);
	ps.setString(5,ckcllx);
	ps.setString(6,cklx);
	ps.setString(7,khbh);
	ps.setString(8,ckfs);
	ps.setString(9,psfs);
	ps.setDate(10,jhshsj);
	ps.setString(11,lydh);
	ps.setString(12,jsr);
	ps.setString(13,ckr);
	ps.setDate(14,cksj);
	ps.setString(15,lrr);
	ps.setString(16,lrbm);
	ps.setString(17,nian);
	ps.setString(18,bz);
	ps.setString(19,ckjxz);
	ps.setString(20,mddqbm);
	ps.executeUpdate();
	ps.close();

	
	response.sendRedirect("EditJxc_ckd.jsp?lx=1&ckph="+ckph);
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
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