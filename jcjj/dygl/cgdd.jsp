<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ddbh=request.getParameter("ddbh");
    String jc_cgdd_khxm=null;
	String jc_cgdd_lxfs=null;
    String jc_cgdd_fwdz=null;
    String jc_cgdd_jhazrq=null;
	String jc_cgdd_cghtze=null;
	String jc_cgdd_dqhtze=null;
	String jc_cgdd_wjhtze=null;
	String jc_cgdd_htze=null;
    String jc_cgjgb_cgmc=null;
	String jc_cgyddmx_zj=null;

    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();
	     ls_sql="select khxm,fwdz,lxfs,jhazrq,cghtze,dqhtze,wjhtze,htze";
	    ls_sql+=" from  jc_cgdd";
		ls_sql+=" where ddbh='"+ddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgdd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_cgdd_fwdz=cf.fillNull(rs.getString("fwdz"));
		   jc_cgdd_lxfs=cf.fillNull(rs.getString("lxfs"));
		   jc_cgdd_jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		   jc_cgdd_cghtze=cf.fillNull(rs.getString("cghtze"));
		   jc_cgdd_dqhtze=cf.fillNull(rs.getString("dqhtze"));
		   jc_cgdd_wjhtze=cf.fillNull(rs.getString("wjhtze"));
		   jc_cgdd_htze=cf.fillNull(rs.getString("htze"));

		 }
	     rs.close();
	     ps.close();
        
		ls_sql="select jc_cgjgb.cgmc,jc_cgyddmx.cgbm";
	    ls_sql+=" from  jc_cgjgb,jc_cgyddmx";
		ls_sql+=" where jc_cgjgb.cgbm=jc_cgyddmx.cgbm and ddbh='"+ddbh+"' ";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgjgb_cgmc=cf.fillNull(rs.getString("cgmc"));

		 }
	     rs.close();
	     ps.close();

		ls_sql="select tmcd*tmdj";
	    ls_sql+=" from  jc_cgyddmx";
		ls_sql+=" where  ddbh='"+ddbh+"' ";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgyddmx_zj=cf.fillNull(rs.getString("tmcd*tmdj"));

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
<title>���񶨹���ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td colspan="3"> 
      <div align="center"> <strong>���񶩹���ͬ</strong> </div>
    </td>
  </tr>
  <tr align="right"> 
    <td colspan="3">��ͬ��ţ�<%=ddbh%></td>
  </tr>
  <tr>

    <td width="62%">�׷����ͻ�����<%=jc_cgdd_khxm%></td>
    <td width="34%"> �ҷ������������ڴ�װ���������ι�˾ </td>
  </tr>
  <tr>

    <td width="62%">��ϵ�绰��<%=jc_cgdd_lxfs%></td>
    <td width="34%">��װʱ�䣺<%=jc_cgdd_jhazrq%></td>
  </tr>
  <tr> 
    <td colspan="3">��װ��ַ��<%=jc_cgdd_fwdz%></td>
  </tr>
  <tr> 
    <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;Ϊά�������ߡ���Ӫ�ߺϷ�Ȩ�棬���ݡ��л����񹲺͹�������Ȩ�汣�����������л����񹲺͹���ͬ���������л����񹲺͹���Ʒ�����������йع涨��ǩ������ͬ����ͬ���ء�</td>
  </tr>
  <tr> 
    <td colspan="3">
      <table width="100%" border="0">
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%">һ����Ʒ���ơ���������������������� </td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%"><strong>�����׷�Ȩ��������</strong> </td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%"> 
            <table width="100%" border="0">
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">1�� 


�׷���ȨҪ��������������òġ�����ṹ���������ҷ������еĳ�������һ�£��׷�����Ҫ����⣩��</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">2�� 


�׷���ȨҪ���ҷ������ʦ���ճ����Ĳ��ֺ���ؽ�����ƣ�����ϸ������ͻ������׷�ǩ��ȷ�Ϻ󷽿�������</td>
              </tr>
              <tr> 
                <td width="4%" height="19">&nbsp;</td>
                <td width="96%" height="19">3�� 


�׷��Թ��ĵ�����ˮ�۵Ȳ�Ʒ��������ǩ������֮ͬǰ�����ʦ�ṩ�Թ���Ʒʵ����ҳ�����γߴ磬���ں�ͬ��ע������ǩ��ȷ�ϡ�</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">4�� 


