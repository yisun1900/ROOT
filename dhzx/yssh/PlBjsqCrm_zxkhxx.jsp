<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String[] khbh = request.getParameterValues("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxzt=null;
String bjbbh=null;
String ysshbz=null;
String ssfgs=null;
String dqbm=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="select zxzt,bjbbh,ysshbz,ssfgs";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxzt=cf.fillNull(rs.getString("zxzt"));
			bjbbh=cf.fillNull(rs.getString("bjbbh"));
			ysshbz=cf.fillNull(rs.getString("ysshbz"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
		}
		rs.close();
		ps.close();

		ls_sql="select dqbm";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dqbm=cf.fillNull(rs.getString("dqbm"));
		}
		rs.close();
		ps.close();

		if (zxzt.equals("3"))//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		{
			out.println("���󣡿ͻ���ǩԼ:"+khbh[i]);
			return;
		}
		else if (zxzt.equals("4"))//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		{
			out.println("���󣡿ͻ�[ǩ��ʧ��]:"+khbh[i]);
			return;
		}
		if (ysshbz.equals("Y"))
		{
			out.println("����Ԥ�������:"+khbh[i]);
			return;
		}


		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_bjbbsqjl";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("��������Ȩ:"+khbh[i]);
			return;
		}
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>���۰汾��Ȩ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
    <div align="center"><strong>���۰汾��Ȩ </strong></div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SavePlBjsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr>
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>���۰汾��</td>
              <td colspan="3" bgcolor="#FFFFFF">
			  <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:522PX">
                <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.dqbm='"+dqbm+"' order by bj_dzbjbb.dqbm,bjbbh","");
%>
              </select></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">������ע</td>
              <td colspan="3" bgcolor="#FFFFFF"><textarea name="sqbz" cols="71" rows="3"></textarea></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#CC0000">*</font><font color="#0000CC">��Ȩ��</font></td>
              <td width="31%" bgcolor="#FFFFFF"><input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="10" readonly></td>
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">��Ȩʱ��</font></td>
              <td width="31%" bgcolor="#FFFFFF"><input type="text" name="sqsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
			  <%
			  for (int i=0;i<khbh.length ;i++ )
			  {
				  %>
				<input type="hidden" name="khbh"  value="<%=khbh[i]%>" >
				  <%
			  }
			  %>
              <input type="button"  value="����" onClick="f_do(editform)"></td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("������[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("������[��Ȩ��]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[��Ȩʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "��Ȩʱ��"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
