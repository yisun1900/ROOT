<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String sfxmbm=null;
String sfje=null;
String sflx=null;
String bz=null;
String dqbm=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,sfxmbm,DECODE(bj_sfxmmx.sflx,'1','�ٷֱ�','2','�̶����') sflx,sfje,bz ";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sfxmbm='"+wheresfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		sfje=cf.fillNull(rs.getString("sfje"));
		sflx=cf.fillNull(rs.getString("sflx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (sflx.equals("�ٷֱ�"))
	{
		sfje="";
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸������շ���Ŀ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBj_sfxmmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">�շ���Ŀ</td>
              <td> 
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getSfxm(insertform)">
                  <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmbm",sfxmbm);
%> 
                </select>
              </td>
              <td align="right">�շ�����</td>
              <td> 
                <input name="sflx" type="text" id="sflx" value="<%=sflx%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">�շѽ��</td>
              <td colspan="3"> 
                <input type="text" name="sfje" size="20" maxlength="17"  value="<%=sfje%>" >
                <font color="#FF0033"><b>ע�⣺���ٷֱ��շ���Ŀ������¼���շѽ���ϵͳ�Զ����� </b></font> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
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

function getSfxm(FormName)
{

	var str="Bj_sfxmmxCx.jsp?dqbm=<%=dqbm%>&sfxmbm="+FormName.sfxmbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("��ѡ��[�շ���Ŀ]��");
		FormName.sfxmbm.focus();
		return false;
	}
	if (FormName.sflx.value=='�̶����')
	{
		if(	javaTrim(FormName.sfje)=="") {
			alert("������[�շѽ��]��");
			FormName.sfje.focus();
			return false;
		}
		if(!(isFloat(FormName.sfje, "�շѽ��"))) {
			return false;
		}
	}
	else {
		if(	javaTrim(FormName.sfje)!="" && FormName.sfje.value!='0') {
			alert("���ٷֱ��շѣ�����Ҫ¼��[�շѽ��]��");
			FormName.sfje.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
