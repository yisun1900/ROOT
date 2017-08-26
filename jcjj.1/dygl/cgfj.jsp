<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ddbh=request.getParameter("ddbh");
    String jc_cgdd_khxm=null;
	Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
	try {
	    conn=cf.getConnection();
	    ls_sql="select khxm";
	    ls_sql+=" from  jc_cgdd,crm_khxx";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and ddbh='"+ddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgdd_khxm=cf.fillNull(rs.getString("khxm"));
		   
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
<title>�ڹ��Ÿ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr align="right">
    <td><div align="center"><strong>�ڹ��Ÿ���</strong></div></td>
  </tr>
  <tr align="right"> 
    <td width="34%"><div align="left">�ͻ�������<%=jc_cgdd_khxm%></div></td>
  </tr>
  <tr> 
    <td>
     <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�Ҿ����</td>
	<td  width="8%">�Ű�װλ��</td>
	<td  width="6%">�ڹ��ų���</td>
	<td  width="6%">�ڹ��ſ��</td>
	<td  width="8%">�߿���ɫ</td>
	<td  width="8%">�߿��ͺ�</td>
	<td  width="8%">������1</td>
	<td  width="8%">������2</td>
	<td  width="8%">������3</td>
	<td  width="6%">����</td>
	<td  width="24%">��ע</td>
</tr>
<%

	ls_sql="SELECT jdm_jjlbbm.jjlbmc,jdm_bgmazwzbm.bgmazwzmc,TO_CHAR(jc_ddbgmmx.bgmcd),TO_CHAR(jc_ddbgmmx.bgmkd),jdm_bgmbkysbm.bgmbkysmc,jc_ddbgmmx.bgmbkxh,jdm_bgmmbclbm.bgmmbclmc,jc_ddbgmmx.bgmmbclbm2,jc_ddbgmmx.bgmmbclbm3,jc_ddbgmmx.dj,jc_ddbgmmx.bz  ";
	ls_sql+=" FROM jc_ddbgmmx,jdm_bgmazwzbm,jdm_bgmbkysbm,jdm_bgmmbclbm,jdm_jjlbbm  ";
    ls_sql+=" where jc_ddbgmmx.bgmbkysbm=jdm_bgmbkysbm.bgmbkysbm(+) and jc_ddbgmmx.bgmazwzbm=jdm_bgmazwzbm.bgmazwzbm(+)";
    ls_sql+=" and jc_ddbgmmx.jjlbbm=jdm_jjlbbm.jjlbbm(+) and JC_DDBGMMX.bgmmbclbm1=jdm_bgmmbclbm.bgmmbclbm(+)";
    ls_sql+=" and jc_ddbgmmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
            <table width="100%" border="0">
              <tr> 
                <td width="100%"><table width="765" border="0">
                  <tr>
                    <td width="195" scope="row">С ��:</td>
                    <td width="560" scope="row">ʵ�ս�����д��&nbsp; �� &nbsp;Ǫ&nbsp; ��&nbsp; ʰ &nbsp;Ԫ�� ����</td>
                  </tr>
                </table> 
                </td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><p>�ڹ��ż�ͼ��</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p></td>
        </tr>
        <tr>
          <td>��ע��</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
              <td width="45">&nbsp;</td>
              <td width="705">1���뽫�ڹ��ŵķָ�ߴ��ʾ�������ע��ָ�ĳߴ�����Ӱ�죩��</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>2�����������ڵذ���ש�̺ú�������ڹ���Ӧ�������ڱڹ�װ���ٸ��⡣</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>3������������ڹ�ӹ�����Ϊ10�죬�߱������������װ����ǰ3��֪ͨ��</td>
            </tr>
          </table></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="151"><table width="757" border="0">
        <tr>
          <td width="175" height="15">�ͻ�ǩ�֣�</td>
          <td width="190"> ǩ�����ڣ�<%=cf.today()%></td>
          <td width="213">�Ҿ����ʦ��</td>
          <td width="161">&nbsp;</td>
        </tr>
      </table>      
    <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
