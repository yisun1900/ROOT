<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE3 {font-weight: bold}
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

<form method="post" action="Jc_jjddCxList.jsp" name="selectform">
      <div align="center">�Ҿ߶�������ѯ</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">������˾</td>
              <td><%
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
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
%>              </td>
              <td align="right">ǩԼ����</td>
              <td><select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td align="right">�ͻ����</td>
              <td><input type="text" name="jc_jjdd_khbh" size="20" maxlength="20" ></td>
              <td align="right">��ͬ��</td>
              <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3 STYLE1"><strong> �ͻ����� </strong></span></td>
              <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td align="right">�ͻ�����</td>
              <td><input type="text" name="crm_khxx_khxm2" size="14" maxlength="20" >
                ��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></td>
              <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="50"></td>
              <td align="right">��ϵ��ʽ</td>
              <td><input type="text" name="crm_khxx_lxfs2" size="14" maxlength="50">
                ��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE3 STYLE1"><strong> ���ݵ�ַ </strong></span></td>
              <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td align="right">���ݵ�ַ</td>
              <td><input type="text" name="crm_khxx_fwdz2" size="14" maxlength="50" >
                ��ģ����ѯ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">��ͬ�������� ��</td>
              <td bgcolor="#FFFFCC"><input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFCC">��</td>
              <td bgcolor="#FFFFCC"><input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ʦ</td>
              <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" ></td>
              <td align="right"> �ʼ����� </td>
              <td><input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
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
              <td colspan="3"><select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:522PX" onclick="getThis('cxhdbm');">
                  <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ������� </td>
              <td><input type="text" name="jc_jjdd_ddbh" size="20" maxlength="9" >              </td>
              <td align="right">����״̬</td>
              <td><select name="jc_jjdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clzt')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�Ƿ��������ʦ</td>
              <td><input type="radio" name="sfpsjs" value="1">
                ��
                <input type="radio" name="sfpsjs" value="2">
                �� </td>
              <td align="right">�Ҿ����ʦ</td>
              <td>
			  <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('jjsjs')">
				  <option value=""></option>
				</select>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">פ��Ҿӹ���</td>
              <td><select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">չ���Ҿӹ���</td>
              <td><select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"> ��ĿרԱ </td>
              <td><select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">�˵�ԭ��</td>
              <td><select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('jctdyybm')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1"><strong>�Ҿ�-�ɵ�����</strong></span></td>
              <td><select name="pdgcmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('pdgcmc')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">�Ҿ�-�ɵ�����</td>
              <td><input name="pdgcmc2" type="text" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1"><strong>�Ҿ�-Ʒ������</strong></span></td>
              <td><select name="jjppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('jjppmc')">
                  <option value=""></option>
              </select></td>
              <td align="right">�Ҿ�-Ʒ������</td>
              <td><input type="text" name="jjppmc2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1"><strong>�Ҿ�-��Ӧ������</strong></span></td>
              <td><select name="jjgys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('jjgys')">
                  <option value=""></option>
                  <%
				if (yhjs.equals("G0"))
				{
					cf.selectItem(out,"select gys c1,gys c2 from sq_gysbm where gysbm='"+ygbh+"' order by gys","");
				}
				%>
              </select></td>
              <td align="right">�Ҿ�-��Ӧ������</td>
              <td><input type="text" name="jjgys2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1"><strong>�Ͳ���-�ɵ�����</strong></span></td>
              <td><select name="xcmgcmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xcmgcmc')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">�Ͳ���-�ɵ�����</td>
              <td><input name="xcmgcmc2" type="text" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1"><strong>�Ͳ���-Ʒ������</strong></span></td>
              <td><select name="xcmppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xcmppmc')">
                  <option value=""></option>
              </select></td>
              <td align="right">�Ͳ���-Ʒ������</td>
              <td><input type="text" name="xcmppmc2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1"><strong>�Ͳ���-Ӧ������</strong></span></td>
              <td><select name="xcmgys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xcmgys')">
                  <option value=""></option>
                  <%
				if (yhjs.equals("G0"))
				{
					cf.selectItem(out,"select gys c1,gys c2 from sq_gysbm where gysbm='"+ygbh+"' order by gys","");
				}
				%>
              </select></td>
              <td align="right">�Ͳ���-��Ӧ������</td>
              <td><input type="text" name="xcmgys2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="19%" align="right"><font color="#0000CC">�ɹ���ʱ�� 
                ��</font></td>
              <td width="31%">
              <input type="text" name="pgcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%">
              <input type="text" name="pgcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC">�����ʦʱ�� ��</font></td>
              <td><input name="pdsj" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right">��</td>
              <td><input name="pdsj2" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                �ƻ�����ʱ�� ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_jhccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_jhccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ʵ����ʱ�� ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_sccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_sccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                ǩ��ͬʱ�� ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_qhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_qhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ƻ���װ���� ��</td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_jhazrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_jhazrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                ʵ��װ���� ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_sazrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_sazrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼��ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">�˵�ʱ�� ��</td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_tdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
              <input type="text" name="jc_jjdd_tdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ¼����              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrr" size="20" maxlength="20" >              </td>
              <td width="19%" align="right"> 
                ¼�벿��              </td>
              <td width="31%"> 
                <select name="jc_jjdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('lrbm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">�ӳٴ���״̬</td>
              <td colspan="3"><input type="radio" name="ycclzt" value="0">
                δ�ӳ�
                <input type="radio" name="ycclzt" value="1">
                �ӳ�δ��ʵ
                <input type="radio" name="ycclzt" value="2">
                �ӳ�ԭ����ʵ
                <input type="radio" name="ycclzt" value="3">
                �ӳ�ԭ����ʵ</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">�ӳ�ԭ��</td>
              <td><select name="ycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ycyybm')">
                  <option value=""></option>
              </select></td>
              <td align="right">��ʵ�ӳ�ԭ��</td>
              <td><select name="zsycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zsycyybm')">
                  <option value=""></option>
              </select></td>
            </tr>
            
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
				  <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
				  <option value="jc_jjdd.qhtsj desc">ǩ��ͬʱ��</option>
				  <option value="jc_jjdd.pgcsj desc">�ɹ���ʱ��</option>
				  <option value="jc_jjdd.pdsj desc">�����ʦʱ��</option>
				  <option value="jc_jjdd.jhccsj desc">�ƻ�����ʱ��</option>
				  <option value="jc_jjdd.sccsj desc">ʵ����ʱ��</option>
				  <option value="jc_jjdd.jhazrq desc">�ƻ���װ����</option>
				  <option value="jc_jjdd.sazrq desc">ʵ��װ����</option>
				  <option value="jc_jjdd.tdsj desc">�˵�ʱ��</option>
				  <option value="crm_khxx.khbh ">�ͻ����</option>
				  <option value="crm_khxx.khxm">�ͻ�����</option>
				  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
				  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
				  <option value="crm_khxx.sjs">��װ���ʦ</option>
				  <option value="crm_khxx.sgd">ʩ����</option>
				  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
				  <option value="crm_khxx.hth">��ͬ��</option>
				  <option value="crm_khxx.gcjdbm">���̽���</option>
				  <option value="jc_jjdd.xmzy">��ĿרԱ</option>
				  <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
				  <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
				  <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
				  <option value="jc_jjdd.pdgcmc">�Ҿ߹���</option>
				  <option value="jc_jjdd.xcmgcmc">�Ͳ��Ź���</option>
				  <option value="jc_jjdd.clzt">����״̬</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
				  <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
				  <option value="jc_jjdd.qhtsj desc">ǩ��ͬʱ��</option>
				  <option value="jc_jjdd.pgcsj desc">�ɹ���ʱ��</option>
				  <option value="jc_jjdd.pdsj desc">�����ʦʱ��</option>
				  <option value="jc_jjdd.jhccsj desc">�ƻ�����ʱ��</option>
				  <option value="jc_jjdd.sccsj desc">ʵ����ʱ��</option>
				  <option value="jc_jjdd.jhazrq desc">�ƻ���װ����</option>
				  <option value="jc_jjdd.sazrq desc">ʵ��װ����</option>
				  <option value="jc_jjdd.tdsj desc">�˵�ʱ��</option>
				  <option value="crm_khxx.khbh ">�ͻ����</option>
				  <option value="crm_khxx.khxm">�ͻ�����</option>
				  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
				  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
				  <option value="crm_khxx.sjs">��װ���ʦ</option>
				  <option value="crm_khxx.sgd">ʩ����</option>
				  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
				  <option value="crm_khxx.hth">��ͬ��</option>
				  <option value="crm_khxx.gcjdbm">���̽���</option>
				  <option value="jc_jjdd.xmzy">��ĿרԱ</option>
				  <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
				  <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
				  <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
				  <option value="jc_jjdd.pdgcmc">�Ҿ߹���</option>
				  <option value="jc_jjdd.xcmgcmc">�Ͳ��Ź���</option>
				  <option value="jc_jjdd.clzt">����״̬</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
				  <option value="jc_jjdd.lrsj desc">¼��ʱ��</option>
				  <option value="jc_jjdd.qhtsj desc">ǩ��ͬʱ��</option>
				  <option value="jc_jjdd.pgcsj desc">�ɹ���ʱ��</option>
				  <option value="jc_jjdd.pdsj desc">�����ʦʱ��</option>
				  <option value="jc_jjdd.jhccsj desc">�ƻ�����ʱ��</option>
				  <option value="jc_jjdd.sccsj desc">ʵ����ʱ��</option>
				  <option value="jc_jjdd.jhazrq desc">�ƻ���װ����</option>
				  <option value="jc_jjdd.sazrq desc">ʵ��װ����</option>
				  <option value="jc_jjdd.tdsj desc">�˵�ʱ��</option>
				  <option value="crm_khxx.khbh ">�ͻ����</option>
				  <option value="crm_khxx.khxm">�ͻ�����</option>
				  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
				  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
				  <option value="crm_khxx.sjs">��װ���ʦ</option>
				  <option value="crm_khxx.sgd">ʩ����</option>
				  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
				  <option value="crm_khxx.hth">��ͬ��</option>
				  <option value="crm_khxx.gcjdbm">���̽���</option>
				  <option value="jc_jjdd.xmzy">��ĿרԱ</option>
				  <option value="jc_jjdd.clgw">פ��Ҿӹ���</option>
				  <option value="jc_jjdd.ztjjgw">չ���Ҿӹ���</option>
				  <option value="jc_jjdd.jjsjs">�Ҿ����ʦ</option>
				  <option value="jc_jjdd.pdgcmc">�Ҿ߹���</option>
				  <option value="jc_jjdd.xcmgcmc">�Ͳ��Ź���</option>
				  <option value="jc_jjdd.clzt">����״̬</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
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

