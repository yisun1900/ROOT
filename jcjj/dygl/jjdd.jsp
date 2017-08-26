<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ddbh=request.getParameter("ddbh");
    String khxm="";
	String lxfs="";
    String fwdz="";
	String jc_jjdd_htze="";
	String jc_jjdd_jhazrq="";
	String jc_jjdd_qhtsj="";
    String jhq=null;
    String jdm_jjlbbm_jjlbmc="&nbsp;";
	String jdm_jjbjmcbm_jjlbmc="";
	String sgbz="";
	String sgd="";
	String bzdh="";
	String jhq1="";
	String jhq2="";

	
    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();

	    ls_sql="select khxm,fwdz,lxfs,sgd,sgbz,jhazrq,htze,qhtsj,jhazrq-qhtsj,qhtsj+10 jhq1,qhtsj+20 jhq2";
	    ls_sql+=" from  jc_jjdd,crm_khxx,sq_dwxx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.ddbh='"+ddbh+"'";
		ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery();
	    if (rs.next())
	    {
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			jc_jjdd_htze=cf.fillNull(rs.getString("htze"));
			jc_jjdd_qhtsj=cf.fillNull(rs.getDate("qhtsj"));
			jc_jjdd_jhazrq=cf.fillNull(rs.getDate("jhazrq"));
			jhq=cf.fillNull(rs.getString("jhazrq-qhtsj"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			sgd=cf.fillNull(rs.getString("sgd"));
			jhq1=cf.fillNull(rs.getDate("jhq1"));
			jhq2=cf.fillNull(rs.getDate("jhq2"));
		
		 }
	     rs.close();
	     ps.close();

		ls_sql="select jjlbmc";
	    ls_sql+=" from  jdm_jjlbbm,jc_jjyddmx";
		ls_sql+=" where ddbh='"+ddbh+"' and jdm_jjlbbm.jjlbbm=jc_jjyddmx.jjlbbm";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jdm_jjlbbm_jjlbmc=cf.fillNull(rs.getString("jjlbmc"));
		 }
	     rs.close();
	     ps.close();
         
		 ls_sql=" select dh from sq_bzxx";
		ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			bzdh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();

		ls_sql="select bcpp";
	    ls_sql+=" from  jc_jjgtmx";
		ls_sql+=" where ddbh='"+ddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jdm_jjbjmcbm_jjlbmc=cf.fillNull(rs.getString("bcpp"));
		   
		
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 13px'>
  <tr> 
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><font size="4"><b>�����ڴ�Ҿ�/�ڹ��Ŷ�����ͬ</b></font></td>
    <td width="27%">��װ��ͬ�ţ�<%=ddbh%></td>
  </tr>
  <tr> 
    <td colspan="2">�׷����ͻ�����<%=khxm%></td>
    <td colspan="2">�� ���������ڴ�</td>
  </tr>
  <tr> 
    <td colspan="2">��ϵ�绰��<%=lxfs%></td>
    <td colspan="2">��ͬ������ţ�<%=ddbh%></td>
  </tr>
  <tr> 
    <td colspan="2">��װ��ַ��<%=fwdz%></td>
    <td colspan="2">�ҷ���ϵ�绰:010-84291188-�ͻ�����</td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 13px'>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;Ϊά�������ߡ���Ӫ�ߺϷ�Ȩ�棬���ݡ��л����񹲺͹�������Ȩ�汣�����������л����񹲺͹���ͬ���������л����񹲺͹���Ʒ����������������ط��ɡ����棬ǩ������ͬ����ͬ���ء�</td>
  </tr>
  <tr> 
    <td colspan="2">һ����Ʒ���ơ���������������Ҿ�/�ڹ��ź�ͬ��������</td>
  </tr>
  <tr> 
    <td colspan="2">��������͸��ʽ��</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1������ͬ�ܽ������ң�<u><%=cf.NumToRMBStr(cf.doubleTrim(jc_jjdd_htze,0))%></u>����<u><%=jc_jjdd_htze%></u>�����׷�Ӧ�ں�ͬǩ�����ո���ȫ�����</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2�����ͬ������������ܼ���ߣ���˫��ǩ����������ĵ��ռ׷���Ӧ���Ӽۿ�����ҷ���</td>
  </tr>
  <tr> 
    <td colspan="2">����˫����Ȩ��������</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1���ҷ����ʦ��������׷�����Ʒ��������۵Ƚ��г�ֹ�ͨ����ȷ�׷�������Ʒ��һЩ��Ҫ�����������������ڹ����ԡ����ʡ���ɫ�ȡ��ڼ׷���⡢�Ͽ�������ݺ�˫��ǩ��ȷ�ϣ�����Ϊ���б���ͬ�����ݡ�</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2���ҷ�����׷�ȷ�Ϸ�����ǩ����ͬ�󣬼��ɰ���ͼֽ��������װ���ڱ���ͬǩ����3���ڣ��׷�����ԼҾ�/�ڹ��ŵĲ��ʡ��ߴ硢��ɫ����װ�߶ȡ�����λ�õ��иĶ������֪�Ҿ����ʦ����˫��Э��ǩ������Э�顣��������޳���3�գ�������ͬ���²�Ʒ���µ�������δȫ��������ϵģ����������������ɵĲ��ϵȷ�����ʧ���ӳٽ���������е����Ρ����Ҿ�/�ڹ����Ѿ�����������и��ĵģ�����������е���Ӧ���ķ��á�</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">3�����ҷ�ԭ��δ�����ͻ���װ��ÿ�ӳ�һ�գ���ΥԼ���Ʒ2����׷�֧��ΥԼ��ΥԼ����߲��ó�����ͬ�ܽ���20%��</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">4�����ڼҾ�/�ڹ��Ų�Ʒ��רΪ�ҷ���ơ������Ĳ�Ʒ����ˣ������ҷ������Ĳ�Ʒ��˫����Լ�����Բ����ϻ��߸ò�Ʒ�������������޷�����ʹ�ã������ҷ������˻���</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">5������ͬ���¼Ҿ߲�Ʒ��Ϊ������׼�������������Ľ������β�ͬ���Ƴ�Ʒ����չ����Ʒ��΢Сɫ���������Χ�����ս������Ƴ�ƷΪ׼��</td>
  </tr>
  <tr> 
    <td colspan="2">�ġ��ͻ�������������ͻ���װ�������˷�Χ��200Ԫ/����ȡ������ã��������������������Զ���˷����顣</td>
  </tr>
  <tr> 
    <td colspan="2">�塢�����ڣ��ҷ���������Ϊ10-20�죬�ƻ�������Ϊ��<u><%=jhq1%></u> �� 
      <u><%=jhq2%></u>��</td>
  </tr>
  <tr> 
    <td colspan="2">������װ�� </td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1������ͬ���µĲ�Ʒ������Ϻ����ֳ��߱���װ�����󣬼׷�����֪ͨ�ҷ����Ű�װ���ҷ��ӵ��׷�֪ͨ��5������Ա�������а�װ����װ����ȷ����˫�����ñ�������б��Ӧ�����̶���װ���ڡ�����׷���ԭ�����ҷ���Ա�޷����а�װ�ģ��˹�����ʧ�ɼ׷��е���ÿ����100Ԫ����Ҽơ�</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2����װʱ�׷��ֳ���߱���������Ϳ�ϡ���ֽ������ϣ��ذ塢��שʩ����ϣ�����������ϣ��߽��߲�λ��װ��ϡ�</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">3����װ����Ϊ1-3�죬��һ���Զ��������϶�����顣</td>
  </tr>
  <tr> 
    <td colspan="2">�ߡ����ʽ��ȷ�����������ں�ͬ����ͬ������ǩ�֣�������ȫ�����</td>
  </tr>
  <tr> 
    <td colspan="2">�ˡ������ڣ�����ͬ���²�Ʒ��װ��Ϻ󣬼׷�Ӧ����������ղ�ǩ��ȷ�ϣ�����ͬ���µĲ�Ʒ���׷�ǩ��ȷ�Ϻ���Ϊ�����ϸ��Լ׷�ǩ������֮���𣬼��������걣���ڣ����������������Ʒ��װ���ڵı��޿�ʱ��Ϊ׼����װ��ϵ���׷�û�е���ǩ��ȷ�ϣ����ҷ�֪ͨ��������δǩ��ȷ�ϵģ��������԰�װ���֮������㡣</td>
  </tr>
  <tr> 
    <td colspan="2">�š����׽����ʽ</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1�������б���ͬ���������κ�����˫��Ӧ�Ѻ�Э�̽����Э�鲻�ɵģ��κ�һ�������򱻸����ڵ�����Ժ���ߡ�</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">2������˫�����ڲ�Υ������ͬ��ԭ����ǩ�𲹳�Э�飬������Э���뱾��ͬ�й�������㣣�������Э��ִ�С�</td>
  </tr>
  <tr> 
    <td colspan="2">ʮ������Լ��</td>
  </tr>
  <tr> 
    <td width="3%">&nbsp;</td>
    <td width="97%">1����Ҿ�Ϊ�Ǿ�ϸ�ӹ���Ʒ��������ǽʽ�Ҿ߲�����ǽ��ÿ������2-3���ֵĹ��շ죬�Է��������ӡ�</td>
  </tr>
  <tr> 
    <td colspan="2">ʮһ������ͬ��˫��ǩ�֡������Ҽ׷�֧��ȫ���������Ч��</td>
  </tr>
  <tr> 
    <td colspan="2">ʮ��������ͬһʽ�ķݣ��׷�����һ�ݣ��ҷ��������ݣ����ݾ�����ͬ�ķ���Ч����</td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 13px'>
  <tr> 
    <td width="60">&nbsp;</td>
    <td colspan="2">����һ���Ҿߺ�ͬ�������˱�Ӧ�ɿͻ�ǩ��ȷ�ϣ�</td>
    <td width="410">���������Ҿ����ͼ����ͼӦ�ɿͻ�ǩ��ȷ�ϣ�</td>
  </tr>
  <tr>
    <td width="60">&nbsp;</td>
    <td width="300">&nbsp;</td>
    <td width="164">&nbsp;</td>
    <td width="410">&nbsp;</td>
  </tr>
  <tr> 
    <td width="60">&nbsp;</td>
    <td width="300">�׷�ǩ�֣�</td>
    <td width="164">&nbsp;</td>
    <td width="410">�ҷ��������ڴ�</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>ǩ�����ڣ�<%=cf.today()%></td>
    <td>&nbsp;</td>
    <td>�����ˣ�</td>
  </tr>
</table>
</body>
</html>
