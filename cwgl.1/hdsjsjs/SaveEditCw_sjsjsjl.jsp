<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
String[] khbh=request.getParameterValues("khbh");
String[] lx=request.getParameterValues("lx");
String[] qye=request.getParameterValues("qye");
String[] khjsje=request.getParameterValues("khjsje");
String[] td=request.getParameterValues("td");
String[] kjgz=request.getParameterValues("kjgz");
String[] qdsyjsje=request.getParameterValues("qdsyjsje");
String[] wgtcjestr=request.getParameterValues("wgtcje");
String[] bz=request.getParameterValues("bz");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		double qdtcbl=0;
		double qdtcje=0;
		double wgtcbl=0;
		double wgtcje=0;

		if (td[i].trim().equals(""))
		{
			conn.rollback();
			out.println("客户编号【"+khbh[i]+"】错误！请输入【提点】");
			return;
		}
		if (Double.parseDouble(td[i].trim())<=0)
		{
			conn.rollback();
			out.println("客户编号【"+khbh[i]+"】错误！【提点】应大于0");
			return;
		}
		if (kjgz[i].trim().equals(""))
		{
			conn.rollback();
			out.println("客户编号【"+khbh[i]+"】错误！请输入【可结工资】");
			return;
		}



		if (lx[i].equals("1"))//签单提成
		{
			qdtcbl=Double.parseDouble(td[i].trim());
			qdtcje=Double.parseDouble(kjgz[i].trim());
			wgtcbl=0;
			wgtcje=0;
		}
		else if (lx[i].equals("2"))//结算提成
		{
			if (wgtcjestr[i].trim().equals(""))
			{
				conn.rollback();
				out.println("客户编号【"+khbh[i]+"】错误！请输入【实领工资】");
				return;
			}

			qdtcbl=0;
			qdtcje=Double.parseDouble(qdsyjsje[i].trim());
			wgtcbl=Double.parseDouble(td[i].trim());
			wgtcje=Double.parseDouble(wgtcjestr[i].trim());
		}
		else if (lx[i].equals("3"))//设计客户
		{
			if (wgtcjestr[i].trim().equals(""))
			{
				conn.rollback();
				out.println("客户编号【"+khbh[i]+"】错误！请输入【实领工资】");
				return;
			}

			qdtcbl=0;
			qdtcje=Double.parseDouble(qdsyjsje[i].trim());
			wgtcbl=Double.parseDouble(td[i].trim());
			wgtcje=Double.parseDouble(wgtcjestr[i].trim());
		}


		ls_sql=" update cw_sjsjsmx  set qdtcbl=?,qdtcje=?,wgtcbl=?,wgtcje=?,bz=?";
		ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,qdtcbl);
		ps.setDouble(2,qdtcje);
		ps.setDouble(3,wgtcbl);
		ps.setDouble(4,wgtcje);
		ps.setString(5,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();

		if (lx[i].equals("1"))//签单提成
		{
			ls_sql=" update crm_khxx set sjstcbl=?,qdsyjsje=?";
			ls_sql+=" where khbh='"+khbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,qdtcbl);
			ps.setDouble(2,qdtcje);
			ps.executeUpdate();
			ps.close();
		}
		else if (lx[i].equals("2"))//结算提成
		{
			ls_sql=" update crm_khxx set sjswgtcbl=?,wgtcje=?";
			ls_sql+=" where khbh='"+khbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,wgtcbl);
			ps.setDouble(2,wgtcje);
			ps.executeUpdate();
			ps.close();
		}
		else if (lx[i].equals("3"))//设计客户
		{
			ls_sql=" update crm_khxx set sjswgtcbl=?,wgtcje=?";
			ls_sql+=" where khbh='"+khbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,wgtcbl);
			ps.setDouble(2,wgtcje);
			ps.executeUpdate();
			ps.close();
		}
	}

	
	int qdzs=0;
	double qdze=0;
	double qdtcze=0;
	ls_sql="select count(*),sum(qye),sum(qdtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='1' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdzs=rs.getInt(1);
		qdze=rs.getDouble(2);
		qdtcze=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	int jsgds=0;
	double khjsze=0;
	double yjsje=0;
	double wgtcze=0;
	ls_sql="select count(*),sum(khjsje),sum(qdtcje),sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='2' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsgds=rs.getInt(1);
		khjsze=rs.getDouble(2);
		yjsje=rs.getDouble(3);
		wgtcze=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	double sjf=0;
	double sjftcze=0;
	ls_sql="select sum(qye),sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='3' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjf=rs.getDouble(1);
		sjftcze=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double jsze=qdtcze+wgtcze+sjftcze;

	ls_sql="update cw_sjsjsjl set qdzs=?,qdze=?,qdtcze=?,jsgds=?,khjsze=?,yjsje=?,wgtcze=?,sjf=?,sjftcze=?,jsze=?";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,qdzs);
	ps.setDouble(2,qdze);
	ps.setDouble(3,qdtcze);
	ps.setInt(4,jsgds);
	ps.setDouble(5,khjsze);
	ps.setDouble(6,yjsje);
	ps.setDouble(7,wgtcze);
	ps.setDouble(8,sjf);
	ps.setDouble(9,sjftcze);
	ps.setDouble(10,jsze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>