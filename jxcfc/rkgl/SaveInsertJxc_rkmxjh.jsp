<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ls=null;
String rkph=null;
String clbm=null;
rkph=cf.GB2Uni(request.getParameter("rkph"));
String fhjlh=cf.GB2Uni(request.getParameter("fhjlh"));
int rkxh=0;
int nu=0;
double cbj=0;
double xsj=0;
double rksl=0;
double rkj=0;
int cgrksl=0;
double fhsj=0;
String sfxsh=null;
String clbmppmc=null;
String rkdppmc=null;
String gysmc=null;
String ygysmc=null;
String scph=null;
java.sql.Date scrq=null;
String[] clbmjh =request.getParameterValues("clbm");
String[] cbjjh =request.getParameterValues("cbj");
String[] rksljh =request.getParameterValues("rksl");
String[] fhsjjh =request.getParameterValues("fhsj");
String[] scrqjh =request.getParameterValues("scrq");
String[] scphjh =request.getParameterValues("scph");
String dqbm=null;
String sfycsh="N";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//��ѯ��Ӧ������,��������
	ls_sql="select gysmc,dqbm ";
	ls_sql+=" from  jxc_rkd";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	//��ѯ������Ʒ����
	ls_sql="select max(rkxh) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();


	//��������
	for (int i=0;i<clbmjh.length ;i++ )
	{
		nu=i+1;
		rkxh++;

		clbm=clbmjh[i];
		clbm=cf.addZero(clbm,13);

		if (clbm!=null && !(clbm.equals("")))
		{
			//��������
			scph=cf.GB2Uni(scphjh[i]);
			if (scph==null || scph.equals(""))
			{
				conn.rollback();
				out.print("<font clolr='red'>�ڡ�"+nu+"���С�"+clbm+"���������Ų���Ϊ�գ�</font><br>");
				return;
			}

			//��������
			ls=scrqjh[i];
			try{
				if (!(ls.equals(""))) 
				{
					scrq=java.sql.Date.valueOf(ls.trim());
				}
				else
				{
					conn.rollback();
					out.print("<font clolr='red'>�ڡ�"+nu+"���С�"+clbm+"���������ڲ���Ϊ�գ�</font><br>");
					return;
				}
			}
			catch (java.lang.NullPointerException nulle){
				conn.rollback();
				out.println("<BR>����scrq������");
				return;
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[��������]����ת����������:"+e);
				return;
			}

			//�������
			ls=rksljh[i];
			try{
				if (!(ls.equals("")))  
				{
					rksl=Double.parseDouble(ls.trim());
				}
				else
				{
					conn.rollback();
					out.print("<font clolr='red'>�ڡ�"+nu+"���С�"+clbm+"�������������Ϊ�գ�</font><br>");
					return;
				}
			}
			catch (java.lang.NullPointerException nulle)
			{
				conn.rollback();
				out.println("<BR>����rksl������");
				return;
			}
			catch (Exception e)
			{
				conn.rollback();
				out.println("<BR>[�������]����ת����������:"+e);
				return;
			}

			//��ѯ���ϳɱ���
			ls_sql=" select cbj ";
			ls_sql+=" from jxc_cljgb ";
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				sfycsh="Y";
				rkj=rs.getDouble("cbj");
			}
			else
			{
				conn.rollback();
				sfycsh="N";
				out.print("<font color=\"red\">���󣺲��ϡ�"+clbm+"���ڼ۸����û���ҵ���Ӧ�ĳɱ��ۣ�</font><br>");
				return;

			}
			rs.close();
			ps.close();

			if (rkj<=0)
			{
				out.print("<font color=red>��ʾ������["+clbm+"]û��¼��ɱ���!���۽�Ϊ�㣡</font><br>");
			}

			//�����ϱ����Ƿ����	
			ls_sql=" select clbm,ppmc ";
			ls_sql+=" from jxc_clbm ";
			ls_sql+=" where clbm='"+clbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			int count=0;
			if (rs.next())
			{
				sfycsh="Y";
				clbmppmc=cf.fillNull(rs.getString("ppmc"));
			}
			else
			{
				conn.rollback();
				sfycsh="N";
				out.print("<font color=\"red\">���󣺲��ϡ�"+clbm+"�������ڣ�����¼�룡</font><br>");
				return;

			}
			rs.close();
			ps.close();

			//�����ϱ����е���Ʒ�������Ƿ�����ⵥ��Ʒ������һ��
			if (gysmc!=null && gysmc.equals("����"))
			{
				sfycsh="Y";
			}
			else
			{
				ls_sql=" select ppmc ";
				ls_sql+=" from jxc_ppgysdzb ";
				ls_sql+=" where ppmc='"+clbmppmc+"' and gysmc='"+gysmc+"' ";
				ps= conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if (rs.next())
				{
					sfycsh="Y";
				}
				else
				{
					conn.rollback();
					sfycsh="N";
					out.print("<font color=\"red\">���ϡ�"+clbm+"��������Ʒ��["+clbmppmc+"]�빩Ӧ��["+gysmc+"]�޶�Ӧ��ϵ��<br>���鹩Ӧ���Ƿ���ȷ��������û������Ʒ�ƹ�Ӧ�̶��ձ����潫��Ʒ����ù�Ӧ�̹�����</font><br>");
					return;

				}
				rs.close();
				ps.close();
			}

			if (sfycsh.equals("Y"))
			{
				//д�������ϸ
				ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm,cbj,rksl,rkj,zcpsl,ccpsl,thpsl,bfpsl,scrq,scph,ccpzkl ) ";
				ls_sql+=" values ( ?,?,?,?,?,?,0,0,0,0,?,?,1 ) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,rkph);
				ps.setLong(2,rkxh);
				ps.setString(3,clbm);
				ps.setDouble(4,cbj);
				ps.setDouble(5,rksl);
				ps.setDouble(6,rkj);
				ps.setDate(7,scrq);
				ps.setString(8,scph);
				ps.executeUpdate();
				ps.close();

				cgrksl++;

				//�޸Ĺ�Ӧ�̷���
				ls_sql="update jxc_gysfhjl set sfrk='Y',rkph='"+rkph+"' ";
				ls_sql+=" where  fhjlh='"+fhjlh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				//�޸���ⵥ�ķ�����¼��
				ls_sql="update jxc_rkd set fhjlh='"+fhjlh+"' ";
				ls_sql+=" where  rkph='"+rkph+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

			sfycsh="N";
		}
		else
		{
			out.print("<font clolr='red'>�ڡ�"+nu+"���в��ϱ���Ϊ�գ�</font><br>");
		}
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���<%=cgrksl%>����������⣡");
	window.close();
	//-->
	</SCRIPT>
	<center><DIV><font color="blue">��ⵥ����ɹ������ύ��ⵥ��</font></DIV></center>
	<center><DIV><font color="blue"><a href="tjrkd.jsp?rkph=<%=rkph%>">�ύ��ⵥ</a></font></DIV></center>
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>