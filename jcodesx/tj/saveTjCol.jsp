<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	Connection conn  = null;
	PreparedStatement ps1=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
		
	String dw_name=request.getParameter("dw_name");
	String[] column_id=request.getParameterValues("column_id");
	String[] zb=request.getParameterValues("zb");
	String[] coltype=request.getParameterValues("coltype");
	String[] groupbyxh=request.getParameterValues("groupbyxh");
	String[] issum=request.getParameterValues("issum");
	String[] isgroupby=request.getParameterValues("isgroupby");
	String[] isgroupbywhere=request.getParameterValues("isgroupbywhere");
	String[] istjmutil=request.getParameterValues("istjmutil");
	String[] istjmultiple=request.getParameterValues("istjmultiple");
	
	if (isgroupby==null)
	{
		out.println("����������ʧ�ܣ���ѡ��ͳ����");
		return;
	}
	if (issum==null)
	{
		out.println("����������ʧ�ܣ���ѡ��������");
		return;
	}

	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		ls_sql="update jdatawindow set issum='N',isgroupby='N',isgroupbywhere='N',istjmutil='N',coltype=null,groupbyxh=null,zb=null,istjmultiple=null ";
		ls_sql+="  where  dw_name='"+dw_name+"'";
		ps = conn.prepareStatement(ls_sql);
		ps.executeUpdate(ls_sql);
		ps.close();
		

		for (int i=0;i<issum.length ;i++ )
		{
			ls_sql="update jdatawindow set issum='Y' ";
			ls_sql+="where dw_name='"+dw_name+"' and column_id="+issum[i];
			ps = conn.prepareStatement(ls_sql);
			ps.executeUpdate(ls_sql);
			ps.close();
		}		
		for (int i=0;i<isgroupby.length ;i++ )
		{
			ls_sql="update jdatawindow set isgroupby='Y' ";
			ls_sql+="where dw_name='"+dw_name+"' and column_id="+isgroupby[i];
			ps = conn.prepareStatement(ls_sql);
			ps.executeUpdate(ls_sql);
			ps.close();
		}		
		if (isgroupbywhere!=null)
		{
			for (int i=0;i<isgroupbywhere.length ;i++ )
			{
				ls_sql="update jdatawindow set isgroupbywhere='Y' ";
				ls_sql+="where dw_name='"+dw_name+"' and column_id="+isgroupbywhere[i];
				ps = conn.prepareStatement(ls_sql);
				ps.executeUpdate(ls_sql);
				ps.close();
			}		
		}
		if (istjmutil!=null)
		{
			for (int i=0;i<istjmutil.length ;i++ )
			{
				ls_sql="update jdatawindow set istjmutil='Y' ";
				ls_sql+="where dw_name='"+dw_name+"' and column_id="+istjmutil[i];
				ps = conn.prepareStatement(ls_sql);
				ps.executeUpdate(ls_sql);
				ps.close();
			}		
		}
		if (istjmultiple!=null)
		{
			for (int i=0;i<istjmultiple.length ;i++ )
			{
				ls_sql="update jdatawindow set istjmultiple='Y' ";
				ls_sql+="where dw_name='"+dw_name+"' and column_id="+istjmultiple[i];
				ps = conn.prepareStatement(ls_sql);
				ps.executeUpdate(ls_sql);
				ps.close();
			}		
		}
		//����:ͳ������š�������
		String lsissum=null;
		String lsisgroupby=null;
		String lscolumn_id=null;
		String lscolumn_name=null;
		String lsdata_type=null;
		String lszb=null;

		for (int i=0;i<column_id.length ;i++ )
		{
			ls_sql="select issum,isgroupby,column_china,data_type ";
			ls_sql+=" from  jdatawindow ";
			ls_sql+=" where dw_name='"+dw_name+"' and column_id="+column_id[i];
			ps = conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				lsissum=rs.getString("issum");
				lsisgroupby=rs.getString("isgroupby");
				lscolumn_name=rs.getString("column_china");
				lsdata_type=rs.getString("data_type");

				if (lsisgroupby.equals("Y")&&lsissum.equals("Y"))
				{
					conn.rollback();
					out.println("������["+lscolumn_name+"]���ܼ�ѡ[ͳ����]����ѡ[������]");
					return;
				}
				if (lsisgroupby.equals("Y"))
				{
					if (coltype[i].equals(""))//δѡ
					{
						coltype[i]="3";
					}
					else if (coltype[i].equals("2"))
					{
						coltype[i]="3";
						out.println("<BR>��ʾ��ͳ����["+lscolumn_name+"]��������ѡ����[��ֵ��]��ϵͳ�Զ��������޸�!");
					}
					if (groupbyxh[i].equals(""))//δѡ
					{
						groupbyxh[i]=String.valueOf(i+1);
					}
					zb[i]="0";
				}
				else if (lsissum.equals("Y"))
				{
					if (!(lsdata_type.equals("DOUBLE")||lsdata_type.equals("INT")))
					{
						conn.rollback();
						out.println("������["+lscolumn_name+"]����ֵ���ͣ�����ѡ[������]");
						return;
					}
					if (!coltype[i].equals("2"))
					{
						coltype[i]="2";
						out.println("<BR>��ʾ����ֵ��["+lscolumn_name+"]��������ѡ����[����ֵ��]��ϵͳ�Զ��������޸�!");
					}
					if (groupbyxh[i].equals(""))//δѡ
					{
						groupbyxh[i]=String.valueOf(i+1);
					}
					if (zb[i].equals(""))
					{
						zb[i]="1";
						out.println("<BR>��ʾ����ֵ��["+lscolumn_name+"]δѡ����ߣ�ϵͳ�Զ���Ϊ1!");
					}
				}
				if (lsisgroupby.equals("Y")||lsissum.equals("Y"))
				{
					ls_sql=" update  jdatawindow ";
					ls_sql+=" set coltype='"+coltype[i]+"',groupbyxh="+groupbyxh[i]+",zb='"+zb[i]+"'";
					ls_sql+=" where dw_name='"+dw_name+"' and column_id="+column_id[i];
					ps1 = conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
			} 

			rs.close();
			ps.close();
		}		



		conn.commit();
		out.println("<BR>���̳ɹ�!");

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
			if (ps1 != null) ps1.close(); 
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%>
</body>
</html>

