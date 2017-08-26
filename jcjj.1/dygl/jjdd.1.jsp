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

	
    Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
    try {
	    conn=cf.getConnection();
	    ls_sql="select khxm,fwdz,lxfs,sgd,sgbz,jhazrq,htze,qhtsj,jhazrq-qhtsj";
	    ls_sql+=" from  jc_jjdd,crm_khxx,sq_dwxx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.ddbh='"+ddbh+"'";
		ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td colspan="2"> <div align="center"> <strong>�����ڴ�Ҿ߶�����ͬ</strong></div></td>
  </tr>
  <tr align="right"> 
    <td colspan="2"><div align="left"></div></td>
  </tr>
  <tr> 
    <td width="99%"><table width="965" border="0">
        <tr> 
          <th scope="row"></th>
          <td>��ͬ��ţ�<%=ddbh%></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <th width="34" scope="row"></th>
          <td width="477"> �׷����ͻ�����<%=khxm%> </td>
          <td width="440"> �� ���������ڴ�װ�ι��̣����������޹�˾</td>
        </tr>
        <tr> 
          <th scope="row"></th>
          <td>��ϵ�绰��<%=lxfs%> </td>
          <td> �ֳ��೤/�绰��<u><%=sgbz%><%=bzdh%></u> </td>
        </tr>
        <tr> 
          <th scope="row"></th>
          <td>��װ��ַ��<%=fwdz%> </td>
          <td> ��װʱ�䣺<%=jc_jjdd_jhazrq%></td>
        </tr>
      </table>
      <div align="center"></div></td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2"> <table width="100%" border="0">
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2"> &nbsp;&nbsp;&nbsp;Ϊά�������ߡ���Ӫ�ߺϷ�Ȩ�棬���ݡ��л����񹲺͹�������Ȩ�汣�����������л����񹲺͹���ͬ���������л����񹲺͹���Ʒ����������������ط��ɡ����棬ǩ������ͬ����ͬ���ء�</td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td colspan="2">һ����Ʒ���ơ���������������Ҿߺ�ͬ����������</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">��������͸��ʽ��</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td>1������ͬ�ܽ�������<u>&nbsp;&nbsp;&nbsp;<%=cf.NumToRMBStr(cf.doubleTrim(jc_jjdd_htze,0))%>&nbsp;&nbsp;&nbsp;</u>����<%=jc_jjdd_htze%>���׷�Ӧ�ں�ͬǩ�����ո���ȫ�����</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>2�����ͬ������������ܼ���ߣ���˫��ǩ����������ĵ��ռ׷���Ӧ���Ӽۿ�����ҷ���</td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td colspan="2">����˫����Ȩ��������</td>
        </tr>
        <tr> 
          <td width="4%">&nbsp;</td>
          <td colspan="2"> <table width="100%" border="0">
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">1���ҷ����ʦ��������׷�����Ʒ��������۵Ƚ��г�ֹ�ͨ����ȷ�׷�������Ʒ��һЩ��Ҫ�������繦���ԡ����ʡ���ɫ�ȡ��ڼ׷���⡢�Ͽ�������ݺ�˫��ǩ��ȷ�ϣ���Ϊ���к�ͬ�����ݡ�</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">2����Ʒ���һ��˫��ǩ��ȷ�ϣ�������һ����Ҫ���ģ�������ǩ����ͬ��3�����������������޳���3�գ���Ʒ���µ�������δȫ��������ϵģ����������������ɵĲ��ϵȷ�����ʧ���ӳٽ���������е����Ρ����Ҿ��Ѿ�����������и��ĵģ�����������е����Ͽ�˹��ѡ����Ͽ�˹��Ѱ���ͬ�ܼۿ��60%�ơ�</td>
              </tr>
              <tr> 
                <td width="4%" height="19">&nbsp;</td>
                <td width="96%" height="19">3���ҷ��Ѱ���������������ϣ����׷��ֳ����߱���װ�������ӳٰ�װ�������������Ϊ�ҷ�ΥԼ��</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>4�����ҷ�ԭ��δ�����ͻ���װ����֧���׷�ΥԼ���Ʒ2���ΥԼ��ΥԼ����߲��ó�����ͬ�ܽ���20%��</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>5���򱾺�ͬ���ṩ�ļҾ߲�Ʒ������ʽ��Ʒ�����ﵽ�����������������һ�㲻���˻���</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>6���Ҿ߲�Ʒ��Ϊ������׼�������������Ľ������β�ͬ������չ����Ʒ��΢Сɫ���������Χ����ʵ��Ϊ׼��</td>
              </tr>
              <tr> 
                <td width="4%">&nbsp;</td>
                <td width="96%">7�� �ҷ��Ա������廷�ڵĿͻ�����ͻ������ڳ����˷�Χ��������ȡԶ�̷ѡ�</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">�ġ��ͻ�������������ͻ���װ�������˷�Χ���շ�200Ԫ/���������������������Զ�̷����顣</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">�塢������: �ҷ���������Ϊ<%=jhq%>��,�ڣ�<%=jc_jjdd_jhazrq%>����</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">������װ���ҷ��谴�պ�ͬԼ��ʱ�����Ű�װ����װʱ�׷��ֳ���߱���������Ϳ�ϡ���ֽ������ϣ�<br>
            �ذ塢��שʩ����ϣ�����������ϣ��߽��߲�λ��װ��ϡ��ҷ����Ҿ��˵ְ�װ�ֳ��󼴿ɵ��հ�װ����װ����Ϊ1��3�졣���������϶�ĳ���<br></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">�ߡ������ڣ��ԼҾ߰�װ��ϣ��׷�ǩ������֮���𣬼��������걣���ڡ�</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">�ˡ����׽����ʽ</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>1�������б���ͬ���������κ�����˫��Ӧ�Ѻ�Э�̽����Э�鲻�ɵģ��κ�һ�������򱻸����ڵ�����Ժ���ߡ�</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>2������˫�����ڲ�Υ������ͬ��ԭ����ǩ�𲹳�Э�飬������Э���뱾��ͬ�й�������㣣�������Э��ִ�С�</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">�š���ͬ˵��</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>��Ҿ�Ϊ�Ǿ�ϸ�ӹ���Ʒ��������ǽʽ�Ҿ߲�����ǽ��ÿ������2��3���ֵĹ��շ죬���������ӡ�</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2">ʮ������ͬ��˫��ǩ�֡������Ҽ׷�֧��ȫ���������Ч������ͬһʽ�ķݣ��׷�����һ�ݣ��ҷ��������ݣ����ݾ�����ͬ�ķ���Ч</td>
        </tr>
        <tr> 
          <td width="4%" rowspan="3">&nbsp;</td>
          <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;����<BR> &nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">����һ���Ҿߺ�ͬ�������˱�Ӧ�ɿͻ�ǩ��ȷ�ϣ�</td>
        </tr>
        <tr> 
          <td colspan="2">���������Ҿ����ͼ����ͼӦ�ɿͻ�ǩ��ȷ�ϣ�</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td colspan="2"><strong> </strong></td>
  </tr>
  <tr> 
    <td colspan="2"><div align="left"><strong> </strong></div></td>
  </tr>
  <tr> 
    <td colspan="2"><table width="757" border="0">
        <tr> 
          <th width="26" scope="row">&nbsp;</th>
          <td width="721">&nbsp; </td>
        </tr>
      </table>
      <table width="952" border="0">
        <tr> 
          <td width="60">&nbsp;</td>
          <td width="300">�׷�ǩ�֣�</td>
          <td width="164">&nbsp;</td>
          <td width="410">�ҷ��������ڴ�װ�ι��̣����������޹�˾</td>
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
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
