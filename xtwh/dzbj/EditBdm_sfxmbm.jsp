<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sfxmbm=null;
String sfxmmc=null;
String dysfxmmc=null;
String sflx=null;
String sfbxx=null;
String sfjrqye=null;
String jrsjbz=null;
String jrglfbz=null;
String dqbm=null;
String bz=null;
double gdje=0;
String sfkdz=null;
double zdzk=0;
String sfxmlx=null;
String sfcysgdjs=null;
String jldw=null;
String sfxsq=null;
String sfssjf=null;
double cbjbfb=0;
double sgcbjbfb=0;
double gcjcbjbfb=0;
String sffqsk=null;
String cbjjsfs=null;
String sfjrhtjz=null;
String sfjzsf=null;

String wheresfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
String wheresdqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfjzsf,sffqsk,cbjjsfs,gcjcbjbfb,sgcbjbfb,sfxsq,sfxmbm,sfxmmc,dysfxmmc,sflx,sfbxx,sfjrqye,dqbm,bz,gdje,jrsjbz,jrglfbz,sfkdz,zdzk,sfxmlx,sfcysgdjs,jldw,sfssjf,cbjbfb,sfjrhtjz ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where  sfxmbm='"+wheresfxmbm+"' and dqbm='"+wheresdqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfjzsf=cf.fillNull(rs.getString("sfjzsf"));
		sffqsk=cf.fillNull(rs.getString("sffqsk"));
		cbjjsfs=cf.fillNull(rs.getString("cbjjsfs"));
		gcjcbjbfb=rs.getDouble("gcjcbjbfb");
		sgcbjbfb=rs.getDouble("sgcbjbfb");
		sfxsq=cf.fillNull(rs.getString("sfxsq"));
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		dysfxmmc=cf.fillNull(rs.getString("dysfxmmc"));
		sflx=cf.fillNull(rs.getString("sflx"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfjrqye=cf.fillNull(rs.getString("sfjrqye"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bz=cf.fillNull(rs.getString("bz"));
		gdje=rs.getDouble("gdje");
		jrsjbz=cf.fillNull(rs.getString("jrsjbz"));
		jrglfbz=cf.fillNull(rs.getString("jrglfbz"));
		sfkdz=cf.fillNull(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");
		sfxmlx=cf.fillNull(rs.getString("sfxmlx"));
		sfcysgdjs=cf.fillNull(rs.getString("sfcysgdjs"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sfssjf=cf.fillNull(rs.getString("sfssjf"));
		cbjbfb=rs.getDouble("cbjbfb");
		sfjrhtjz=cf.fillNull(rs.getString("sfjrhtjz"));
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
       <div align="center">�޸ģ������շ���Ŀ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>����</td>
              <td width="30%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font>�շ���Ŀ����              </td>
              <td width="30%"> 
                <input type="text" name="sfxmbm" size="20" maxlength="2"  value="<%=sfxmbm%>" >              </td>
              <td colspan="2">ע�⣺<font color="#CC0000"><b>��ͬ����������ͬ��Ŀ���룬���ͬһ��Ŀ����ͬ����</b></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ����</td>
              <td colspan="3"><input type="text" name="sfxmmc" size="73" maxlength="100"  value="<%=sfxmmc%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ��ӡ����</td>
              <td colspan="3"><input type="text" name="dysfxmmc" value="<%=dysfxmmc%>" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ����</td>
              <td><%
	cf.radioToken(out, "sfxmlx","1+1����ӹ��̷�<BR>&2+2��������ط�<BR>&3+3����Ʒ�<BR>&5+5�����̹����<BR>&6+6������˰��<BR><BR>&7+7����˾�����Ĺ����<BR>&8+8����˾������˰��<BR>&4+4����˾�����ļ�ӷ�<BR><BR>&A+A���Թ����Ĺ����<BR>&B+B���Թ�����˰��<BR>&C+C���Թ����ļ�ӷ�<BR><BR>&D+D��ˮ��·<BR>&E+E��ˮ��·Ԥ��<BR><BR>&9+9������",sfxmlx);
%></td>
              <td align="right"><font color="#FF0000">*</font>�շѼ��㷽ʽ</td>
              <td  valign="top"><%
	cf.radioToken(out, "sflx","1+1������ֱ�ӷѰٷֱȣ����ɸģ�<BR>&A+A������ֱ�ӷѰٷֱȣ��ɸģ�<BR><BR>&3+3��˰���ۺ��ͬ���˰�ʣ�<BR>&8+8��˰����ǰ˰���˰���ۿۣ�<BR><BR>&5+5�������<BR><BR>&2+2���̶����(���ʦ�ɸ�)<BR>&4+4���̶����(���ʦ���ɸ�)<BR><BR>&6+6����˾�����İٷֱ�(���ɸ�)<BR>&F+F����˾�����İٷֱ�(�ɸ�)<BR><BR>&7+7���Թ����İٷֱ�(���ɸ�)<BR>&G+G���Թ����İٷֱ�(�ɸ�)<BR><BR>&9+9�����ٷֱ�����Ʒ�<BR><BR>&B+B����װ���̹����<BR>&C+C����װ���Ĺ����",sflx);
%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>������λ</td>
              <td><input type="text" name="jldw" value="<%=jldw%>" size="10" maxlength="20" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�̶����</td>
              <td colspan="3"> 
                <input type="text" name="gdje" size="10" maxlength="12"  value="<%=gdje%>" >
��ԣ����̶����(���ʦ�ɸ�)���̶����<font color="#FF0000"><b>�����ʦ���ɸģ�</b></font>������ </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ����ʩ���ӽ���</td>
              <td>
<%
	cf.radioToken(out, "sfcysgdjs","Y+��&N+��",sfcysgdjs);
%>			</td>
              <td align="right"><font color="#FF0000">*</font>�ɱ��ٷֱ�</td>
              <td><input type="text" name="cbjbfb" size="10" maxlength="12"  value="<%=cbjbfb%>" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>ʩ���ɱ��۰ٷֱ�</td>
              <td><input type="text" name="sgcbjbfb" size="10" maxlength="8"  value="<%=sgcbjbfb%>" >
%</td>
              <td align="right"><font color="#FF0000">*</font>���̻������۰ٷֱ�</td>
              <td><input type="text" name="gcjcbjbfb" size="10" maxlength="8"  value="<%=gcjcbjbfb%>" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
              <td width="30%"><%
	cf.radioToken(out, "sfbxx","1+��ѡ&2+�Ǳ�ѡ",sfbxx);
%></td>
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ����ҵ��<BR></td>
              <td width="30%"><%
	cf.radioToken(out, "sfjrqye","1+��&2+��",sfjrqye);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ���ȡ˰��</td>
              <td width="30%"><%
	cf.radioToken(out, "jrsjbz","1+��ȡ&2+����ȡ",jrsjbz);
%></td>
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ���ȡ�����</td>
              <td width="30%"><%
	cf.radioToken(out, "jrglfbz","1+��ȡ&2+����ȡ",jrglfbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ���ȡ��Ʒ�</td>
              <td><%
	cf.radioToken(out, "sfssjf","1+��ȡ&2+����ȡ",sfssjf);
%></td>
              <td align="right"><font color="#FF0000">*</font>���ʦ�Ƿ�����Ȩʹ��</td>
              <td><%
	cf.radioToken(out, "sfxsq","1+������Ȩ&2+����Ȩʹ��&3+ͣ��",sfxsq);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ�ɴ���</td>
              <td width="30%"> <%
 	cf.radioToken(out, "sfkdz","N+���ɴ���&Y+�ɴ���",sfkdz);
%> </td>
              <td width="20%" align="right">����ۿ�</td>
              <td width="30%"> 
                <input type="text" name="zdzk" size="10" maxlength="8"  value="<%=zdzk%>" >
                <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ�����տ�</td>
              <td><%
 	cf.radioToken(out, "sffqsk","1+��&2+��",sffqsk);
%></td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ�����ͬ��ֵë��</td>
              <td><%
 	cf.radioToken(out, "sfjrhtjz","Y+����&N+��",sfjrhtjz);
%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ɱ��ۼ��㷽ʽ</td>
              <td><%
 	cf.radioToken(out, "cbjjsfs","1+��ǰ&2+�ۺ�&3+������",cbjjsfs);
%></td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ�װ�շ�</td>
              <td><%
 	cf.radioToken(out, "sfjzsf","Y+��&N+��",sfjzsf);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" rows="4" cols="71"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                 
                  <input type="hidden" name="wheresfxmbm"  value="<%=wheresfxmbm%>" >
                  <input type="hidden" name="wheresdqbm"  value="<%=wheresdqbm%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����"></td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("������[�շ���Ŀ����]��");
		FormName.sfxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sfxmmc)=="") {
		alert("������[�շ���Ŀ����]��");
		FormName.sfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dysfxmmc)=="") {
		alert("������[��ӡ�շ���Ŀ����]��");
		FormName.dysfxmmc.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfxmlx)) {
		alert("��ѡ��[�շ���Ŀ����]��");
		FormName.sfxmlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sflx)) {
		alert("��ѡ��[�շѼ��㷽ʽ]��");
		FormName.sflx[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfcysgdjs)) {
		alert("��ѡ��[�Ƿ����ʩ���ӽ���]��");
		FormName.sfcysgdjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("������[������λ]��");
		FormName.jldw.select();
		return false;
	}

	if(	!radioChecked(FormName.sfbxx)) {
		alert("��ѡ��[�Ƿ��ѡ��]��");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjrqye)) {
		alert("��ѡ��[�Ƿ����ҵ��]��");
		FormName.sfjrqye[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jrsjbz)) {
		alert("��ѡ��[��˰�������־]��");
		FormName.jrsjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jrglfbz)) {
		alert("��ѡ��[�Ƿ���ȡ�����]��");
		FormName.jrglfbz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkdz)) {
		alert("��ѡ��[�Ƿ�ɴ���]��");
		FormName.sfkdz[0].focus();
		return false;
	}
	if (FormName.sfkdz[1].checked)
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("������[����ۿ�]��");
			FormName.zdzk.select();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "����ۿ�"))) {
			return false;
		}
		if (FormName.zdzk.value<0 || FormName.zdzk.value>10)
		{
			alert("����[����ۿ�]Ӧ����0��10֮�䣡");
			FormName.zdzk.select();
			return false;
		}
	}
	else{
		FormName.zdzk.value=10;
	}
	if(	!radioChecked(FormName.sfxsq)) {
		alert("��ѡ��[���ʦ�Ƿ�����Ȩʹ��]��");
		FormName.sfxsq[0].focus();
		return false;
	}

	//���¼���Ƿ���ȷ������������������������������ʼ
	if (FormName.sfxmlx[0].checked || FormName.sfxmlx[1].checked)//�շ���Ŀ���ͣ���ӹ��̷ѡ�������ط�
	{
		if (!FormName.sflx[0].checked && !FormName.sflx[1].checked && !FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[14].checked && !FormName.sflx[15].checked)//�շѼ��㷽ʽ������ֱ�ӷѰٷֱȡ��̶����(���ʦ�ɸ�)���̶������ʦ���ɸģ�
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��1������ֱ�ӷѰٷֱȣ����ɸģ� �� A������ֱ�ӷѰٷֱȣ��ɸģ� �� 2���̶����(���ʦ�ɸ�) �� 4���̶������ʦ���ɸģ���");
			FormName.sflx[0].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[2].checked)//�շ���Ŀ���ͣ���Ʒ�
	{
		if (!FormName.sflx[0].checked && !FormName.sflx[1].checked && !FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[11].checked && !FormName.sflx[14].checked && !FormName.sflx[15].checked)//�շѼ��㷽ʽ������ֱ�ӷѰٷֱȡ��̶����(���ʦ�ɸ�)���̶������ʦ���ɸģ������ٷֱ�����Ʒ�
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��1������ֱ�ӷѰٷֱȣ����ɸģ� �� A������ֱ�ӷѰٷֱȣ��ɸģ� �� 2���̶����(���ʦ�ɸ�) �� 4���̶������ʦ���ɸģ���9�����ٷֱ�����Ʒ� ��");
			FormName.sflx[0].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[3].checked )//�շ���Ŀ���ͣ����̹����
	{
		if ( !FormName.sflx[0].checked  && !FormName.sflx[1].checked  && !FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[12].checked && !FormName.sflx[13].checked)//�շѼ��㷽ʽ������ѡ��̶����(���ʦ�ɸ�)
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��5������� �� 2���̶����(���ʦ�ɸ�)��");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("����[�Ƿ���ȡ�����]Ӧѡ�񡺲���ȡ��");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[5].checked )//�շ���Ŀ���ͣ���˾�����Ĺ����
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[7].checked && !FormName.sflx[8].checked)//�շѼ��㷽ʽ������ѡ��̶����(���ʦ�ɸ�)
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��5������� �� 2���̶����(���ʦ�ɸ�)��");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("����[�Ƿ���ȡ�����]Ӧѡ�񡺲���ȡ��");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[8].checked )//�շ���Ŀ���ͣ��Թ����Ĺ����
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[9].checked && !FormName.sflx[10].checked)//�շѼ��㷽ʽ������ѡ��̶����(���ʦ�ɸ�)
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��5������� �� 2���̶����(���ʦ�ɸ�)����");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("����[�Ƿ���ȡ�����]Ӧѡ�񡺲���ȡ��");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[4].checked || FormName.sfxmlx[6].checked || FormName.sfxmlx[9].checked)//�շ���Ŀ���ͣ�����˰�𡢹�˾������˰���Թ�����˰��
	{
		if (!FormName.sflx[2].checked && !FormName.sflx[3].checked && !FormName.sflx[5].checked)//�շѼ��㷽ʽ��˰���ۺ󰴻������㣩��˰���ۺ��ۿۼ��㣩���̶����(���ʦ�ɸ�)
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��3��˰���ۺ󰴻������㣩 �� 8��˰���ۺ��ۿۼ��㣩 �� 2���̶����(���ʦ�ɸ�)��");
			FormName.sflx[2].focus();
			return false;
		}
		if (!FormName.jrsjbz[1].checked)
		{
			alert("����[�Ƿ���ȡ˰��]Ӧѡ�񡺲���ȡ��");
			FormName.jrsjbz[1].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("����[�Ƿ���ȡ�����]Ӧѡ�񡺲���ȡ��");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[7].checked)//�շ���Ŀ���ͣ���˾�����ļ�ӷ�
	{
		if (!FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[7].checked && !FormName.sflx[8].checked)//�շѼ��㷽ʽ���̶����(���ʦ�ɸ�)���̶������ʦ���ɸģ�����˾�����İٷֱ�
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��2���̶����(���ʦ�ɸ�) �� 4���̶������ʦ���ɸģ���6����˾�����İٷֱȡ�F����˾�����İٷֱ�(�ɸ�)��");
			FormName.sflx[6].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[10].checked)//�շ���Ŀ���ͣ��Թ����ļ�ӷ�
	{
		if (!FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[9].checked && !FormName.sflx[10].checked)//�շѼ��㷽ʽ���̶����(���ʦ�ɸ�)���̶������ʦ���ɸģ����Թ����İٷֱ�
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��2���̶����(���ʦ�ɸ�) �� 4���̶������ʦ���ɸģ���7���Թ����İٷֱȡ�G���Թ����İٷֱ�(�ɸ�)��");
			FormName.sflx[7].focus();
			return false;
		}
	}
	else{
		if (FormName.sflx[2].checked || FormName.sflx[3].checked || FormName.sflx[4].checked)//�շѼ��㷽ʽ��˰���ۺ󰴻������㣩��˰���ۺ��ۿۼ��㣩�������
		{
			alert("����[�շѼ��㷽ʽ]����ѡ��ѡ��3��˰���ۺ󰴻������㣩 �� 8��˰���ۺ��ۿۼ��㣩��5������ѡ�");
			FormName.sflx[0].focus();
			return false;
		}
	}


	if (FormName.sflx[2].checked)//�շѼ��㷽ʽ��˰���ۺ󰴻������㣩
	{
		if (!FormName.sfkdz[0].checked)
		{
			alert("����Ӧѡ�񡺲��ɴ��ۡ�");
			FormName.sfkdz[0].focus();
			return false;
		}
	}
	else if (FormName.sflx[3].checked)//�շѼ��㷽ʽ��˰���ۺ��ۿۼ��㣩
	{
	}
	else if (FormName.sflx[4].checked)//�շѼ��㷽ʽ�������
	{
	}
	else if (FormName.sflx[6].checked)//�շѼ��㷽ʽ���̶������ʦ���ɸģ�
	{
		if(	javaTrim(FormName.gdje)=="" || FormName.gdje.value=="0" || FormName.gdje.value=="0.0") {
			alert("������[�̶����]��");
			FormName.gdje.select();
			return false;
		}
		if(!(isFloat(FormName.gdje, "�̶����"))) {
			return false;
		}
	}
	//���¼���Ƿ���ȷ��������������������������������

	if(	javaTrim(FormName.cbjbfb)=="") {
		alert("������[�ɱ��۰ٷֱ�]��");
		FormName.cbjbfb.select();
		return false;
	}
	if(!(isFloat(FormName.cbjbfb, "�ɱ��۰ٷֱ�"))) {
		return false;
	}
	if (FormName.cbjbfb.value<0 || FormName.cbjbfb.value>100)
	{
		alert("����[�ɱ��۰ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.cbjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.sgcbjbfb)=="") {
		alert("������[ʩ���ɱ��۰ٷֱ�]��");
		FormName.sgcbjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbjbfb, "ʩ���ɱ��۰ٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.sgcbjbfb.value)<0 || parseFloat(FormName.sgcbjbfb.value)>100)
	{
		alert("[ʩ���ɱ��۰ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.sgcbjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.gcjcbjbfb)=="") {
		alert("������[���̻������۰ٷֱ�]��");
		FormName.gcjcbjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjcbjbfb, "���̻������۰ٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.gcjcbjbfb.value)<0 || parseFloat(FormName.gcjcbjbfb.value)>100)
	{
		alert("[���̻������۰ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.gcjcbjbfb.select();
		return false;
	}
	if(	!radioChecked(FormName.sfssjf)) {
		alert("��ѡ��[�Ƿ���ȡ��Ʒ�]��");
		FormName.sfssjf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sffqsk)) {
		alert("��ѡ��[�Ƿ�����տ�]��");
		FormName.sffqsk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cbjjsfs)) {
		alert("��ѡ��[�ɱ��ۼ��㷽ʽ]��");
		FormName.cbjjsfs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjrhtjz)) {
		alert("��ѡ��[�Ƿ�����ͬ��ֵë��]��");
		FormName.sfjrhtjz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjzsf)) {
		alert("��ѡ��[�Ƿ�װ�շ�]��");
		FormName.sfjzsf[0].focus();
		return false;
	}

	FormName.action="SaveEditBdm_sfxmbm.jsp";
	FormName.submit();
	return true;
}

function f_edit(FormName)
{
	if ( confirm("ϵͳ����������δǩ���ͻ������ӱ������漰����Ŀ����Ϣ��ȷʵҪ������?") )	
	{
		FormName.action="UpdateDzbjSfxmbm.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</SCRIPT>
