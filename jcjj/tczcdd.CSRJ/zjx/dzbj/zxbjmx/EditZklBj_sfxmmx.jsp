<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String sfxmbm=null;
double zqsfje=0;
double dxzkl=0;
double sfje=0;
String sflx=null;
String bz=null;
String dqbm=null;
String sfkdz=null;
double zdzk=0;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfkdz,zdzk,khbh,sfxmbm,DECODE(bj_sfxmmx.sflx,'1','ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰��(�ٷֱ�)','4','�̶����(���ɸ�)','5','�����(�ٷֱ�)') sflx,zqsfje,dxzkl,sfje,bz ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sfxmbm='"+wheresfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfkdz=cf.fillNull(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");
		khbh=cf.fillNull(rs.getString("khbh"));
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		sfje=rs.getDouble("sfje");
		sflx=cf.fillNull(rs.getString("sflx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
	if (!sfkdz.equals("Y"))
	{
		out.println("���󣡱���ܴ���");
		return;
	}


	ls_sql="select dqbm";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.ssfgs=sq_dwxx.dwbh and  (khbh='"+wherekhbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �����շ���Ŀ���������ۿ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditZklBj_sfxmmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">�ͻ����</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" readonly>
              </td>
              <td width="20%"> 
                <div align="right"></div>
              </td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000FF">�շ���Ŀ</font></td>
              <td width="33%"> 
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX"  disabled>
                  <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmbm",sfxmbm);
%> 
                </select>
              </td>
              <td align="right" width="20%"><font color="#0000FF">�շ�����</font></td>
              <td width="30%"> 
                <input name="sflx" type="text" id="sflx" value="<%=sflx%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000FF">��ǰ�շѽ��</font></td>
              <td width="33%"> 
                <input type="text" name="zqsfje" size="20" maxlength="17"  value="<%=zqsfje%>" readonly>
              </td>
              <td align="right" width="20%"><font color="#0000FF">�ۺ��շѽ��</font></td>
              <td width="30%"> 
                <input type="text" name="sfje" size="20" maxlength="17"  value="<%=sfje%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000FF">��������ۿ�</font></td>
              <td width="33%"> 
                <input type="text" name="zdzk" size="10" maxlength="8"  value="<%=zdzk%>" readonly>
              </td>
              <td align="right" width="20%">�����ۿ���</td>
              <td width="30%"> 
                <input type="text" name="dxzkl" size="10" maxlength="8"  value="<%=dxzkl%>" onChange="calValue(insertform)">
                ��>0��<=10��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wheresfxmbm"  value="<%=wheresfxmbm%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	var sfje=FormName.zqsfje.value*FormName.dxzkl.value/10.0;
	sfje=round(sfje,2);

	FormName.sfje.value=sfje;
}    

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.zqsfje)=="") {
		alert("������[��ǰ�շѽ��]��");
		FormName.zqsfje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqsfje, "��ǰ�շѽ��"))) {
		return false;
	}

	if(	javaTrim(FormName.dxzkl)=="") {
		alert("������[�����ۿ���]��");
		FormName.dxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.dxzkl, "�����ۿ���"))) {
		return false;
	}
	if (FormName.dxzkl.value<0 || FormName.dxzkl.value>10)
	{
		alert("����[�����ۿ���]Ӧ����0��10֮�䣡");
		FormName.dxzkl.select();
		return false;
	}

	if (FormName.dxzkl.value< <%=zdzk%>)
	{
		alert("����[�����ۿ���]����С�ڡ���������ۿ�<%=zdzk%>����");
		FormName.dxzkl.select();
		return false;
	}

	if(	javaTrim(FormName.sfje)=="") {
		alert("������[�ۺ��շѽ��]��");
		FormName.sfje.focus();
		return false;
	}
	if(!(isFloat(FormName.sfje, "�ۺ��շѽ��"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
