<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] fkxh=request.getParameterValues("fkxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String skdd=null;
	String dsksjbz=null;
	String scbz=null;
	String glxh=null;
	String khbh=null;
	String yjjzsj=null;

	conn.setAutoCommit(false);
	
	for (int i=0;i<fkxh.length ;i++ )
	{
		ls_sql="select khbh,skdd,dsksjbz,scbz,glxh,yjjzsj";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			skdd=rs.getString("skdd");
			dsksjbz=rs.getString("dsksjbz");
			scbz=rs.getString("scbz");
			glxh=rs.getString("glxh");
			yjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		}
		else{
			conn.rollback();
			out.println("错误！不存在的收款序号："+fkxh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!yjjzsj.equals(""))
		{
//			conn.rollback();
//			out.println("收款记录已结转，不能再修改，结转时间："+yjjzsj);
//			return;
		}

		if (scbz.equals("Y"))
		{
			conn.rollback();
			out.println("错误！收款序号["+fkxh[i]+"]已被删除");
			return;
		}

		if (skdd.equals("2"))//1：财务收款；2：非财务代收款
		{
			if (dsksjbz.equals("N"))//N: 未审核；Y: 审核通过；M:审核未通过
			{
				conn.rollback();
				out.println("错误！未审核，收款序号："+fkxh[i]);
				return;
			}
		}
		else{
			conn.rollback();
			out.println("错误！是否需审核不正确，收款序号："+fkxh[i]);
			return;
		}
		


		ls_sql="update cw_khfkjl set sjr=null,sjsj=null,shsj=null,dsksjbz='N',shyj=null ";
		ls_sql+=" where  (fkxh='"+fkxh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (glxh!=null)
		{
			ls_sql="update cw_khfkjl set sjr=null,sjsj=null,dsksjbz='N',shyj=null ";
			ls_sql+=" where fkxh!='"+fkxh[i]+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//家装款更新+++++++++++++++++++++++++++++++++++++++开始
		double zjxssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//增减项实收款
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//家装最近收款时间
		java.sql.Date getjzkscsj=null;//首次付家装款时间
		String getjzkfkxh=null;//家装最近收款序号
		int getjzkfkcs=0;//家装收款期数
		ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//已收工程款
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//取财务收款情况
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//财务家装最近收款时间
		java.sql.Date getcwjzkscsj=null;//财务首次付家装款时间
		String getcwjzkfkxh=null;//财务家装最近收款序号
		int getcwjzkfkcs=0;//财务家装收款期数

		ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//已收工程款
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.executeUpdate();
		ps.close();

		//家装款更新--------------------------------------------完成
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>