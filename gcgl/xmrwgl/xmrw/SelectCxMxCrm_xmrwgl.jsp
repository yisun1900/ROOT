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
<form method="post" action="Crm_xmrwglCxMxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC">��ѯ�������</td>
  <td colspan="3"> ��һ��
    <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="crm_khxx.khxm">�ͻ�����</option>
        <option value="crm_khxx.fwdz">���ݵ�ַ</option>
        <option value="crm_khxx.hth">��ͬ��</option>
        <option value="crm_xmrwgl.rwxh" >�������</option>
        <option value="crm_xmrwgl.rwbm">�������</option>
        <option value="crm_xmrwgl.rwmc">��������</option>
        <option value="crm_xmrwgl.rwflbm">�������</option>
        <option value="crm_xmrwgl.zdjkrw">�ص�������</option>
        <option value="crm_xmrwgl.jhkssj">�ƻ���ʼʱ��</option>
        <option value="crm_xmrwgl.jhjssj">�ƻ�����ʱ��</option>
        <option value="crm_xmrwgl.sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="crm_xmrwgl.sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="crm_xmrwgl.rwsyts">����˳������</option>
      </select>
    �ڶ���
    <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="crm_khxx.khxm">�ͻ�����</option>
        <option value="crm_khxx.fwdz">���ݵ�ַ</option>
        <option value="crm_khxx.hth">��ͬ��</option>
        <option value="crm_xmrwgl.rwxh" selected>�������</option>
        <option value="crm_xmrwgl.rwbm">�������</option>
        <option value="crm_xmrwgl.rwmc">��������</option>
        <option value="crm_xmrwgl.rwflbm">�������</option>
        <option value="crm_xmrwgl.zdjkrw">�ص�������</option>
        <option value="crm_xmrwgl.jhkssj">�ƻ���ʼʱ��</option>
        <option value="crm_xmrwgl.jhjssj">�ƻ�����ʱ��</option>
        <option value="crm_xmrwgl.sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="crm_xmrwgl.sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="crm_xmrwgl.rwsyts">����˳������</option>
    </select>
    ������
    <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="crm_khxx.khxm">�ͻ�����</option>
        <option value="crm_khxx.fwdz">���ݵ�ַ</option>
        <option value="crm_khxx.hth">��ͬ��</option>
        <option value="crm_xmrwgl.rwxh" >�������</option>
        <option value="crm_xmrwgl.rwbm">�������</option>
        <option value="crm_xmrwgl.rwmc">��������</option>
        <option value="crm_xmrwgl.rwflbm">�������</option>
        <option value="crm_xmrwgl.zdjkrw">�ص�������</option>
        <option value="crm_xmrwgl.jhkssj">�ƻ���ʼʱ��</option>
        <option value="crm_xmrwgl.jhjssj">�ƻ�����ʱ��</option>
        <option value="crm_xmrwgl.sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="crm_xmrwgl.sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="crm_xmrwgl.rwsyts">����˳������</option>
    </select>
    <BR>
    <BR>
    ������
    <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="crm_khxx.khxm">�ͻ�����</option>
        <option value="crm_khxx.fwdz">���ݵ�ַ</option>
        <option value="crm_khxx.hth">��ͬ��</option>
        <option value="crm_xmrwgl.rwxh" >�������</option>
        <option value="crm_xmrwgl.rwbm">�������</option>
        <option value="crm_xmrwgl.rwmc">��������</option>
        <option value="crm_xmrwgl.rwflbm">�������</option>
        <option value="crm_xmrwgl.zdjkrw">�ص�������</option>
        <option value="crm_xmrwgl.jhkssj">�ƻ���ʼʱ��</option>
        <option value="crm_xmrwgl.jhjssj">�ƻ�����ʱ��</option>
        <option value="crm_xmrwgl.sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="crm_xmrwgl.sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="crm_xmrwgl.rwsyts">����˳������</option>
    </select>
    ������
    <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="crm_khxx.khxm">�ͻ�����</option>
        <option value="crm_khxx.fwdz">���ݵ�ַ</option>
        <option value="crm_khxx.hth">��ͬ��</option>
        <option value="crm_xmrwgl.rwxh" >�������</option>
        <option value="crm_xmrwgl.rwbm">�������</option>
        <option value="crm_xmrwgl.rwmc">��������</option>
        <option value="crm_xmrwgl.rwflbm">�������</option>
        <option value="crm_xmrwgl.zdjkrw">�ص�������</option>
        <option value="crm_xmrwgl.jhkssj">�ƻ���ʼʱ��</option>
        <option value="crm_xmrwgl.jhjssj">�ƻ�����ʱ��</option>
        <option value="crm_xmrwgl.sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="crm_xmrwgl.sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="crm_xmrwgl.rwsyts">����˳������</option>
    </select>
    ������
    <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="crm_khxx.khxm">�ͻ�����</option>
        <option value="crm_khxx.fwdz">���ݵ�ַ</option>
        <option value="crm_khxx.hth">��ͬ��</option>
        <option value="crm_xmrwgl.rwxh" >�������</option>
        <option value="crm_xmrwgl.rwbm">�������</option>
        <option value="crm_xmrwgl.rwmc">��������</option>
        <option value="crm_xmrwgl.rwflbm">�������</option>
        <option value="crm_xmrwgl.zdjkrw">�ص�������</option>
        <option value="crm_xmrwgl.jhkssj">�ƻ���ʼʱ��</option>
        <option value="crm_xmrwgl.jhjssj">�ƻ�����ʱ��</option>
        <option value="crm_xmrwgl.sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="crm_xmrwgl.sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="crm_xmrwgl.rwsyts">����˳������</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" >��ʾ���</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    ��ҳ
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
    <input type="text" name="myxssl" size="7" maxlength="13" value="25">  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
    <input type="reset"  value="����">  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">ͳ�Ʊ�</td>
  <td colspan="3"> ��һ��
    <input type="hidden" name="tj1name" value="">
      <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
        <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="hth">��ͬ��</option>
        <option value="rwxh" >�������</option>
        <option value="rwbm">�������</option>
        <option value="rwmc">��������</option>
        <option value="rwflmc">�������</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','�ص�','2','���ص�')">�ص�������</option>
        <option value="jhkssj">�ƻ���ʼʱ��</option>
        <option value="jhjssj">�ƻ�����ʱ��</option>
        <option value="sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="rwsyts">����˳������</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','��','N','��')">�Ƿ�Ӱ���������</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','��','N','��')">�Ƿ�Ӱ�츴��</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','��','N','��')">�Ƿ�������</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','��','N','��')">�Ƿ�Ϊ��̱�</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','ͨ��','N','δͨ��')">���ս���</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','��','N','��')">�Ƿ��й��ڱ����</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','���','N','δ���')">�����Ƿ����</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','��','N','��')">�Ƿ��з�����</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','���','N','��')">�����Ƿ����</option>
      </select>
    �ڶ���
    <input type="hidden" name="tj2name" value="">
    <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="hth">��ͬ��</option>
        <option value="rwxh" >�������</option>
        <option value="rwbm">�������</option>
        <option value="rwmc">��������</option>
        <option value="rwflmc">�������</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','�ص�','2','���ص�')">�ص�������</option>
        <option value="jhkssj">�ƻ���ʼʱ��</option>
        <option value="jhjssj">�ƻ�����ʱ��</option>
        <option value="sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="rwsyts">����˳������</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','��','N','��')">�Ƿ�Ӱ���������</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','��','N','��')">�Ƿ�Ӱ�츴��</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','��','N','��')">�Ƿ�������</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','��','N','��')">�Ƿ�Ϊ��̱�</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','ͨ��','N','δͨ��')">���ս���</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','��','N','��')">�Ƿ��й��ڱ����</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','���','N','δ���')">�����Ƿ����</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','��','N','��')">�Ƿ��з�����</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','���','N','��')">�����Ƿ����</option>
    </select>
    ������
    <input type="hidden" name="tj3name" value="">
    <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="hth">��ͬ��</option>
        <option value="rwxh" >�������</option>
        <option value="rwbm">�������</option>
        <option value="rwmc">��������</option>
        <option value="rwflmc">�������</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','�ص�','2','���ص�')">�ص�������</option>
        <option value="jhkssj">�ƻ���ʼʱ��</option>
        <option value="jhjssj">�ƻ�����ʱ��</option>
        <option value="sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="rwsyts">����˳������</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','��','N','��')">�Ƿ�Ӱ���������</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','��','N','��')">�Ƿ�Ӱ�츴��</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','��','N','��')">�Ƿ�������</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','��','N','��')">�Ƿ�Ϊ��̱�</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','ͨ��','N','δͨ��')">���ս���</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','��','N','��')">�Ƿ��й��ڱ����</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','���','N','δ���')">�����Ƿ����</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','��','N','��')">�Ƿ��з�����</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','���','N','��')">�����Ƿ����</option>
    </select>
    <BR>
    <BR>
    ������
    <input type="hidden" name="tj4name" value="">
    <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="hth">��ͬ��</option>
        <option value="rwxh" >�������</option>
        <option value="rwbm">�������</option>
        <option value="rwmc">��������</option>
        <option value="rwflmc">�������</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','�ص�','2','���ص�')">�ص�������</option>
        <option value="jhkssj">�ƻ���ʼʱ��</option>
        <option value="jhjssj">�ƻ�����ʱ��</option>
        <option value="sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="rwsyts">����˳������</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','��','N','��')">�Ƿ�Ӱ���������</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','��','N','��')">�Ƿ�Ӱ�츴��</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','��','N','��')">�Ƿ�������</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','��','N','��')">�Ƿ�Ϊ��̱�</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','ͨ��','N','δͨ��')">���ս���</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','��','N','��')">�Ƿ��й��ڱ����</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','���','N','δ���')">�����Ƿ����</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','��','N','��')">�Ƿ��з�����</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','���','N','��')">�����Ƿ����</option>
    </select>
    ������
    <input type="hidden" name="tj5name" value="">
    <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="hth">��ͬ��</option>
        <option value="rwxh" >�������</option>
        <option value="rwbm">�������</option>
        <option value="rwmc">��������</option>
        <option value="rwflmc">�������</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','�ص�','2','���ص�')">�ص�������</option>
        <option value="jhkssj">�ƻ���ʼʱ��</option>
        <option value="jhjssj">�ƻ�����ʱ��</option>
        <option value="sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="rwsyts">����˳������</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','��','N','��')">�Ƿ�Ӱ���������</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','��','N','��')">�Ƿ�Ӱ�츴��</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','��','N','��')">�Ƿ�������</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','��','N','��')">�Ƿ�Ϊ��̱�</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','ͨ��','N','δͨ��')">���ս���</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','��','N','��')">�Ƿ��й��ڱ����</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','���','N','δ���')">�����Ƿ����</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','��','N','��')">�Ƿ��з�����</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','���','N','��')">�����Ƿ����</option>
    </select>
    ������
    <input type="hidden" name="tj6name" value="">
    <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
      <option value=""></option>
        <option value="crm_xmrwgl.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="hth">��ͬ��</option>
        <option value="rwxh" >�������</option>
        <option value="rwbm">�������</option>
        <option value="rwmc">��������</option>
        <option value="rwflmc">�������</option>
        <option value="DECODE(crm_xmrwgl.zdjkrw,'1','�ص�','2','���ص�')">�ص�������</option>
        <option value="jhkssj">�ƻ���ʼʱ��</option>
        <option value="jhjssj">�ƻ�����ʱ��</option>
        <option value="sjkssj">ʵ�ʿ�ʼʱ��</option>
        <option value="sjjssj">ʵ�ʽ���ʱ��</option>
        <option value="rwsyts">����˳������</option>
        <option value="DECODE(crm_xmrwgl.sfyxhxgq,'Y','��','N','��')">�Ƿ�Ӱ���������</option>
        <option value="DECODE(crm_xmrwgl.sfyxfc,'Y','��','N','��')">�Ƿ�Ӱ�츴��</option>
        <option value="DECODE(crm_xmrwgl.sfxys,'Y','��','N','��')">�Ƿ�������</option>
        <option value="DECODE(crm_xmrwgl.sfwlcb,'Y','��','N','��')">�Ƿ�Ϊ��̱�</option>
        <option value="DECODE(crm_xmrwgl.ysjl,'Y','ͨ��','N','δͨ��')">���ս���</option>
        <option value="DECODE(crm_xmrwgl.sfybgd,'Y','��','N','��')">�Ƿ��й��ڱ����</option>
        <option value="DECODE(crm_xmrwgl.zgsfwc,'Y','���','N','δ���')">�����Ƿ����</option>
        <option value="DECODE(crm_xmrwgl.sfyfbd,'Y','��','N','��')">�Ƿ��з�����</option>
        <option value="DECODE(crm_xmrwgl.fbsfwc,'Y','���','N','��')">�����Ƿ����</option>
    </select>  </td>
