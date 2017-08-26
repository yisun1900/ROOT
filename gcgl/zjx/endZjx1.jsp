<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zjxxh="000239801";
String khbh="0002398";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	double zqgcf=0;//折前工程费
	double zhgcf=0;//折后工程费
	double zqzcje=0;//折前公司主材金额
	double zhzcje=0;//折后公司主材金额
	double zqzgzcje=0;//折前自购主材金额
	double zhzgzcje=0;//折后自购主材金额


			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj),sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
			ls_sql+=" where bj_bjxmmxh.zjxxh='000239801' and bj_bjxmmxh.khbh='0002398' ";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zqgcf=rs.getDouble(1);//折前工程费
				zhgcf=rs.getDouble(2);//折后工程费
			}
			rs.close();
			ps.close();

			out.println(ls_sql);
			out.println("<BR>zqgcf="+zqgcf);
			out.println("<BR>zhgcf="+zhgcf);



			zqgcf=0;
			zhgcf=0;

			String jgwzbm="";

			ls_sql="SELECT jgwzbm,sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj),sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
			ls_sql+=" where bj_bjxmmxh.zjxxh='000239801' and bj_bjxmmxh.khbh='0002398' ";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ls_sql+=" group by jgwzbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				jgwzbm=rs.getString(1);//折前工程费
				double q=rs.getDouble(2);//折前工程费
				double h=rs.getDouble(3);//折后工程费

				zqgcf+=q;
					zhgcf+=h;
				out.println("<BR>"+jgwzbm+":"+zqgcf+"、"+zhgcf+"、"+q+"、"+h);
			}
			rs.close();
			ps.close();

			out.println("<BR>zqgcf="+zqgcf);
			out.println("<BR>zhgcf="+zhgcf);



			zqgcf=0;
			zhgcf=0;


/*

			String str1="";
			double dd1=0;
			double dd2=0;
			ls_sql="SELECT xmbh,zqdj,dj";
			ls_sql+=" FROM bj_bjxmmxh,bdm_xmdlbm";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm='1'";
			ls_sql+=" order by xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				str1=rs.getString("xmbh").trim();
				dd1=rs.getDouble("zqdj");
				dd2=rs.getDouble("dj");

				out.println("<BR>xmbh="+str1+",zqdj="+dd1+",dj="+dd2);
			
				String str2="";
				double dd3=0;
				ls_sql="SELECT jgwzbm,sl";
				ls_sql+=" FROM bj_gclmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+str1+"'";
				ls_sql+=" order by jgwzbm";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					str2=rs1.getString("jgwzbm");
					dd3=rs1.getDouble("sl");

					out.println("     jgwzbm="+str2+",sl="+dd3);

					zqgcf=cf.round(zqgcf+dd1*dd3,2);
					zhgcf=cf.round(zhgcf+dd2*dd3,2);

					out.println("            zqgcf="+zqgcf+",zhgcf="+zhgcf);

				}
				rs1.close();
				ps1.close();
			}
			rs.close();
			ps.close();



*/




	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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