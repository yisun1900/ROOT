<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ¼�룭�����շ���Ŀ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBdm_sfxmbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>����</td>
              <td width="30%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
				<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
				%> 
                </select>              </td>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�շ���Ŀ���루2λ��</td>
              <td width="30%"> 
                <input type="text" name="sfxmbm" value="" size="20" maxlength="2" ></td>
              <td colspan="2">ע�⣺<font color="#CC0000"><b>��ͬ����������ͬ��Ŀ���룬���ͬһ��Ŀ����ͬ����</b></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ����</td>
              <td colspan="3"><input type="text" name="sfxmmc" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ��ӡ����</td>
              <td colspan="3"><input type="text" name="dysfxmmc" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ����</td>
              <td valign="top">
			    <input type="radio" name="sfxmlx"  value="1">
				1����ӹ��̷�<br>
				<input type="radio" name="sfxmlx"  value="2">
				2��������ط�<br>
				<input type="radio" name="sfxmlx"  value="3">
				3����Ʒ� <br>
				<input type="radio" name="sfxmlx"  value="5">
				5�����̹����� <br>
				<input type="radio" name="sfxmlx"  value="6">
				6������˰�� <br><br>
				<input type="radio" name="sfxmlx"  value="7">
				7����˾�����Ĺ����� <br>
				<input type="radio" name="sfxmlx"  value="8">
				8����˾������˰�� <br>
				<input type="radio" name="sfxmlx"  value="4">
				4����˾�����ļ�ӷ� <br><br>
				<input type="radio" name="sfxmlx"  value="A">
				A���Թ����Ĺ�����<br>
				<input type="radio" name="sfxmlx"  value="B">
				B���Թ�����˰��<br>
				<input type="radio" name="sfxmlx"  value="C">
				C���Թ����ļ�ӷ� <br><br>
				<input type="radio" name="sfxmlx"  value="D">
				D��ˮ��· <br>
				<input type="radio" name="sfxmlx"  value="E">
				E��ˮ��·Ԥ�� <br><br>
				<input type="radio" name="sfxmlx"  value="9">
				9������			  </td>
              <td align="right"><font color="#FF0000">*</font>�շѼ��㷽ʽ</td>
              <td valign="top">
			        <input type="radio" name="sflx"  value="1">
					1������ֱ�ӷѰٷֱ�<font color="#FF0000"><b>�����ɸģ�</b></font><br>
			        <input type="radio" name="sflx"  value="A">
					A������ֱ�ӷѰٷֱȣ��ɸģ�<br><br>
					<input type="radio" name="sflx"  value="3">
					3��˰���ۺ��ͬ���˰�ʣ�<br>
					<input type="radio" name="sflx"  value="8">
					8��˰����ǰ˰���˰���ۿۣ�<br>
					<br>
					<input type="radio" name="sflx"  value="5">
					5��������<br>
					<br>
					<input type="radio" name="sflx"  value="2">
					2���̶����(���ʦ�ɸ�)<br>
					<input type="radio" name="sflx"  value="4">
					
					4���̶����<font color="#FF0000"><b>�����ʦ���ɸģ�</b></font> <br><br>
					<input type="radio" name="sflx"  value="6">
					6����˾�����İٷֱ�(���ɸ�)<br>
					<input type="radio" name="sflx"  value="F">
					F����˾�����İٷֱ�(�ɸ�)<br><BR>
					<input type="radio" name="sflx"  value="7">
					7���Թ����İٷֱ�(���ɸ�)<br>
					<input type="radio" name="sflx"  value="G">
					G���Թ����İٷֱ�(�ɸ�)<br><br>
					<input type="radio" name="sflx"  value="9">
					9�����ٷֱ�����Ʒ�			  
					<br>
					<br>
					<input type="radio" name="sflx"  value="B">
					B����װ���̹�����<br>
					<input type="radio" name="sflx"  value="C">
					C����װ���Ĺ�����<br>
					<input type="radio" name="sflx"  value="D">
					D����װ���̷Ѱٷֱ�<br>
					<input type="radio" name="sflx"  value="E">
					E����װ���ķѰٷֱ�<br>					</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>������λ</td>
              <td><input type="text" name="jldw" value="��" size="10" maxlength="20" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�̶����</td>
              <td colspan="3"> 
                <input type="text" name="gdje" size="10" maxlength="12"  value="" >
                ��ԣ����̶����(���ʦ�ɸ�)���̶����<font color="#FF0000"><b>�����ʦ���ɸģ�</b></font>������</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ����ʩ���ӽ���</td>
              <td><input type="radio" name="sfcysgdjs" value="Y">
					��
					  <input type="radio" name="sfcysgdjs" value="N">
					�� </td>
              <td align="right"><font color="#FF0000">*</font>�ɱ��ٷֱ�</td>
              <td><input type="text" name="cbjbfb" size="10" maxlength="8"  value="100" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>ʩ���ɱ��۰ٷֱ�</td>
              <td><input type="text" name="sgcbjbfb" size="10" maxlength="8"  value="100" >
