<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>
<body bgcolor="#FFFFFF">


<form method="post" action="" name="selectform">
      <div align="center">ľ��Ԥ��������ѯ</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')" name="Button">
                <input type="reset"  value="����">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">������˾</td>
              <td width="30%"> <%
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
              <td width="20%" align="right">�ͻ����</td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_khbh" size="20" maxlength="20" >              </td>
              <td width="19%" align="right">��ͬ��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><span class="STYLE3"> 
              �ͻ�����              </span></td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td width="19%" align="right">�ͻ�����</td>
              <td width="31%"><input type="text" name="crm_khxx_khxm2" size="14" maxlength="20" >
              ��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3">��ϵ��ʽ</span></td>
              <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" ></td>
              <td align="right">��ϵ��ʽ</td>
              <td><input type="text" name="crm_khxx_lxfs2" size="14" maxlength="20" >
              ��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><span class="STYLE3"> 
              ���ݵ�ַ              </span></td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="19%" align="right">���ݵ�ַ</td>
              <td width="31%"><input type="text" name="crm_khxx_fwdz2" size="14" maxlength="50" >
              ��ģ����ѯ��</td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right">��װǩԼ���� ��</td>
              <td><input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">��</td>
              <td><input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ͬ�������� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"> 
                ��ͬ�������� ��              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���ʦ</td>
              <td width="30%"><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" ></td>
              <td width="19%" align="right"> 
                �ʼ�����              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">ʩ����</td>
              <td><select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd');">
                <option value=""></option>
              </select></td>
              <td align="right">�ͻ�����־</td>
              <td><input type="radio" name="crm_khxx_wjbz" value="1">
δ���
<input type="radio" name="crm_khxx_wjbz" value="2">
����� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�����</td>
              <td colspan="3"><select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:512PX" onclick="getThis('cxhdbm');">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"> Ԥ������� </td>
              <td><input type="text" name="jc_mmydd_yddbh" size="20" maxlength="9" >              </td>
              <td align="right"> ����״̬ </td>
              <td><select name="jc_mmydd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clzt')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">פ��Ҿӹ���</td>
              <td width="30%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">չ���Ҿӹ���</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ĿרԱ</td>
              <td width="30%"><select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                <option value=""></option>
              </select></td>
              <td width="19%" align="right">��ͬǩ����</td>
              <td width="31%"><input type="text" name="jc_mmydd_htqdr" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><span class="STYLE3">�ɵ�����</span></td>
              <td width="30%"> 
                <select name="pdgcmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('pdgcmc')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">�ɵ�����</td>
              <td width="31%"> 
                <input name="pdgcmc2" type="text" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><span class="STYLE3">Ʒ������</span></td>
              <td width="30%"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                <option value=""></option>
              </select></td>
              <td width="19%" align="right">Ʒ������</td>
              <td width="31%"> 
                <input type="text" name="ppmc2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><span class="STYLE3">��Ӧ������</span></td>
              <td width="30%"><select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select gys c1,gys c2 from sq_gysbm where gysbm='"+ygbh+"' order by gys","");
	}
%>
              </select></td>
              <td width="19%" align="right">��Ӧ������</td>
              <td width="31%"> 
                <input type="text" name="gys2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������</td>
              <td><input type="radio" name="jc_mmydd_wjqk" value="1">
                �ͻ��Թ�
                  <input type="radio" name="jc_mmydd_wjqk" value="2">
              ��˾���� </td>
              <td align="right">�Թ������͵���˾</td>
              <td><input type="radio" name="jc_mmydd_wjsgsbz" value="Y">���͹�˾
              <input type="radio" name="jc_mmydd_wjsgsbz" value="N">δ�͹�˾</td>
            </tr>
            
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">�ɵ�ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_paidsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_mmydd_paidsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ƻ�����ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_jhccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_mmydd_jhccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">ʵ����ʱ�� ��</td>
              <td width="30%"> 
                <input name="jc_mmydd_sccsj" type="text" id="sccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input name="jc_mmydd_sccsj2" type="text" id="sccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ǩ��ͬ���� ��</td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_htrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_mmydd_htrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">��ͬ��װʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_jhazsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_mmydd_jhazsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ʵ���ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="srksj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="srksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">Э�̰�װʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="kazsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="kazsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����װ֪ͨʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="aztzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="aztzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">��װ���ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="azjssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="azjssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�˵�ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_tdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_mmydd_tdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">¼��ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_mmydd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ¼����              </td>
              <td width="30%"> 
                <input type="text" name="jc_mmydd_lrr" size="20" maxlength="20" >              </td>
              <td width="19%" align="right"> 
                ¼�벿��              </td>
              <td width="31%"> 
                <select name="jc_mmydd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('lrbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ��ʵ�ӳ�ԭ�� </td>
              <td><select name="jc_mmydd_zsycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zsycyybm')">
                  <option value=""></option>
                </select>              </td>
              <td align="right"> �ӳ�ԭ�� </td>
              <td><select name="jc_mmydd_mmycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('mmycyybm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="20%" align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:125PX">
                  <option value="jc_mmydd.lrsj desc">¼��ʱ��</option>
                  <option value="jc_mmydd.skqrsj desc">�տ�ȷ��ʱ��</option>
                  <option value="jc_mmydd.htrq desc">ǩ��ͬ����</option>
                  <option value="jc_mmydd.gcjslrsj desc">��������ʱ��</option>
                  <option value="jc_mmydd.srksj desc">���ʱ��</option>
                  <option value="jc_mmydd.azjssj desc">��װ���ʱ��</option>
                  <option value="jc_mmydd.wjsj desc">���ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">��װ���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="jc_mmydd.xmzy">��ĿרԱ</option>
                  <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_mmydd.clzt">����״̬</option>
                  <option value="jc_mmydd.pdgcmc">�ɵ�����</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:125PX">
                  <option value=""></option>
                  <option value="jc_mmydd.skqrsj desc">�տ�ȷ��ʱ��</option>
                  <option value="jc_mmydd.lrsj desc">¼��ʱ��</option>
                  <option value="jc_mmydd.htrq desc">ǩ��ͬ����</option>
                  <option value="jc_mmydd.gcjslrsj desc">��������ʱ��</option>
                  <option value="jc_mmydd.srksj desc">���ʱ��</option>
                  <option value="jc_mmydd.azjssj desc">��װ���ʱ��</option>
                  <option value="jc_mmydd.wjsj desc">���ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">��װ���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="jc_mmydd.xmzy">��ĿרԱ</option>
                  <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_mmydd.clzt">����״̬</option>
                  <option value="jc_mmydd.pdgcmc">�ɵ�����</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:125PX">
                  <option value=""></option>
                  <option value="jc_mmydd.skqrsj desc">�տ�ȷ��ʱ��</option>
                  <option value="jc_mmydd.lrsj desc">¼��ʱ��</option>
                  <option value="jc_mmydd.htrq desc">ǩ��ͬ����</option>
                  <option value="jc_mmydd.gcjslrsj desc">��������ʱ��</option>
                  <option value="jc_mmydd.srksj desc">���ʱ��</option>
                  <option value="jc_mmydd.azjssj desc">��װ���ʱ��</option>
                  <option value="jc_mmydd.wjsj desc">���ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">��װ���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="jc_mmydd.xmzy">��ĿרԱ</option>
                  <option value="jc_mmydd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_mmydd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_mmydd.clzt">����״̬</option>
                  <option value="jc_mmydd.pdgcmc">�ɵ�����</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')" name="Button">
                <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>
	  
	  

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>
var sgdMark=0;
var cxhdbmMark=0;

