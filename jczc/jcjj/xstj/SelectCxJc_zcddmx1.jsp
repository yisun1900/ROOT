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

String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ

String ssfgs=request.getParameter("ssfgs");
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+ssfgs+"'");

String ppstr=null;
if (yhjs.equals("G0"))
{
	ppstr=cf.getItemData("select gysmc c1,gysmc c2,zclb from sq_gysxx where gyslb='4' and dqbm='"+dqbm+"' and  gysbm='"+dwbh+"' order by zclb,gysmc");
}
else{
	ppstr=cf.getItemData("select gysmc c1,gysmc c2,zclb from sq_gysxx where gyslb='4' and dqbm='"+dqbm+"' order by zclb,gysmc");
}

String zcxlbmstr=null;
if (yhjs.equals("G0"))
{
	zcxlbmstr=cf.getItemData("select zcxlmc c1,zcxlmc c2,zcdlmc from jdm_zcxlbm where zcxlmc in (select zclb from sq_gysxx where gyslb='4' and  gysbm='"+dwbh+"') order by zcdlmc,zcxlbm");
}
else{
	zcxlbmstr=cf.getItemData("select zcxlmc c1,zcxlmc c2,zcdlmc from jdm_zcxlbm order by zcdlmc,zcxlbm");
}

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
      <td width="23%" align="right">ǩԼ����</td>
      <td width="27%"> 
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
    <tr bgcolor="#FFCCFF"> 
      <td align="right" width="21%"><b>*����ǩ��ʱ�� ��</b></td>
      <td width="29%"> <b> 
        <input type="text" name="jc_zcdd_qhtsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
        </b></td>
      <td align="right" width="23%"><b>*��</b></td>
      <td width="27%"> <b> 
        <input type="text" name="jc_zcdd_qhtsj2" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
        </b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�ͻ����</td>
      <td width="29%"> 
        <input type="text" name="jc_zcdd_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="23%">�ͻ�����</td>
      <td width="27%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">���ݵ�ַ</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="23%">��ϵ��ʽ</td>
      <td width="27%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">��ͬ��</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="23%">��װ���ʦ</td>
      <td width="27%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">����ǩԼ���</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">��װǩԼ���� ��</td>
      <td width="29%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
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
      <td align="right" width="23%">�ʼ�</td>
      <td width="27%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�������</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_ddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="23%">��������</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_zcmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">���Ĵ���</td>
      <td width="29%"> 
        <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(zcdlbm,zcxlbm,<%=zcxlbmstr%>)">
          <option value=""></option>
          <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select distinct zcdlmc c1,zcdlmc c2 from jdm_zcxlbm where zcxlmc in(select zclb from sq_gysxx where gysbm='"+dwbh+"') order by zcdlmc","");
	}
	else{
		cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlbm","");
	}
%> 
        </select>
      </td>
      <td width="23%" align="right">����С��</td>
      <td width="27%"> 
        <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange=" selectItem(zcxlbm,ppbm,<%=ppstr%>)">
          <option value=""></option>
          <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm where zcxlmc in(select zclb from sq_gysxx where gysbm='"+dwbh+"') order by zcxlbm","");
	}
	else{
		cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm  order by zcxlbm","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">Ʒ�ƹ�Ӧ��</td>
      <td width="29%"> 
        <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("G0"))
	{
		out.println("<option value=\"\"></option>");
		String ls_sql=null;
		ls_sql=" select gysmc c1,gysmc c2 from sq_gysxx where gyslb='4' and dqbm='"+dqbm+"' and gysbm='"+dwbh+"' order by gysmc";
		cf.selectItem(out,ls_sql,"");
	}
%> 
        </select>
      </td>
      <td width="23%" align="right">Ʒ�ƹ�Ӧ��</td>
      <td width="27%"> 
        <input type="text" name="ppbm2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">Ʒ������</td>
      <td width="29%"> 
        <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select distinct ppmc c1,ppmc c2 from sq_gysxx where gyslb='4' and dqbm='"+dqbm+"' and gysbm='"+dwbh+"' order by ppmc","");
	}
	else{
		cf.selectItem(out,"select ppmc c1,ppmc c2 from sq_ppxx order by ppmc","");
	}
%> 
        </select>
      </td>
      <td width="23%" align="right">Ʒ������</td>
      <td width="27%"> 
        <input type="text" name="ppmc2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">��Ӧ������</td>
      <td width="29%"> 
        <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select gys c1,gys c2 from sq_gysbm where gysbm='"+dwbh+"' order by gys","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gys c1,gys||'��'||dqmc||'��' c2 from sq_gysbm,dm_dqbm where sq_gysbm.dqbm=dm_dqbm.dqbm(+) and sq_gysbm.dqbm='"+dqbm+"' order by gys","");
	}
