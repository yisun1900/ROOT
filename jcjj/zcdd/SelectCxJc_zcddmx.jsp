<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
      <div align="center">��ѯ��������ϸ</div></td>
  </tr>
  <tr>
    <td width="100%" > 
<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
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
              <td width="18%" align="right">ǩԼ����</td>
              <td width="32%"> 
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
            <tr bgcolor="#FFCCFF">
              <td align="right"><b>*����ǩ��ʱ�� ��</b></td>
              <td><b>
                <input type="text" name="jc_zcdd_qhtsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
              </b></td>
              <td align="right"><b>*��</b></td>
              <td><b>
                <input type="text" name="jc_zcdd_qhtsj2" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">
              </b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �������              </td>
              <td width="30%"> 
                <input type="text" name="jc_zcdd_ddbh" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"> 
                ����״̬              </td>
              <td width="32%"> 
                <select name="jc_zcdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_zcddzt order by clzt","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong>�ͻ����ۼ���</strong></td>
              <td><select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('bjjb')">
                <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ͻ����</td>
              <td width="30%"> 
                <input type="text" name="khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">��ͬ��</td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#0000CC"><b>�ͻ�����</b></font>              </td>
              <td width="30%"> 
                <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="18%" align="right"> 
                �ͻ�����              </td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></td>
              <td width="30%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="18%" align="right">��ϵ��ʽ</td>
              <td width="32%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#0000CC"><b>���ݵ�ַ</b></font>              </td>
              <td width="30%"> 
                <input type="text" name="fwdz" size="20" maxlength="100">              </td>
              <td width="18%" align="right"> 
                ���ݵ�ַ              </td>
              <td width="32%"> 
                <input type="text" name="fwdz2" size="14" maxlength="100">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">����ǩԼ���</td>
              <td><input type="text" name="crm_khxx_qye" size="20" maxlength="17" >              </td>
              <td align="right">��</td>
              <td><input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">��װǩԼ���� ��</td>
              <td><input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">��</td>
              <td><input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���ʦ</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">�ʼ�</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ʩ����              </td>
              <td width="30%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd');">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">���Ĵ���</td>
              <td width="30%"> 
                <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcdlbm');" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">����С��</td>
              <td width="32%"> 
                <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>��Ʒ��</b></font></td>
              <td width="30%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppbm')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select jxc_ppgysdzb.ppmc c1,jxc_ppgysdzb.ppmc c2 from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppgysdzb.ppmc","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right">��Ʒ��</td>
              <td width="32%"> 
                <input type="text" name="ppbm2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>Ʒ������</b></font></td>
              <td width="30%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                  <option value=""></option>
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select distinct jxc_ppxx.scsmc c1,jxc_ppxx.scsmc c2 from jxc_gysxx,jxc_ppgysdzb,jxc_ppxx where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_gysxx.gysbm='"+ygbh+"' order by jxc_ppxx.scsmc","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right">Ʒ������</td>
              <td width="32%"> 
                <input type="text" name="ppmc2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>��Ӧ������</b></font></td>
              <td width="30%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                  <%
	if (yhjs.equals("G0"))
	{
		cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where gysbm='"+ygbh+"' order by gysmc","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right">��Ӧ������</td>
              <td width="32%"> 
                <input type="text" name="gys2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"> 
                <font color="#0000CC"><b>פ��Ҿӹ���</b></font>              </td>
              <td width="30%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right"> 
                פ��Ҿӹ���              </td>
              <td width="32%"> 
                <input type="text" name="clgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>չ���Ҿӹ���</b></font></td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">չ���Ҿӹ���</td>
              <td width="32%"> 
                <input type="text" name="ztjjgw2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>��ĿרԱ</b></font></td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">��ĿרԱ</td>
              <td width="32%"> 
                <input type="text" name="xmzy2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"><font color="#0000CC"><b>�Ҿ����ʦ</b></font></td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('jjsjs')">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">�Ҿ����ʦ</td>
              <td width="32%"> 
                <input type="text" name="jjsjs2" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ı���</td>
              <td><input type="text" name="jc_zcddmx_zcbm" size="20" maxlength="100" ></td>
              <td align="right">��������</td>
              <td><input type="text" name="jc_zcddmx_zcmc" size="20" maxlength="100" ></td>
            </tr>
            
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�����ͺ�</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_xinghao" size="20" maxlength="100" >      </td>
      <td align="right" width="18%">���Ĺ��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_gg" size="20" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">������ɫ</td>
      <td><input type="text" name="jc_zcddmx_zcysbm" size="20" maxlength="100" ></td>
      <td align="right">������װλ��</td>
      <td><input type="text" name="jc_zcddmx_zcpzwzbm" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�������ϵ��</td>
      <td width="30%"><input type="text" name="jc_zcddmx_zclbbm" size="20" maxlength="100" ></td>
      <td align="right" width="18%">�����Ƿ��д���</td>
      <td width="32%"> <%
	cf.radioToken(out, "jc_zcddmx_sfycx","N+û����&Y+�д���","");
%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">������ʼʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">��������ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ѡ��۸�</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_zcddmx_xzjg","1+�����޼�&2+������","");
%> </td>
      <td align="right" width="18%">ʵ������</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_dj" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">��ͬ���� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_sl" size="20" maxlength="9" >      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_sl2" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ͬ��� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_je" size="20" maxlength="17" >      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_je2" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">���������� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_zjhsl" size="20" maxlength="9" >      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_zjhsl2" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">�������� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_zjhje" size="20" maxlength="17" >      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_zjhje2" size="20" maxlength="17" >      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%" bgcolor="#FFFFFF">�Ƿ�μӴ����</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_zcddmx_cxhdbz","Y+�μ�&N+���μ�","");
%> </td>
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_lrr" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">������������ ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxhdbl" size="20" maxlength="9" >      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxhdbl2" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">����������� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_cxhdje" size="20" maxlength="17" >      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_cxhdje2" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="20%">¼��ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="jc_zcddmx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="jc_zcddmx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��д��־</td>
      <td width="30%"> <%
	cf.radioToken(out, "jc_zcddmx_sxbz","1+����д&2+��д","");
%> </td>
      <td align="right" width="18%">���� </td>
      <td width="32%"><%
	cf.radioToken(out, "jc_zcddmx_lx","1+��ͬ��&2+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��д��ͬԭ��</td>
      <td width="30%"> 
        <select name="sxhtyy" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sxhtyy c1,sxhtyy c2 from jdm_sxhtyybm order by sxhtyybm","");
%> 
        </select>      </td>
      <td align="right" width="18%">��д��ͬԭ��</td>
      <td width="32%"> 
        <input type="text" name="sxhtyy2" size="20" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right" bgcolor="#FFFFCC">��ѯ�������</td>
      <td colspan="3"> ��һ�� 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="jc_zcdd.ddbh" selected>�������</option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
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
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="20%" >��ʾ���</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
        <input type="text" name="myxssl" size="7" maxlength="13" value="25">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="����">      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">ͳ�Ʊ�</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="jc_zcddmx.zcdlbm">���Ĵ���</option>
          <option value="jc_zcddmx.zcxlbm">����С��</option>
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',��д��Ŀ,'1','�����޼�','2','������','3','�г����')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="bjjbmc">���ۼ���</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',��д��Ŀ,'1','�����޼�','2','������','3','�г����')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="bjjbmc">���ۼ���</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',��д��Ŀ,'1','�����޼�','2','������','3','�г����')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="bjjbmc">���ۼ���</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',��д��Ŀ,'1','�����޼�','2','������','3','�г����')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="bjjbmc">���ۼ���</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',��д��Ŀ,'1','�����޼�','2','������','3','�г����')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="bjjbmc">���ۼ���</option>
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
          <option value="jc_zcddmx.dwbh">��Ʒ��</option>
          <option value="jc_zcddmx.gys">��Ӧ��</option>
          <option value="jc_zcddmx.ppmc">Ʒ��</option>
          <option value="jc_zcddmx.zclbbm">�������ϵ��</option>
          <option value="jc_zcddmx.xinghao" >�����ͺ�</option>
          <option value="jc_zcddmx.gg">���Ĺ��</option>
          <option value="jc_zcddmx.zcysbm">������ɫ</option>
          <option value="DECODE(jc_zcddmx.sfycx,'N','û����','Y','�д���')">�����Ƿ��д���</option>
          <option value="DECODE(jc_zcddmx.xzjg,'0',��д��Ŀ,'1','�����޼�','2','������','3','�г����')">���ۼ۸�</option>
          <option value="jc_zcddmx.dj">���ۼ�</option>
          <option value="jc_zcddmx.cxhdbl">��������</option>
          <option value="DECODE(jc_zcddmx.qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')">��������</option>
          <option value="DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�')">�Ƿ�μӴ����</option>
          <option value="DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����')">����</option>
          <option value="DECODE(jc_zcddmx.sxbz,'1','����д','2','��д')">��д��־</option>
          <option value="sxhtyy">��д��ͬԭ��</option>
          <option value="bjjbmc">���ۼ���</option>
          <option value="crm_khxx.khbh">�ͻ����</option>
          <option value="crm_khxx.khxm">�ͻ�����</option>
          <option value="crm_khxx.fwdz">���ݵ�ַ</option>
          <option value="crm_khxx.sjs">��װ���ʦ</option>
          <option value="jc_zcdd.ddbh">�������</option>
          <option value="jc_zcdd.xmzy">��ĿרԱ</option>
          <option value="jc_zcdd.clgw">פ��Ҿӹ���</option>
          <option value="jc_zcdd.ztjjgw">չ���Ҿӹ���</option>
        </select>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">      </td>
    </tr>
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

	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;
	jjsjsMark=0;
	gysMark=0;
	ppbmMark=0;
	ppmcMark=0;
	sgdMark=0;

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
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.ppmc";
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
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.scsmc";
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
