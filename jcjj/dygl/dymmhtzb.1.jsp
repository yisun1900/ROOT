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
	    ls_sql="select jc_mmydd.sfydy,(SYSDATE-jc_mmydd.dysj) dysj,jc_mmydd.clzt,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,htrq,jhazsj,mmhtje,wjhtje,blhtje,htje,azjssj,htrq,htrq+25 xhs";
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
		   jc_mmydd_htrq=cf.fillNull(rs.getString("htrq"));
		   jc_mmydd_jhazsj=cf.fillNull(rs.getString("jhazsj"));
		   jc_mmydd_mmhtje=cf.fillNull(rs.getString("mmhtje"));
		   jc_mmydd_wjhtje=cf.fillNull(rs.getString("wjhtje"));
		   jc_mmydd_blhtje=cf.fillNull(rs.getString("blhtje"));
		   hth=cf.fillNull(rs.getString("hth"));
		   htje=rs.getDouble("htje");
		   jc_mmydd_azjssj=cf.fillNull(rs.getDate("azjssj"));
		   htrq=cf.fillNull(rs.getDate("htrq"));
		   xhs=cf.fillNull(rs.getDate("xhs"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td colspan="2"> 
      <div align="center"><font size="4"><b>ľ�Ŷ�����ͬ</b></font></div>
    </td>
  </tr>
  <tr align="right"> 
    <td colspan="2"> 
      <div align="left">��ͬ��ţ�<%=hth%></div>
    </td>
  </tr>
  <tr> 
    <td width="50%">�׷����ͻ�����<%=jc_mmydd_khxm%></td>
    <td width="50%"> �ҷ��������ڴ� </td>
  </tr>
  <tr> 
    <td width="50%">��ϵ�绰��<%=jc_mmydd_lxfs%></td>
    <td width="50%">��ͬ������ţ�<%=yddbh%></td>
  </tr>
  <tr> 
    <td  width="50��">��װ��ַ��<%=jc_mmydd_fwdz%></td>
    <td width="50%">�ҷ���ϵ�绰��010��84291188ת��Ŀ����</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;Ϊά�������ߡ���Ӫ�ߺϷ�Ȩ�棬���ݡ��л����񹲺͹�������Ȩ�汣�����������л����񹲺͹���ͬ���������л����񹲺͹���Ʒ�����������йع涨��ǩ������ͬ����ͬ���ء�</td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;һ�� ��Ʒ���ơ����������������������<br>
      &nbsp;&nbsp;&nbsp;&nbsp;���� ���ʽ������ͬ�ܽ�������:<u><%=cf.NumToRMBStr(cf.doubleTrim(htje,0))%>Ԫ������<%=cf.doubleTrim(htje)+"0"%>��</u><br>
      �׷�Ӧ�ں�ͬǩ�����ո���ȫ�����<br>
      &nbsp;&nbsp;&nbsp;&nbsp;���� ˫�����μ�����<br>
      &nbsp;&nbsp;&nbsp;&nbsp;1���ҷ��ṩ��ľ��Ϊʵľ�����š���ʵľľƤΪ��Ȼ��Ʒ����װ���׷��ֳ���ľ�������ҷ�չ����Ʒ��������ɫ����΢С���죬������Χ���ҷ�ȷ���������׷��Ĳ�Ʒ�ò���չ����Ʒһ�¡�<br>
      &nbsp;&nbsp;&nbsp;&nbsp;2������ͬ��ǩ����ľ�����ҷ�רΪ�׷������Ķ���ʽ��Ʒ�������ͺš��ߴ��뱾��ͬԼ������������һ�ɲ����˻������׷�����˻����������ɵ�һ�з����ɼ׷��е��� 
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;3���ҷ����������׷�ǩ�ֺ󣬼���Ϊ��ľ�ŷ�����ȷ�ϣ��������뱾��ͬ����ͬ��Ч����Ϊ˫�����б���ͬ�����ݡ�������һ��ȷ�Ϻ󣬵����������Ը��ġ�������ģ����뾭˫��ǩ���Ͽɣ���Ķ�����ɵľ�����ʧ���ӳٽ�����������������ķ��е����׷�Ӧȷ��ʵ��ѡ�õĵز����ࣨ�ذ��ȣ���������й�ͬԼ�������Ǻϣ��������ɰ�װ�����ȵ��ȵط������С��<br>
      &nbsp;&nbsp;&nbsp;&nbsp;4���ҷ���δ�����ͻ���װ��ÿ�ӳ�һ�찴ΥԼ���ͬ���2��֧��ΥԼ��ΥԼ����߲�����ΥԼ����ܽ�<br>
      &nbsp;&nbsp;&nbsp;&nbsp;�ġ�������<u>25</u>�죬�Ա���ͬǩ��֮������㡣��󽻻�����Ϊ<u><%=xhs%></u>��ľ�Ž����󼴿ɽ��а�װ��ʵ�ʰ�װ�����ɼ׷�����װ�޽��Ⱥ���ȷ����<br>
      &nbsp;&nbsp;&nbsp;&nbsp;�塢�ͻ�������������ͻ������������˷��ɼ׷��е���<br>
      &nbsp;&nbsp;&nbsp;&nbsp;���������ص㣺Ϊ����ͬԼ���İ�װ��ַ������׷��ֳ����߱���װ��������˫��ͬ����������ͻ���װ����װʱ�ֳ���߱����������ذ塢��ש��װ��ϣ�ǽש���ꣻ����ʯ���ꣻľ���߽���������һ�Σ���ľ�Ű�װ����ɣ�����ʯ�߽���������һ�Σ���������ʯ������ɣ���<br>
      &nbsp;&nbsp;&nbsp;&nbsp;�ߡ���װ���ҷ��ӵ��׷�֪ͨ��5������Ա�������а�װ����װ����ȷ����˫�����ñ�������б��Ӧ�����̶���װ���ڡ�����׷���ԭ�����ҷ���Ա�޷����а�װ�ģ��˹�����ʧ�ɼ׷��е���ÿ����100Ԫ����Ҽơ�<br>
      &nbsp;&nbsp;&nbsp;&nbsp;�ˡ������ڣ�ľ�Ű�װ��׷�Ӧ���ҷ�������ľ�Ž������ղ�ǩ��ȷ�ϣ�ľ�ž��׷�ǩ��ȷ�Ϻ���Ϊ�����ϸ��Լ׷�ǩ������֮���𣬼��������걣���ڡ��޼׷�ǩ��ȷ�ϣ��������԰�װ���֮������㡣<br>
      &nbsp;&nbsp;&nbsp;&nbsp;�š������б���ͬ��������һ������˫��Ӧ�Ѻ�Э�̽����Э�̲��ɵģ��κ�һ�������򱻸����ڵط�Ժ�������ϡ�<br>
      &nbsp;&nbsp;&nbsp;&nbsp;ʮ������ͬһʽ�ķݣ��׷���һ�ݣ��ҷ������ݡ����ݾ�����ͬ����Ч��������ͬ��˫��ǩ�֡����º���Ч��</td>
  </tr>
  <tr>
    <td  width="50��">&nbsp;</td>
    <td width="50��">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="50��">�׷�ǩ�֣�</td>
    <td width="50��">�ҷ��������ڴ���£�</td>
  </tr>
  <tr> 
    <td  width="50��">&nbsp;&nbsp;</td>
    <td width="50��">�����ˣ�</td>
  </tr>
  <tr> 
    <td  width="50��">ǩ�����ڣ�<%=htrq%></td>
    <td width="50��">ǩ�����ڣ�<%=htrq%></td>
</table>

        <tr> 
          
  <td width="121">&nbsp; </td>
</tr>
<p>&nbsp;</p>
      </body>
</html>

