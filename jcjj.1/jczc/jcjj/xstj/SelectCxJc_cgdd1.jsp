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
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=request.getParameter("ssfgs");
String yhdlm=(String)session.getAttribute("yhdlm");
String dlxmzy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='10'");
if (dlxmzy==null)
{
	dlxmzy="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���񶩵���ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="19%">������˾</td>
              <td width="31%"> <%
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
%> </td>
              <td align="right" width="17%">ǩԼ����</td>
              <td width="33%"> 
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
              <td width="19%" align="right"> �������</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_ddbh" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right"> �ͻ����</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> ��ͬ��</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="17%" align="right"> �ͻ�����</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> ���ݵ�ַ</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right"> ��ϵ��ʽ</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">פ��Ҿӹ���</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">չ���Ҿӹ���</td>
              <td width="33%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">�Ƿ��������ʦ</td>
              <td width="31%"> 
                <input type="radio" name="sfpsjs" value="1">
                �� 
                <input type="radio" name="sfpsjs" value="2">
                �� </td>
              <td align="right" width="17%">���񹤳�</td>
              <td width="33%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' order by ssfgs,gysmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='2' and ssfgs='"+ssfgs+"' order by gysmc","");
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> ��ĿרԱ</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (dlxmzy.equals(""))
	{
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='10' order by sq_dwxx.ssdw,yhmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' order by yhmc","");
		}
	}
	else{
		out.println("<option value=\""+dlxmzy+"\">"+dlxmzy+"</option>");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">�Ҿ����ʦ</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_cgsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"> �ƻ�����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_jhccsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> ��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_jhccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"> ʵ����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_sccsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> ��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_sccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ƻ�����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_jhfcsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_jhfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ʵ����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_sfcsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_sfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">ǩ��ͬʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_qhtsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> ��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_qhtsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">�ƻ���װ���� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_jhazrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_jhazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"> ʵ��װ���� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_sazrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right"> ��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼��ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_lrsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�˵�ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_tdsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="jc_cgdd_tdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> ¼����</td>
              <td width="31%"> 
                <input type="text" name="jc_cgdd_lrr" size="20" maxlength="20" >
              </td>
              <td width="17%" align="right">�ͻ�����</td>
              <td width="33%"> 
                <input type="radio" name="jc_cgdd_khlx" value="2">
                ��װ�ͻ� 
                <input type="radio" name="jc_cgdd_khlx" value="4">
                �Ǽ�װ�ͻ� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">�����ʽ</td>
              <td width="31%"> 
                <input type="text" name="sdks" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">������</td>
              <td width="33%"> 
                <input type="text" name="xtbc" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">����ɫ</td>
              <td width="31%"> 
                <input type="text" name="cghs" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">̨��Ʒ��</td>
              <td width="31%"> 
                <input type="text" name="tmpp" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">̨�滨ɫ</td>
              <td width="33%"> 
                <input type="text" name="tmhs" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">��������</td>
              <td width="31%"> 
                <input type="text" name="blcz" size="20" maxlength="50">
              </td>
              <td width="17%" align="right">����</td>
              <td width="33%"> 
                <input type="text" name="jiaolian" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> ����״̬</td>
              <td width="31%"> 
                <select name="jc_cgdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_cgddzt order by clzt","");
