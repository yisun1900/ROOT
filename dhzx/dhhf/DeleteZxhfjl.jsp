<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlh = request.getParameterValues("hfjlh");
if (hfjlh.length>1)
{
	out.println("����ÿ��ֻ��ɾ��һ����¼");
	return;
}

String newkhbh=null;
String newhfjg=null;
String newsfghdm=null;
String newzxdm=null;
String newyhjs=null;
String newsfjxhf=null;
String newxchfrq=null;

String yhjs=null;


java.sql.Date yzxhfsj=null;
String yhfjlh=null;
String ysfxhf=null;
java.sql.Date yhfrq=null;
String yzxdm=null;
String yzxzt=null;
String ysjs=null;

String ylfbz=null;
java.sql.Date ylfsj=null;
String yctbz=null;
java.sql.Date yctsj=null;

String nowzxhfsj=null;
String nowhfjlh=null;
String nowsfxhf=null;
String nowhfrq=null;
String nowzxdm=null;
String nowzxzt=null;
String nowsjs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,hfjg,sfghdm,zxdm,sfjxhf,xchfrq,ysfxhf,yhfrq,yzxhfsj,yhfjlh,yzxdm,yzxzt,ysjs,yhjs,ylfbz,ylfsj,yctbz,yctsj";
	ls_sql+=" from  crm_zxhfjl";
	ls_sql+=" where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newkhbh=rs.getString("khbh");
		newhfjg=rs.getString("hfjg");
		newsfghdm=rs.getString("sfghdm");
		newzxdm=cf.fillNull(rs.getString("zxdm"));
		newsfjxhf=cf.fillNull(rs.getString("sfjxhf"));
		newxchfrq=cf.fillNull(rs.getDate("xchfrq"));

		ysfxhf=rs.getString("ysfxhf");
		yhfrq=rs.getDate("yhfrq");
		yzxhfsj=rs.getDate("yzxhfsj");
		yhfjlh=rs.getString("yhfjlh");
		yzxdm=rs.getString("yzxdm");
		yzxzt=rs.getString("yzxzt");
		ysjs=cf.fillNull(rs.getString("ysjs"));

		ylfbz=rs.getString("ylfbz");
		ylfsj=rs.getDate("ylfsj");
		yctbz=rs.getString("yctbz");
		yctsj=rs.getDate("yctsj");

		yhjs=rs.getString("yhjs");
	
	}
	else{
		out.println("���󣡲����ڵĻطü�¼��"+hfjlh[0]);
		return;
	}
	ps.close();
	rs.close();

	ls_sql="select sfxhf,hfrq,zxhfsj,hfjlh,zxdm,zxzt,sjs";
	ls_sql+=" from  crm_zxkhxx where khbh='"+newkhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nowsfxhf=rs.getString("sfxhf");
		nowhfrq=cf.fillNull(rs.getDate("hfrq"));
		nowzxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		nowhfjlh=cf.fillNull(rs.getString("hfjlh"));
		nowzxdm=cf.fillNull(rs.getString("zxdm"));
		nowzxzt=rs.getString("zxzt");
		nowsjs=cf.fillNull(rs.getString("sjs"));
	}
	else{
		out.println("���󣡲����ڵĿͻ����"+newkhbh);
		return;
	}
	ps.close();
	rs.close();

	if (!nowhfjlh.equals(hfjlh[0]))
	{
		out.println("����ֻ��ɾ�����µĻطü�¼��"+nowhfjlh);
		return;
	}


	conn.setAutoCommit(false);


	if (yhjs.equals("F2"))//F2������
	{
		if (newhfjg.equals("2"))//2����ǩԼ
		{
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("����[�Ƿ���ط�]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("����[Ӧ�ط�����]�Ѹı䣬�޸�ʧ��");
				return;
			}

			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("����[���ʦ]�Ѹı䣬�޸�ʧ�ܣ�Ŀǰ��"+nowsjs+"����ʱ��"+ysjs);
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("����[��ѯ����]�Ѹı䣬�޸�ʧ��");
				return;
			}

			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,zxzt=?,lfbz=?,lfsj=?,ctbz=?,ctsj=? ";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,yzxzt);
			ps.setString(6,ylfbz);
			ps.setDate(7,ylfsj);
			ps.setString(8,yctbz);
			ps.setDate(9,yctsj);
			ps.executeUpdate();
			ps.close();

		}
		else if (newhfjg.equals("3")){//3��ʧ��
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("����[�Ƿ���ط�]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("����[Ӧ�ط�����]�Ѹı䣬�޸�ʧ��");
				return;
			}
		
			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("����[���ʦ]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("����[��ѯ����]�Ѹı䣬�޸�ʧ��");
				return;
			}
			
			if (!nowzxzt.equals("2"))
			{
				conn.rollback();
				out.println("����[��ѯ״̬]�Ѹı䣬�޸�ʧ��");
				return;
			}

			
			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,sjs=?,zxdm=?,zxzt=?,lfbz=?,lfsj=?,ctbz=?,ctsj=? ";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,ysjs);
			ps.setString(6,yzxdm);
			ps.setString(7,yzxzt);
			ps.setString(8,ylfbz);
			ps.setDate(9,ylfsj);
			ps.setString(10,yctbz);
			ps.setDate(11,yctsj);
			ps.executeUpdate();
			ps.close();

		}
		else{//1����������
			if (!nowsfxhf.equals(newsfjxhf))
			{
				conn.rollback();
				out.println("����[�Ƿ���ط�]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowhfrq.equals(newxchfrq))
			{
				conn.rollback();
				out.println("����[Ӧ�ط�����]�Ѹı䣬�޸�ʧ��");
				return;
			}

			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("����[���ʦ]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("����[��ѯ����]�Ѹı䣬�޸�ʧ��");
				return;
			}

			
			if (!nowzxzt.equals(yzxzt))
			{
				conn.rollback();
				out.println("����[��ѯ״̬]�Ѹı䣬�޸�ʧ��");
				return;
			}

			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,ylfbz);
			ps.setDate(6,ylfsj);
			ps.setString(7,yctbz);
			ps.setDate(8,yctsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{//�ǵ���
		if (newhfjg.equals("2"))//2����ǩԼ
		{
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("����[�Ƿ���ط�]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("����[Ӧ�ط�����]�Ѹı䣬�޸�ʧ��");
				return;
			}

		
			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("����[���ʦ]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("����[��ѯ����]�Ѹı䣬�޸�ʧ��");
				return;
			}

		
			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,zxzt=?,lfbz=?,lfsj=?,ctbz=?,ctsj=? ";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,yzxzt);
			ps.setString(6,ylfbz);
			ps.setDate(7,ylfsj);
			ps.setString(8,yctbz);
			ps.setDate(9,yctsj);
			ps.executeUpdate();
			ps.close();
		}
		else if (newhfjg.equals("3")){//3��ʧ��
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("����[�Ƿ���ط�]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("����[Ӧ�ط�����]�Ѹı䣬�޸�ʧ��");
				return;
			}

		
			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("����[���ʦ]�Ѹı䣬�޸�ʧ��");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("����[��ѯ����]�Ѹı䣬�޸�ʧ��");
				return;
			}

		
			if (!nowzxzt.equals("4"))
			{
				conn.rollback();
				out.println("����[��ѯ״̬]�Ѹı䣬�޸�ʧ��");
				return;
			}

			
			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,zxzt=?, sbyybm=null,lfbz=?,lfsj=?,ctbz=?,ctsj=?";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,yzxzt);
			ps.setString(6,ylfbz);
			ps.setDate(7,ylfsj);
			ps.setString(8,yctbz);
			ps.setDate(9,yctsj);
			ps.executeUpdate();
			ps.close();

		}
		else{//1����������
			if (!nowsfxhf.equals(newsfjxhf))
			{
				conn.rollback();
				out.println("����[�Ƿ���ط�]�Ѹı䣬ɾ��ʧ��");
				return;
			}
			if (!nowhfrq.equals(newxchfrq))
			{
				conn.rollback();
				out.println("����[Ӧ�ط�����]�Ѹı䣬ɾ��ʧ�ܣ�����Ϊ"+newxchfrq+";ĿǰΪ"+nowhfrq+";");
				return;
			}

			if (newsfghdm.equals("Y"))//Y������
			{
				if (!nowsjs.equals(""))
				{
					conn.rollback();
					out.println("����[���ʦ]�Ѹı䣬ɾ��ʧ��");
					return;
				}
				if (!nowzxdm.equals(newzxdm))
				{
					conn.rollback();
					out.println("����[��ѯ����]�Ѹı䣬ɾ��ʧ��");
					return;
				}
				
				if (!nowzxzt.equals("5"))
				{
					conn.rollback();
					out.println("����[��ѯ״̬]�Ѹı䣬ɾ��ʧ��");
					return;
				}
			}
			else{//N��������
				if (!nowsjs.equals(ysjs))
				{
					conn.rollback();
					out.println("����[���ʦ]�Ѹı䣬ɾ��ʧ��");
					return;
				}
				if (!nowzxdm.equals(yzxdm))
				{
					conn.rollback();
					out.println("����[��ѯ����]�Ѹı䣬ɾ��ʧ��");
					return;
				}

				
				if (!nowzxzt.equals(yzxzt))
				{
					conn.rollback();
					out.println("����[��ѯ״̬]�Ѹı䣬ɾ��ʧ��");
					return;
				}
			}


			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,ylfbz);
			ps.setDate(6,ylfsj);
			ps.setString(7,yctbz);
			ps.setDate(8,yctsj);
			ps.executeUpdate();
			ps.close();

			if (newsfghdm.equals("Y"))//N����������Y������
			{
				ls_sql="update crm_zxkhxx set sjs=?,zxdm=?,zxzt=? where khbh='"+newkhbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ysjs);
				ps.setString(2,yzxdm);
				ps.setString(3,yzxzt);
				ps.executeUpdate();
				ps.close();
			}
		}
	}


	ls_sql="delete from crm_zxhfjl ";
	ls_sql+=" where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("����ʧ��,��������: " + e);
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