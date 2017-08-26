<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
int sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工地数量]类型转换发生意外:"+e);
	return;
}

String fgs=request.getParameter("fgs");
String sxjlh=request.getParameter("sxjlh");
String yhdlm=request.getParameter("yhdlm");
String cqbm=request.getParameter("cqbm");
String gcjd=request.getParameter("gcjd");

String khbh=null;
String sgd=null;
String zjxm=null;
String yhmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int xph=0;
	ls_sql=" select count(*)";
	ls_sql+=" from  kp_sxgdjl";
	ls_sql+=" where yhdlm='"+yhdlm+"' and sxjlh="+sxjlh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xph=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//开始新的批号
	if (xph==0)
	{
		ls_sql=" delete from  kp_sgdsxcs";
		ls_sql+=" where sxr='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from  kp_zjsxcs";
		ls_sql+=" where sxr='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	
	//删除离职信息
	ls_sql=" delete from  kp_sgdsxcs";
	ls_sql+=" where sxr='"+yhdlm+"' and sgd not in(select sgd from sq_sgd where ssfgs='"+fgs+"' and cxbz='N')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from  kp_zjsxcs";
	ls_sql+=" where sxr='"+yhdlm+"'";
	ls_sql+=" and zjxm not in(";
	ls_sql+=" select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where zwbm='05'";
	ls_sql+=" and  dwbh in(select dwbh from sq_dwxx where ssfgs='"+fgs+"'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//插入不再施工队
	ls_sql=" select sgd";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where ssfgs='"+fgs+"' and cxbz='N'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");

		int count=0;
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_sgdsxcs";
		ls_sql+=" where sxr='"+yhdlm+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			ls_sql="insert into kp_sgdsxcs ( sgd,sxr,sxcs,ygdbz ) ";
			ls_sql+=" values ( '"+sgd+"','"+yhdlm+"',0,'N') ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	rs1.close();
	ps1.close();

	//插入不再工程担当
	ls_sql=" select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where zwbm='05'";
	ls_sql+=" and  dwbh in(select dwbh from sq_dwxx where ssfgs='"+fgs+"')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		yhmc=rs1.getString("yhmc");

		int count=0;
		ls_sql=" select count(*)";
		ls_sql+=" from  kp_zjsxcs";
		ls_sql+=" where sxr='"+yhdlm+"' and zjxm='"+yhmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			ls_sql="insert into kp_zjsxcs ( zjxm,sxr,sxcs,ygdbz ) ";
			ls_sql+=" values ( '"+yhmc+"','"+yhdlm+"',0,'N') ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	rs1.close();
	ps1.close();

	//有工地标志
	ls_sql=" update  kp_sgdsxcs set ygdbz='Y'";
	ls_sql+=" where sxr='"+yhdlm+"' and sgd in(";
	ls_sql+=" select distinct sgd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where gcjdbm='2' and zt='2' and tgbz!='Y'";//44:木制品工艺检查
	ls_sql+=" and fgsbh='"+fgs+"'";
	if (gcjd.equals("Y"))
	{
		ls_sql+=" and zqysxmbm>'41' and zqysxmbm<'44'";//44:木制品工艺检查
	}
	if (!cqbm.equals(""))
	{
		ls_sql+=" and cqbm='"+cqbm+"'";
	}
	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update kp_zjsxcs set ygdbz='Y'";
	ls_sql+=" where sxr='"+yhdlm+"'";
	ls_sql+=" and zjxm in(";
	ls_sql+=" select distinct zjxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where gcjdbm='2' and zt='2' and tgbz!='Y'";//44:木制品工艺检查
	ls_sql+=" and fgsbh='"+fgs+"'";
	if (gcjd.equals("Y"))
	{
		ls_sql+=" and zqysxmbm>'41' and zqysxmbm<'44'";//44:木制品工艺检查
	}
	if (!cqbm.equals(""))
	{
		ls_sql+=" and cqbm='"+cqbm+"'";
	}
	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	int maxsgdsxcs=0;
	ls_sql=" select max(sxcs)";
	ls_sql+=" from  kp_sgdsxcs";
	ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxsgdsxcs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (maxsgdsxcs==0)
	{
		maxsgdsxcs=1;
	}


	int maxzjsxcs=0;

	ls_sql=" select max(sxcs)";
	ls_sql+=" from  kp_zjsxcs";
	ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxzjsxcs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (maxzjsxcs==0)
	{
		maxzjsxcs=1;
	}


	int row=0;

	int jsq=0;

	while (row<sl)
	{
		jsq++;

		if (jsq>6)
		{
			break;
		}


		int crow=0;

		ls_sql=" select khbh,sgd,zjxm";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where gcjdbm='2' and zt='2' and tgbz!='Y'";//44:木制品工艺检查
		ls_sql+=" and fgsbh='"+fgs+"'";
		
		ls_sql+=" and khbh not in(";
		ls_sql+=" select khbh";
		ls_sql+=" from  kp_sxgdjl";
		ls_sql+=" where yhdlm='"+yhdlm+"' and sxjlh="+sxjlh;
		ls_sql+=" )";

		if (gcjd.equals("Y"))
		{
			ls_sql+=" and zqysxmbm>'41' and zqysxmbm<'44'";//44:木制品工艺检查
		}
		if (!cqbm.equals(""))
		{
			ls_sql+=" and cqbm='"+cqbm+"'";
		}
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			khbh=rs1.getString("khbh");
			sgd=rs1.getString("sgd");
			zjxm=rs1.getString("zjxm");

			if (sgd==null || zjxm==null)
			{
				continue;
			}

	//		out.println("sgd="+sgd+";zjxm="+zjxm);

			int sgdsxcs=0;
			ls_sql=" select sxcs";
			ls_sql+=" from  kp_sgdsxcs";
			ls_sql+=" where sxr='"+yhdlm+"' and sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				sgdsxcs=rs.getInt(1);
			}
			else{
				rs.close();
				ps.close();
				continue;
			}
			rs.close();
			ps.close();

			int zjsxcs=0;
			ls_sql=" select sxcs";
			ls_sql+=" from  kp_zjsxcs";
			ls_sql+=" where sxr='"+yhdlm+"' and zjxm='"+zjxm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				zjsxcs=rs.getInt(1);
			}
			else{
				rs.close();
				ps.close();
				continue;
			}
			rs.close();
			ps.close();

			int wsxsgd=0;//未筛选施工队
			ls_sql=" select count(*)";
			ls_sql+=" from  kp_sgdsxcs";
			ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y' and sxcs!="+maxsgdsxcs;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				wsxsgd=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (wsxsgd==0)
			{
				maxsgdsxcs++;
			}

			int wsxzj=0;//未筛选工程担当
			ls_sql=" select count(*)";
			ls_sql+=" from  kp_zjsxcs";
			ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y' and sxcs!="+maxzjsxcs;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				wsxzj=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (wsxzj==0)
			{
				maxzjsxcs++;
			}

			
			if (sgdsxcs<maxsgdsxcs && zjsxcs<maxzjsxcs )
			{
				ls_sql="insert into kp_sxgdjl ( sxjlh,khbh,yhdlm,sxsj ) ";
				ls_sql+=" values ( "+sxjlh+",'"+khbh+"','"+yhdlm+"',TRUNC(SYSDATE) ) ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update kp_sgdsxcs set sxcs="+maxsgdsxcs;
				ls_sql+=" where sxr='"+yhdlm+"' and sgd='"+sgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update kp_zjsxcs set sxcs="+maxzjsxcs;
				ls_sql+=" where sxr='"+yhdlm+"' and zjxm='"+zjxm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				row++;
				crow++;

			}

			if (row==sl)
			{
				rs1.close();
				ps1.close();
				break;
			}
		}
		rs1.close();
		ps1.close();

		if (crow==0)//未选到工地
		{
			int wsxzj=0;//未筛选工程担当
			ls_sql=" select count(*)";
			ls_sql+=" from  kp_zjsxcs";
			ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y' and sxcs!="+maxzjsxcs;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				wsxzj=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (wsxzj>0)
			{
				ls_sql=" update  kp_zjsxcs set sxcs="+maxzjsxcs;
				ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{

				int wsxsgd=0;//未筛选施工队
				ls_sql=" select count(*)";
				ls_sql+=" from  kp_sgdsxcs";
				ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y' and sxcs!="+maxsgdsxcs;
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					wsxsgd=rs.getInt(1);
				}
				rs.close();
				ps.close();
				if (wsxsgd>0)
				{
					ls_sql=" update  kp_sgdsxcs set sxcs="+maxsgdsxcs;
					ls_sql+=" where sxr='"+yhdlm+"' and ygdbz='Y' ";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{
					break;
				}
			
			}
		}
	}


	%>
	<SCRIPT language=javascript >
	<!--
	alert("筛选成功，工筛选出工地！<%=row%>");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>