var jjsjsMark=0;
var clgwMark=0;
var ztjjgwMark=0;
var xmzyMark=0;

var jjgysMark=0;
var pdgcmcMark=0;
var jjppmcMark=0;
var xcmgysMark=0;
var xcmgcmcMark=0;
var xcmppmcMark=0;

var lrbmMark=0;

var ycyybmMark=0;
var zsycyybmMark=0;
var clztMark=0;
var jctdyybmMark=0;

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
	jjsjsMark=0;
	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;

	jjgysMark=0;
	pdgcmcMark=0;
	jjppmcMark=0;
	xcmgysMark=0;
	xcmgcmcMark=0;
	xcmppmcMark=0;

	lrbmMark=0;

	FormName.crm_khxx_sgd.length=1;
	FormName.cxhdbm.length=1;

	FormName.jjsjs.length=1;
	FormName.clgw.length=1;
	FormName.ztjjgw.length=1;
	FormName.xmzy.length=1;

	FormName.jjgys.length=1;
	FormName.pdgcmc.length=1;
	FormName.jjppmc.length=1;
	FormName.xcmgys.length=1;
	FormName.xcmgcmc.length=1;
	FormName.xcmppmc.length=1;

	FormName.jc_jjdd_dwbh.length=1;


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

	if (lx=="jjsjs")
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

