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
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">�Ͳ���--��ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">������˾</td>
      <td width="30%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
      <td width="20%" align="right">ǩԼ����</td>
      <td width="30%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1") || yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�ͻ����</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">��ͬ��</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�ͻ�����</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">���ݵ�ַ</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ϵ��ʽ</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
      <td align="right" width="20%">��װ���ʦ</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ǩԼ���� ��</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ʩ����</td>
      <td width="30%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">�ʼ�</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�������</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_ddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">����״̬</td>
      <td width="30%"> 
        <select name="jc_jjdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select clzt,clztmc from jdm_jjddzt order by clzt","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">פ��Ҿӹ���</td>
      <td width="30%"> 
        <select name="jc_jjdd_clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">չ���Ҿӹ���</td>
      <td width="30%"> 
        <select name="jc_jjdd_ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�Ҿ����ʦ</td>
      <td width="30%"> 
        <select name="jc_jjdd_jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">��ĿרԱ</td>
      <td width="30%"> 
        <select name="jc_jjdd_xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�Ҿ߹���</td>
      <td width="30%"> 
        <select name="jc_jjdd_pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
%> 
        </select>
      </td>
      <td align="right" width="20%">�Ͳ��Ź���</td>
      <td width="30%"> 
        <select name="jc_jjdd_xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�Ͳ�������</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_xcmmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">��װλ��</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_azwz" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�߿�ϵ���ͺ�</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_bklxxh" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">�߿���ɫ</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_bkys" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">������1</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_mbcl1" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">������2</td>
      <td width="30%"> 
        <input type="text" name="jc_jjxcmmx_mbcl2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ǩ��ͬʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_qhtsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_qhtsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">¼��ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="jc_jjdd_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#CCFFFF"> 
      <td width="20%" align="right">�������</td>
      <td colspan="3" bgcolor="#CCFFFF"> ��һ�� 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
          <option value="crm_khxx.khbh ">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="crm_khxx.sgd">ʩ����</option>
          <option value="crm_khxx.zjxm">�ʼ�Ա</option>
          <option value="crm_khxx.hth">��ͬ��</option>
          <option value="crm_khxx.gcjdbm">���̽���</option>
          <option value="crm_khxx.qyrq desc">ǩԼ����</option>

          <option value="jc_jjdd.ddbh">�������</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
          <option value="jc_jjdd.pdgc">�Ҿ߹���</option>
          <option value="jc_jjdd.xcmgc">�Ͳ��Ź���</option>
          <option value="jc_jjdd.clzt">����״̬</option>

          <option value="jc_jjxcmmx.xcmmc">�Ͳ�������</option>
          <option value="jc_jjxcmmx.azwz">��װλ��</option>
          <option value="jc_jjxcmmx.bklxxh">�߿�ϵ���ͺ�</option>
          <option value="jc_jjxcmmx.bkys">�߿���ɫ</option>
          <option value="jc_jjxcmmx.mbcl1">������1</option>
          <option value="jc_jjxcmmx.mbcl2">������2</option>
        </select>
        �ڶ��� 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
          <option value="crm_khxx.khbh ">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="crm_khxx.sgd">ʩ����</option>
          <option value="crm_khxx.zjxm">�ʼ�Ա</option>
          <option value="crm_khxx.hth">��ͬ��</option>
          <option value="crm_khxx.gcjdbm">���̽���</option>
          <option value="crm_khxx.qyrq desc">ǩԼ����</option>

          <option value="jc_jjdd.ddbh">�������</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
          <option value="jc_jjdd.pdgc">�Ҿ߹���</option>
          <option value="jc_jjdd.xcmgc">�Ͳ��Ź���</option>
          <option value="jc_jjdd.clzt">����״̬</option>

          <option value="jc_jjxcmmx.xcmmc">�Ͳ�������</option>
          <option value="jc_jjxcmmx.azwz">��װλ��</option>
          <option value="jc_jjxcmmx.bklxxh">�߿�ϵ���ͺ�</option>
          <option value="jc_jjxcmmx.bkys">�߿���ɫ</option>
          <option value="jc_jjxcmmx.mbcl1">������1</option>
          <option value="jc_jjxcmmx.mbcl2">������2</option>
        </select>
        ������ 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
          <option value="crm_khxx.khbh ">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="crm_khxx.sgd">ʩ����</option>
          <option value="crm_khxx.zjxm">�ʼ�Ա</option>
          <option value="crm_khxx.hth">��ͬ��</option>
          <option value="crm_khxx.gcjdbm">���̽���</option>
          <option value="crm_khxx.qyrq desc">ǩԼ����</option>

          <option value="jc_jjdd.ddbh">�������</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
          <option value="jc_jjdd.pdgc">�Ҿ߹���</option>
          <option value="jc_jjdd.xcmgc">�Ͳ��Ź���</option>
          <option value="jc_jjdd.clzt">����״̬</option>

          <option value="jc_jjxcmmx.xcmmc">�Ͳ�������</option>
          <option value="jc_jjxcmmx.azwz">��װλ��</option>
          <option value="jc_jjxcmmx.bklxxh">�߿�ϵ���ͺ�</option>
          <option value="jc_jjxcmmx.bkys">�߿���ɫ</option>
          <option value="jc_jjxcmmx.mbcl1">������1</option>
          <option value="jc_jjxcmmx.mbcl2">������2</option>
        </select>
        <br>
        <br>
        ������ 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
          <option value="crm_khxx.khbh ">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="crm_khxx.sgd">ʩ����</option>
          <option value="crm_khxx.zjxm">�ʼ�Ա</option>
          <option value="crm_khxx.hth">��ͬ��</option>
          <option value="crm_khxx.gcjdbm">���̽���</option>
          <option value="crm_khxx.qyrq desc">ǩԼ����</option>

          <option value="jc_jjdd.ddbh">�������</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
          <option value="jc_jjdd.pdgc">�Ҿ߹���</option>
          <option value="jc_jjdd.xcmgc">�Ͳ��Ź���</option>
          <option value="jc_jjdd.clzt">����״̬</option>

          <option value="jc_jjxcmmx.xcmmc">�Ͳ�������</option>
          <option value="jc_jjxcmmx.azwz">��װλ��</option>
          <option value="jc_jjxcmmx.bklxxh">�߿�ϵ���ͺ�</option>
          <option value="jc_jjxcmmx.bkys">�߿���ɫ</option>
          <option value="jc_jjxcmmx.mbcl1">������1</option>
          <option value="jc_jjxcmmx.mbcl2">������2</option>
        </select>
        ������ 
        <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
          <option value="crm_khxx.khbh ">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="crm_khxx.sgd">ʩ����</option>
          <option value="crm_khxx.zjxm">�ʼ�Ա</option>
          <option value="crm_khxx.hth">��ͬ��</option>
          <option value="crm_khxx.gcjdbm">���̽���</option>
          <option value="crm_khxx.qyrq desc">ǩԼ����</option>

          <option value="jc_jjdd.ddbh">�������</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
          <option value="jc_jjdd.pdgc">�Ҿ߹���</option>
          <option value="jc_jjdd.xcmgc">�Ͳ��Ź���</option>
          <option value="jc_jjdd.clzt">����״̬</option>

          <option value="jc_jjxcmmx.xcmmc">�Ͳ�������</option>
          <option value="jc_jjxcmmx.azwz">��װλ��</option>
          <option value="jc_jjxcmmx.bklxxh">�߿�ϵ���ͺ�</option>
          <option value="jc_jjxcmmx.bkys">�߿���ɫ</option>
          <option value="jc_jjxcmmx.mbcl1">������1</option>
          <option value="jc_jjxcmmx.mbcl2">������2</option>
        </select>
        ������ 
        <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
          <option value="crm_khxx.khbh ">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="crm_khxx.sgd">ʩ����</option>
          <option value="crm_khxx.zjxm">�ʼ�Ա</option>
          <option value="crm_khxx.hth">��ͬ��</option>
          <option value="crm_khxx.gcjdbm">���̽���</option>
          <option value="crm_khxx.qyrq desc">ǩԼ����</option>

          <option value="jc_jjdd.ddbh">�������</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
          <option value="jc_jjdd.pdgc">�Ҿ߹���</option>
          <option value="jc_jjdd.xcmgc">�Ͳ��Ź���</option>
          <option value="jc_jjdd.clzt">����״̬</option>

          <option value="jc_jjxcmmx.xcmmc">�Ͳ�������</option>
          <option value="jc_jjxcmmx.azwz">��װλ��</option>
          <option value="jc_jjxcmmx.bklxxh">�߿�ϵ���ͺ�</option>
          <option value="jc_jjxcmmx.bkys">�߿���ɫ</option>
          <option value="jc_jjxcmmx.mbcl1">������1</option>
          <option value="jc_jjxcmmx.mbcl2">������2</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%" >��ʾ���</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
        <input type="text" name="myxssl" size="7" maxlength="13" value="30">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="����">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">ͳ�Ʊ�</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
          <option value="jjsjs">�Ҿ����ʦ</option>
          <option value="a.gysmc">�Ҿ߹���</option>
          <option value="b.gysmc">�Ͳ��Ź���</option>
          <option value="clztmc">����״̬</option>

          <option value="xcmmc">�Ͳ�������</option>
          <option value="azwz">��װλ��</option>
          <option value="bklxxh">�߿�ϵ���ͺ�</option>
          <option value="bkys">�߿���ɫ</option>
          <option value="mbcl1">������1</option>
          <option value="mbcl2">������2</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">��װ���ʦ</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
          <option value="cgsjs">�������ʦ</option>
          <option value="gysmc">�ɵ�����</option>
          <option value="clztmc">����״̬</option>

          <option value="xcmmc">�Ͳ�������</option>
          <option value="azwz">��װλ��</option>
          <option value="bklxxh">�߿�ϵ���ͺ�</option>
          <option value="bkys">�߿���ɫ</option>
          <option value="mbcl1">������1</option>
          <option value="mbcl2">������2</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">��װ���ʦ</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
          <option value="cgsjs">�������ʦ</option>
          <option value="gysmc">�ɵ�����</option>
          <option value="clztmc">����״̬</option>

          <option value="xcmmc">�Ͳ�������</option>
          <option value="azwz">��װλ��</option>
          <option value="bklxxh">�߿�ϵ���ͺ�</option>
          <option value="bkys">�߿���ɫ</option>
          <option value="mbcl1">������1</option>
          <option value="mbcl2">������2</option>
        </select>
        <br>
        <br>
        ������ 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">��װ���ʦ</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
          <option value="cgsjs">�������ʦ</option>
          <option value="gysmc">�ɵ�����</option>
          <option value="clztmc">����״̬</option>

          <option value="xcmmc">�Ͳ�������</option>
          <option value="azwz">��װλ��</option>
          <option value="bklxxh">�߿�ϵ���ͺ�</option>
          <option value="bkys">�߿���ɫ</option>
          <option value="mbcl1">������1</option>
          <option value="mbcl2">������2</option>
        </select>
        ������ 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">��װ���ʦ</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
          <option value="cgsjs">�������ʦ</option>
          <option value="gysmc">�ɵ�����</option>
          <option value="clztmc">����״̬</option>

          <option value="xcmmc">�Ͳ�������</option>
          <option value="azwz">��װλ��</option>
          <option value="bklxxh">�߿�ϵ���ͺ�</option>
          <option value="bkys">�߿���ɫ</option>
          <option value="mbcl1">������1</option>
          <option value="mbcl2">������2</option>
        </select>
        ������ 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">��װ���ʦ</option>
          <option value="jc_jjdd.xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
          <option value="cgsjs">�������ʦ</option>
          <option value="gysmc">�ɵ�����</option>
          <option value="clztmc">����״̬</option>

          <option value="xcmmc">�Ͳ�������</option>
          <option value="azwz">��װλ��</option>
          <option value="bklxxh">�߿�ϵ���ͺ�</option>
          <option value="bkys">�߿���ɫ</option>
          <option value="mbcl1">������1</option>
          <option value="mbcl2">������2</option>
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj2, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_jjxcmmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_jjxcmmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
