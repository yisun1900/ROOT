<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");

String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��ѯ��ȫ����ͬ(���)
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
                <input type="reset"  value="����">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="jc_zcdd.lrsj desc">¼��ʱ��</option>
                  <option value="jc_zcdd.ddqrsj desc">����ȷ��ʱ��</option>
                  <option value="jc_zcdd.dwbh">¼�벿��</option>
                  <option value="jc_zcdd.ddbh">�������</option>
                  <option value="jc_zcdd.jhshsj">�ƻ��ͻ�ʱ��</option>
                  <option value="jc_zcdd.zcdlbm">���Ĵ���</option>
                  <option value="jc_zcdd.zcxlbm">����С��</option>
                  <option value="jc_zcdd.ppbm">��Ʒ��</option>
                  <option value="jc_zcdd.gys">��Ӧ��</option>
                  <option value="jc_zcdd.ppmc">Ʒ��</option>
                  <option value="jc_zcdd.xmzy">��ĿרԱ</option>
                  <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_zcdd.hkze">��ͬ�ܶ�</option>
                  <option value="jc_zcdd.clzt">����״̬</option>
                  <option value="jc_zcdd.ddlx">��������</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_zcdd.lrsj desc">¼��ʱ��</option>
                  <option value="jc_zcdd.ddqrsj desc">����ȷ��ʱ��</option>
                  <option value="jc_zcdd.dwbh">¼�벿��</option>
                  <option value="jc_zcdd.ddbh">�������</option>
                  <option value="jc_zcdd.jhshsj">�ƻ��ͻ�ʱ��</option>
                  <option value="jc_zcdd.zcdlbm">���Ĵ���</option>
                  <option value="jc_zcdd.zcxlbm">����С��</option>
                  <option value="jc_zcdd.ppbm">��Ʒ��</option>
                  <option value="jc_zcdd.gys">��Ӧ��</option>
                  <option value="jc_zcdd.ppmc">Ʒ��</option>
                  <option value="jc_zcdd.xmzy">��ĿרԱ</option>
                  <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_zcdd.hkze">��ͬ�ܶ�</option>
                  <option value="jc_zcdd.clzt">����״̬</option>
                  <option value="jc_zcdd.ddlx">��������</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_zcdd.lrsj desc">¼��ʱ��</option>
                  <option value="jc_zcdd.ddqrsj desc">����ȷ��ʱ��</option>
                  <option value="jc_zcdd.dwbh">¼�벿��</option>
                  <option value="jc_zcdd.ddbh">�������</option>
                  <option value="jc_zcdd.jhshsj">�ƻ��ͻ�ʱ��</option>
                  <option value="jc_zcdd.zcdlbm">���Ĵ���</option>
                  <option value="jc_zcdd.zcxlbm">����С��</option>
                  <option value="jc_zcdd.ppbm">��Ʒ��</option>
                  <option value="jc_zcdd.gys">��Ӧ��</option>
                  <option value="jc_zcdd.ppmc">Ʒ��</option>
                  <option value="jc_zcdd.xmzy">��ĿרԱ</option>
                  <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_zcdd.hkze">��ͬ�ܶ�</option>
                  <option value="jc_zcdd.clzt">����״̬</option>
                  <option value="jc_zcdd.ddlx">��������</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="19%" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">������˾</td>
              <td width="31%"> <%
	if (yhjs.equals("G0"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct sq_dwxx.dwbh,sq_dwxx.dwmc from jxc_ppgysdzb,sq_dwxx where jxc_ppgysdzb.ssfgs=sq_dwxx.dwbh and jxc_ppgysdzb.gysbm='"+ygbh+"' order by sq_dwxx.dwbh","");
        out.println("        </select>");
	}
	else
	{
		out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onchange=\"changeFgs(selectform)\">");
		
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}

        out.println("        </select>");
	}
	