var clgwMark=0;
var ztjjgwMark=0;
var xmzyMark=0;

var gysMark=0;
var pdgcmcMark=0;
var ppmcMark=0;

var lrbmMark=0;

var clztMark=0;
var zsycyybmMark=0;
var mmycyybmMark=0;

var fieldName="";

function changeFgs(FormName) 
{
	FormName.crm_khxx_dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sgdMark=0;
	cxhdbmMark=0;
	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;

	gysMark=0;
	pdgcmcMark=0;
	ppmcMark=0;

	lrbmMark=0;

	FormName.crm_khxx_sgd.length=1;
	FormName.cxhdbm.length=1;

	FormName.clgw.length=1;
	FormName.ztjjgw.length=1;
	FormName.xmzy.length=1;

	FormName.gys.length=1;
	FormName.pdgcmc.length=1;
	FormName.ppmc.length=1;

	FormName.jc_mmydd_dwbh.length=1;


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

	if (lx=="clgw")
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
	else if (lx=="gys")
	{
		if (gysMark==0)
		{
			sql="select distinct sq_gysxx.gys from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='1' order by sq_gysxx.gys";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="pdgcmc")
	{
		if (pdgcmcMark==0)
		{

			sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='1' order by sq_gysxx.gysmc";
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			pdgcmcMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			sql="select distinct sq_gysxx.ppmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='1' order by sq_gysxx.ppmc";

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
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			var sql="select cxhdmc from jc_cxhd where fgsbh='"+selectform.fgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/getstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			cxhdbmMark=1;
		}
	}
	else if (lx=="lrbm")
	{
		if (lrbmMark==0)
		{
			var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.fgs.value+"' and  cxbz='N' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			lrbmMark=1;
		}
	}

}


function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="clzt")
	{
		if (clztMark==0)
		{
			var sql="select clzt,clztmc from jdm_mmyddzt order by clzt";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			clztMark=1;
		}
	}
	else if (lx=="zsycyybm")
	{
		if (zsycyybmMark==0)
		{
			sql ="select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zsycyybmMark=1;
		}
	}
	else if (lx=="mmycyybm")
	{
		if (mmycyybmMark==0)
		{
			sql ="select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			mmycyybmMark=1;
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
		strToSelect(selectform.jc_mmydd_dwbh,ajaxRetStr);
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
	else if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="pdgcmc")
	{
		strToItem2(selectform.pdgcmc,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToItem(selectform.crm_khxx_sgd,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToItem2(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="clzt")
	{
		strToSelect(selectform.jc_mmydd_clzt,ajaxRetStr);
	}
	else if (fieldName=="zsycyybm")
	{
		strToSelect(selectform.jc_mmydd_zsycyybm,ajaxRetStr);
	}
	else if (fieldName=="mmycyybm")
	{
		strToSelect(selectform.jc_mmydd_mmycyybm,ajaxRetStr);
	}
}


function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_khxx_kgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhccsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_sccsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_sccsj2, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq, "ǩ��ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_htrq2, "ǩ��ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhazsj, "��ͬ��װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_jhazsj2, "��ͬ��װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.srksj, "ʵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.srksj2, "ʵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kazsj, "Э�̰�װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kazsj2, "Э�̰�װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.aztzsj, "����װ֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.aztzsj2, "����װ֪ͨʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.azjssj, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.azjssj2, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_paidsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_paidsj2, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_tdsj, "�˵�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_mmydd_tdsj2, "�˵�ʱ��"))) {
		return false;
	}
	

	FormName.action="Jc_mmyddCxList.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
