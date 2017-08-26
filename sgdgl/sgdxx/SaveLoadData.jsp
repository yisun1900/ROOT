<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String ssfgs =request.getParameter("ssfgs");

String[] sgd =request.getParameterValues("sgd");
String[] sgdmc =request.getParameterValues("sgdmc");
String[] duihao =request.getParameterValues("duihao");
String[] sgdjbbm =request.getParameterValues("sgdjbbm");
String[] sgdlx =request.getParameterValues("sgdlx");
String[] sfzhm =request.getParameterValues("sfzhm");
String[] dz =request.getParameterValues("dz");
String[] dh =request.getParameterValues("dh");

String[] email =request.getParameterValues("email");
String[] hjszd =request.getParameterValues("hjszd");
String[] jjlxr =request.getParameterValues("jjlxr");
String[] lxrdh =request.getParameterValues("lxrdh");
String[] jjlxrdz =request.getParameterValues("jjlxrdz");
String[] sfqldht =request.getParameterValues("sfqldht");

String[] zbj =request.getParameterValues("zbj");
String[] bzs =request.getParameterValues("bzs");
String[] tdbz =request.getParameterValues("tdbz");
String[] tdkssj =request.getParameterValues("tdkssj");
String[] tdzzsj =request.getParameterValues("tdzzsj");
String[] cxbz =request.getParameterValues("cxbz");
String[] kjdsm =request.getParameterValues("kjdsm");
String[] bz =request.getParameterValues("bz");

//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<sgd.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from sq_sgd " ;
		sql+=" where ssfgs='"+ssfgs+"' and sgdmc='"+cf.GB2Uni(sgdmc[i])+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			conn.rollback();
			out.println("错误！施工队名称["+cf.GB2Uni(sgdmc[i])+"]有多个");
			return;
		}
		else if (count==1)//首先删除
		{
			sql=" delete from sq_sgd " ;
			sql+=" where ssfgs='"+ssfgs+"' and sgdmc='"+cf.GB2Uni(sgdmc[i])+"'" ;
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

		sql=" select count(*)" ;
		sql+=" from sq_sgd " ;
		sql+=" where sgd='"+sgd[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("错误！施工队编号["+cf.GB2Uni(sgd[i])+"]已存在");
			return;
		}

		String dqbm=null;
		sql=" select dqbm" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwbh='"+ssfgs+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			dqbm = rs.getString(1);
		}
		rs.close();
		ps.close();

		sql ="insert into sq_sgd (ssfgs,dqbm,sgd,sgdmc,duihao,sgdjbbm,sgdlx,sfzhm";
		sql+=" ,dz,dh,email,hjszd,jjlxr,lxrdh,jjlxrdz ";
		sql+=" ,sfqldht,zbj,bzs,tdbz,tdkssj,tdzzsj,cxbz,kjdsm,bz)";
		sql+=" values('"+ssfgs+"','"+dqbm+"','"+cf.GB2Uni(sgd[i])+"','"+cf.GB2Uni(sgdmc[i])+"','"+cf.GB2Uni(duihao[i])+"','"+cf.GB2Uni(sgdjbbm[i])+"','"+cf.GB2Uni(sgdlx[i])+"','"+cf.GB2Uni(sfzhm[i])+"'";
		sql+=" ,'"+cf.GB2Uni(dz[i])+"','"+cf.GB2Uni(dh[i])+"','"+cf.GB2Uni(email[i])+"','"+cf.GB2Uni(hjszd[i])+"','"+cf.GB2Uni(jjlxr[i])+"','"+cf.GB2Uni(lxrdh[i])+"','"+cf.GB2Uni(jjlxrdz[i])+"'";
		sql+=" ,'"+cf.GB2Uni(sfqldht[i])+"','"+cf.GB2Uni(zbj[i])+"','"+cf.GB2Uni(bzs[i])+"','"+cf.GB2Uni(tdbz[i])+"',TO_DATE('"+tdkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+tdzzsj[i]+"','YYYY-MM-DD'),'"+cf.GB2Uni(cxbz[i])+"','"+cf.GB2Uni(kjdsm[i])+"','"+cf.GB2Uni(bz[i])+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