����׷��Թ��Ĳ�Ʒ�ڰ�װʱδ��ʱ��λ�������ҷ��������Ű�װ������׷���ȡ100Ԫ/�εķ��á�</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><strong>����<strong>�ҷ�Ȩ��������</strong> </strong> </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><table width="100%" border="0">
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%">1�� 


�ҷ�����׷�ȷ�Ϸ����󣬼��ɰ���˫��ǩ��ȷ�ϵ�ͼֽ��������װ���ֳ����԰�װ�߶Ȼ򰲷�λ���иĶ�����׷�ǩ��ȷ�ϣ����Թ��ӳߴ��иĶ������ȸ�֪���ʦ����˫�����ۺ󣬼׷�ǩ���Ͽɣ��������ķѽ����ҷ�������µ��������ɰ�װ��</td>
              </tr>
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%">2�� 


�ҷ��谴�պ�ͬԼ��ʱ�����Ű�װ������İ�װ����Ϊ1��5�졣�����ҷ�ԭ����ɵ����ڰ�װ����֧���׷�ΥԼ���ͬ���0.2%��ΥԼ��</td>
              </tr>
              <tr>
                <td width="4%" height="19">&nbsp;</td>
                <td width="96%" height="19">3�� 


���ڳ���Ϊ���Ʋ�Ʒ������������ز�Ʒ�������⣬�ҷ������˻���</td>
              </tr>
              <tr>
                <td width="4%">&nbsp;</td>
                <td width="96%">4�� 


����������ͻ���װ�������˷�Χ���շ�200Ԫ/���������������������Զ�̷����顣</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>5��


�԰�װ��ϼ׷�ǩ��ȷ��֮���𣬼׷��ĳ��񼴽����ۺ����ڣ�������Ϊ���꣬����ά����</td>
              </tr>
          </table></td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="96%"> �ġ�������װ����³��� <BR>
          &nbsp;&nbsp;&nbsp;&nbsp;1�� ˫��Э�̽����<BR>&nbsp;&nbsp;&nbsp;&nbsp;2�� �ύ�����ٲ�ίԱ���ٲá� </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td colspan="3"><div align="left"><strong>    <strong>�ر�˵����ÿ�׳��������ۼƸ�����̨��10�L������15�L��</strong> </strong></div></td>
  </tr>
  <tr> 
    <td colspan="3"> �˵�Ϊ�������ݣ������Ʊ��棬����ά��������δ��ۺ����绰��84291188-��Ŀ������</td>
  </tr>
  <tr> 
    <td colspan="3"><table width="757" border="0">
      <tr>
        <th width="26" scope="row">&nbsp;</th>
        <td width="721"><strong>����Ӧ���������£���ϸ���ϼ���������</strong> </td>
      </tr>
    </table>
      <table width="87%" height="37" border="1" cellspacing="0" bordercolor="#000000">
        <tr>
          <td width="91" height="18"> ������ʽ </td>
          <td width="113"><div align="center"> ̨�沿�ּ۸� </div></td>
          <td width="120"><div align="center"> ���岿�ּ۸� </div></td>
          <td width="96"><div align="center"> ������ּ۸� </div></td>
          <td width="115"> ������ˮ�ۼ۸� </td>
          <td width="125"><div align="center"> �ܼ� </div></td>
        </tr>
        <tr>
          <td height="17"><%=jc_cgjgb_cgmc%></td>
          <td><%=jc_cgyddmx_zj%></td>
          <td><%=jc_cgdd_cghtze%></td>
          <td><%=jc_cgdd_wjhtze%></td>
          <td><%=jc_cgdd_dqhtze%></td>
          <td><%=jc_cgdd_htze%></td>
        </tr>
      </table>
      <table width="660" border="0">
        <tr>
          <td width="32">&nbsp;</td>
          <td width="204">�׷�ǩ�֣�</td>
          <td width="70">&nbsp;</td>
          <td width="336">�ҷ������������ڴ�װ���������ι�˾�����£�</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>�����ˣ�</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>ǩ�����ڣ�<%=cf.today()%></td>
        </tr>
      </table>      <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
