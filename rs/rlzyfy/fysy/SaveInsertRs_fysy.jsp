<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
int count=0;

String ls=null;
String fysybh=null;
String hzbh=null;
String fgs=null;
java.sql.Date sysj=null;
String sylx=null;
String ytxs=null;
double fy=0;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;
hzbh=cf.GB2Uni(request.getParameter("hzbh"));
fgs=cf.GB2Uni(request.getParameter("fgs"));
String checkfgs=null;
//if (!(checkfgs.equals(fgs)))
//{
//	out.print("Ԥ���Ŵ���");
//	return;
//}

ls=request.getParameter("sysj");
try{
	if (!(ls.equals("")))  sysj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sysj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʹ��ʱ��]����ת����������:"+e);
	return;
}
sylx=cf.GB2Uni(request.getParameter("sylx"));
ytxs=cf.GB2Uni(request.getParameter("ytxs"));
ls=request.getParameter("fy");
try{
	if (!(ls.equals("")))  fy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fy������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
int checksy=0;
int checksp=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
//���Ԥ���ŵ���ȷ��
	ls_sql="select count(*) cs";
	ls_sql+=" from rs_fysh";
	ls_sql+=" where hzbh='"+hzbh+"' ";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	if (rs.next())
	{
		checksy=rs.getInt("cs");
	}
	rs.close();
	ps.close();

	if(checksy==0)
	{
		out.print("��ʾ������Ԥ���Ŵ��������Ƿ�������Ԥ�㡣��ά�����޸ġ�");
	}
	else
	{
		ls_sql="select count(*) cs,fgs";
		ls_sql+=" from rs_fysh";
		ls_sql+=" where hzbh='"+hzbh+"' and yshz='03' group by fgs";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			checksy=rs.getInt("cs");
			checksy=rs.getString("fgs");
		}
		rs.close();
		ps.close();

		if(checksy==0)
		{
			out.print("��ʾ������Ԥ�㻹δͨ�����������޸Ļ��ʵ����Ԥ�㡣");
		}
		if (!(checkfgs.equals(fgs)))
		{
			out.print("����ͬһ���ֹ�˾��Ԥ���ţ�");
			return;
		}

	}

	//�Զ��������
	ls_sql="select NVL(max(substr(fysybh,6,9)),0)";
	ls_sql+=" from  rs_fysy";
	ls_sql+=" where fgs='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	fysybh=fgs+cf.addZero(count,9);


	ls_sql="insert into rs_fysy ( fysybh,hzbh,fgs,sysj,sylx,ytxs,fy,bz,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fysybh);
	ps.setString(2,hzbh);
	ps.setString(3,fgs);
	ps.setDate(4,sysj);
	ps.setString(5,sylx);
	ps.setString(6,ytxs);
	ps.setDouble(7,fy);
	ps.setString(8,bz);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>