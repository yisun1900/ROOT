<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");

String zcxlbmstr=cf.getItemData("select zcxlmc c1,zcxlmc c2,zcdlmc from jdm_zcxlbm order by zcdlmc,zcxlbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right">������˾</td>
      <td width="29%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
      <td width="22%" align="right">ǩԼ����</td>
      <td width="28%"> 
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
      <td align="right" width="21%">�ͻ����</td>
      <td width="29%"> 
        <input type="text" name="jc_zcdd_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="22%">�ͻ�����</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">���ݵ�ַ</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="22%">��ϵ��ʽ</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">��ͬ��</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="22%">��װ���ʦ</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">����ǩԼ���</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">��װǩԼ���� ��</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">ʩ����</td>
      <td width="29%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc","");
%> 
        </select>
      </td>
      <td align="right" width="22%">�ʼ�</td>
      <td width="28%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">פ��Ҿӹ���</td>
      <td width="29%"> 
        <select name="jc_zcdd_clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="22%">չ���Ҿӹ���</td>
      <td width="28%"> 
        <select name="jc_zcdd_ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">��ĿרԱ</td>
      <td width="29%"> 
        <select name="jc_zcdd_xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="22%">�Ҿ����ʦ</td>
      <td width="28%"> 
        <select name="jc_zcdd_jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2  from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�������</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_ddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">��������</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zcmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">���Ĵ���</td>
      <td width="29%"> 
        <select name="jc_zcddmx_zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(jc_zcddmx_zcdlbm,jc_zcddmx_zcxlbm,<%=zcxlbmstr%>)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm order by zcdlbm","");
%> 
        </select>
      </td>
      <td align="right" width="22%">����С��</td>
      <td width="28%"> 
        <select name="jc_zcddmx_zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm  order by zcxlbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">����Ʒ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_dwbh" size="20" maxlength="50" >
      </td>
      <td align="right" width="22%">�������ϵ��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zclbbm" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�����ͺ�</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_xinghao" size="20" maxlength="100" >
      </td>
      <td align="right" width="22%">���Ĺ��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_gg" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">������ɫ</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zcysbm" size="20" maxlength="100" >
      </td>
      <td align="right" width="22%">�����Ƿ��д���</td>
      <td width="28%"> <%
	cf.radioToken(out, "jc_zcddmx_sfycx","N+û����&Y+�д���","");
%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">����ʼʱ�� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxkssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxkssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">��������ʱ�� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxjzsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">ѡ��۸�</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_xzjg","1+�����޼�&2+������","");
%> </td>
      <td align="right" width="22%">ʵ������</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_dj" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">��ͬ���� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_sl" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_sl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">���Ϸ� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_je" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_je2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">���������� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhsl" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zjhsl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">��������Ϸ� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhje" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zjhje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">������Զ�̷�</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhycf" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">������װλ��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_zcpzwzbm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%" bgcolor="#FFFFFF">�Ƿ�μӴ����</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_cxhdbz","Y+�μ�&N+���μ�","");
%> </td>
      <td align="right" width="22%">¼����</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">������������ ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxhdbl" size="20" maxlength="9" >
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxhdbl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">����������� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxhdje" size="20" maxlength="17" >
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_cxhdje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">¼��ʱ�� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcddmx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">����ǩ��ʱ�� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcdd_qhtsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="22%">��</td>
      <td width="28%"> 
        <input type="text" name="jc_zcdd_qhtsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">��д��־</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_sxbz","1+����д&2+��д","");
%> </td>
      <td align="right" width="22%">���� </td>
      <td width="28%"><%
	cf.radioToken(out, "jc_zcddmx_lx","1+��ͬ��&2+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="21%" align="right" bgcolor="#FFFFCC">��ѯ�������</td>
      <td colspan="3"> ��һ�� 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh" selected>�������</option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">ѡ��۸�</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
        </select>
        �ڶ��� 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh" >�������</option>
          <option value="jc_zcddmx.zcdlbm" >���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm" >����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">ѡ��۸�</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
        </select>
        ������ 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm" >����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">ѡ��۸�</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
        </select>
        <BR><BR>
		������ 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh" >Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">ѡ��۸�</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
        </select>
        ������ 
        <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm" >�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">ѡ��۸�</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
        </select>
        ������ 
        <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">ѡ��۸�</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="21%" >��ʾ���</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
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
      <td width="21%" align="right">ͳ�Ʊ�</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">ѡ��۸�</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">ѡ��۸�</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">ѡ��۸�</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
        </select>

        <BR><BR>
		������ 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">ѡ��۸�</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">ѡ��۸�</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">ѡ��۸�</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isFloat(FormName.crm_khxx_qye, "����ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "����ǩԼ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "��װǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "��װǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj, "����ǩ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj2, "����ǩ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxkssj, "����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxkssj2, "����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxjzsj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_cxjzsj2, "��������ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_dj, "ʵ������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_sl, "��ͬ����"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_sl2, "��ͬ����"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_je, "���Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_je2, "���Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl, "����������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl2, "����������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje, "��������Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje2, "��������Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhycf, "������Զ�̷�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdbl, "������������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdbl2, "������������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdje, "�����������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_cxhdje2, "�����������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcddmx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	
	if (lx=="cx")
	{
		FormName.action="Jc_zcddmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_zcddmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
