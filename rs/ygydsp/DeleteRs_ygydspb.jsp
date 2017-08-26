<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] bdxh = request.getParameterValues("bdxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<bdxh.length ;i++ )
	{
		String getclzt=null;
		String getbdxz=null;
		String getbdqsfzszg=null;
		String getbdhsfzszg=null;
		String getdwbh=null;
		String getzwbm=null;
		double getbdqgwgz=0;
		double getbdqjbgz=0;
		double getbdqkhgz=0;
		double getbdqbuzhu=0;
		double getbdqjtbt=0;
		double getbdqcb=0;
		double getbdqdhbt=0;
		String ybdxh=null;
		String ygbh=null;
		ls_sql="select clzt,bdxz,bdqsfzszg,bdhsfzszg,dwbh,zwbm,bdqgwgz,bdqjbgz,bdqkhgz,bdqbuzhu,bdqjtbt,bdqcb,bdqdhbt,ybdxh,ygbh";
		ls_sql+=" from  rs_ygbdsqb";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getclzt=cf.fillNull(rs.getString("clzt"));
			getbdxz=cf.fillNull(rs.getString("bdxz"));
			getbdqsfzszg=cf.fillNull(rs.getString("bdqsfzszg"));
			getbdhsfzszg=cf.fillNull(rs.getString("bdhsfzszg"));
			getdwbh=cf.fillNull(rs.getString("dwbh"));
			getzwbm=cf.fillNull(rs.getString("zwbm"));
			getbdqgwgz=rs.getDouble("bdqgwgz");
			getbdqjbgz=rs.getDouble("bdqjbgz");
			getbdqkhgz=rs.getDouble("bdqkhgz");
			getbdqbuzhu=rs.getDouble("bdqbuzhu");
			getbdqjtbt=rs.getDouble("bdqjtbt");
			getbdqcb=rs.getDouble("bdqcb");
			getbdqdhbt=rs.getDouble("bdqdhbt");
			ybdxh=cf.fillNull(rs.getString("ybdxh"));
			ygbh=cf.fillNull(rs.getString("ygbh"));
		}
		else{
			conn.rollback();
			out.println("���󣡱䶯��š�"+bdxh[i]+"��������");
			return;
		}
		rs.close();
		ps.close();

		if (!getclzt.equals("00") && !getclzt.equals("01"))//01���ȴ�����
		{
			conn.rollback();
			out.println("���󣡴���״̬����ȷ");
			return;
		}

		String mqsfzszg="";
		String mqbdxh="";
		ls_sql="select sfzszg,bdxh";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mqsfzszg=cf.fillNull(rs.getString(1));
			mqbdxh=cf.fillNull(rs.getString(2));
		}
		rs.close();
		ps.close();

		if (!mqsfzszg.equals(getbdhsfzszg))
		{
			conn.rollback();
			out.println("���󣡡�Ա��״̬���Ѹı�");
			return;
		}
		if (!mqbdxh.equals(bdxh[i]))
		{
			out.println("����ֻ��ɾ�����µı䶯��¼��"+mqbdxh+"��");
			return;
		}

		String gzbm=null;
		ls_sql="select gzbm";
		ls_sql+=" from  dm_xzzwbm";
		ls_sql+=" where xzzwmc='"+getzwbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gzbm=rs.getString(1);
		}
		rs.close();
		ps.close();
		if (gzbm==null)
		{
			conn.rollback();
			out.println("���󣡹��ֲ����ڣ�"+ls_sql);
			return;
		}

		String ssfgs=null;
		ls_sql="select ssfgs";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ssfgs=rs.getString("ssfgs");
		}
		rs.close();
		ps.close();
		if (ssfgs==null)
		{
			conn.rollback();
			out.println("����ʧ�ܣ��ޡ������ֹ�˾��");
			return;
		}
		//��ԭ
		if (getclzt.equals("00"))//00������������01���ȴ�������02������������03������ͨ����04������ȡ��
		{
			ls_sql="update sq_yhxx set dwbh=?,xzzwbm=?,zwbm=?,ssfgs=?,bdxh=? ";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,getdwbh);
			ps.setString(2,getzwbm);
			ps.setString(3,gzbm);
			ps.setString(4,ssfgs);
			ps.setString(5,ybdxh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update rs_ygjbgzb set gwgz=?,jbgz=?,khgz=?,buzhu=?,jtbt=?,cb=?,dhbt=?";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,getbdqgwgz);
			ps.setDouble(2,getbdqjbgz);
			ps.setDouble(3,getbdqkhgz);
			ps.setDouble(4,getbdqbuzhu);
			ps.setDouble(5,getbdqjtbt);
			ps.setDouble(6,getbdqcb);
			ps.setDouble(7,getbdqdhbt);
			ps.executeUpdate();
			ps.close();


			if (getbdxz.equals("01"))//01:ת����02:��н��03:��ְ��04:��ְ��05:��ְ��06:������07:������08:������99:����
			{
				ls_sql="update sq_yhxx set zzxh=null,zzrq=null,zzpzbm=null,sfzszg=?";
				ls_sql+=" where ygbh='"+ygbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,getbdqsfzszg);
				ps.executeUpdate();
				ps.close();
			}
		}

		ls_sql="delete from rs_ygbdsplc";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from rs_bdsh";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from rs_ygbdsqb";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
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