//			window.open(actionStr);
			openAjax(actionStr);
			jjsjsMark=1;
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
	else if (lx=="jjgys")
	{
		if (jjgysMark==0)
		{
			sql="select distinct sq_gysxx.gys from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gys";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			jjgysMark=1;
		}
	}
	else if (lx=="pdgcmc")
	{
		if (pdgcmcMark==0)
		{

			sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			pdgcmcMark=1;
		}
	}
	else if (lx=="jjppmc")
	{
		if (jjppmcMark==0)
		{
			sql="select distinct sq_gysxx.ppmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='3' order by sq_gysxx.ppmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			jjppmcMark=1;
		}
	}
	else if (lx=="xcmgys")
	{
		if (xcmgysMark==0)
		{
			sql="select distinct sq_gysxx.gys from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gys";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			xcmgysMark=1;
		}
	}
	else if (lx=="xcmgcmc")
	{
		if (xcmgcmcMark==0)
		{

			sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='3' order by sq_gysxx.gysmc";
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			xcmgcmcMark=1;
		}
	}
	else if (lx=="xcmppmc")
	{
		if (xcmppmcMark==0)
		{
			sql="select distinct sq_gysxx.ppmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='3' order by sq_gysxx.ppmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			xcmppmcMark=1;
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
			var sql="select clzt,clztmc from jdm_jjddzt order by clzt";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			clztMark=1;
		}
	}
	else if (lx=="ycyybm")
	{
		if (ycyybmMark==0)
		{
			var sql="select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			ycyybmMark=1;
		}
	}
	else if (lx=="zsycyybm")
	{
		if (zsycyybmMark==0)
		{
			var sql="select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zsycyybmMark=1;
		}
	}
	else if (lx=="jctdyybm")
	{
		if (jctdyybmMark==0)
		{
			var sql="select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			jctdyybmMark=1;
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
		strToSelect(selectform.jc_jjdd_dwbh,ajaxRetStr);
	}
	else if (fieldName=="jjsjs")
	{
		strToSelect(selectform.jjsjs,ajaxRetStr);
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
	else if (fieldName=="jjgys")
	{
		strToItem2(selectform.jjgys,ajaxRetStr);
	}
	else if (fieldName=="pdgcmc")
	{
		strToItem2(selectform.pdgcmc,ajaxRetStr);
	}
	else if (fieldName=="jjppmc")
	{
		strToItem2(selectform.jjppmc,ajaxRetStr);
	}
	else if (fieldName=="xcmgys")
	{
		strToItem2(selectform.xcmgys,ajaxRetStr);
	}
	else if (fieldName=="xcmgcmc")
	{
		strToItem2(selectform.xcmgcmc,ajaxRetStr);
	}
	else if (fieldName=="xcmppmc")
	{
		strToItem2(selectform.xcmppmc,ajaxRetStr);
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
		strToSelect(selectform.jc_jjdd_clzt,ajaxRetStr);
	}
	else if (fieldName=="ycyybm")
	{
		strToSelect(selectform.ycyybm,ajaxRetStr);
	}
	else if (fieldName=="zsycyybm")
	{
		strToSelect(selectform.zsycyybm,ajaxRetStr);
	}
	else if (fieldName=="jctdyybm")
	{
		strToSelect(selectform.jctdyybm,ajaxRetStr);
	}
}



function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_khxx_kgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "��ͬ��������"))) {
		return false;
	}


	if(!(isDatetime(FormName.pgcsj, "�ɹ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.pgcsj2, "�ɹ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "�����ʦʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj2, "�����ʦʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhccsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sccsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sccsj2, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj2, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhazrq, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhazrq2, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sazrq, "ʵ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sazrq2, "ʵ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_tdsj, "�˵�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_tdsj2, "�˵�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
