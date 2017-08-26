<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");

String khzq=cf.GB2Uni(request.getParameter("khzq"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

String[] dwbh=request.getParameterValues("dwbh");
String[] djsjhStr=request.getParameterValues("djsjh");
String[] sjfjhStr=request.getParameterValues("sjfjh");
String[] gxhjhStr=request.getParameterValues("gxhjh");
String[] tcjhStr=request.getParameterValues("tcjh");
String[] zcjhStr=request.getParameterValues("zcjh");

String[] jtdjsjhStr=request.getParameterValues("jtdjsjh");
String[] jtsjfjhStr=request.getParameterValues("jtsjfjh");
String[] jtgxhjhStr=request.getParameterValues("jtgxhjh");
String[] jttcjhStr=request.getParameterValues("jttcjh");
String[] jtzcjhStr=request.getParameterValues("jtzcjh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	java.sql.Date khqssj=null;
	java.sql.Date khjzsj=null;
	ls_sql="select khqssj,khjzsj ";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khqssj=rs.getDate("khqssj");
		khjzsj=rs.getDate("khjzsj");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	for (int i=0;i<dwbh.length ;i++ )
	{

		int djsjh=0;
		if (!djsjhStr[i].trim().equals(""))
		{
			try{
				djsjh=Integer.parseInt(djsjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[��˾�������ƻ�]������������:"+e);
				return;
			}
		}
		double sjfjh=0;
		if (!sjfjhStr[i].trim().equals(""))
		{
			try{
				sjfjh=Double.parseDouble(sjfjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[��˾��ƷѼƻ�]������������:"+e);
				return;
			}
		}
		double gxhjh=0;
		if (!gxhjhStr[i].trim().equals(""))
		{
			try{
				gxhjh=Double.parseDouble(gxhjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[��˾���Ի��ƻ�]������������:"+e);
				return;
			}
		}
		double tcjh=0;
		if (!tcjhStr[i].trim().equals(""))
		{
			try{
				tcjh=Double.parseDouble(tcjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[��˾�ײͼƻ�]������������:"+e);
				return;
			}
		}
		double zcjh=0;
		if (!zcjhStr[i].trim().equals(""))
		{
			try{
				zcjh=Double.parseDouble(zcjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[��˾���ļƻ�]������������:"+e);
				return;
			}
		}


		int jtdjsjh=0;
		if (!jtdjsjhStr[i].trim().equals(""))
		{
			try{
				jtdjsjh=Integer.parseInt(jtdjsjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[���Ŷ������ƻ�]������������:"+e);
				return;
			}
		}
		double jtsjfjh=0;
		if (!jtsjfjhStr[i].trim().equals(""))
		{
			try{
				jtsjfjh=Double.parseDouble(jtsjfjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[������ƷѼƻ�]������������:"+e);
				return;
			}
		}
		double jtgxhjh=0;
		if (!gxhjhStr[i].trim().equals(""))
		{
			try{
				jtgxhjh=Double.parseDouble(jtgxhjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[���Ÿ��Ի��ƻ�]������������:"+e);
				return;
			}
		}
		double jttcjh=0;
		if (!jttcjhStr[i].trim().equals(""))
		{
			try{
				jttcjh=Double.parseDouble(jttcjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[�����ײͼƻ�]������������:"+e);
				return;
			}
		}
		double jtzcjh=0;
		if (!jtzcjhStr[i].trim().equals(""))
		{
			try{
				jtzcjh=Double.parseDouble(jtzcjhStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+dwbh[i]+"[�������ļƻ�]������������:"+e);
				return;
			}
		}

		ls_sql="delete from cw_jrbmyjkh  ";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into cw_jrbmyjkh ( khzq,khqssj,khjzsj,fgsbh,dwbh  ,djsjh,sjfjh,gxhjh,tcjh,zcjh,zjh   ,jtdjsjh,jtsjfjh,jtgxhjh,jttcjh,jtzcjh,jtzjh   ,djswc,sjfwc,gxhwc,tcwc,zcwc,zwc,khdf,lrr,lrsj,bz,sfkh ) ";
		ls_sql+=" values ( ?,?,?,?,?  ,?,?,?,?,?,?  ,?,?,?,?,?,?   ,0,0,0,0,0,0,0,?,SYSDATE,?,'N' ) ";//N��δ���ˣ�Y������
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khzq);
		ps.setDate(2,khqssj);
		ps.setDate(3,khjzsj);
		ps.setString(4,fgsbh);
		ps.setString(5,dwbh[i]);

		ps.setInt(6,djsjh);
		ps.setDouble(7,sjfjh);
		ps.setDouble(8,gxhjh);
		ps.setDouble(9,tcjh);
		ps.setDouble(10,zcjh);
		ps.setDouble(11,sjfjh+gxhjh+tcjh+zcjh);

		ps.setInt(12,jtdjsjh);
		ps.setDouble(13,jtsjfjh);
		ps.setDouble(14,jtgxhjh);
		ps.setDouble(15,jttcjh);
		ps.setDouble(16,jtzcjh);
		ps.setDouble(17,jtsjfjh+jtgxhjh+jttcjh+jtzcjh);

		ps.setString(18,lrr);
		ps.setString(19,"");
		ps.executeUpdate();
		ps.close();

	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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