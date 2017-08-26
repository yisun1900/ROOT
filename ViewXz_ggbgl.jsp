<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String xz_ggbgl_ggbh=null;
String xz_ggbgl_ggmc=null;
String xz_ggbgl_ggnr=null;
String xz_ggbgl_fbsj=null;
String xz_ggbgl_fbr=null;
String xz_ggbgl_fbbm=null;
String dwmc=null;
String xz_ggbgl_lrr=null;
String xz_ggbgl_lrsj=null;
String fj=null;
String ggbh=cf.GB2Uni(request.getParameter("ggbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
oracle.sql.CLOB   clob=null;   
String   s=null;
try {
	conn=cf.getConnection();

	ls_sql="select dwmc,fj,xz_ggbgl.ggbh as xz_ggbgl_ggbh,xz_ggbgl.ggmc as xz_ggbgl_ggmc,xz_ggbgl.ggnr as xz_ggbgl_ggnr,xz_ggbgl.fbsj as xz_ggbgl_fbsj,xz_ggbgl.fbr as xz_ggbgl_fbr,xz_ggbgl.fbbm as xz_ggbgl_fbbm,xz_ggbgl.lrr as xz_ggbgl_lrr,xz_ggbgl.lrsj as xz_ggbgl_lrsj ";
	ls_sql+=" from  sq_dwxx,xz_ggbgl";
	ls_sql+=" where xz_ggbgl.fbbm=sq_dwxx.dwbh and  (xz_ggbgl.ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		fj=cf.fillNull(rs.getString("fj"));
		xz_ggbgl_ggbh=cf.fillNull(rs.getString("xz_ggbgl_ggbh"));
		xz_ggbgl_ggmc=cf.fillNull(rs.getString("xz_ggbgl_ggmc"));
		xz_ggbgl_ggnr=cf.fillNull(rs.getString("xz_ggbgl_ggnr"));
		xz_ggbgl_fbsj=cf.fillNull(rs.getDate("xz_ggbgl_fbsj"));
		xz_ggbgl_fbr=cf.fillNull(rs.getString("xz_ggbgl_fbr"));
		xz_ggbgl_fbbm=cf.fillNull(rs.getString("xz_ggbgl_fbbm"));
		xz_ggbgl_lrr=cf.fillNull(rs.getString("xz_ggbgl_lrr"));
		xz_ggbgl_lrsj=cf.fillNull(rs.getDate("xz_ggbgl_lrsj"));

		clob=(oracle.sql.CLOB)rs.getClob("xz_ggbgl_ggnr");   
		if(clob!=null)
		{
			Reader is=clob.getCharacterStream();   
			BufferedReader br=new BufferedReader(is);   
			s = br.readLine();   
			while(s!=null)
			{   
				xz_ggbgl_ggnr+=s;   
				s=br.readLine();   
			}   
		}   
	}
	else{
		out.println("���治���ڣ��ѱ�ɾ��");
		return;
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  xz_ggdx";
	ls_sql+=" where  ggbh='"+ggbh+"' and yhdlm='"+yhdlm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (count>0)
	{
		ls_sql=" delete from xz_ggckjl ";
		ls_sql+=" where  ggbh='"+ggbh+"' and yhdlm='"+yhdlm+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" insert into xz_ggckjl (ggbh,yhdlm,yhmc,ssfgs,dwbh,cksj)" ;
		ls_sql+=" select ggbh,yhdlm,yhmc,ssfgs,dwbh,SYSDATE ";
		ls_sql+=" from xz_ggdx ";
		ls_sql+=" where  ggbh='"+ggbh+"' and yhdlm='"+yhdlm+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from xz_ggdx ";
		ls_sql+=" where  ggbh='"+ggbh+"' and yhdlm='"+yhdlm+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

      <div align="center">��Ϣ���棨�����ţ�<%=xz_ggbgl_ggbh%>��</div>
        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">����</td>
            <td colspan="3"><%=xz_ggbgl_ggmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">����</td>
            <td colspan="3"><%if (!fj.equals(""))
            {
				out.println("<a href='ViewXz_ggbglFj.jsp?ggbh="+ggbh+"' >����鿴������"+fj+"</a>");
            }%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">������</div>
            </td>
            <td width="34%"> <%=xz_ggbgl_fbr%></td>
            <td width="17%"> 
              <div align="right">����ʱ��</div>
            </td>
            <td width="33%"> <%=xz_ggbgl_fbsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">¼����</div>
            </td>
            <td width="34%"><%=xz_ggbgl_lrr%> </td>
            <td width="17%"> 
              <div align="right">¼��ʱ��</div>
            </td>
            <td width="33%"> <%=xz_ggbgl_lrsj%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">��������</div>
            </td>
            <td colspan="3"><%=dwmc%></td>
          </tr>
        </table>

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" onclick="return false;">
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">��������</div>
            </td>
            <td colspan="3"><%=xz_ggbgl_ggnr%></td>
          </tr>
        </table>

</body>
</html>


<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}

//-->
</script>