%> </td>
              <td width="19%" align="right">ǩԼ����</td>
              <td width="31%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("G0"))
	{
		out.println("<option value=\"\"></option>");
	}
	else
	{
		if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
		}
		else if (kfgssq.equals("1") )
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
		}
		else if (kfgssq.equals("3"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
		}
		else if (kfgssq.equals("4"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                �������              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_ddbh" size="20" maxlength="9" >              </td>
              <td width="19%" align="right"> 
                ����״̬              </td>
              <td width="31%"> 
                <select name="jc_zcdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt order by clzt","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ͻ����</td>
              <td width="31%"> 
                <input type="text" name="khbh" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">��ͬ��</td>
              <td width="31%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC"><b>�ͻ�����</b></font>              </td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="19%" align="right"> 
                �ͻ�����              </td>
              <td width="31%"> 
                <input type="text" name="khxm2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="19%" align="right">��ϵ��ʽ</td>
              <td width="31%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC"><b>���ݵ�ַ</b></font>              </td>
              <td width="31%"> 
                <input type="text" name="fwdz" size="20" maxlength="100">              </td>
              <td width="19%" align="right"> 
                ���ݵ�ַ              </td>
              <td width="31%"> 
                <input type="text" name="fwdz2" size="14" maxlength="100">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">���ʦ</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">�ʼ�</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ʩ����              </td>
              <td width="31%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd');">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ͻ���������</td>
              <td colspan="3"><%
	cf.radioToken(out, "jc_zcdd_jkxz","1+δ����&2+ȫ��&3+�����������&4+Ԥ�������&5+�˻������","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">����ص�</td>
              <td colspan="3"><%
	cf.radioToken(out, "jc_zcdd_jkdd","1+�������ֳ������&2+�����տ�&3+��˾�����տ�","");
%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">�Ƿ��ѽ���</td>
              <td><INPUT type="radio" name="sfjs" value="N">
                δ����
                <INPUT type="radio" name="sfjs" value="Y">
                �ѽ���</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">����ʱ�� �� </td>
              <td><input name="jssj" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
              <td align="right">��</td>
              <td><input name="jssj2" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">���Ĵ���</td>
              <td width="31%"> 
                <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcdlbm');" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">����С��</td>
              <td width="31%"> 
                <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>��Ʒ��</b></font></td>
              <td width="31%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppbm')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select jxc_ppgysdzb.ppmc c1,jxc_ppgysdzb.ppmc c2 from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppgysdzb.ppmc","");
	}
%> 
                </select>              </td>
              <td width="19%" align="right">��Ʒ��</td>
              <td width="31%"> 
                <input type="text" name="ppbm2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>Ʒ������</b></font></td>
              <td width="31%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select distinct jxc_ppxx.scsmc c1,jxc_ppxx.scsmc c2 from jxc_gysxx,jxc_ppgysdzb,jxc_ppxx where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppxx.scsmc","");
	}
%> 
                </select>              </td>
              <td width="19%" align="right">Ʒ������</td>
              <td width="31%"> 
                <input type="text" name="ppmc2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>��Ӧ������</b></font></td>
              <td width="31%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where gysbm='"+ygbh+"' order by gysmc","");
	}
%> 
                </select>              </td>
              <td width="19%" align="right">��Ӧ������</td>
              <td width="31%"> 
                <input type="text" name="gys2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC"><b>פ��Ҿӹ���</b></font>              </td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right"> 
                פ��Ҿӹ���              </td>
              <td width="31%"> 
                <input type="text" name="clgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>չ���Ҿӹ���</b></font></td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">չ���Ҿӹ���</td>
              <td width="31%"> 
                <input type="text" name="ztjjgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>��ĿרԱ</b></font></td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">��ĿרԱ</td>
              <td width="31%"> 
                <input type="text" name="xmzy2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>�Ҿ����ʦ</b></font></td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('jjsjs')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">�Ҿ����ʦ</td>
              <td width="31%"> 
                <input type="text" name="jjsjs2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ��Ʒ����              </td>
              <td width="31%"> 
                <select name="jc_zcdd_xclbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�Ƕ���ʽ��Ʒ</option>
                  <option value="2">����ʽ��Ʒ</option>
                </select>              </td>
              <td width="19%" align="right"> 
                �Ƿ�ȴ��ͻ�֪ͨ              </td>
              <td width="31%"> 
                <select name="jc_zcdd_ddshbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�������&2+����δ֪ͨ&3+������֪ͨ","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ¼����              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_lrr" size="20" maxlength="20" >              </td>
              <td width="19%" align="right"> 
                ¼�벿��              </td>
              <td width="31%"> 
                <select name="jc_zcdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('lrbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">¼��ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ǩ��ͬʱ�� ��              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_qhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_qhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">�ɼ����ֹʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_kjxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_kjxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ƻ�����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhclsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhclsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">��ͬ�ͻ�ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_htshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_htshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ƻ��ͻ�ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">���ͻ�֪ͨʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_tzshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_tzshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">ʵ�ͻ�ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_sshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_zcdd_sshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="wjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="wjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ӳٴ���״̬</td>
              <td width="31%"> 
                <select name="jc_zcdd_ycclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�ӳ�δ��ʵ</option>
                  <option value="2">�ӳ�ԭ����ʵ</option>
                  <option value="3">�ӳ�ԭ����ʵ</option>
                  <option value="4">�ӳ��Ѵ���</option>
                </select>              </td>
              <td width="19%" align="right">�ͻ�����־</td>
              <td width="31%"> 
                <input type="radio" name="crm_khxx_wjbz" value="1">
                δ��� 
                <input type="radio" name="crm_khxx_wjbz" value="2">
                ����� </td>
            </tr>
			<tr bgcolor="#FFFFFF">
  <td align="right"><strong><font color="#FF0000">�ײͷֽⶩ����־</font></strong></td>
  <td>
	  <input type="radio" name="crm_khxx_fjtcbz" value="Y">�ֽ�
	  <input type="radio" name="crm_khxx_fjtcbz" value="N">δ�ֽ�  </td>
	  </tr>
            <%
