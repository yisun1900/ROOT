<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
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
      <div align="center">�����շ���Ŀ���룭��ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Bdm_sfxmbmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����</td>
              <td width="32%"> 
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
              <td width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�շ���Ŀ���� </td>
              <td width="32%"> 
                <input type="text" name="sfxmbm" size="20" maxlength="2" ></td>
              <td width="20%" align="right">�շ���Ŀ���� </td>
              <td width="30%"> 
                <input type="text" name="sfxmmc" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�շ���Ŀ����</td>
              <td>
			    <input type="radio" name="sfxmlx"  value="1">
				1����ӹ��̷�<br>
				<input type="radio" name="sfxmlx"  value="2">
				2��������ط�<br>
				<input type="radio" name="sfxmlx"  value="3">
				3����Ʒ� <br>
				<input type="radio" name="sfxmlx"  value="5">
				5�����̹���� <br>
				<input type="radio" name="sfxmlx"  value="6">
				6������˰�� <br><br>
				<input type="radio" name="sfxmlx"  value="7">
				7����˾�����Ĺ���� <br>
				<input type="radio" name="sfxmlx"  value="8">
				8����˾������˰�� <br>
				<input type="radio" name="sfxmlx"  value="4">
				4����˾�����ļ�ӷ� <br><br>
				<input type="radio" name="sfxmlx"  value="A">
				A���Թ����Ĺ����<br>
				<input type="radio" name="sfxmlx"  value="B">
				B���Թ�����˰��<br>
				<input type="radio" name="sfxmlx"  value="C">
				C���Թ����ļ�ӷ� <br><br>
				<input type="radio" name="sfxmlx"  value="D">
				D��ˮ��· <br>
				<input type="radio" name="sfxmlx"  value="E">
				E��ˮ��·Ԥ��<br><br>
				<input type="radio" name="sfxmlx"  value="9">
				9������			  </td>
              <td align="right">�շѼ��㷽ʽ</td>
              <td valign="top">
			        <input type="radio" name="sflx"  value="1">
					1������ֱ�ӷѰٷֱ�<font color="#FF0000"><b>�����ɸģ�</b></font><br>
			        <input type="radio" name="sflx"  value="A">
					A������ֱ�ӷѰٷֱȣ��ɸģ�<br><br>
					<input type="radio" name="sflx"  value="3">
					3��˰���ۺ��ͬ���˰�ʣ�<br>
					<input type="radio" name="sflx"  value="8">
					8��˰����ǰ˰���˰���ۿۣ�<br><br>
					<input type="radio" name="sflx"  value="5">
					5�������<br>
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
					B����װ���̹����<br>
					<input type="radio" name="sflx"  value="C">
					C����װ���Ĺ����<br>
					<input type="radio" name="sflx"  value="D">
					D����װ���̷Ѱٷֱ�<br>
					<input type="radio" name="sflx"  value="E">
					E����װ���ķѰٷֱ�<br>					</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�Ƿ��ѡ��</td>
              <td width="32%"> 
                <input type="radio" name="sfbxx" value="1">
                ��ѡ 
                <input type="radio" name="sfbxx" value="2">
                �Ǳ�ѡ </td>
              <td width="20%" align="right">�Ƿ����ҵ��</td>
              <td width="30%"> 
                <input type="radio" name="sfjrqye" value="1">
                �� 
                <input type="radio" name="sfjrqye" value="2">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�Ƿ����ʩ���ӽ���</td>
              <td><input type="radio" name="sfcysgdjs" value="Y">
��
  <input type="radio" name="sfcysgdjs" value="N">
�� </td>
              <td align="right">�Ƿ�ɴ���</td>
              <td><input type="radio" name="sfkdz" value="N">
���ɴ���
  <input type="radio" name="sfkdz" value="Y">
�ɴ���</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�Ƿ���ȡ˰��</td>
              <td width="32%"><%
	cf.radioToken(out, "jrsjbz","1+��ȡ&2+����ȡ","");
%></td>
              <td width="20%" align="right">�Ƿ���ȡ�����</td>
              <td width="30%"><%
	cf.radioToken(out, "jrglfbz","1+��ȡ&2+����ȡ","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ʦ�Ƿ�����Ȩʹ��</td>
              <td>
				  <input name="sfxsq" type="radio" value="1">������Ȩ
				  <input type="radio" name="sfxsq" value="2">����Ȩʹ��
				  <input type="radio" name="sfxsq" value="3">ͣ��				</td>
              <td align="right">�Ƿ�����ͬ��ֵë��</td>
              <td><input type="radio" name="sfjrhtjz" value="Y">
����
  <input type="radio" name="sfjrhtjz" value="N">
�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�Ƿ�����տ�</td>
              <td><input type="radio" name="sffqsk" value="1">
                ��
                <input type="radio" name="sffqsk" value="2">
                �� </td>
              <td align="right">�ɱ��ۼ��㷽ʽ</td>
              <td><input type="radio" name="cbjjsfs" value="1">
��ǰ
  <input type="radio" name="cbjjsfs" value="2">
�ۺ�
<input type="radio" name="cbjjsfs" value="3">
������</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�Ƿ�װ�շ�</td>
              <td><input type="radio" name="sfjzsf" value="Y">
                ��
                <input name="sfjzsf" type="radio" value="N">
                ��</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