</tr>
<tr align="center">
  <td colspan="4"><input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ͻ����</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">�ͻ�����</td> 
  <td width="31%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼�벿��</td>
  <td><input type="text" name="crm_xmrwgl_lrbm" size="20" maxlength="5" >  </td>
  <td align="right">���ݵ�ַ</td>
  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ͬ��</td>
  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right">���ʦ</td>
  <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�������</td> 
  <td width="31%"> 
    <select name="crm_xmrwgl_rwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwbm,rwmc from dm_bzrwbm order by rwbm","");
%>
    </select>  </td>
  <td align="right" width="19%">��������</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_rwmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�������</td> 
  <td width="31%"> 
    <select name="crm_xmrwgl_rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm","");
%>
    </select>  </td>
  <td align="right" width="19%">�ص�������</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_zdjkrw","1+�ص���&2+���ص���","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�������</td>
  <td><%
	cf.radioToken(out, "sfxtx","Y+������&N+��","");
%></td>
  <td align="right">��������</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjjbbm,bjjbmc from dm_bjjbbm order by bjjbbm","");
	%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="txrq" size="20" maxlength="8"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="txrq2" size="20" maxlength="8"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����Сʱ</td>
  <td><input type="text" name="txxs" size="20" maxlength="8"  value="" ></td>
  <td align="right">��</td>
  <td><input type="text" name="txxs2" size="20" maxlength="8"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�������</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "crm_xmrwgl_bjlb","1+��ǰ����&2+�º�����&3+��ǰ�º�����&9+һ���¼","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ǰ�������� ��</td>
  <td><input type="text" name="crm_xmrwgl_sqtxts" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_sqtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�º��������� ��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_shtxts" size="20" maxlength="8" ></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_shtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�Ӱ���������</td>
  <td><%
	cf.radioToken(out, "crm_xmrwgl_sfyxhxgq","Y+��&N+��","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�Ƿ�Ӱ�츴��</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfyxfc","Y+��&N+��","");
