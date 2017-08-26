<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>

<html>
<head>
<title>有奖调查</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String wtbh=null;
String wtmc=null;
String szcs =null;
String zybm="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
int flag=0;
%>

          <table width="74%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12;BORDER-COLLAPSE: collapse" >
		  <!-- <tr><td colspan="3"><div align="center"><b>查看调查结果</b></div></td></tr> -->
<%
try {
	conn=cf.getConnection();
	int row=0;
	
	String wtkxda=null;//问题可选答案
	String sfkdx=null;
	String sfyxsm="";
	ls_sql="select wtbh,wtmc";
	ls_sql+=" from  hd_scdcwt where wtsfgq='N'";//Y：过期&N：没有过期
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		
		wtkxda="";
		int cos=0;
		int count=0;
		ls_sql="select count(wtbh)";
		ls_sql+=" from  hd_dcwtkxda where wtbh='"+wtbh+"'";
		
%>

		<tr bgcolor="#D0D0FF">
          <td height="25" bgcolor="#F1FCFE" colspan="3"><b>【问题：<%=wtmc%>】</b></td>
        </tr>

<%

		ls_sql="select count(wtbh)";
		ls_sql+=" from  hd_scdcjg where wtbh='"+wtbh+"'";
		
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		
		if(rs1.next())
		{
			count=rs1.getInt(1);//每个问题中选择项目的总数
			
		}
		rs1.close();
		ps1.close();
		row=0;
		if(count>0)//当COUNT为零时返回,防止报错
		{
			ls_sql="select wtkxda,sum(xzs) from ";
			ls_sql+=" ( select wtkxda,count(wtbh) xzs from  hd_scdcjg where wtbh='"+wtbh+"'";
			ls_sql+=" group by wtkxda ";
			ls_sql+=" union all ";
			ls_sql+=" select wtkxda,0 xzs from  hd_dcwtkxda where wtbh='"+wtbh+"'";
			ls_sql+=" group by wtkxda )";
			ls_sql+=" group by wtkxda ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			int xzs=0;
		
			while(rs1.next())
			{
				row++;
				wtkxda=rs1.getString("wtkxda");
				xzs=rs1.getInt(2);
				//out.print(ls_sql);
			
	%>
					<tr><td width="30%"><%=row%>.<%=wtkxda%></td><td width="20%" align="center"><%=xzs*100/count%> %</td><td  align="left"><img src="/images/ColuGif.gif" width="<%=xzs*70/count%>" height="10">&nbsp;<%=xzs%>次 </td>
	</tr>
	<%		
			}

			rs1.close();
			ps1.close();
		}
		%>
		
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>
<div align="center"><input type=button value="返回" onclick="window.history.back()" ></div>
</form>
    </body>
</html>

