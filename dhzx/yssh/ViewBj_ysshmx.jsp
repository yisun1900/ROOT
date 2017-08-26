<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String khxm=null;
double allkf=0;
double allzf=0;
int allbhgsl=0;

String bgcolor="#FFFFFF"  ;
int row=0;
try {
	conn=cf.getConnection();

	ls_sql="select khxm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
	}
	rs.close();
	ps.close();
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">预算审核－－不合格明细（客户姓名：<%=khxm%>）</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

<%
	String ysshjl=null;
	String shxmbm=null;
	String shxmmc=null;
	String jsy=null;
	String ysshsj=null;
	int bhgsl=0;
	double kf=0;
	double zf=0;
	oracle.sql.CLOB   clob=null;   
    String   s=null;
	
	ls_sql="select ysshjl,bj_ysshjl.jsy,bj_ysshjl.ysshsj ";
	ls_sql+=" from  bj_ysshjl";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by ysshjl ";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		ysshjl=cf.fillNull(rs2.getString("ysshjl"));
		jsy=cf.fillNull(rs2.getString("jsy"));
		ysshsj=cf.fillNull(rs2.getString("ysshsj"));

		%>
		<tr bgcolor="#E8E8FF"  align="left">
				<td colspan=8 ><b>审核记录号:<%=ysshjl%>&nbsp;&nbsp;&nbsp;&nbsp;价审员:<%=jsy%>&nbsp;&nbsp;&nbsp;&nbsp;审核时间:<%=ysshsj%></b></td>
				
		</tr>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="10%">项目编码</td>
			<td  width="60%">项目名称</td>
			<td  width="10%">不合格数量</td>
			<td  width="10%">单项扣分</td>
			<td  width="10%">扣分</td>
		</tr>
		<%
		ls_sql="select bj_ysshmx.ysshjl,bj_ysshjl.jsy,bj_ysshjl.ysshsj,dm_ysshxmbm.shxmbm,dm_ysshxmbm.shxmmc,bj_ysshmx.bhgsl,bj_ysshmx.kf,bj_ysshmx.bhgsl*bj_ysshmx.kf zf";
		ls_sql+=" from  bj_ysshmx,dm_ysshxmbm,bj_ysshjl";
		ls_sql+=" where bj_ysshmx.shxmbm=dm_ysshxmbm.shxmbm and bj_ysshmx.ysshjl=bj_ysshjl.ysshjl and bj_ysshjl.ysshjl ='"+ysshjl+"'";
		ls_sql+=" order by bj_ysshmx.ysshjl,bj_ysshmx.shxmbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ysshjl=cf.fillNull(rs.getString("ysshjl"));
			jsy=cf.fillNull(rs.getString("jsy"));
			ysshsj=cf.fillNull(rs.getString("ysshsj"));
			shxmbm=cf.fillNull(rs.getString("shxmbm"));
			shxmmc=cf.fillNull(rs.getString("shxmmc"));
			bhgsl=rs.getInt("bhgsl");
			kf=rs.getDouble("kf");
			zf=rs.getDouble("zf");

			allbhgsl+=bhgsl;
			allkf+=kf;
			allzf+=zf;


			if (row%2==1)
			{
				bgcolor="#FFFFFF";
			}
			else{
				bgcolor="#E8E8FF";
			}

			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td><%=shxmbm%></td>
				<td align="left"><%=shxmmc%></td>
				<td><%=bhgsl%></td>
				<td><%=kf%></td>
				<td><%=zf%></td>
			</tr>
			<%
			row++;
		}
		rs.close();
		ps.close();

		if(ysshjl!=null&&!"".equals(ysshjl))
		{
			ls_sql="select ysshyj ";
			ls_sql+=" from  bj_ysshjlyj";
			ls_sql+=" where ysshjl='"+ysshjl+"'";
			ls_sql+=" order by ysshjl ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			while (rs.next())
			{
				String ysshyj="";
				clob = (oracle.sql.CLOB)rs.getClob("ysshyj");   
				if(clob!=null)
				{
					Reader is=clob.getCharacterStream();   
					BufferedReader br=new BufferedReader(is);   
					s = br.readLine();   
					while(s!=null)
					{   
						ysshyj+=s;   
						s=br.readLine();   
					}  
				}

				ysshyj=cf.replace(ysshyj,"<P>","<BR>");
				ysshyj=cf.replace(ysshyj,"<p>","<BR>");
				ysshyj=cf.replace(ysshyj,"</p>","");
				ysshyj=cf.replace(ysshyj,"</P>","");

				%>
				<tr bgcolor="#FFFFFF"  align="left">
					<td  >审核意见:</td><td colspan=7 ><%=ysshyj%></td>
				</tr>
				<%
			}
			rs.close();
			ps.close();
		}
	}
	rs2.close();
	ps2.close();

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<tr bgcolor="<%=bgcolor%>"  align="center">
	<td>合计</td>
	<td>&nbsp;</td>
	<td><%=allbhgsl%></td>
	<td><%=allkf%></td>
	<td><%=allzf%></td>
</tr>

</table>
</form> 
</html>


