<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String[] mgfrz=request.getParameterValues("mgfrz");
String[] nwgfrz=request.getParameterValues("nwgfrz");
String[] sdgfrz=request.getParameterValues("sdgfrz");
String[] yqgfrz=request.getParameterValues("yqgfrz");
String[] zgfrz=request.getParameterValues("zgfrz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String mgfrzs="";
	String nwgfrzs="";
	String sdgfrzs="";
	String yqgfrzs="";
	String zgfrzs="";

	
	conn.setAutoCommit(false);

	ls_sql=" update crm_grxx set zt='0'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//1��ľ�� 2�����߹� 3��ˮ�繤 4�����Ṥ
	if(mgfrz!=null)
	{
		for(int i=0; i<mgfrz.length ;i++)
		{
			if (!cf.GB2Uni(mgfrz[i]).equals(""))
			{
				String zp="";
				String yhk="";
				ls_sql="select zp,yhk";
				ls_sql+=" from  sq_grxxb";
				ls_sql+=" where xm='"+cf.GB2Uni(mgfrz[i])+"' and gz='ľ��'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zp=cf.fillNull(rs.getString("zp"));
					yhk=cf.fillNull(rs.getString("yhk"));
				}
				rs.close();
				ps.close();

				if (zp.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(mgfrz[i])+"������Ƭ");
					return;
				}
				if (yhk.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(mgfrz[i])+"�������п���");
					return;
				}

				
				int count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_grxx";
				ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(mgfrz[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm,pdr,pdsj,zt) ";
					ls_sql+=" values (?,'ľ��',?,'"+yhmc+"',SYSDATE,'1') ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.setString(2,cf.GB2Uni(mgfrz[i]));
					ps.executeUpdate();
					ps.close();
				}
				else if (count==1)
				{
					ls_sql=" update crm_grxx set zt='1'";
					ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(mgfrz[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}


				mgfrzs+="��"+cf.GB2Uni(mgfrz[i]);
			}
			
		}
	}
	
	if(nwgfrz!=null)
	{
		for(int i=0; i<nwgfrz.length ;i++)
		{
			if (!cf.GB2Uni(nwgfrz[i]).equals(""))
			{
				String zp="";
				String yhk="";
				ls_sql="select zp,yhk";
				ls_sql+=" from  sq_grxxb";
				ls_sql+=" where xm='"+cf.GB2Uni(nwgfrz[i])+"' and gz='�߹�'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zp=cf.fillNull(rs.getString("zp"));
					yhk=cf.fillNull(rs.getString("yhk"));
				}
				rs.close();
				ps.close();

				if (zp.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(nwgfrz[i])+"������Ƭ");
					return;
				}
				if (yhk.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(nwgfrz[i])+"�������п���");
					return;
				}

				int count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_grxx";
				ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(nwgfrz[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm,pdr,pdsj,zt) ";
					ls_sql+=" values (?,'���߹�',?,'"+yhmc+"',SYSDATE,'1') ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.setString(2,cf.GB2Uni(nwgfrz[i]));
					ps.executeUpdate();
					ps.close();

				}
				else if (count==1)
				{
					ls_sql=" update crm_grxx set zt='1'";
					ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(nwgfrz[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}

				nwgfrzs+="��"+cf.GB2Uni(nwgfrz[i]);
			}
		}
	}

	if(sdgfrz!=null)
	{
		for(int i=0; i<sdgfrz.length ;i++)
		{
			if (!cf.GB2Uni(sdgfrz[i]).equals(""))
			{
				String zp="";
				String yhk="";
				ls_sql="select zp,yhk";
				ls_sql+=" from  sq_grxxb";
				ls_sql+=" where xm='"+cf.GB2Uni(sdgfrz[i])+"' and gz='ˮ�繤'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zp=cf.fillNull(rs.getString("zp"));
					yhk=cf.fillNull(rs.getString("yhk"));
				}
				rs.close();
				ps.close();

				if (zp.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(sdgfrz[i])+"������Ƭ");
					return;
				}
				if (yhk.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(sdgfrz[i])+"�������п���");
					return;
				}

				int count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_grxx";
				ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(sdgfrz[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm,pdr,pdsj,zt) ";
					ls_sql+=" values (?,'ˮ�繤',?,'"+yhmc+"',SYSDATE,'1') ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.setString(2,cf.GB2Uni(sdgfrz[i]));
					ps.executeUpdate();
					ps.close();
				}
				else if (count==1)
				{
					ls_sql=" update crm_grxx set zt='1'";
					ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(sdgfrz[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}

				sdgfrzs+="��"+cf.GB2Uni(sdgfrz[i]);
			}
		}
	}

	if(yqgfrz!=null)
	{
		for(int i=0; i<yqgfrz.length ;i++)
		{
			if (!cf.GB2Uni(yqgfrz[i]).equals(""))
			{
				String zp="";
				String yhk="";
				ls_sql="select zp,yhk";
				ls_sql+=" from  sq_grxxb";
				ls_sql+=" where xm='"+cf.GB2Uni(yqgfrz[i])+"' and gz='���Ṥ'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zp=cf.fillNull(rs.getString("zp"));
					yhk=cf.fillNull(rs.getString("yhk"));
				}
				rs.close();
				ps.close();

				if (zp.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(yqgfrz[i])+"������Ƭ");
					return;
				}
				if (yhk.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(yqgfrz[i])+"�������п���");
					return;
				}

				int count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_grxx";
				ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(yqgfrz[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm,pdr,pdsj,zt) ";
					ls_sql+=" values (?,'���Ṥ',?,'"+yhmc+"',SYSDATE,'1') ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.setString(2,cf.GB2Uni(yqgfrz[i]));
					ps.executeUpdate();
					ps.close();
				}
				else if (count==1)
				{
					ls_sql=" update crm_grxx set zt='1'";
					ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(yqgfrz[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}

				yqgfrzs+="��"+cf.GB2Uni(yqgfrz[i]);
			}
		}
	}


	if(zgfrz!=null)
	{
		for(int i=0; i<zgfrz.length ;i++)
		{
			if (!cf.GB2Uni(zgfrz[i]).equals(""))
			{
				String zp="";
				String yhk="";
				ls_sql="select zp,yhk";
				ls_sql+=" from  sq_grxxb";
				ls_sql+=" where xm='"+cf.GB2Uni(zgfrz[i])+"' and gz='�ӹ�'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zp=cf.fillNull(rs.getString("zp"));
					yhk=cf.fillNull(rs.getString("yhk"));
				}
				rs.close();
				ps.close();

				if (zp.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(zgfrz[i])+"������Ƭ");
					return;
				}

				if (yhk.equals(""))
				{
					conn.rollback();
					out.println("���󣡡�"+cf.GB2Uni(zgfrz[i])+"�������п���");
					return;
				}

				int count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_grxx";
				ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(zgfrz[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					count=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (count==0)
				{
					ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm,pdr,pdsj,zt) ";
					ls_sql+=" values (?,'�ӹ�',?,'"+yhmc+"',SYSDATE,'1') ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.setString(2,cf.GB2Uni(zgfrz[i]));
					ps.executeUpdate();
					ps.close();
				}
				else if (count==1)
				{
					ls_sql=" update crm_grxx set zt='1'";
					ls_sql+=" where khbh='"+khbh+"' and grxm='"+cf.GB2Uni(zgfrz[i])+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}

				zgfrzs+="��"+cf.GB2Uni(zgfrz[i]);
			}
		}
	}



	ls_sql=" delete from crm_grxx  ";
	ls_sql+=" where khbh='"+khbh+"' and zt='0'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	
	int grsl=0;
	if (!mgfrzs.equals(""))
	{
		grsl++;
		mgfrzs=mgfrzs.substring(1);
	}
	if (!nwgfrzs.equals(""))
	{
		grsl++;
		nwgfrzs=nwgfrzs.substring(1);
	}
	if (!sdgfrzs.equals(""))
	{
		grsl++;
		sdgfrzs=sdgfrzs.substring(1);
	}
	if (!yqgfrzs.equals(""))
	{
		grsl++;
		yqgfrzs=yqgfrzs.substring(1);
	}
	if (!zgfrzs.equals(""))
	{
		grsl++;
		zgfrzs=zgfrzs.substring(1);
	}

	String pgrbz="";//1��δ�ɣ�2���ɹ�����ɣ�3�������ɣ�4���ɲ��ֹ��ˣ�5���������
	if (grsl>=5)
	{
		pgrbz="2";
	}
	else if (grsl<=0)
	{
		pgrbz="1";
	}
	else{
		pgrbz="4";
	}

	String pgrshbz="";//1��δ��ˣ�2�����
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_grxx";
	ls_sql+=" where khbh='"+khbh+"' and shsj is null";
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
		pgrshbz="1";
	}
	else {
		pgrshbz="2";
	}
	
	ls_sql="update crm_khxx set mgfrz=?,nwgfrz=?,sdgfrz=?,yqgfrz=?,zgfrz=?,pgrbz=?,pgrshbz=?,pgrsj=SYSDATE ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mgfrzs);
	ps.setString(2,nwgfrzs);
	ps.setString(3,sdgfrzs);
	ps.setString(4,yqgfrzs);
	ps.setString(5,zgfrzs);
	ps.setString(6,pgrbz);
	ps.setString(7,pgrshbz);
	ps.executeUpdate();
	ps.close();
	

	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ɵ��ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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