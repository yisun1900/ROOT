<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String cldlbm=request.getParameter("cldlbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xhgg=request.getParameterValues("xhgg");
String[] wlbm=request.getParameterValues("wlbm");
String[] jswlbm=request.getParameterValues("jswlbm");
String[] wljsbz=request.getParameterValues("wljsbz");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


double dj=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

    
	for (int i=0;i<wlbm.length ;i++ )
	{
		int count=0;
		if (wlbm[i].equals(""))
		{
			continue;
		}
		//[��������]�Ƿ�Ϊ��
		if (glmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[��������]Ϊ��");
			return;
		}
		//[������λ]�Ƿ�Ϊ��
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[������λ]Ϊ��");
			return;
		}
		
		//[����]�Ƿ�Ϊ��
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[����]Ϊ��");
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[����]���벻��ȷ:"+djstr[i].trim());
			return;
		}
		
    
        ls_sql="select count(*)";
	    ls_sql+=" from  bj_jzcljgb";
	    ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   count=rs.getInt(1);
	    }
	    rs.close();
	    ps.close();
	    if (count>0)
	    {
			conn.rollback();
			out.println("����[�������ϱ���]�ظ�,�������ظ�¼�롣�������ϱ��룺"+cf.GB2Uni(wlbm[i]));
			return;
	    }

		String jsjldwbm="";
        if (!jswlbm[i].equals(""))
        {
 			ls_sql="select count(*)";
			ls_sql+=" from  bj_jscljgb";
			ls_sql+=" where dqbm='"+dqbm+"' AND cldlbm='"+cldlbm+"' AND wlbm='"+cf.GB2Uni(jswlbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
			   count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count<1)
			{
				conn.rollback();
				out.println("���󣡲����ڵ�[������ϱ���]��"+cf.GB2Uni(jswlbm[i]));
				return;
			}
	  
			
			ls_sql="select jldwbm";
			ls_sql+=" from  bj_jscljgb";
			ls_sql+=" where  dqbm='"+dqbm+"' and wlbm='"+jswlbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				jsjldwbm=cf.fillNull(rs.getString("jldwbm"));
			}
			rs.close();
			ps.close();

			//[����/���������λ��ֵ]�Ƿ�Ϊ��
			if (wljsbz[i].equals(""))
			{
				conn.rollback();
				out.println("����[������ϱ���]"+cf.GB2Uni(jswlbm[i])+"��[����/���������λ��ֵ]����Ϊ��");
				return;
			}
			if (wljsbz[i].equals("0") || wljsbz[i].equals("0.0"))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ�[������ϱ���]"+cf.GB2Uni(jswlbm[i])+"��[����/���������λ��ֵ]����Ϊ0");
				return;
			}
       }
	   else{
		   wljsbz[i]="";
	   }

		//���ϼ۸���Ϣ��
		ls_sql="insert into bj_jzcljgb(dqbm,cldlbm,glmc,pp,xhgg,jldwbm,dj,lrr,lrsj,wlbm,jswlbm,jsjldwbm,wljsbz,qrbz)";
		ls_sql+=" values('"+dqbm+"','"+cldlbm+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+cf.GB2Uni(wlbm[i])+"','"+cf.GB2Uni(jswlbm[i])+"','"+jsjldwbm+"','"+wljsbz[i]+"','N')";
		ps= conn.prepareStatement(ls_sql);
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
	return;
}
finally 
{
	conn.setAutoCommit(true);
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