%>  </td>
  <td align="right" width="19%">�Ƿ�������</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfxys","Y+��&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�Ƿ�Ϊ��̱�</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfwlcb","Y+��&N+��","");
%>  </td>
  <td align="right" width="19%">ժҪ����</td> 
  <td width="31%"> 
    <select name="crm_xmrwgl_zyrwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�������</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_rwxh" size="20" maxlength="8" >  </td>
  <td align="right" width="19%">������</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_zrr" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ڵ�÷�</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_jddf" size="20" maxlength="8" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ���ʼʱ�� ��</td>
  <td><input type="text" name="crm_xmrwgl_jhkssj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_jhkssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ�����ʱ�� ��</td>
  <td><input type="text" name="crm_xmrwgl_jhjssj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_jhjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ƻ������� ��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_jhgzr" size="20" maxlength="8" ></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_jhgzr2" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ڵ�˳������ ��</td>
  <td><input type="text" name="crm_xmrwgl_jdsyts" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_jdsyts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">ʵ�ʿ�ʼʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjkssj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjkssj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʵ�ʽ���ʱ�� ��</td>
  <td><input type="text" name="crm_xmrwgl_sjjssj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_sjjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">ʵ�ʹ����� ��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjgzr" size="20" maxlength="8" ></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_sjgzr2" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_ysr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="crm_xmrwgl_yssj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_yssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���ս���</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_ysjl","Y+ͨ��&N+δͨ��","");
