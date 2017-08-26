<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String kpjlh=request.getParameter("kpjlh");
String[] sgd =request.getParameterValues("sgd");
String[] sgdmc =request.getParameterValues("sgdmc");
String[] bqpmstr =request.getParameterValues("bqpm");
String[] bqdfstr =request.getParameterValues("bqdf");
String[] sgdjbmc =request.getParameterValues("sgdjbmc");
String[] bqjdzestr =request.getParameterValues("bqjdze");
String[] bqddestr =request.getParameterValues("bqdde");
String[] bqzdestr =request.getParameterValues("bqzde");
String[] bqxdestr =request.getParameterValues("bqxde");

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<sgd.length ;i++ )
	{
		int bqpm=0;
		int bqdf=0;
		String sgdjbbm =null;
		double bqjdze=0;
		double bqdde=0;
		double bqzde=0;
		double bqxde=0;

		if (!bqpmstr[i].trim().equals(""))
		{
			try{
				bqpm=Integer.parseInt(bqpmstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[施工队："+cf.GB2Uni(sgdmc[i])+"]错误！【本期排名】输入不正确:"+bqpmstr[i]);
				return;
			}
		}

		if (!bqdfstr[i].trim().equals(""))
		{
			try{
				bqdf=Integer.parseInt(bqdfstr[i].trim());
			}
			catch (Exception e){
				out.println("<BR>[施工队："+cf.GB2Uni(sgdmc[i])+"]错误！【本期得分】输入不正确:"+bqdfstr[i]);
			}
		}


		if (!sgdjbmc[i].trim().equals(""))
		{
			ls_sql=" select sgdjbbm" ;
			ls_sql+=" from sq_sgdjbbm " ;
			ls_sql+=" where sgdjbmc='"+cf.GB2Uni(sgdjbmc[i].trim())+"'" ;
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				sgdjbbm = rs.getString("sgdjbbm");			    
			}
			else{
				sgdjbbm="";
				out.println("<BR>[施工队："+cf.GB2Uni(sgdmc[i])+"]错误！【施工队级别】不正确："+cf.GB2Uni(sgdjbmc[i]));
			}
			rs.close();
			ps.close();
		}

		if (!bqjdzestr[i].trim().equals(""))
		{
			try{
				bqjdze=Double.parseDouble(bqjdzestr[i].trim());
			}
			catch (Exception e){
				out.println("<BR>[施工队："+cf.GB2Uni(sgdmc[i])+"]错误！【本期接单总额】输入不正确:"+bqjdzestr[i]);
			}
		}

		if (!bqddestr[i].trim().equals(""))
		{
			try{
				bqdde=Double.parseDouble(bqddestr[i].trim());
			}
			catch (Exception e){
				out.println("<BR>[施工队："+cf.GB2Uni(sgdmc[i])+"]错误！【本期大单额】输入不正确:"+bqddestr[i]);
			}
		}

		if (!bqzdestr[i].trim().equals(""))
		{
			try{
				bqzde=Double.parseDouble(bqzdestr[i].trim());
			}
			catch (Exception e){
				out.println("<BR>[施工队："+cf.GB2Uni(sgdmc[i])+"]错误！【本期中单额】输入不正确:"+bqzdestr[i]);
			}
		}

		if (!bqxdestr[i].trim().equals(""))
		{
			try{
				bqxde=Double.parseDouble(bqxdestr[i].trim());
			}
			catch (Exception e){
				out.println("<BR>[施工队："+cf.GB2Uni(sgdmc[i])+"]错误！【本期小单额】输入不正确:"+bqxdestr[i]);
			}
		}

		String sgdlx=null;
		int zbj=0;
		int bzs=0;
		int jcf=0;
		ls_sql=" select sgdlx,zbj,bzs,jcf" ;
		ls_sql+=" from sq_sgd " ;
		ls_sql+=" where sgd='"+sgd[i]+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgdlx = rs.getString("sgdlx");			    
			zbj = rs.getInt("zbj");			    
			bzs = rs.getInt("bzs");			    
			jcf = rs.getInt("jcf");			    
		}
		else{
			out.println("<BR>警告！[施工队："+cf.GB2Uni(sgdmc[i])+"]不存在");
			continue;
		}
		rs.close();
		ps.close();

		if (bzs<=0)
		{
			conn.rollback();
			out.println("<BR>存盘失败！[施工队："+cf.GB2Uni(sgdmc[i])+"]班组数为0，将不能派单");
			return;
		}

		//派单考评明细
		ls_sql=" insert into kp_pdkpmx (kpjlh,sgd,sgdlx,zbj,bzs,jcf,sgdjbbm,jdqz,ddbl,zdbl";
		ls_sql+=" ,xdbl,bqdf,bqpm,kpzf,sqpm,hjwbz,qjwbz,sjbz,jjbz,kcjdebfb";
		ls_sql+=" ,zdjdze,lljdze,jdze,lljdde,ddje,lljzde,zdje,lljxde,xdje,sqsydze ";
		ls_sql+=" ,sqsydde,sqsyzde,sqsyxde,sqpdbcze,sqpdbcdde,sqpdbczde,sqpdbcxde,bqjdze,bqdde,bqzde";
		ls_sql+=" ,bqxde,yjdze,yjddje,yjzdje,yjxdje,jfdze,jfddje,jfzdje,jfxdje,sydze";
		ls_sql+=" ,syddje,syzdje,syxdje,zsbzs,kjhzdfpe) ";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
		ls_sql+="       ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,kpjlh);
		ps.setString(2,sgd[i]);
		ps.setString(3,sgdlx);
		ps.setDouble(4,zbj);
		ps.setInt(5,bzs);
		ps.setInt(6,jcf);
		ps.setString(7,sgdjbbm);
		ps.setInt(8,0);
		ps.setInt(9,0);
		ps.setInt(10,0);

		ps.setInt(11,0);
		ps.setInt(12,bqdf);
		ps.setInt(13,bqpm);
		ps.setInt(14,0);
		ps.setInt(15,0);
		ps.setString(16,"N");
		ps.setString(17,"N");
		ps.setString(18,"N");
		ps.setString(19,"N");
		ps.setDouble(20,0);

		ps.setInt(21,0);
		ps.setInt(22,0);
		ps.setInt(23,0);
		ps.setInt(24,0);
		ps.setInt(25,0);
		ps.setInt(26,0);
		ps.setInt(27,0);
		ps.setInt(28,0);
		ps.setInt(29,0);
		ps.setDouble(30,0);

		ps.setDouble(31,0);
		ps.setDouble(32,0);
		ps.setDouble(33,0);
		ps.setInt(34,0);
		ps.setInt(35,0);
		ps.setInt(36,0);
		ps.setInt(37,0);
		ps.setDouble(38,bqjdze);
		ps.setDouble(39,bqdde);
		ps.setDouble(40,bqzde);

		ps.setDouble(41,bqxde);
		ps.setInt(42,0);
		ps.setInt(43,0);
		ps.setInt(44,0);
		ps.setInt(45,0);
		ps.setInt(46,0);
		ps.setInt(47,0);
		ps.setInt(48,0);
		ps.setInt(49,0);
		ps.setDouble(50,bqjdze);

		ps.setDouble(51,bqdde);
		ps.setDouble(52,bqzde);
		ps.setDouble(53,bqxde);
		ps.setInt(54,0);
		ps.setDouble(55,0);


		ps.executeUpdate();
		ps.close();
		
	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("存盘成功!!!");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + ls_sql);
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

