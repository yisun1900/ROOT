<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String spks=null;
String spzl=null;
String spgn=null;
String spfw=null;
String azjs=null;
String fwtd=null;
String fwgf=null;
String mfsh=null;
String mfaz=null;
String zssm=null;
String syxt=null;
String sydb=null;
String wzzq=null;
String qlxc=null;
String cscp=null;
String jsbyzs=null;
String bzgkjxy=null;
String bzgkjcf=null;
String bsdtt=null;
String bjsgkxf=null;
String bsygksb=null;
String bjsgkyq=null;
String azhs=null;
String bz=null;
String whereyddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,spks,spzl,spgn,spfw,azjs,fwtd,fwgf,mfsh,mfaz,zssm,syxt,sydb,wzzq,qlxc,cscp,jsbyzs,bzgkjxy,bzgkjcf,bsdtt,bjsgkxf,bsygksb,bjsgkyq,azhs,bz ";
	ls_sql+=" from  jc_mmazfkd";
	ls_sql+=" where  (yddbh='"+whereyddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		spks=cf.fillNull(rs.getString("spks"));
		spzl=cf.fillNull(rs.getString("spzl"));
		spgn=cf.fillNull(rs.getString("spgn"));
		spfw=cf.fillNull(rs.getString("spfw"));
		azjs=cf.fillNull(rs.getString("azjs"));
		fwtd=cf.fillNull(rs.getString("fwtd"));
		fwgf=cf.fillNull(rs.getString("fwgf"));
		mfsh=cf.fillNull(rs.getString("mfsh"));
		mfaz=cf.fillNull(rs.getString("mfaz"));
		zssm=cf.fillNull(rs.getString("zssm"));
		syxt=cf.fillNull(rs.getString("syxt"));
		sydb=cf.fillNull(rs.getString("sydb"));
		wzzq=cf.fillNull(rs.getString("wzzq"));
		qlxc=cf.fillNull(rs.getString("qlxc"));
		cscp=cf.fillNull(rs.getString("cscp"));
		jsbyzs=cf.fillNull(rs.getString("jsbyzs"));
		bzgkjxy=cf.fillNull(rs.getString("bzgkjxy"));
		bzgkjcf=cf.fillNull(rs.getString("bzgkjcf"));
		bsdtt=cf.fillNull(rs.getString("bsdtt"));
		bjsgkxf=cf.fillNull(rs.getString("bjsgkxf"));
		bsygksb=cf.fillNull(rs.getString("bsygksb"));
		bjsgkyq=cf.fillNull(rs.getString("bjsgkyq"));
		azhs=cf.fillNull(rs.getString("azhs"));
		bz=cf.fillNull(rs.getString("bz"));
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
      <div align="center">���޸İ�װ�۷���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmazfkd.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">Ԥ�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yddbh" size="20" maxlength="9"  value="<%=yddbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">��Ʒ��ʽ</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spks","1+������&2+����&3+������",spks);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spzl","1+������&2+����&3+������",spzl);
%> </td>
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spgn","1+������&2+����&3+������",spgn);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spfw","1+������&2+����&3+������",spfw);
%> </td>
              <td width="15%"> 
                <div align="right">��װ����</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "azjs","1+������&2+����&3+������",azjs);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����̬��</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "fwtd","1+������&2+����&3+������",fwtd);
%> </td>
              <td width="15%"> 
                <div align="right">����淶</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "fwgf","1+������&2+����&3+������",fwgf);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ͻ�</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "mfsh","Y+��&N+��",mfsh);
%> </td>
              <td width="15%"> 
                <div align="right">��Ѱ�װ</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "mfaz","Y+��&N+��",mfaz);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">׼ʱ����</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "zssm","Y+��&N+��",zssm);
%> </td>
              <td width="15%"> 
                <div align="right">ʹ��Ь��</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "syxt","Y+��&N+��",syxt);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ʹ�õ沼</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "sydb","Y+��&N+��",sydb);
%> </td>
              <td width="15%"> 
                <div align="right">λ����ȷ</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "wzzq","Y+��&N+��",wzzq);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ֳ�</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "qlxc","Y+��&N+��",qlxc);
%> </td>
              <td width="15%"> 
                <div align="right">���ò�Ʒ</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "cscp","Y+��&N+��",cscp);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ܱ���֪ʶ</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "jsbyzs","Y+��&N+��",jsbyzs);
%> </td>
              <td width="15%"> 
                <div align="right">���ڹ˿ͼ�����</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bzgkjxy","Y+��&N+��",bzgkjxy);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ڹ˿ͼҳԷ�</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bzgkjcf","Y+��&N+��",bzgkjcf);
%> </td>
              <td width="15%"> 
                <div align="right">�������̵</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bsdtt","Y+��&N+��",bsdtt);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ܹ˿�С��</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bjsgkxf","Y+��&N+��",bjsgkxf);
%> </td>
              <td width="15%"> 
                <div align="right">��ʹ�ù˿ͼ�ˮ��</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bsygksb","Y+��&N+��",bsygksb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ܹ˿�����</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bjsgkyq","Y+��&N+��",bjsgkyq);
%> </td>
              <td width="15%"> 
                <div align="right">��װ��ʱ</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "azhs","Y+��&N+��",azhs);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="whereyddbh"  value="<%=whereyddbh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.spks)) {
		alert("��ѡ��[��Ʒ��ʽ]��");
		FormName.spks[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spzl)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.spzl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spgn)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.spgn[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spfw)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.spfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.azjs)) {
		alert("��ѡ��[��װ����]��");
		FormName.azjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.fwtd)) {
		alert("��ѡ��[����̬��]��");
		FormName.fwtd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.fwgf)) {
		alert("��ѡ��[����淶]��");
		FormName.fwgf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mfsh)) {
		alert("��ѡ��[����ͻ�]��");
		FormName.mfsh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mfaz)) {
		alert("��ѡ��[��Ѱ�װ]��");
		FormName.mfaz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zssm)) {
		alert("��ѡ��[׼ʱ����]��");
		FormName.zssm[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.syxt)) {
		alert("��ѡ��[ʹ��Ь��]��");
		FormName.syxt[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sydb)) {
		alert("��ѡ��[ʹ�õ沼]��");
		FormName.sydb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.wzzq)) {
		alert("��ѡ��[λ����ȷ]��");
		FormName.wzzq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.qlxc)) {
		alert("��ѡ��[�����ֳ�]��");
		FormName.qlxc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cscp)) {
		alert("��ѡ��[���ò�Ʒ]��");
		FormName.cscp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jsbyzs)) {
		alert("��ѡ��[���ܱ���֪ʶ]��");
		FormName.jsbyzs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bzgkjxy)) {
		alert("��ѡ��[���ڹ˿ͼ�����]��");
		FormName.bzgkjxy[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bzgkjcf)) {
		alert("��ѡ��[���ڹ˿ͼҳԷ�]��");
		FormName.bzgkjcf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bsdtt)) {
		alert("��ѡ��[�������̵]��");
		FormName.bsdtt[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjsgkxf)) {
		alert("��ѡ��[�����ܹ˿�С��]��");
		FormName.bjsgkxf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bsygksb)) {
		alert("��ѡ��[��ʹ�ù˿ͼ�ˮ��]��");
		FormName.bsygksb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjsgkyq)) {
		alert("��ѡ��[�����ܹ˿�����]��");
		FormName.bjsgkyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.azhs)) {
		alert("��ѡ��[��װ��ʱ]��");
		FormName.azhs[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
