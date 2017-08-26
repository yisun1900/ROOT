<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String kpjlh=request.getParameter("kpjlh");
String[] sgd =request.getParameterValues("sgd");
String[] sgdmc =request.getParameterValues("sgdmc");
String[] gcjxjestr =request.getParameterValues("gcjxje");
String[] gcjxdfstr =request.getParameterValues("gcjxdf");
String[] phjcdfstr =request.getParameterValues("phjcdf");
String[] tsgxdfstr =request.getParameterValues("tsgxdf");


String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	for (int i=0;i<sgd.length ;i++ )
	{
		double gcjxje=0;
		int gcjxdf=0;
		int phjcdf=0;
		int tsgxdf=0;

		if (!gcjxjestr[i].trim().equals(""))
		{
			try{
				gcjxje=Double.parseDouble(gcjxjestr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[ʩ���ӣ�"+cf.GB2Uni(sgdmc[i])+"]���󣡡����̼�������벻��ȷ:"+gcjxjestr[i]);
				return;
			}
		}

		if (!gcjxdfstr[i].trim().equals(""))
		{
			try{
				gcjxdf=Integer.parseInt(gcjxdfstr[i].trim());

				if (gcjxdf<0 || gcjxdf>12)
				{
					conn.rollback();
					out.println("<BR>[ʩ���ӣ�"+cf.GB2Uni(sgdmc[i])+"]���󣡡����̼���÷֡�ֻ��λ��0��12֮��");
					return;
				}
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[ʩ���ӣ�"+cf.GB2Uni(sgdmc[i])+"]���󣡡����̼���÷֡����벻��ȷ:"+gcjxdfstr[i]);
				return;
			}
		}

		if (!phjcdfstr[i].trim().equals(""))
		{
			try{
				phjcdf=Integer.parseInt(phjcdfstr[i].trim());

				if (phjcdf<0 || phjcdf>10)
				{
					conn.rollback();
					out.println("<BR>[ʩ���ӣ�"+cf.GB2Uni(sgdmc[i])+"]���󣡡���ϼ��ɵ÷֡�ֻ��λ��0��10֮��");
					return;
				}
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[ʩ���ӣ�"+cf.GB2Uni(sgdmc[i])+"]���󣡡���ϼ��ɵ÷֡����벻��ȷ:"+phjcdfstr[i]);
				return;
			}
		}

		if (!tsgxdfstr[i].trim().equals(""))
		{
			try{
				tsgxdf=Integer.parseInt(tsgxdfstr[i].trim());

				if (tsgxdf<0 || tsgxdf>10)
				{
					conn.rollback();
					out.println("<BR>[ʩ���ӣ�"+cf.GB2Uni(sgdmc[i])+"]���󣡡����⹱�׵÷֡�ֻ��λ��0��10֮��");
					return;
				}
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[ʩ���ӣ�"+cf.GB2Uni(sgdmc[i])+"]���󣡡����⹱�׵÷֡����벻��ȷ:"+tsgxdfstr[i]);
				return;
			}
		}
		
		
		sql=" update kp_pdkprgdf set gcjxje=?,gcjxdf=?,gcjxlrr=?,gcjxlrsj=SYSDATE,phjcdf=?,phjclrr=?,phjclrsj=SYSDATE,tsgxdf=?,tsgxlrr=?,tsgxlrsj=SYSDATE,kpbz='Y' ";
		sql+=" where sgd='"+sgd[i]+"' and kpjlh='"+kpjlh+"' ";
		ps= conn.prepareStatement(sql);
		ps.setDouble(1,gcjxje);
		ps.setInt(2,gcjxdf);
		ps.setString(3,yhmc);
		ps.setInt(4,phjcdf);
		ps.setString(5,yhmc);
		ps.setInt(6,tsgxdf);
		ps.setString(7,yhmc);
		ps.executeUpdate();
		ps.close();

	}

	String getsgd=null;
	String getsgdmc=null;
	String kpbz=null;
	int mark=0;
	sql=" select kp_pdkprgdf.sgd,sgdmc,kpbz ";
	sql+=" from kp_pdkprgdf,sq_sgd  ";
	sql+=" where kp_pdkprgdf.sgd=sq_sgd.sgd(+) and kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kpbz=cf.fillNull(rs.getString("kpbz"));
		getsgd=cf.fillNull(rs.getString("sgd"));
		getsgdmc=cf.fillNull(rs.getString("sgdmc"));

		if (!kpbz.equals("Y"))
		{
			out.println("<BR>����ʩ���ӡ�"+getsgd+":"+getsgdmc+"��δ¼���˹���������");
			mark++;
		}
	}
	rs.close();
	ps.close();

	if (mark>0)
	{
		conn.rollback();
		out.println("<P>����ʧ�ܣ�");
		return;
	}

	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("���̳ɹ�!!!");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              