%>  </td>
  <td align="right" width="19%">�Ƿ�����</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfyq","Y+��&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������� ��</td>
  <td><input type="text" name="crm_xmrwgl_yqts" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_yqts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�������η�</td> 
  <td width="31%"><input type="text" name="crm_xmrwgl_yqzrf" size="20" maxlength="20" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�Ƿ��й��ڱ����</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfybgd","Y+��&N+��","");
%>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ԥ���������ʱ�� ��</td>
  <td><input type="text" name="crm_xmrwgl_yjzgwcsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_yjzgwcsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�����Ƿ����</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_zgsfwc","Y+���&N+δ���","");
%>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������ʱ�� ��</td>
  <td><input type="text" name="crm_xmrwgl_zgwcsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_zgwcsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�Ƿ��з�����</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_sfyfbd","Y+��&N+��","");
%>  </td>
  <td align="right" width="19%">�����Ƿ����</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "crm_xmrwgl_fbsfwc","Y+���&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="crm_xmrwgl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmrwgl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼����</td> 
  <td width="31%"> 
    <input type="text" name="crm_xmrwgl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_xmrwgl_sqtxts, "��ǰ��������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_sqtxts2, "��ǰ��������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_shtxts, "�º���������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_shtxts2, "�º���������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_rwxh, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jddf, "�ڵ�÷�"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhkssj, "�ƻ���ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhkssj2, "�ƻ���ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhjssj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_jhjssj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jhgzr, "�ƻ�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jhgzr2, "�ƻ�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jdsyts, "�ڵ�˳������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_jdsyts2, "�ڵ�˳������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjkssj, "ʵ�ʿ�ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjkssj2, "ʵ�ʿ�ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjjssj, "ʵ�ʽ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_sjjssj2, "ʵ�ʽ���ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_sjgzr, "ʵ�ʹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_sjgzr2, "ʵ�ʹ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yssj2, "����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_yqts, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_xmrwgl_yqts2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yjzgwcsj, "Ԥ���������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_yjzgwcsj2, "Ԥ���������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_zgwcsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_zgwcsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmrwgl_lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Crm_xmrwglCxMxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Crm_xmrwglTjList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
