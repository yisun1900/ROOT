<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��λ��Ϣ��ά��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_dwxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%"> 
                <div align="right">��λ���</div>              </td>
              <td width="27%"> 
                <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >              </td>
              <td width="21%"> 
                <div align="right">��λ����</div>              </td>
              <td width="29%"> 
                <select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="A0">�ܲ�</option>
                  <option value="A1">�ܲ�������</option>
                  <option value="F0">�ֹ�˾</option>
                  <option value="F1">�ֹ�˾������</option>
                  <option value="F2">����</option>
                  <option value="F3">���С��</option>
                  <option value="F4">�г�С��</option>
                  <option value="F5">����С��</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%"> 
                <div align="right">��λ���</div>              </td>
              <td width="27%"> 
                <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >              </td>
              <td width="21%"> 
                <div align="right">��λ����</div>              </td>
              <td width="29%"> 
                <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">��λ����</td>
              <td width="27%"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
                </select>              </td>
              <td width="21%" align="right">��������</td>
              <td width="29%"> 
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">��������</td>
              <td width="27%"> 
                <select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
                </select>              </td>
              <td width="21%" align="right">��˾����</td>
              <td width="29%"> 
                <select name="sfjms" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">ֱӪ��˾</option>
                  <option value="Y">���˹�˾</option>
                  <option value="Q">������˾</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">�����ֹ�˾</td>
              <td width="27%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
%> 
                </select>              </td>
              <td width="21%" align="right">�ϼ���λ</td>
              <td width="29%"> 
                <select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwlx in('A0','F0','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">��ͬ��ǰ׺</td>
              <td width="27%"> 
                <input type="text" name="hthqz" value="" size="20" maxlength="5" >              </td>
              <td width="21%" align="right">������־</td>
              <td width="29%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ����</option>
                  <option value="Y">�ѳ���</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">������λ</td>
              <td width="27%"> 
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
                </select>              </td>
              <td width="21%" align="right">��λ����</td>
              <td width="29%"> 
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">��λ��ַ</td>
              <td width="27%"> 
                <input type="text" name="sq_dwxx_dwdz" size="20" maxlength="100" >              </td>
              <td width="21%" align="right">��ĿרԱ</td>
              <td width="29%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%"> 
                <div align="right">��λ������</div>              </td>
              <td width="27%"> 
                <input type="text" name="sq_dwxx_dwfzr" size="20" maxlength="20" >              </td>
              <td width="21%"> 
                <div align="right">��λ�绰</div>              </td>
              <td width="29%"> 
                <input type="text" name="sq_dwxx_dwdh" size="20" maxlength="30" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%"> 
                <div align="right">��λ����</div>              </td>
              <td width="27%" bgcolor="#FFFFFF"> 
                <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >              </td>
              <td width="21%" align="right">������ʽ</td>
              <td width="29%"> 
                <select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs","");
%> 
                </select>              </td>
            </tr>
            <tr align="center" bgcolor="#CCCCFF"> 
              <td colspan="4" height="26"><b>�������</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">Ͷ�߱��޹�Ӧ�̼��</td>
              <td width="27%" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcppbz","Y+ȡ����&N+ȡ�����ֵ�","");
%></td>
              <td width="21%" align="right">���ɶ�������ĿרԱ����</td>
              <td width="29%"><%
	cf.radioToken(out, "xmzyglbz","N+������&Y+����","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">���ûط�ʱ���Զ�����(4λ)</td>
              <td width="27%" bgcolor="#FFFFFF"> 
                <input type="text" name="hfsjzdsz" value="" size="10" maxlength="4" >              </td>
              <td width="21%" align="right">���ɶ����ԼҾӹ��ʹ���</td>
              <td width="29%"><%
	cf.radioToken(out, "jjgwglbz","N+������&Y+����","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">������ѯ�ͻ�¼����</td>
              <td width="27%" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+������&Y+����","");
%></td>
              <td width="21%" align="right">��ѯ�ͻ���ǰ¼������</td>
              <td width="29%"> 
                <input type="text" name="zxkhlrts" value="" size="10" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">����ǩ���ͻ���¼���</td>
              <td width="27%" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+������&Y+����","");
%></td>
              <td width="21%" align="right">ǩ���ͻ���¼��������</td>
              <td width="29%"> 
                <input type="text" name="qdkhblts" value="" size="10" maxlength="8" >              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���õ��ӱ��ۼ��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]<BR>&2+2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]<BR>&3+3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����<BR>&6+6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬��¼����<BR>&4+4�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸ�<BR>&7+7��[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸģ��ɸ������Ż�<BR>&5+5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">���ɶ�������С��</td>
              <td colspan="3"><%
	cf.radioToken(out, "jcddblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ɶ�����ϸ����С��</td>
              <td colspan="3"><%
	cf.radioToken(out, "jcddmxblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ","");
%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="23%" align="right">��ѯ�������</td>
              <td colspan="3"> 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="sq_dwxx.dwbh">��λ���</option>
                  <option value="sq_dwxx.dwmc">��λ����</option>
                  <option value="sq_dwxx.ssfgs">�����ֹ�˾</option>
                  <option value="sq_dwxx.dwlx">��λ����</option>
                </select>              </td>
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
	if(!(isNumber(FormName.zxkhlrts, "��ѯ�ͻ���ǰ¼������"))) {
		return false;
	}
	if(!(isNumber(FormName.qdkhblts, "ǩ���ͻ���¼��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
