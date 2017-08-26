<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String jc_mmydd_khxm=null;
String jc_mmydd_lxfs=null;
String jc_mmydd_fwdz=null;
String jc_mmydd_jhccsj=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	    conn=cf.getConnection();
	    ls_sql="select khxm,lxfs,fwdz,jhccsj";
	    ls_sql+=" from  jc_mmydd";
		ls_sql+=" where yddbh='"+yddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_mmydd_lxfs=cf.fillNull(rs.getString("lxfs"));
		   jc_mmydd_fwdz=cf.fillNull(rs.getString("fwdz"));
		   jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		   
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
<title>�����ڴ�Ҿ�/�ڹ��Ŷ�����ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr align="right">
    <td><div align="center"><strong>Ԫ �� ľ �� �� �� ��</strong></div></td>
  </tr>
  <tr align="right"> 
    <td width="34%"><div align="right"><strong>NO.��<%=yddbh%></strong></div></td>
  </tr>
  <tr> 
    <td><table width="100%" border="0">
      <tr>
        <td width="280" scope="row">�ͻ�������<%=jc_mmydd_khxm%></td>
        <td width="265" scope="row">��ϵ�绰��<%=jc_mmydd_lxfs%></td>
        <td width="200">����ʱ�䣺<%=jc_mmydd_jhccsj%></td>
      </tr>
      <tr>
        <td colspan="2" scope="row">ʩ����ַ��<%=jc_mmydd_fwdz%></td>
        <td>�ֳ��೤/�绰��</td>
      </tr>
      <tr>
        <td colspan="3" scope="row"> <div align="left"><strong>��ͻ�ȷ������ԭ���ڳߴ硢�ذ壨��ש����ȣ�ʩ����Աȷ�����޸ĺ��Ŷ�����װ��ذ壩�ߴ�ʩ������ȷ��ǩ�֡� </strong></div></td>
        </tr>
    </table>
    </td>
  </tr>
  <tr> 
    <td>
      <table width="100%" border="0">
        <tr> 
          <td><table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">����</td>
	<td  width="4%">˫��</td>
	<td  width="8%">ԭ�Ŷ����ھ����ߴ磨mm��</td>
	<td  width="5%">�� �ģ�mm��</td>
	<td  width="6%">�޸ĺ��Ŷ��ߴ磨mm��</td>
	<td  width="4%">���ȳߴ�</td>

</tr>
     <%

	ls_sql="SELECT rownum,azwzmc,kqfxmc,'','',jc_mmdgdmx.qh||'��'||jc_mmdgdmx.mdk||'��'||jc_mmdgdmx.mdg md,dczlmc,'',''  ";
	ls_sql+=" FROM jdm_azwzbm,jdm_kqfxbm,jc_mmdgdmx,jdm_dczlbm ";
    ls_sql+=" where jdm_azwzbm.azwzbm=jc_mmdgdmx.azwzbm and jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by rownum";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();

%>
          </table>
          <table width="100%" border="0">
              <tr> 
                <td width="100%"><table width="765" border="0">
                  <tr>
                    <td scope="row"><div align="left">��ע��</div>                      </td>
                    </tr>
                </table> 
                </td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><strong>������ʾ�������������Ǹ���ľ�ذ壬1.5m��Χ�ڵ�������2--3mm������Ե��������ƽ���� �ۺ����绰��84291188������Ŀ����</strong></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="151"><table width="757" border="0">
        <tr>
          <td width="175" height="15">�ͻ�ǩ�֣�</td>
          <td width="190">�ֳ��೤ǩ�֣�</td>
          <td width="213">����ʦǩ�֣�</td>
          <td width="161">����ʦ�绰��</td>
        </tr>
      </table>      
    <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
