<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String lsfwmj=null;
double fwmj=0;
double pmjj=0;
String lsqye=null;
double qye=0;
String lssjkgrq=null;
java.sql.Date qyrq=null;
java.sql.Date sjkgrq=null;
String lssjjgrq=null;
java.sql.Date sjjgrq=null;
String lsbxjzsj=null;
java.sql.Date bxkssj=null;
java.sql.Date bxjzsj=null;
String zjxm=null;
String lssgd=null;
String sgd=null;
String sjs=null;
String lsysbm=null;
String ysbm=null;
String dwbh=null;
String pdclzt=null;
String gcjdbm=null;
String kbxbz=null;

//String dqbm="02";
String ssfgs="FCD00";

int count=0;
int start=20705;
int pos=0;

String xh=null;
String khbh=null;
String c1=null;
String c2=null;
String c3=null;
String cqbm=null;
String rddqbm=null;
String hxwzbm=null;

try {

	//得到ORACLE连接
	conn=cf.getConnection();    
	
	conn.setAutoCommit(false);

	//中级报价
	ls_sql ="select xh,khbh,khxm,fwdz,zjxm,c1,c2,c3";
	ls_sql+=" from imp_khxx2  ";
	ls_sql+=" order by xh";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		count++;

		xh=rs1.getString("xh");
		khbh=rs1.getString("khbh");
		khxm=rs1.getString("khxm");
		fwdz=rs1.getString("fwdz");
		zjxm=rs1.getString("zjxm");
		c1=cf.fillNull(rs1.getString("c1"));
		c2=cf.fillNull(rs1.getString("c2"));
		c3=cf.fillNull(rs1.getString("c3"));

//		out.println("<BR>dwbh="+dwbh+";hth="+hth);

/*
		ls_sql ="select khbh";
		ls_sql+=" from crm_khxx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			khbh=rs.getString("khbh");
		}
		else{
			out.println("<BR>khbh不存在:"+khbh);
		}
		rs.close();
		ps.close();
*/		
		cqbm="";
		rddqbm="";
		hxwzbm="";
		if (!c1.equals(""))
		{
			ls_sql ="select cqbm";
			ls_sql+=" from dm_cqbm ";
			ls_sql+=" where cqmc='"+c1+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				cqbm=rs.getString("cqbm");
			}
			else{
				out.println("<BR>城区不存在:"+c1);
			}
			rs.close();
			ps.close();
		}

		if (!c2.equals(""))
		{
			ls_sql ="select rddqbm";
			ls_sql+=" from dm_rddqbm ";
			ls_sql+=" where rddq='"+c2+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				rddqbm=rs.getString("rddqbm");
			}
			else{
				out.println("<BR>热点地区不存在:"+c2);
			}
			rs.close();
			ps.close();
		}

		if (!c3.equals(""))
		{
			ls_sql ="select hxwzbm";
			ls_sql+=" from dm_hxwzbm ";
			ls_sql+=" where hxwz='"+c3+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				hxwzbm=rs.getString("hxwzbm");
			}
			else{
				out.println("<BR>环线位置不存在:"+c3);
			}
			rs.close();
			ps.close();
		}


		ls_sql="update imp_khxx2 set cqbm=?,rddqbm=?,hxwzbm=?";
		ls_sql+=" where xh="+xh;
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cqbm);
		ps.setString(2,rddqbm);
		ps.setString(3,hxwzbm);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	
	conn.commit();

	out.print("<BR>数据导入成功，共导入记录数："+count);
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