%</td>
              <td align="right"><font color="#FF0000">*</font>���̻������۰ٷֱ�</td>
              <td><input type="text" name="gcjcbjbfb" size="10" maxlength="8"  value="100" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
              <td width="30%"> 
                <input type="radio" name="sfbxx" value="1">
                ��ѡ 
                <input type="radio" name="sfbxx" value="2">
                �Ǳ�ѡ </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>�Ƿ����ҵ��</td>
              <td width="31%"><%
	cf.radioToken(out, "sfjrqye","1+��&2+��","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ���ȡ˰��</td>
              <td width="30%"><%
	cf.radioToken(out, "jrsjbz","1+��ȡ&2+����ȡ","");
%></td>
              <td width="19%" align="right"><font color="#FF0000">*</font>�Ƿ���ȡ������</td>
              <td width="31%"><%
	cf.radioToken(out, "jrglfbz","1+��ȡ&2+����ȡ","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ���ȡ��Ʒ�</td>
              <td><%
	cf.radioToken(out, "sfssjf","1+��ȡ&2+����ȡ","2");
%></td>
              <td align="right"><font color="#FF0000">*</font>���ʦ�Ƿ�����Ȩʹ��</td>
              <td>
				  <input name="sfxsq" type="radio" value="1" checked>������Ȩ
				  <input type="radio" name="sfxsq" value="2">����Ȩʹ��
				  <input type="radio" name="sfxsq" value="3">ͣ��			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>�Ƿ�ɴ���</td>
              <td width="30%"> 
                <input type="radio" name="sfkdz" value="N">
                ���ɴ��� 
                <input type="radio" name="sfkdz" value="Y">
                �ɴ��� </td>
              <td width="19%" align="right">����ۿ�</td>
              <td width="31%"> 
                <input type="text" name="zdzk" size="10" maxlength="8"  value="" >
                <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ�����տ�</td>
              <td><input type="radio" name="sffqsk" value="1">
                ��
                  <input type="radio" name="sffqsk" value="2">
              �� </td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ�����ͬ��ֵë��</td>
              <td><input type="radio" name="sfjrhtjz" value="Y">
����
  <input type="radio" name="sfjrhtjz" value="N">
�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ɱ��ۼ��㷽ʽ</td>
              <td><input type="radio" name="cbjjsfs" value="1">
��ǰ
  <input type="radio" name="cbjjsfs" value="2">
�ۺ�
<input type="radio" name="cbjjsfs" value="3">
������</td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ�װ�շ�</td>
              <td><input type="radio" name="sfjzsf" value="Y">
��
  <input name="sfjzsf" type="radio" value="N" checked>
��</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" rows="4" cols="71"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
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
		alert("��ѡ��[�Ƿ���ȡ������]��");
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
	else if (FormName.sfxmlx[3].checked )//�շ���Ŀ���ͣ����̹�����
	{
		if ( !FormName.sflx[0].checked  && !FormName.sflx[1].checked  && !FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[12].checked && !FormName.sflx[13].checked)//�շѼ��㷽ʽ�������ѡ��̶����(���ʦ�ɸ�)
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��5�������� �� 2���̶����(���ʦ�ɸ�)��");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("����[�Ƿ���ȡ������]Ӧѡ�񡺲���ȡ��");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[5].checked )//�շ���Ŀ���ͣ���˾�����Ĺ�����
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[7].checked && !FormName.sflx[8].checked)//�շѼ��㷽ʽ�������ѡ��̶����(���ʦ�ɸ�)
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��5�������� �� 2���̶����(���ʦ�ɸ�)��");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("����[�Ƿ���ȡ������]Ӧѡ�񡺲���ȡ��");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[8].checked )//�շ���Ŀ���ͣ��Թ����Ĺ�����
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[9].checked && !FormName.sflx[10].checked)//�շѼ��㷽ʽ�������ѡ��̶����(���ʦ�ɸ�)
		{
			alert("����[�շѼ��㷽ʽ]Ӧѡ��5�������� �� 2���̶����(���ʦ�ɸ�)����");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("����[�Ƿ���ȡ������]Ӧѡ�񡺲���ȡ��");
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
			alert("����[�Ƿ���ȡ������]Ӧѡ�񡺲���ȡ��");
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
		if (FormName.sflx[2].checked || FormName.sflx[3].checked || FormName.sflx[4].checked)//�շѼ��㷽ʽ��˰���ۺ󰴻������㣩��˰���ۺ��ۿۼ��㣩��������
		{
			alert("����[�շѼ��㷽ʽ]����ѡ��ѡ��3��˰���ۺ󰴻������㣩 �� 8��˰���ۺ��ۿۼ��㣩��5�������ѡ�");
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
	else if (FormName.sflx[4].checked)//�շѼ��㷽ʽ��������
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>