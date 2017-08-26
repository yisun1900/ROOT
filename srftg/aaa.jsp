<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();




	conn.setAutoCommit(false);
	
	String khbh=null;
	ls_sql="select distinct khbh";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where scbz='N'";
	ls_sql+=" and fklxbm='52'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=rs1.getString("khbh").trim();

		String khxm=null;
		String fwdz=null;
		String sjs=null;
		String sjsbh=null;
		String dwbh=null;
		String fgsbh=null;

		ls_sql="select khxm,fwdz,sjs,sjsbh,zxdm,ssfgs ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=rs.getString("khxm");
			fwdz=rs.getString("fwdz");
			sjs=rs.getString("sjs");
			sjsbh=rs.getString("sjsbh");
			dwbh=rs.getString("zxdm");
			fgsbh=rs.getString("ssfgs");
		}
		rs.close();
		ps.close();

		double fkje=0;
		int count=0;

		ls_sql="select sum(fkje),count(*) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where scbz='N'";
		ls_sql+=" and fklxbm='52'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fkje=rs.getDouble(1);
			count=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (fkje>0)
		{
			out.println("<BR>"+count+":hbh="+khbh+",fkje="+fkje);
//			return;

			if (count==1)
			{

				double fkje1=0;
				int count1=0;

				ls_sql="select fkje ";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where scbz='N'";
				ls_sql+=" and fklxbm='62'";
				ls_sql+=" and khbh='"+khbh+"'";
				ls_sql+=" and zffs!='31'";
				ls_sql+=" and fkje>0";
				ls_sql+=" order by  fkje desc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					fkje1=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (fkje1>0 && fkje<=fkje1)
				{
					out.println("<BR>"+count+":khbh="+khbh+",fkje="+fkje);
					out.println(","+count1+",fkje1="+fkje1);

/*
				
					//插入关联付款记录 
					String newfkxh=null;
					ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
					ls_sql+=" from  cw_khfkjl";
					ls_sql+=" where khbh='"+khbh+"'  ";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						count=rs.getInt(1);
					}
					rs.close();
					ps.close();

					newfkxh=khbh+cf.addZero(count+1,3);

//					out.println(newfkxh);

					ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,gysbh,ddbh,zjxbh,fkje,jkr,skr,sksj   ,skdw,lrr,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,sjs,sjsbh,dwbh,fgsbh,sjfkzc   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ) ";
					ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?,?                                      ,?,?,?,?,?,?,?                     ,'N'    ,?,?,?,?,?                     ,'1','0','0',?,?,?    ,'Y',?,?,?,?,?) ";//1：财务收款；2：非财务代收款
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh);
					ps.setString(2,newfkxh);
					ps.setString(3,"");
					ps.setString(4,"52");
					ps.setString(5,"");
					ps.setString(6,"");
					ps.setString(7,"");
					ps.setDouble(8,-1*fkje);
					ps.setString(9,"张三");
					ps.setString(10,"张三");
					ps.setDate(11,cf.getDate());

					ps.setString(12,"99999");
					ps.setString(13,"张三");
					ps.setDate(14,cf.getDate());
					ps.setString(15,"张三处理");
					ps.setString(16,"31");
					ps.setString(17,"62");
					ps.setString(18,"99999");


					ps.setString(19,sjs);
					ps.setString(20,sjsbh);
					ps.setString(21,dwbh);
					ps.setString(22,fgsbh);
					ps.setString(23,"");

					ps.setString(24,"张三");
					ps.setDate(25,cf.getDate());
					ps.setInt(26,0);

					ps.setString(27,"1");
					ps.setString(28,"");
					ps.setString(29,khxm);
					ps.setString(30,fwdz);
					ps.setString(31,"");
					ps.executeUpdate();
					ps.close();
*/
				}


			}
		}
	}
	rs1.close();
	ps1.close();


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
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