%> 
                </select>
              </td>
              <td width="17%" align="right">�˵�ԭ�� </td>
              <td width="33%"> 
                <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ͻ�����־</td>
              <td width="31%"> 
                <input type="radio" name="crm_khxx_wjbz" value="1">
                δ��� 
                <input type="radio" name="crm_khxx_wjbz" value="2">
                ����� </td>
              <td width="17%" align="right">¼�벿��</td>
              <td width="33%"> 
                <select name="jc_cgdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="jc_cgdd.lrsj desc">¼��ʱ��</option>
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
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="jc_cgdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_cgdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_cgdd.cgsjs">�������ʦ</option>
                  <option value="jc_cgdd.pdgc">�ɵ�����</option>
                  <option value="jc_cgdd.clzt">����״̬</option>

                  <option value="jc_cgdd.sdks">�����ʽ</option>
                  <option value="jc_cgdd.xtbc">������</option>
                  <option value="jc_cgdd.cghs">����ɫ</option>
                  <option value="jc_cgdd.tmpp">̨��Ʒ��</option>
                  <option value="jc_cgdd.tmhs">̨�滨ɫ</option>
                  <option value="jc_cgdd.blcz">��������</option>
                  <option value="jc_cgdd.jiaolian">����</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">¼��ʱ��</option>
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
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="jc_cgdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_cgdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_cgdd.cgsjs">�������ʦ</option>
                  <option value="jc_cgdd.pdgc">�ɵ�����</option>
                  <option value="jc_cgdd.clzt">����״̬</option>

                  <option value="jc_cgdd.sdks">�����ʽ</option>
                  <option value="jc_cgdd.xtbc">������</option>
                  <option value="jc_cgdd.cghs">����ɫ</option>
                  <option value="jc_cgdd.tmpp">̨��Ʒ��</option>
                  <option value="jc_cgdd.tmhs">̨�滨ɫ</option>
                  <option value="jc_cgdd.blcz">��������</option>
                  <option value="jc_cgdd.jiaolian">����</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">¼��ʱ��</option>
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
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="jc_cgdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_cgdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_cgdd.cgsjs">�������ʦ</option>
                  <option value="jc_cgdd.pdgc">�ɵ�����</option>
                  <option value="jc_cgdd.clzt">����״̬</option>

                  <option value="jc_cgdd.sdks">�����ʽ</option>
                  <option value="jc_cgdd.xtbc">������</option>
                  <option value="jc_cgdd.cghs">����ɫ</option>
                  <option value="jc_cgdd.tmpp">̨��Ʒ��</option>
                  <option value="jc_cgdd.tmhs">̨�滨ɫ</option>
                  <option value="jc_cgdd.blcz">��������</option>
                  <option value="jc_cgdd.jiaolian">����</option>
                </select>
				<br><br>
				������ 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">¼��ʱ��</option>
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
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="jc_cgdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_cgdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_cgdd.cgsjs">�������ʦ</option>
                  <option value="jc_cgdd.pdgc">�ɵ�����</option>
                  <option value="jc_cgdd.clzt">����״̬</option>

                  <option value="jc_cgdd.sdks">�����ʽ</option>
                  <option value="jc_cgdd.xtbc">������</option>
                  <option value="jc_cgdd.cghs">����ɫ</option>
                  <option value="jc_cgdd.tmpp">̨��Ʒ��</option>
                  <option value="jc_cgdd.tmhs">̨�滨ɫ</option>
                  <option value="jc_cgdd.blcz">��������</option>
                  <option value="jc_cgdd.jiaolian">����</option>
                </select>
                ������ 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">¼��ʱ��</option>
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
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="jc_cgdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_cgdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_cgdd.cgsjs">�������ʦ</option>
                  <option value="jc_cgdd.pdgc">�ɵ�����</option>
                  <option value="jc_cgdd.clzt">����״̬</option>

                  <option value="jc_cgdd.sdks">�����ʽ</option>
                  <option value="jc_cgdd.xtbc">������</option>
                  <option value="jc_cgdd.cghs">����ɫ</option>
                  <option value="jc_cgdd.tmpp">̨��Ʒ��</option>
                  <option value="jc_cgdd.tmhs">̨�滨ɫ</option>
                  <option value="jc_cgdd.blcz">��������</option>
                  <option value="jc_cgdd.jiaolian">����</option>
                </select>
                ������ 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="jc_cgdd.lrsj desc">¼��ʱ��</option>
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
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="jc_cgdd.clgw">פ��Ҿӹ���</option>
                  <option value="jc_cgdd.ztjjgw">չ���Ҿӹ���</option>
                  <option value="jc_cgdd.cgsjs">�������ʦ</option>
                  <option value="jc_cgdd.pdgc">�ɵ�����</option>
                  <option value="jc_cgdd.clzt">����״̬</option>

                  <option value="jc_cgdd.sdks">�����ʽ</option>
                  <option value="jc_cgdd.xtbc">������</option>
                  <option value="jc_cgdd.cghs">����ɫ</option>
                  <option value="jc_cgdd.tmpp">̨��Ʒ��</option>
                  <option value="jc_cgdd.tmhs">̨�滨ɫ</option>
                  <option value="jc_cgdd.blcz">��������</option>
                  <option value="jc_cgdd.jiaolian">����</option>
                </select>

			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" >��ʾ���</td>
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
			  <td width="19%" align="right">ͳ�Ʊ�</td>
			  <td colspan="3"> ��һ�� 
				<input type="hidden" name="tj1name" value="">
				<select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">��װ���ʦ</option>
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="cgsjs">�������ʦ</option>
                  <option value="gysmc">�ɵ�����</option>
                  <option value="clztmc">����״̬</option>

                  <option value="sdks">�����ʽ</option>
                  <option value="xtbc">������</option>
                  <option value="cghs">����ɫ</option>
                  <option value="tmpp">̨��Ʒ��</option>
                  <option value="tmhs">̨�滨ɫ</option>
                  <option value="blcz">��������</option>
                  <option value="jiaolian">����</option>
				</select>
				�ڶ��� 
				<input type="hidden" name="tj2name" value="">
				<select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">��װ���ʦ</option>
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="cgsjs">�������ʦ</option>
                  <option value="gysmc">�ɵ�����</option>
                  <option value="clztmc">����״̬</option>

                  <option value="sdks">�����ʽ</option>
                  <option value="xtbc">������</option>
                  <option value="cghs">����ɫ</option>
                  <option value="tmpp">̨��Ʒ��</option>
                  <option value="tmhs">̨�滨ɫ</option>
                  <option value="blcz">��������</option>
                  <option value="jiaolian">����</option>
				</select>
				������ 
				<input type="hidden" name="tj3name" value="">
				<select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">��װ���ʦ</option>
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="cgsjs">�������ʦ</option>
                  <option value="gysmc">�ɵ�����</option>
                  <option value="clztmc">����״̬</option>

                  <option value="sdks">�����ʽ</option>
                  <option value="xtbc">������</option>
                  <option value="cghs">����ɫ</option>
                  <option value="tmpp">̨��Ʒ��</option>
                  <option value="tmhs">̨�滨ɫ</option>
                  <option value="blcz">��������</option>
                  <option value="jiaolian">����</option>
				</select>
				<br>
				<br>
				������ 
				<input type="hidden" name="tj4name" value="">
				<select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">��װ���ʦ</option>
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="cgsjs">�������ʦ</option>
                  <option value="gysmc">�ɵ�����</option>
                  <option value="clztmc">����״̬</option>

                  <option value="sdks">�����ʽ</option>
                  <option value="xtbc">������</option>
                  <option value="cghs">����ɫ</option>
                  <option value="tmpp">̨��Ʒ��</option>
                  <option value="tmhs">̨�滨ɫ</option>
                  <option value="blcz">��������</option>
                  <option value="jiaolian">����</option>
				</select>
				������ 
				<input type="hidden" name="tj5name" value="">
				<select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">��װ���ʦ</option>
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="cgsjs">�������ʦ</option>
                  <option value="gysmc">�ɵ�����</option>
                  <option value="clztmc">����״̬</option>

                  <option value="sdks">�����ʽ</option>
                  <option value="xtbc">������</option>
                  <option value="cghs">����ɫ</option>
                  <option value="tmpp">̨��Ʒ��</option>
                  <option value="tmhs">̨�滨ɫ</option>
                  <option value="blcz">��������</option>
                  <option value="jiaolian">����</option>
				</select>
				������ 
				<input type="hidden" name="tj6name" value="">
				<select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
				  <option value=""></option>
                  <option value="sjs">��װ���ʦ</option>
                  <option value="jc_cgdd.xmzy">��ĿרԱ</option>
                  <option value="clgw">פ��Ҿӹ���</option>
                  <option value="ztjjgw">չ���Ҿӹ���</option>
                  <option value="cgsjs">�������ʦ</option>
                  <option value="gysmc">�ɵ�����</option>
                  <option value="clztmc">����״̬</option>

                  <option value="sdks">�����ʽ</option>
                  <option value="xtbc">������</option>
                  <option value="cghs">����ɫ</option>
                  <option value="tmpp">̨��Ʒ��</option>
                  <option value="tmhs">̨�滨ɫ</option>
                  <option value="blcz">��������</option>
                  <option value="jiaolian">����</option>
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.jc_cgdd_jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhccsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj2, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj2, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj2, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq2, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq, "ʵ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq2, "ʵ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_tdsj, "�˵�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_tdsj2, "�˵�ʱ��"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_cgddCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_cgddTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