if (!zwbm.equals("08") && !zwbm.equals("12") && !yhjs.equals("G0"))//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
{
	%> 
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ͳ�Ʊ�</td>
              <td colspan="3"> ��һ�� 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">¼�벿��</option>
                  <option value="c.dwmc">ǩԼ����</option>
                  <option value="zcdlbm">���Ĵ���</option>
                  <option value="zcxlbm">����С��</option>
                  <option value="ppbm">��Ʒ��</option>
                  <option value="gys">��Ӧ��</option>
                  <option value="ppmc">Ʒ��</option>
                  <option value="jc_zcdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="clztmc">����״̬</option>
                  <option value="DECODE(jc_zcdd.ddlx,'1','����Ʒ��','2','ϵͳ������Ʒ�ƶ���','3','��¼��ͬ')">��������</option>
                </select>
                �ڶ��� 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">¼�벿��</option>
                  <option value="c.dwmc">ǩԼ����</option>
                  <option value="zcdlbm">���Ĵ���</option>
                  <option value="zcxlbm">����С��</option>
                  <option value="ppbm">��Ʒ��</option>
                  <option value="gys">��Ӧ��</option>
                  <option value="ppmc">Ʒ��</option>
                  <option value="jc_zcdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="clztmc">����״̬</option>
                  <option value="DECODE(jc_zcdd.ddlx,'1','����Ʒ��','2','ϵͳ������Ʒ�ƶ���','3','��¼��ͬ')">��������</option>
                </select>
                ������ 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">¼�벿��</option>
                  <option value="c.dwmc">ǩԼ����</option>
                  <option value="zcdlbm">���Ĵ���</option>
                  <option value="zcxlbm">����С��</option>
                  <option value="ppbm">��Ʒ��</option>
                  <option value="gys">��Ӧ��</option>
                  <option value="ppmc">Ʒ��</option>
                  <option value="jc_zcdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="clztmc">����״̬</option>
                  <option value="DECODE(jc_zcdd.ddlx,'1','����Ʒ��','2','ϵͳ������Ʒ�ƶ���','3','��¼��ͬ')">��������</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">              </td>
            </tr>
            <%
}
%> 
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>

var lrbmMark=0;
var clgwMark=0;
var ztjjgwMark=0;
var xmzyMark=0;
var jjsjsMark=0;
var gysMark=0;

var ppbmMark=0;
var ppmcMark=0;
var zcdlbmMark=0;
var zcxlbmMark=0;
var sgdMark=0;

var fieldName="";

