<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yddbh=request.getParameter("yddbh");
    String jc_mmydd_khxm=null;
	String jc_mmydd_lxfs=null;
    String jc_mmydd_fwdz=null;
	String jc_mmydd_jhtzshsj=null;
	String jc_mmydd_htrq=null;
    String jc_mmydd_jhazsj=null;
	String jc_mmydd_mmhtje=null;
	String jc_mmydd_wjhtje=null;
	String jc_mmydd_blhtje=null;
    double htje=0;  
    String jc_mmydd_azjssj=null;
    String htrq=null;
	String xhs=null;
	String jhsj=null;
	String hth=null;
	String jhq=null;
	String sfydy=null;
	String clzt=null;
	double dysj=0;
    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();
	    ls_sql="select jc_mmydd.sfydy,(SYSDATE-jc_mmydd.dysj) dysj,jc_mmydd.clzt,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,htrq,jhazsj,mmhtje,wjhtje,blhtje,htje,azjssj,htrq,htrq+25 jhsj,htrq+28 xhs";
	    ls_sql+=" from  jc_mmydd,crm_khxx";
		ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and yddbh='"+yddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   sfydy=cf.fillNull(rs.getString("sfydy"));
		   clzt=cf.fillNull(rs.getString("clzt"));
		   dysj=rs.getDouble("dysj");
		   jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_mmydd_fwdz=cf.fillNull(rs.getString("fwdz"));
		   jc_mmydd_lxfs=cf.fillNull(rs.getString("lxfs"));
		   jc_mmydd_htrq=cf.fillNull(rs.getDate("htrq"));
		   jc_mmydd_jhazsj=cf.fillNull(rs.getString("jhazsj"));
		   jc_mmydd_mmhtje=cf.fillNull(rs.getString("mmhtje"));
		   jc_mmydd_wjhtje=cf.fillNull(rs.getString("wjhtje"));
		   jc_mmydd_blhtje=cf.fillNull(rs.getString("blhtje"));
		   hth=cf.fillNull(rs.getString("hth"));
		   htje=rs.getDouble("htje");
		   jc_mmydd_azjssj=cf.fillNull(rs.getDate("azjssj"));
		   htrq=cf.fillNull(rs.getDate("htrq"));
		   xhs=cf.fillNull(rs.getDate("xhs"));
		   jhsj=cf.fillNull(rs.getDate("jhsj"));
		 }
	     rs.close();
	     ps.close();

		 if (clzt.compareTo("04")<0)
		 {
			out.println("����δǩ����ͬ�����ܴ�ӡ");
			return;
		 }
		 if (sfydy.equals("Y"))
		 {
		 }
		 else{
			ls_sql="update jc_mmydd set sfydy='Y',dysj=SYSDATE";
			ls_sql+=" where  yddbh='"+yddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		 }


	     ls_sql=" select jhazsj-htrq from jc_mmydd";
	     ps= conn.prepareStatement(ls_sql);
	     rs =ps.executeQuery(ls_sql);
	     if (rs.next())
	     {
		     jhq=cf.fillNull(rs.getString("jhazsj-htrq"));
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
<title>ľ�ź�ͬ��ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><font size="4"><b>Ԫ �� ľ �� �� �� �� ͬ</b></font></td>
    <td width="27%">��װ��ͬ�ţ�<%=hth%></td>
  </tr>
  <tr> 
    <td colspan="2">�׷����ͻ�����<%=jc_mmydd_khxm%></td>
    <td colspan="2">�� ���������ڴ�װ�ι��̣����������޹�˾</td>
  </tr>
  <tr> 
    <td colspan="2">��ϵ�绰��<%=jc_mmydd_lxfs%></td>
    <td colspan="2">��ͬ������ţ�<%=yddbh%></td>
  </tr>
  <tr> 
    <td colspan="2">ʩ����ַ��<%=jc_mmydd_fwdz%></td>
    <td colspan="2">�ҷ���ϵ�绰:010-84291188-�ͻ�����</td>
  </tr>
  <tr>
    <td colspan="4">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;Ϊά�������ߡ���Ӫ�ߺϷ�Ȩ�棬���ݡ��л����񹲺͹�������Ȩ�汣�����������л����񹲺͹���ͬ���������л����񹲺͹���Ʒ����������������ط��ɡ����棬ǩ������ͬ����ͬ���ء� 
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;һ����Ʒ���ơ��������������ľ�ź�ͬ�������� <br>
      &nbsp;&nbsp;&nbsp;&nbsp;�������ʽ������ͬ�ܽ������ң�<u><%=cf.NumToRMBStr(cf.doubleTrim(htje,0))%></u>����<u><%=cf.doubleTrim(htje)+"0"%></u>�����׷�Ӧ�ں�ͬǩ�����ո���ȫ����� 
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;����˫�����μ����� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="4"> 
      <table width="100%" border="0" style='FONT-SIZE: 14px'>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%"> 1������ͬ����ʵľ�����Ų�Ʒ��Ϊ������׼�������������Ľ������β�ͬ���Ƴ�Ʒ����չ����Ʒ��΢Сɫ���������Χ���ҷ�ȷ���������׷��Ĳ�Ʒ�ò���չ����Ʒһ�£����ս������Ƴ�ƷΪ׼�� 
          </td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">2������ͬ���µ�ľ�����ҷ�רΪ�׷������Ķ���ʽ��Ʒ�������ͺš��ߴ��뱾��ͬԼ������������һ�ɲ����˻������׷�����˻����������ɵ�һ�з����ɼ׷��е���</td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">3���ҷ����������׷�ǩ�ֺ󣬼���Ϊ��ľ�ŷ�����ȷ�ϣ��������뱾��ͬ����ͬ��Ч����Ϊ˫�����б���ͬ�����ݡ�������һ��ȷ�Ϻ󣬵����������Ը��ġ�������ģ����뾭˫��ǩ���Ͽɣ���Ķ�����ɵľ�����ʧ���ӳٽ�����������������ķ��е����׷�Ӧȷ��ʵ��ѡ�õĵز����ࣨ�ذ��ȣ���������й�ͬԼ�������Ǻϣ����������ɰ�װ�����ȵ��ȵط������С�ĺ���ɼ׷��Ը���</td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">4���ҷ���δ�����ͻ���װ��ÿ�ӳ�һ�찴ΥԼ���ͬ���2��֧��ΥԼ��ΥԼ����߲�����ΥԼ����ܽ���20%��</td>
        </tr>
        <tr> 
          <td width="5%">&nbsp;</td>
          <td width="95%">5���ҷ�����׷�ȷ�Ϸ�����ǩ����ͬ�󣬼�����������װ���ڱ���ͬǩ����3���ڣ��׷�����ľ�ŵĲ��ʡ��ߴ硢��ɫ����װλ���иĶ������֪������Ա����˫��Э��ǩ������Э�顣��׷��Ķ������ڱ���ͬǩ�����պ����������Ʒ���µ�������δȫ��������ϵģ����������������ɵĲ��ϵȷ�����ʧ���ӳٽ����ȳе����Ρ���ľ���Ѿ�����������и��ĵģ�����������е���Ӧ���ķ��á�</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td colspan="4"> &nbsp;&nbsp;&nbsp;&nbsp;�ġ��ҷ���������Ϊ25-35�죬�ƻ���������Ϊ��<u><%=jhsj%></u>����ٽ�����Ϊ��<u><%=xhs%></u>�� 
      ľ�Ž����󼴿ɽ��а�װ����װ����Ϊ1-5�죬���������ɼ׷�����װ�޽��Ⱥ���ȷ����֪ͨ�ҷ��� <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;�塢�ͻ�������������ͻ��������˷�Χ��200Ԫ/�μ���������ã������������������Զ���˷����顣 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;���������ص㣺Ϊ����ͬԼ���İ�װ��ַ������׷��ֳ����߱���װ��������˫��ͬ����������ͻ���װ����װʱ�䳬����ͬ���������������ϵģ���֧��100Ԫ/��/�µı��ܷ��á���װʱ�ֳ���߱����������ذ塢��ש��װ��ϣ�ǽש���ꣻ����ʯ���ꣻľ���߽���������һ�Σ���ľ�Ű�װ����ɣ�����ʯ�߽���������һ�Σ���������ʯ������ɣ��� 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;�ߡ���װ���ҷ��ӵ��׷�֪ͨ��5������Ա�������а�װ����װ����ȷ����˫�����ñ�������б��Ӧ�����̶���װ���ڡ�����׷���ԭ�����ҷ���Ա�޷����а�װ�ģ��˹�����ʧ�ɼ׷��е���ÿ����100Ԫ����Ҽơ� 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;�ˡ������ڣ�ľ�Ű�װ��׷�Ӧ������ҷ�������ľ�Ž������ղ�ǩ��ȷ�ϣ�ľ�ž��׷�ǩ��ȷ�Ϻ���Ϊ�����ϸ��Լ׷�ǩ������֮���𣬼��������걣���ڣ����������������Ʒ��װ���ڵı��޿�ʱ��Ϊ׼����װ��ϵ���׷�û�е���ǩ��ȷ�ϣ����ҷ�֪ͨ��������δǩ��ȷ�ϵģ��������԰�װ���֮������㡣 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;�š������б���ͬ��������һ������˫��Ӧ�Ѻ�Э�̽����Э�̲��ɵģ��κ�һ�������򱻸����ڵط�Ժ�������ϡ� 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;ʮ������ͬһʽ�ķݣ��׷���һ�ݣ��ҷ������ݡ����ݾ�����ͬ����Ч���� <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;ʮһ������Լ�� <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1��ľ��ʵľľƤ��������Ȼ���ʣ�������ɫ���ڲ��죬��ַͬ���ò�ӦΪͬһɫ�š�����������棻 
      <BR>
      &nbsp;&nbsp;&nbsp;&nbsp;ʮ��������ͬ��˫��ǩ�֡������Ҽ׷�֧��ȫ���������Ч�� </td>
  </tr>
  <tr> 
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2">�׷�ǩ�֣�</td>
    <td colspan="2">�ҷ��������ڴ�װ�ι��̣����������޹�˾�����£�</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td colspan="2">�����ˣ�</td>
  </tr>
  <tr> 
    <td colspan="2">ǩ�����ڣ�<%=htrq%></td>
    <td colspan="2">ǩ�����ڣ�<%=htrq%></td>
  </tr>
</table>
</body>
</html>

