<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>

<html>
<head>
<title>�н�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
String khbh=(String)session.getAttribute("khbh");
String zdr=(String)session.getAttribute("yhmc");
String flag1=(String)session.getAttribute("flag1");

if((!flag1.equals("N")) || flag1==null)
{

	
	out.print("<br><br><div align=center><font color=\"red\" >�����ˣ����������Ϣ���������ظ��ύ�ˣ�</font></div>");
	out.print("<br><div align=center><input type=button onclick=\"window.close()\" value=\"�رմ���\"></div>");
	return;
}
String wtbh[]=request.getParameterValues("wtbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

%>


<%
try {
	conn=cf.getConnection();
	int row=0;
	String dasm1="��";
	String wtkxda=null;//�����ѡ��
	String sfkdx=null;
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(wtjgxh))+1,1)";
	ls_sql+=" from  hd_scdcjg";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	conn.setAutoCommit(false);
	for(int i=0;i<wtbh.length;i++)
	{   
	
		String sfyxsm=cf.GB2Uni(request.getParameter("sfyxsm"+(i+1)));
		String wtbhx[]=request.getParameterValues("wtbh"+(i+1));
		if(wtbhx==null)
		{
		}else
		{
			for(int j=0;j<wtbhx.length;j++)
			{
				String wtjgxh;
			
				wtjgxh=cf.addZero(xh,7);
				//out.print(wtjgxh);
				if(sfyxsm.equals("Y") && cf.GB2Uni(wtbhx[j]).equals("����"))
				{
					String dasm=cf.GB2Uni(request.getParameter("temp"+(i+1)));
					if((dasm==null) || (dasm.equals("")))
					{
						dasm="��";
					}
					ls_sql="insert into hd_scdcjg(wtbh,wtkxda,dasm,wtjgxh,khbh,zdr,zdsj) ";
					ls_sql+=" values(?,?,?,?,?,?,TRUNC(SYSDATE))";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,wtbh[i]);
					ps.setString(2,cf.GB2Uni(wtbhx[j]));
					ps.setString(3,dasm);
					ps.setString(4,wtjgxh);
					ps.setString(5,khbh);
					ps.setString(6,zdr);
					ps.executeUpdate();
				}
				else
				{
					ls_sql="insert into hd_scdcjg(wtbh,wtkxda,dasm,wtjgxh,khbh,zdr,zdsj) ";
					ls_sql+=" values(?,?,?,?,?,?,TRUNC(SYSDATE))";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,wtbh[i]);
					ps.setString(2,cf.GB2Uni(wtbhx[j]));
					ps.setString(3,dasm1);
					ps.setString(4,wtjgxh);
					ps.setString(5,khbh);
					ps.setString(6,zdr);
					ps.executeUpdate();

				}
				xh++;
				
			}
		}
	}
	ps.close();

	conn.commit();
	session.setAttribute("flag1","");
	%>
		<br>
<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
	<TR><TD WIDTH="253"></TD><TD WIDTH="385"><form method="post" action="../khxx/zhuanym.jsp" name="editform" >
          
        <table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
          <TR>
            <TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[ϵͳ��ʾ]</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">�����ɹ���</div></TD>
          </TR>
		  <TR>
            <TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
                <input type="button"  value="ȷ��" onclick="window.close()">
              <!--   <input type="button"  value="����" onClick="window.history.back()"> -->
              </div></TD>
          </TR>
		  </TABLE>
		  </FORM></TD><TD WIDTH="339"></TD>
		  <TR>
</TABLE>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	%>
	<br>
<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
	<TR><TD WIDTH="253"></TD><TD WIDTH="385"><form method="post" action="../khxx/zhuanym.jsp" name="editform" >
          
        <table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
          <TR>
            <TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[ϵͳ��ʾ]</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">�Բ��𣬲���ʧ�ܣ�</div></TD>
          </TR>
		  <TR>
            <TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
                <input type="button"  value="ȷ��" onclick="window.close()">
               <!--  <input type="button"  value="����" onClick="window.history.back()"> -->
              </div></TD>
          </TR>
		  </TABLE>
		  </FORM></TD><TD WIDTH="339"></TD>
		  <TR>
</TABLE>
	<%
	return;
}
finally 
{	conn.setAutoCommit(true);
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
 
</body>
</html>
