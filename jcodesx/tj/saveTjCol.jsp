<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>请输入查询条件</title>
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
		out.println("！！！存盘失败，请选择统计列");
		return;
	}
	if (issum==null)
	{
		out.println("！！！存盘失败，请选择数据列");
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
		//处理:统计列序号、列属性
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
					out.println("错误！列["+lscolumn_name+"]不能即选[统计列]，又选[数据列]");
					return;
				}
				if (lsisgroupby.equals("Y"))
				{
					if (coltype[i].equals(""))//未选
					{
						coltype[i]="3";
					}
					else if (coltype[i].equals("2"))
					{
						coltype[i]="3";
						out.println("<BR>提示！统计列["+lscolumn_name+"]的列属性选择了[数值列]，系统自动进行了修改!");
					}
					if (groupbyxh[i].equals(""))//未选
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
						out.println("错误！列["+lscolumn_name+"]非数值类型，不能选[数据列]");
						return;
					}
					if (!coltype[i].equals("2"))
					{
						coltype[i]="2";
						out.println("<BR>提示！数值列["+lscolumn_name+"]的列属性选择了[非数值列]，系统自动进行了修改!");
					}
					if (groupbyxh[i].equals(""))//未选
					{
						groupbyxh[i]=String.valueOf(i+1);
					}
					if (zb[i].equals(""))
					{
						zb[i]="1";
						out.println("<BR>提示！数值列["+lscolumn_name+"]未选坐标尺，系统自动设为1!");
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
		out.println("<BR>存盘成功!");

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
			out.println("关闭连接发生以外,Exception:"+e.getMessage());
		}
	}
%>
</body>
</html>

