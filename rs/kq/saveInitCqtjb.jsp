<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String[] id =request.getParameterValues("id");
String[] nian =request.getParameterValues("nian");
String[] yue =request.getParameterValues("yue");
String[] ygbh =request.getParameterValues("ygbh");
String[] bianhao =request.getParameterValues("bianhao");
String[] qqts =request.getParameterValues("qqts");
String[] cqts =request.getParameterValues("cqts");
String[] bz =request.getParameterValues("bz");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
	
		//查询品名编码
		String yhmc=null;
		String dwbh=null;
		String ssfgs=null;
		sql=" select yhmc,dwbh,ssfgs" ;
		sql+=" from sq_yhxx" ;
		sql+=" where  (ygbh="+ygbh[i]+")  ";
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){         
			yhmc = rs.getString("yhmc");			    
			dwbh = rs.getString("dwbh");			    
			ssfgs = rs.getString("ssfgs");			    
		}
		else{
			conn.rollback();
			out.println("！！！错误，序号["+id[i]+"]不存在的员工序号！"+ygbh[i]);
			return;
		}
		rs.close();
		ps.close();

		int xh=0;
		sql=" select xh" ;
		sql+=" from rs_cqtjb" ;
		sql+=" where nian='"+nian[i]+"' and yue='"+yue[i]+"' and ygbh="+ygbh[i];
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){         
			xh = rs.getInt(1);			    
		}
		rs.close();
		ps.close();
		if (xh==0)
		{
			sql=" select max(xh)" ;
			sql+=" from rs_cqtjb" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){         
				xh = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			xh++;

			sql="insert into rs_cqtjb ( xh,nian,yue,ygbh,bianhao,yhmc,dwbh,qqts,cqts,bz,ssfgs ) ";
			sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(sql);
			ps.setInt(1,xh);
			ps.setString(2,nian[i]);
			ps.setString(3,yue[i]);
			ps.setString(4,ygbh[i]);
			ps.setString(5,bianhao[i]);
			ps.setString(6,yhmc);
			ps.setString(7,dwbh);
			ps.setString(8,qqts[i]);
			ps.setString(9,cqts[i]);
			ps.setString(10,cf.GB2Uni(bz[i]));
			ps.setString(11,ssfgs);
			ps.executeUpdate();
			ps.close();

		}
		else{
			sql="update rs_cqtjb set nian=?,yue=?,ygbh=?,bianhao=?,yhmc=?,dwbh=?,qqts=?,cqts=?,bz=?,ssfgs=? ";
			sql+=" where  (xh="+xh+")  ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,nian[i]);
			ps.setString(2,yue[i]);
			ps.setString(3,ygbh[i]);
			ps.setString(4,bianhao[i]);
			ps.setString(5,yhmc);
			ps.setString(6,dwbh);
			ps.setString(7,qqts[i]);
			ps.setString(8,cqts[i]);
			ps.setString(9,cf.GB2Uni(bz[i]));
			ps.setString(10,ssfgs);
			ps.executeUpdate();
			ps.close();
		}


	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