function changeFgs(FormName) 
{
	FormName.crm_khxx_dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	lrbmMark=0;
	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;
	jjsjsMark=0;
	gysMark=0;
	ppbmMark=0;
	ppmcMark=0;
	sgdMark=0;

	FormName.jc_zcdd_dwbh.length=1;
	FormName.clgw.length=1;
	FormName.ztjjgw.length=1;
	FormName.xmzy.length=1;
	FormName.jjsjs.length=1;
	FormName.gys.length=1;
	FormName.ppbm.length=1;
	FormName.ppmc.length=1;
	FormName.crm_khxx_sgd.length=1;


	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getThis(lx)
{
	if ("<%=yhjs%>"=="G0")
	{
		return;
	}

	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("������ѡ�񡾷ֹ�˾��");
		return;
	}

	if (lx=="lrbm")
	{
		if (lrbmMark==0)
		{
			var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.fgs.value+"' and  cxbz='N' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			lrbmMark=1;
		}
	}
	else if (lx=="clgw")
	{
		if (clgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			clgwMark=1;
		}
	}
	else if (lx=="ztjjgw")
	{
		if (ztjjgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ztjjgwMark=1;
		}
	}
	else if (lx=="xmzy")
	{
		if (xmzyMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			xmzyMark=1;
		}
	}
	else if (lx=="jjsjs")
	{
		if (jjsjsMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			jjsjsMark=1;
		}
	}
	else if (lx=="gys")
	{
		if (gysMark==0)
		{
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_gysxx.gysmc from jxc_ppxx,jxc_gysxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_gysxx.gysmc";
			}
			else
			{
				sql="select distinct jxc_gysxx.gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}


	else if (lx=="ppbm")
	{
		if (ppbmMark==0)
		{

			if (selectform.zcxlbm.value!="")
			{
				sql="select jxc_ppxx.ppmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl='"+selectform.zcxlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select jxc_ppxx.ppmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"') order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select jxc_ppxx.ppmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.ppmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppbmMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.zcxlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl='"+selectform.zcxlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"') order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.scsmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppmcMark=1;
		}
	}
	else if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			var sql="select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+selectform.fgs.value+"' order by sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sgdMark=1;
		}
	}

}


function getThisOne(lx)
{
	if ("<%=yhjs%>"=="G0")
	{
		return;
	}

	var sql;

	fieldName=lx;

	if (lx=="zcdlbm")
	{
		if (zcdlbmMark==0)
		{
			var sql="select cldlmc from jxc_cldlbm where cldllb in('1','3')  order by cldlmc";
			var actionStr="/ajax/getstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zcdlbmMark=1;
		}
	}
	else if (lx=="zcxlbm")
	{
		if (zcxlbmMark==0)
		{
			if (selectform.zcdlbm.value=="")
			{
				zcxlbmMark=0;
				selectform.zcdlbm.focus();
				alert("��ѡ�����Ĵ��ࡿ");
				return;
			}

			sql="select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"' order by clxlmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			zcxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="lrbm")
	{
		strToSelect(selectform.jc_zcdd_dwbh,ajaxRetStr);
	}
	else if (fieldName=="clgw")
	{
		strToSelect(selectform.clgw,ajaxRetStr);
	}
	else if (fieldName=="ztjjgw")
	{
		strToSelect(selectform.ztjjgw,ajaxRetStr);
	}
	else if (fieldName=="xmzy")
	{
		strToSelect(selectform.xmzy,ajaxRetStr);
	}
	else if (fieldName=="jjsjs")
	{
		strToSelect(selectform.jjsjs,ajaxRetStr);
	}
	else if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="ppbm")
	{
		strToItem2(selectform.ppbm,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="zcdlbm")
	{
		strToItem2(selectform.zcdlbm,ajaxRetStr);
	}
	else if (fieldName=="zcxlbm")
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToItem(selectform.crm_khxx_sgd,ajaxRetStr);
	}
}

function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.jc_zcdd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_qhtsj2, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_kjxsj, "�ɼ����ֹʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_kjxsj2, "�ɼ����ֹʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhclsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhclsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_htshsj, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_htshsj2, "��ͬ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_jhshsj2, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_tzshsj, "���ͻ�֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_tzshsj2, "���ͻ�֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_sshsj, "ʵ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zcdd_sshsj2, "ʵ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.wjsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.wjsj2, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "����ʱ��"))) {
		return false;
	}

	
	if (lx=="cx")
	{
		FormName.action="Jc_zcddCxJeList.jsp";
	}
	else if (lx=="tj")
	{
		FormName.action="Jc_zcddTjList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