%> 
        </select>
      </td>
      <td width="23%" align="right">��Ӧ������</td>
      <td width="27%"> 
        <input type="text" name="gys2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%"> 
        <div align="right">פ��Ҿӹ���</div>
      </td>
      <td width="29%"> 
        <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
      <td width="23%"> 
        <div align="right">չ���Ҿӹ���</div>
      </td>
      <td width="27%"> 
        <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">��ĿרԱ</td>
      <td width="29%" bgcolor="#CCCCFF"> 
        <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' order by sfzszg desc,yhmc","");
%> 
        </select>
      </td>
      <td width="23%" align="right">�Ҿ����ʦ</td>
      <td width="27%"> 
        <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2  from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�������ϵ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zclbbm" size="20" maxlength="100" >
      </td>
      <td align="right" width="23%">&nbsp;</td>
      <td width="27%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�����ͺ�</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_xinghao" size="20" maxlength="100" >
      </td>
      <td align="right" width="23%">���Ĺ��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_gg" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">������ɫ</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zcysbm" size="20" maxlength="100" >
      </td>
      <td align="right" width="23%">�����Ƿ��д���</td>
      <td width="27%"> <%
	cf.radioToken(out, "jc_zcddmx_sfycx","N+û����&Y+�д���","");
%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">����ʼʱ�� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxkssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_cxkssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">��������ʱ�� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_cxjzsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">ѡ��۸�</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_xzjg","1+�����޼�&2+������","");
%> </td>
      <td align="right" width="23%">ʵ������</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_dj" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">��ͬ���� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_sl" size="20" maxlength="9" >
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_sl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">��ͬ��� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_je" size="20" maxlength="17" >
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_je2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">���������� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhsl" size="20" maxlength="9" >
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_zjhsl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">�������� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhje" size="20" maxlength="17" >
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_zjhje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">������Զ�̷�</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_zjhycf" size="20" maxlength="17" >
      </td>
      <td align="right" width="23%">������װλ��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_zcpzwzbm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%" bgcolor="#FFFFFF">�Ƿ�μӴ����</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_cxhdbz","Y+�μ�&N+���μ�","");
%> </td>
      <td align="right" width="23%">¼����</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">������������ ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxhdbl" size="20" maxlength="9" >
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_cxhdbl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">����������� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_cxhdje" size="20" maxlength="17" >
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_cxhdje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="21%">¼��ʱ�� ��</td>
      <td width="29%"> 
        <input type="text" name="jc_zcddmx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="23%">��</td>
      <td width="27%"> 
        <input type="text" name="jc_zcddmx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">��д��־</td>
      <td width="29%"> <%
	cf.radioToken(out, "jc_zcddmx_sxbz","1+����д&2+��д","");
%> </td>
      <td align="right" width="23%">���� </td>
      <td width="27%"><%
	cf.radioToken(out, "jc_zcddmx_lx","1+��ͬ��&2+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">��д��ͬԭ��</td>
      <td width="29%"> 
        <select name="sxhtyy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sxhtyy c1,sxhtyy c2 from jdm_sxhtyybm order by sxhtyybm","");
%> 
        </select>
      </td>
      <td align="right" width="23%">��д��ͬԭ��</td>
      <td width="27%"> 
        <input type="text" name="sxhtyy2" size="20" maxlength="50" >
      </td>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
          <option value="jc_zcddmx.sxhtyy">��д��ͬԭ��</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
          <option value="jc_zcddmx.sxhtyy">��д��ͬԭ��</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
          <option value="jc_zcddmx.sxhtyy">��д��ͬԭ��</option>
        </select>
        <BR>
        <BR>
        ������ 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
          <option value="jc_zcddmx.sxhtyy">��д��ͬԭ��</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm" >�������ϵ��</option>
          <option value="jc_zcddmx.xinghao">�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
          <option value="jc_zcddmx.sxhtyy">��д��ͬԭ��</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="jc_zcddmx.sfycx">�����Ƿ��д���</option>
          <option value="jc_zcddmx.xzjg">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="jc_zcddmx.qtfy">��������</option>
          <option value="jc_zcddmx.cxhdbz">�Ƿ�μӴ����</option>
          <option value="jc_zcddmx.lx">����</option>
          <option value="jc_zcddmx.sxbz">��д��־</option>
          <option value="jc_zcddmx.sxhtyy">��д��ͬԭ��</option>
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
        <input type="text" name="myxssl" size="7" maxlength="13" value="25">
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        <BR>
        <BR>
        ������ 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
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
          <option value="jc_zcddmx.dwbh">Ʒ�ƹ�Ӧ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'1','�����޼�','2','������')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
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
	if(!(isFloat(FormName.jc_zcddmx_je, "��ͬ���"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_je2, "��ͬ���"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl, "����������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhsl2, "����������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcddmx_zjhje2, "��������"))) {
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
