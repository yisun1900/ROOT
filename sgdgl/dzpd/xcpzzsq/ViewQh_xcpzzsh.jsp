<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qh_xcpzzsh_shbbh=null;
String qh_xcpzzsh_sqsj=null;
String qh_xcpzzsh_tbr=null;
String qh_xcpzzsh_zznr=null;
String qh_xcpzzsh_sl=null;
String qh_xcpzzsh_gg=null;
String qh_xcpzzsh_xs=null;
String qh_xcpzzsh_wznr=null;
String qh_xcpzzsh_ysyq=null;
String qh_xcpzzsh_qtyq=null;
String qh_xcpzzsh_wcsj=null;
String qh_xcpzzsh_qhbshsj=null;
String qh_xcpzzsh_qhbshr=null;
String qh_xcpzzsh_jg=null;
String qh_xcpzzsh_fyzj=null;
String qh_xcpzzsh_yjwcsj=null;
String qh_xcpzzsh_sjwcsj=null;
String qh_xcpzzsh_qhbshyj=null;
String qh_xcpzzsh_shdwbh=null;
String qh_xcpzzsh_bz=null;
String sq_dwxx_dwmc=null;
String qh_xcpzzsh_zgbmjlyj=null;
String qh_xcpzzsh_zjlyj=null;
String whereqh_xcpzzsh_shbbh=null;
whereqh_xcpzzsh_shbbh=cf.GB2Uni(request.getParameter("shbbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select qh_xcpzzsh.shbbh as qh_xcpzzsh_shbbh,qh_xcpzzsh.sqsj as qh_xcpzzsh_sqsj,qh_xcpzzsh.tbr as qh_xcpzzsh_tbr,qh_xcpzzsh.zznr as qh_xcpzzsh_zznr,qh_xcpzzsh.sl as qh_xcpzzsh_sl,qh_xcpzzsh.gg as qh_xcpzzsh_gg,qh_xcpzzsh.xs as qh_xcpzzsh_xs,qh_xcpzzsh.wznr as qh_xcpzzsh_wznr,qh_xcpzzsh.ysyq as qh_xcpzzsh_ysyq,qh_xcpzzsh.qtyq as qh_xcpzzsh_qtyq,qh_xcpzzsh.wcsj as qh_xcpzzsh_wcsj,qh_xcpzzsh.qhbshsj as qh_xcpzzsh_qhbshsj,qh_xcpzzsh.qhbshr as qh_xcpzzsh_qhbshr,qh_xcpzzsh.jg as qh_xcpzzsh_jg,qh_xcpzzsh.fyzj as qh_xcpzzsh_fyzj,qh_xcpzzsh.yjwcsj as qh_xcpzzsh_yjwcsj,qh_xcpzzsh.sjwcsj as qh_xcpzzsh_sjwcsj,qh_xcpzzsh.qhbshyj as qh_xcpzzsh_qhbshyj,qh_xcpzzsh.bz as qh_xcpzzsh_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,qh_xcpzzsh.zgbmjlyj as qh_xcpzzsh_zgbmjlyj,qh_xcpzzsh.zjlyj as qh_xcpzzsh_zjlyj ";
	ls_sql+=" from  qh_xcpzzsh,sq_dwxx";
	ls_sql+=" where qh_xcpzzsh.dwbh=sq_dwxx.dwbh and  (qh_xcpzzsh.shbbh='"+whereqh_xcpzzsh_shbbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qh_xcpzzsh_shbbh=cf.fillNull(rs.getString("qh_xcpzzsh_shbbh"));
		qh_xcpzzsh_sqsj=cf.fillNull(rs.getDate("qh_xcpzzsh_sqsj"));
		qh_xcpzzsh_tbr=cf.fillNull(rs.getString("qh_xcpzzsh_tbr"));
		qh_xcpzzsh_zznr=cf.fillNull(rs.getString("qh_xcpzzsh_zznr"));
		qh_xcpzzsh_sl=cf.fillNull(rs.getString("qh_xcpzzsh_sl"));
		qh_xcpzzsh_gg=cf.fillNull(rs.getString("qh_xcpzzsh_gg"));
		qh_xcpzzsh_xs=cf.fillNull(rs.getString("qh_xcpzzsh_xs"));
		qh_xcpzzsh_wznr=cf.fillNull(rs.getString("qh_xcpzzsh_wznr"));
		qh_xcpzzsh_ysyq=cf.fillNull(rs.getString("qh_xcpzzsh_ysyq"));
		qh_xcpzzsh_qtyq=cf.fillNull(rs.getString("qh_xcpzzsh_qtyq"));
		qh_xcpzzsh_wcsj=cf.fillNull(rs.getDate("qh_xcpzzsh_wcsj"));
		qh_xcpzzsh_qhbshsj=cf.fillNull(rs.getDate("qh_xcpzzsh_qhbshsj"));
		qh_xcpzzsh_qhbshr=cf.fillNull(rs.getString("qh_xcpzzsh_qhbshr"));
		qh_xcpzzsh_jg=cf.fillNull(rs.getString("qh_xcpzzsh_jg"));
		qh_xcpzzsh_fyzj=cf.fillNull(rs.getString("qh_xcpzzsh_fyzj"));
		qh_xcpzzsh_yjwcsj=cf.fillNull(rs.getDate("qh_xcpzzsh_yjwcsj"));
		qh_xcpzzsh_sjwcsj=cf.fillNull(rs.getDate("qh_xcpzzsh_sjwcsj"));
		qh_xcpzzsh_qhbshyj=cf.fillNull(rs.getString("qh_xcpzzsh_qhbshyj"));
		qh_xcpzzsh_bz=cf.fillNull(rs.getString("qh_xcpzzsh_bz"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		qh_xcpzzsh_zgbmjlyj=cf.fillNull(rs.getString("qh_xcpzzsh_zgbmjlyj"));
		qh_xcpzzsh_zjlyj=cf.fillNull(rs.getString("qh_xcpzzsh_zjlyj"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ����Ʒ��������������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">��˱���</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_shbbh%> </td>
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">����ʱ��</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_sqsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">���ʱ��</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_wcsj%> </td>
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">��������</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_zznr%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">����</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_sl%> </td>
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">���</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_gg%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">��ʽ</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_xs%> </td>
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">��������</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_wznr%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">��ɫҪ��</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_ysyq%> </td>
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">����Ҫ��</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_qtyq%> </td>
          </tr>
          <tr> 
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">���뵥λ</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=sq_dwxx_dwmc%> </td>
            <td width="15%" bgcolor="#CC99FF"> 
              <div align="right">���ܲ��ž������</div>
            </td>
            <td width="35%" bgcolor="#CC99FF"> <%=qh_xcpzzsh_zgbmjlyj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">�����</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_tbr%> </td>
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">�󻮲����ʱ��</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_qhbshsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">�󻮲������</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_qhbshr%> </td>
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">�۸�</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_jg%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">�����ܼ�</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_fyzj%> </td>
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">Ԥ�����ʱ��</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_yjwcsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">ʵ�����ʱ��</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_sjwcsj%> </td>
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">�󻮲�������</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_qhbshyj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="15%" bgcolor="#FFFF99"> 
              <div align="right">��ע</div>
            </td>
            <td width="35%" bgcolor="#FFFF99"> <%=qh_xcpzzsh_bz%> </td>
            <td width="15%" bgcolor="#FFFF99">&nbsp;</td>
            <td width="35%" bgcolor="#FFFF99">&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" bgcolor="#FF6699"> 
              <div align="right">�ܾ������</div>
            </td>
            <td width="35%" bgcolor="#FF6699"> <%=qh_xcpzzsh_zjlyj%> </td>
            <td width="15%" bgcolor="#FF6699"> 
              <div align="right">&nbsp;</div>
            </td>
            <td width="35%" bgcolor="#FF6699">&nbsp; </td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
