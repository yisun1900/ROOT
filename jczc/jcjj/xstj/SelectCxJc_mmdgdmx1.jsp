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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">������˾</td>
      <td width="30%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
      <td width="19%" align="right">ǩԼ����</td>
      <td width="31%"> 
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
        <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">�ͻ�����</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">���ݵ�ַ</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">��ϵ��ʽ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ͬ��</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">���ʦ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">����ǩԼ�� ��</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��װǩԼ���� ��</td>
      <td width="30%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
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
      <td align="right" width="19%">�ʼ�</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">Ԥ�������</td>
      <td width="30%"> 
        <input type="text" name="jc_mmdgdmx_yddbh" size="20" maxlength="9" >
      </td>
      <td align="right" width="19%">��ĿרԱ</td>
      <td width="31%"> 
        <select name="jc_mmydd_xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2  from sq_yhxx where zwbm='12' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">פ��Ҿӹ���</td>
      <td width="30%"> 
        <select name="jc_mmydd_clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
      <td align="right" width="19%">չ���Ҿӹ���</td>
      <td width="31%"> 
        <select name="jc_mmydd_ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ľ�Ŷ�������</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <select name="jc_mmdgdmx_mlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ľ���ͺ�</td>
      <td width="30%"> 
        <input type="text" name="jc_mmdgdmx_mmxh" size="20" maxlength="12" >
      </td>
      <td align="right" width="19%">����</td>
      <td width="31%"><%
	cf.radioToken(out, "jc_mmdgdmx_lx","1+��ͬ��&2+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ľ����ɫ</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">ľ�Ų���</td>
      <td width="31%"> 
        <select name="jc_mmdgdmx_czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��װλ��</td>
      <td width="30%"> 
        <input type="text" name="jc_mmdgdmx_azwzbm" size="20" maxlength="2" >
      </td>
      <td align="right" width="19%">��������</td>
      <td width="31%"> 
        <select name="jc_mmdgdmx_kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�ز�����</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dczlbm,dczlmc from jdm_dczlbm order by dczlbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">���ױ���</td>
      <td width="31%"> <%
	cf.radioToken(out, "jc_mmdgdmx_ctbs","3+����&4+�ı�","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��˫��</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_mmdgdmx_dsk","1+����&2+˫��","");
%> </td>
      <td align="right" width="19%">�Ƿ�����������</td>
      <td width="31%"> <%
	cf.radioToken(out, "jc_mmdgdmx_sfysblm","1+��&2+��","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�����ͺ�</td>
      <td width="30%"> 
        <select name="jc_mmdgdmx_blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">�����ƿ��Ƿ���ľ���ɲ�</td>
      <td width="31%"> <%
	cf.radioToken(out, "jc_mmdgdmx_sfsmjcc","Y+��&N+��","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�Ƿ��ж���</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_mmdgdmx_sfydc","Y+�ж���&N+�޶���","");
%> </td>
      <td align="right" width="19%">�Ƿ��Զ��Ƽ�</td>
      <td width="31%"><%
	cf.radioToken(out, "jc_mmdgdmx_sfzdjj","1+�Զ�&2+�˹�","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ľ�ź�ͬ���� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_mmydd_htrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="jc_mmydd_htrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ľ�Ź���</td>
      <td width="30%"> 
        <select name="jc_mmydd_pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='1' and ssfgs='"+ssfgs+"' order by gysmc","");
%> 
        </select>
      </td>
      <td align="right" width="19%">ľ�Ų�����ʦ</td>
      <td width="31%"> 
        <select name="jc_mmydd_mmcljs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc,yhmc from sq_yhxx where zwbm='18' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N')","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ľ���˵�ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_mmydd_tdsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="jc_mmydd_tdsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ľ��ǩ����</td>
      <td width="30%"> 
        <input type="text" name="jc_mmydd_htqdr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp; </td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right" bgcolor="#FFFFCC">��ѯ�������</td>
      <td colspan="3"> ��һ�� 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="jc_mmydd.pdgc">�ɵ�����</option>
          <option value="jc_mmdgdmx.mmdglxbm">��������</option>
          <option value="jc_mmdgdmx.mlx">������</option>
          <option value="jc_mmdgdmx.mmxh">ľ���ͺ�</option>
          <option value="jc_mmdgdmx.ysbm">��ɫ</option>
          <option value="jc_mmdgdmx.czbm">����</option>
          <option value="jc_mmdgdmx.azwzbm">��װλ��</option>
          <option value="jc_mmdgdmx.dsk">��˫��</option>
          <option value="jc_mmdgdmx.sfysblm">�Ƿ�����������</option>
          <option value="jc_mmdgdmx.blxhbm">�����ͺ�</option>
          <option value="jc_mmdgdmx.sfsmjcc">�Ƿ���ľ���ɲ�</option>
          <option value="jc_mmdgdmx.sfydc">�Ƿ��ж���</option>
          <option value="jc_mmdgdmx.lx">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh" selected>�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="jc_mmydd.mmcljs">ľ�Ų�����ʦ</option>
          <option value="jc_mmydd.xmzy">��ĿרԱ</option>
          <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
          <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        �ڶ��� 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">�ɵ�����</option>
          <option value="jc_mmdgdmx.mmdglxbm">��������</option>
          <option value="jc_mmdgdmx.mlx">������</option>
          <option value="jc_mmdgdmx.mmxh">ľ���ͺ�</option>
          <option value="jc_mmdgdmx.ysbm">��ɫ</option>
          <option value="jc_mmdgdmx.czbm">����</option>
          <option value="jc_mmdgdmx.azwzbm">��װλ��</option>
          <option value="jc_mmdgdmx.dsk">��˫��</option>
          <option value="jc_mmdgdmx.sfysblm">�Ƿ�����������</option>
          <option value="jc_mmdgdmx.blxhbm">�����ͺ�</option>
          <option value="jc_mmdgdmx.sfsmjcc">�Ƿ���ľ���ɲ�</option>
          <option value="jc_mmdgdmx.sfydc">�Ƿ��ж���</option>
          <option value="jc_mmdgdmx.lx">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="jc_mmydd.mmcljs">ľ�Ų�����ʦ</option>
          <option value="jc_mmydd.xmzy">��ĿרԱ</option>
          <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
          <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">�ɵ�����</option>
          <option value="jc_mmdgdmx.mmdglxbm">��������</option>
          <option value="jc_mmdgdmx.mlx">������</option>
          <option value="jc_mmdgdmx.mmxh">ľ���ͺ�</option>
          <option value="jc_mmdgdmx.ysbm">��ɫ</option>
          <option value="jc_mmdgdmx.czbm">����</option>
          <option value="jc_mmdgdmx.azwzbm">��װλ��</option>
          <option value="jc_mmdgdmx.dsk">��˫��</option>
          <option value="jc_mmdgdmx.sfysblm">�Ƿ�����������</option>
          <option value="jc_mmdgdmx.blxhbm">�����ͺ�</option>
          <option value="jc_mmdgdmx.sfsmjcc">�Ƿ���ľ���ɲ�</option>
          <option value="jc_mmdgdmx.sfydc">�Ƿ��ж���</option>
          <option value="jc_mmdgdmx.lx">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="jc_mmydd.mmcljs">ľ�Ų�����ʦ</option>
          <option value="jc_mmydd.xmzy">��ĿרԱ</option>
          <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
          <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        <br><br>
        ������ 
        <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">�ɵ�����</option>
          <option value="jc_mmdgdmx.mmdglxbm">��������</option>
          <option value="jc_mmdgdmx.mlx">������</option>
          <option value="jc_mmdgdmx.mmxh">ľ���ͺ�</option>
          <option value="jc_mmdgdmx.ysbm">��ɫ</option>
          <option value="jc_mmdgdmx.czbm">����</option>
          <option value="jc_mmdgdmx.azwzbm">��װλ��</option>
          <option value="jc_mmdgdmx.dsk">��˫��</option>
          <option value="jc_mmdgdmx.sfysblm">�Ƿ�����������</option>
          <option value="jc_mmdgdmx.blxhbm">�����ͺ�</option>
          <option value="jc_mmdgdmx.sfsmjcc">�Ƿ���ľ���ɲ�</option>
          <option value="jc_mmdgdmx.sfydc">�Ƿ��ж���</option>
          <option value="jc_mmdgdmx.lx">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="jc_mmydd.mmcljs">ľ�Ų�����ʦ</option>
          <option value="jc_mmydd.xmzy">��ĿרԱ</option>
          <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
          <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">�ɵ�����</option>
          <option value="jc_mmdgdmx.mmdglxbm">��������</option>
          <option value="jc_mmdgdmx.mlx">������</option>
          <option value="jc_mmdgdmx.mmxh">ľ���ͺ�</option>
          <option value="jc_mmdgdmx.ysbm">��ɫ</option>
          <option value="jc_mmdgdmx.czbm">����</option>
          <option value="jc_mmdgdmx.azwzbm">��װλ��</option>
          <option value="jc_mmdgdmx.dsk">��˫��</option>
          <option value="jc_mmdgdmx.sfysblm">�Ƿ�����������</option>
          <option value="jc_mmdgdmx.blxhbm">�����ͺ�</option>
          <option value="jc_mmdgdmx.sfsmjcc">�Ƿ���ľ���ɲ�</option>
          <option value="jc_mmdgdmx.sfydc">�Ƿ��ж���</option>
          <option value="jc_mmdgdmx.lx">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="jc_mmydd.mmcljs">ľ�Ų�����ʦ</option>
          <option value="jc_mmydd.xmzy">��ĿרԱ</option>
          <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
          <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="jc_mmydd.pdgc">�ɵ�����</option>
          <option value="jc_mmdgdmx.mmdglxbm">��������</option>
          <option value="jc_mmdgdmx.mlx">������</option>
          <option value="jc_mmdgdmx.mmxh">ľ���ͺ�</option>
          <option value="jc_mmdgdmx.ysbm">��ɫ</option>
          <option value="jc_mmdgdmx.czbm">����</option>
          <option value="jc_mmdgdmx.azwzbm">��װλ��</option>
          <option value="jc_mmdgdmx.dsk">��˫��</option>
          <option value="jc_mmdgdmx.sfysblm">�Ƿ�����������</option>
          <option value="jc_mmdgdmx.blxhbm">�����ͺ�</option>
          <option value="jc_mmdgdmx.sfsmjcc">�Ƿ���ľ���ɲ�</option>
          <option value="jc_mmdgdmx.sfydc">�Ƿ��ж���</option>
          <option value="jc_mmdgdmx.lx">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="jc_mmydd.mmcljs">ľ�Ų�����ʦ</option>
          <option value="jc_mmydd.xmzy">��ĿרԱ</option>
          <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
          <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>

		</select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="20%" >��ʾ���</td>
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
      <td width="20%" align="right">ͳ�Ʊ�</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">�ɵ�����</option>
          <option value="mmdglxmc">��������</option>
          <option value="mlxmc">������</option>
          <option value="mmxh">ľ���ͺ�</option>
          <option value="mmczmc">��ɫ</option>
          <option value="czmc">����</option>
          <option value="azwzmc">��װλ��</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��')">��˫��</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','��','2','��')">�Ƿ�����������</option>
          <option value="blxh">�����ͺ�</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','��','N','��')">�Ƿ���ľ���ɲ�</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','�ж���','N','�޶���')">�Ƿ��ж���</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','��ͬ��','2','����')">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="mmcljs">ľ�Ų�����ʦ</option>
          <option value="xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">�ɵ�����</option>
          <option value="mmdglxmc">��������</option>
          <option value="mlxmc">������</option>
          <option value="mmxh">ľ���ͺ�</option>
          <option value="mmczmc">��ɫ</option>
          <option value="czmc">����</option>
          <option value="azwzmc">��װλ��</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��')">��˫��</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','��','2','��')">�Ƿ�����������</option>
          <option value="blxh">�����ͺ�</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','��','N','��')">�Ƿ���ľ���ɲ�</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','�ж���','N','�޶���')">�Ƿ��ж���</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','��ͬ��','2','����')">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="mmcljs">ľ�Ų�����ʦ</option>
          <option value="xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">�ɵ�����</option>
          <option value="mmdglxmc">��������</option>
          <option value="mlxmc">������</option>
          <option value="mmxh">ľ���ͺ�</option>
          <option value="mmczmc">��ɫ</option>
          <option value="czmc">����</option>
          <option value="azwzmc">��װλ��</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��')">��˫��</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','��','2','��')">�Ƿ�����������</option>
          <option value="blxh">�����ͺ�</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','��','N','��')">�Ƿ���ľ���ɲ�</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','�ж���','N','�޶���')">�Ƿ��ж���</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','��ͬ��','2','����')">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="mmcljs">ľ�Ų�����ʦ</option>
          <option value="xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
        </select>
        <br>
        <br>
        ������ 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">�ɵ�����</option>
          <option value="mmdglxmc">��������</option>
          <option value="mlxmc">������</option>
          <option value="mmxh">ľ���ͺ�</option>
          <option value="mmczmc">��ɫ</option>
          <option value="czmc">����</option>
          <option value="azwzmc">��װλ��</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��')">��˫��</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','��','2','��')">�Ƿ�����������</option>
          <option value="blxh">�����ͺ�</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','��','N','��')">�Ƿ���ľ���ɲ�</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','�ж���','N','�޶���')">�Ƿ��ж���</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','��ͬ��','2','����')">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="mmcljs">ľ�Ų�����ʦ</option>
          <option value="xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">�ɵ�����</option>
          <option value="mmdglxmc">��������</option>
          <option value="mlxmc">������</option>
          <option value="mmxh">ľ���ͺ�</option>
          <option value="mmczmc">��ɫ</option>
          <option value="czmc">����</option>
          <option value="azwzmc">��װλ��</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��')">��˫��</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','��','2','��')">�Ƿ�����������</option>
          <option value="blxh">�����ͺ�</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','��','N','��')">�Ƿ���ľ���ɲ�</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','�ж���','N','�޶���')">�Ƿ��ж���</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','��ͬ��','2','����')">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="mmcljs">ľ�Ų�����ʦ</option>
          <option value="xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
        </select>
        ������ 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="gysmc">�ɵ�����</option>
          <option value="mmdglxmc">��������</option>
          <option value="mlxmc">������</option>
          <option value="mmxh">ľ���ͺ�</option>
          <option value="mmczmc">��ɫ</option>
          <option value="czmc">����</option>
          <option value="azwzmc">��װλ��</option>

          <option value="DECODE(jc_mmdgdmx.dsk,'1','����','2','˫��')">��˫��</option>
          <option value="DECODE(jc_mmdgdmx.sfysblm,'1','��','2','��')">�Ƿ�����������</option>
          <option value="blxh">�����ͺ�</option>
          <option value="DECODE(jc_mmdgdmx.sfsmjcc,'Y','��','N','��')">�Ƿ���ľ���ɲ�</option>
          <option value="DECODE(jc_mmdgdmx.sfydc,'Y','�ж���','N','�޶���')">�Ƿ��ж���</option>
          <option value="DECODE(jc_mmdgdmx.lx,'1','��ͬ��','2','����')">����</option>
 
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_mmydd.yddbh">�������</option>
          <option value="jc_mmydd.htrq">ľ��ǩ��ͬ����</option>
          <option value="mmcljs">ľ�Ų�����ʦ</option>
          <option value="xmzy">��ĿרԱ</option>
          <option value="clgw">פ��Ҿӹ���</option>
          <option value="ztjjgw">չ���Ҿӹ���</option>
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
	if(!(isDatetime(FormName.jc_mmydd_htrq, "ľ�ź�ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq2, "ľ�ź�ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_tdsj, "ľ���˵�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_tdsj2, "ľ���˵�ʱ��"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_mmdgdmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_mmdgdmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
