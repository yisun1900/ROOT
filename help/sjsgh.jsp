<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int count=0;


try {
	//拷贝标准凭证文件
	conn=cf.getConnection();    //得到连接

	String fgsbh=null;//设计师
	String khbh=null;//设计师
	String dwbh=null;//设计师
	String sjs=null;//设计师
	String sjsgh=null;//所属设计室编号

	int row=0;
	ls_sql=" select fgsbh,khbh,sjs,dwbh" ;
	ls_sql+=" from crm_khxx " ;
	ls_sql+=" where zt='2' and sjsgh is null and sjs is not null" ;
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{         
		fgsbh = rs1.getString("fgsbh");			    
		khbh = rs1.getString("khbh");			    
		sjs = cf.fillNull(rs1.getString("sjs"));			    
		dwbh = rs1.getString("dwbh");		

		row++;
		out.println("<BR>"+row);
		
		//取设计师工号
		String bianhao=null;//员工编号

		//1、检查本店在职设计师
		ls_sql=" select count(*)" ;
		ls_sql+=" from sq_yhxx " ;
		ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
		ps2= conn.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			count = rs2.getInt(1);			    
		}
		rs2.close();
		ps2.close();

		if (sjs.equals(""))
		{
			out.println("<BR>提醒！客户编号<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+khbh+"]</A>设计师为空");
			sjs="未知";
		}
		else if (count>1)//多个
		{
			conn.rollback();
			out.println("<BR>错误！在["+dwbh+"]店，在职设计师<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>有多个");
			return;
		}
		else if (count==1)//一个
		{
			ls_sql=" select ygbh" ;
			ls_sql+=" from sq_yhxx " ;
			ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				bianhao = rs2.getString("ygbh");			    
			}
			rs2.close();
			ps2.close();
		}
		else{//无在职设计师

			//2、检查本店离职设计师
			ls_sql=" select count(*)" ;
			ls_sql+=" from sq_yhxx " ;
			ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				count = rs2.getInt(1);			    
			}
			rs2.close();
			ps2.close();

			if (count>1)//多个
			{
				conn.rollback();
				out.println("<BR>错误！在["+dwbh+"]店，离职设计师<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>有多个");
				return;
			}
			else if (count==1)//一个
			{
				ls_sql=" select ygbh" ;
				ls_sql+=" from sq_yhxx " ;
				ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
				ps2= conn.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					bianhao = rs2.getString("ygbh");			    
				}
				rs2.close();
				ps2.close();

				out.println("<BR>提醒！在["+dwbh+"]店，设计师<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>已离职");
			}
			else{//无离职设计师

				//3、检查公司所有在职设计师
				ls_sql=" select count(*)" ;
				ls_sql+=" from sq_yhxx " ;
				ls_sql+=" where ssfgs='"+fgsbh+"' and sq_yhxx.yhmc='"+sjs+"' and zwbm='04' and sq_yhxx.sfzszg in('Y','N')";
				ps2= conn.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					count = rs2.getInt(1);			    
				}
				rs2.close();
				ps2.close();

				if (count>1)//多个
				{
					conn.rollback();
					out.println("<BR>错误！设计师<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>有多个");
					return;
				}
				if (count==1)//一个
				{
					String lsdwbh=null;
					ls_sql=" select sq_yhxx.ygbh,dwmc" ;
					ls_sql+=" from sq_yhxx,sq_dwxx " ;
					ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ssfgs='"+fgsbh+"' and sq_yhxx.yhmc='"+sjs+"' and zwbm='04' and sq_yhxx.sfzszg in('Y','N')";
					ps2= conn.prepareStatement(ls_sql);
					rs2=ps2.executeQuery();
					if(rs2.next())
					{         
						bianhao = rs2.getString("ygbh");			    
						lsdwbh = rs2.getString("dwmc");			    
					}
					rs2.close();
					ps2.close();

					out.println("<BR>提醒！设计师<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>已异动到["+lsdwbh+"]");
				}
				else{
//					conn.rollback();
					bianhao="未知";
					out.println("<BR>提醒！无此设计师<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>");
//					return;
				}
			}
		}



		if (sjs.equals("未知"))
		{
			bianhao="未知";
		}
		else{
			if (bianhao==null || bianhao.equals(""))
			{
				out.println("<BR>提醒！设计师<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>工号不存在");
				bianhao="未知";
			}
			else{
				ls_sql="update crm_khxx set sjsgh=? ";
				ls_sql+=" where  khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,bianhao);
				ps.executeUpdate();
				ps.close();
			}
		}


		
	}
	rs1.close();
	ps1.close();

	out.print("<P>成功");
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{

	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
 
