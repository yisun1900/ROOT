<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgzl=null;
String gcjd=null;
String wmsgcd=null;
String ctfw=null;
String pscl=null;
String dmcl=null;
String sjxg=null;
String sjfw=null;
String jlfw=null;
String lrr=null;
String lrsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,sgzl,gcjd,wmsgcd,ctfw,pscl,dmcl,sjxg,sjfw,jlfw,lrr,lrsj,bz ";
	ls_sql+=" from  kp_khpjb";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgzl=cf.fillNull(rs.getString("sgzl"));
		gcjd=cf.fillNull(rs.getString("gcjd"));
		wmsgcd=cf.fillNull(rs.getString("wmsgcd"));
		ctfw=cf.fillNull(rs.getString("ctfw"));
		pscl=cf.fillNull(rs.getString("pscl"));
		dmcl=cf.fillNull(rs.getString("dmcl"));
		sjxg=cf.fillNull(rs.getString("sjxg"));
		sjfw=cf.fillNull(rs.getString("sjfw"));
		jlfw=cf.fillNull(rs.getString("jlfw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,sgbz,zjxm,hth,sjkgrq,sjjgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

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
      <div align="center"> �ͻ����۱�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_khpjb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="32%"> <%=khbh%> 
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">��ͬ��</font></div>
              </td>
              <td width="32%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="32%"> <%=khxm%>��<%=lxfs%>�� </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">���ʦ</font></div>
              </td>
              <td width="32%"> <%=sjs%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
              </td>
              <td width="32%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">ʩ����</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">ʩ������</font></div>
              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">ʵ��������</font></td>
              <td width="32%"> <%=sjkgrq%> </td>
              <td width="18%" align="right"><font color="#0000CC">ʵ��������</font></td>
              <td width="32%"> <%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">ʩ������</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "sgzl","1+����&2+��������&3+������",sgzl);
%> </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���̽���</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "gcjd","1+����&2+��������&3+������",gcjd);
%> </td>
              <td width="18%"> 
                <div align="right">��������ʩ���̶�</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "wmsgcd","1+����&2+��������&3+������",wmsgcd);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">ʩ�����������</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "ctfw","1+����&2+��������&3+������",ctfw);
%> </td>
              <td width="18%"> 
                <div align="right">��˾���Ͳ���</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "pscl","1+����&2+��������&3+������",pscl);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">ʩ���Ӵ������</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "dmcl","1+����&2+��������&3+������",dmcl);
%> </td>
              <td width="18%"> 
                <div align="right">���Ч��</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sjxg","1+����&2+��������&3+������",sjxg);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��Ʒ���</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sjfw","1+����&2+��������&3+������",sjfw);
%> </td>
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "jlfw","1+����&2+��������&3+������",jlfw);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">¼����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sgzl)) {
		alert("��ѡ��[ʩ������]��");
		FormName.sgzl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.gcjd)) {
		alert("��ѡ��[���̽���]��");
		FormName.gcjd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.wmsgcd)) {
		alert("��ѡ��[��������ʩ���̶�]��");
		FormName.wmsgcd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ctfw)) {
		alert("��ѡ��[ʩ�����������]��");
		FormName.ctfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.pscl)) {
		alert("��ѡ��[��˾���Ͳ���]��");
		FormName.pscl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.dmcl)) {
		alert("��ѡ��[ʩ���Ӵ������]��");
		FormName.dmcl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjxg)) {
		alert("��ѡ��[���Ч��]��");
		FormName.sjxg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjfw)) {
		alert("��ѡ��[��Ʒ���]��");
		FormName.sjfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jlfw)) {
		alert("��ѡ��[�������]��");
		FormName.jlfw[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
