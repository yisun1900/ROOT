<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>



<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String kkbbz=(String)session.getAttribute("kkbbz");

String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF"  >
<noscript><iframe scr="*.htm"></iframe></noscript>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��ѯ�ͻ�--��ҵ��Ա</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
                  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
                  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_zxkhxx.nlqjbm">��������</option>
                  <option value="crm_zxkhxx.ysrbm">������</option>
                  <option value="crm_zxkhxx.zybm">ְҵ</option>
                  <option value="crm_zxkhxx.sjs">���ʦ</option>
                  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
                  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
                  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
                  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
                  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
                  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
                  <option value="crm_zxkhxx.cqbm">��������</option>
                  <option value="crm_zxkhxx.xqbm">С��</option>
                  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
                  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
                  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
                  <option value="crm_zxkhxx.lfdjbz desc">���������־</option>
                  <option value="crm_zxkhxx.hddjbz desc">������־</option>
                  <option value="crm_zxkhxx.sjfbz desc">��Ʒѱ�־</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
                  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
                  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_zxkhxx.nlqjbm">��������</option>
                  <option value="crm_zxkhxx.ysrbm">������</option>
                  <option value="crm_zxkhxx.zybm">ְҵ</option>
                  <option value="crm_zxkhxx.sjs">���ʦ</option>
                  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
                  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
                  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
                  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
                  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
                  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
                  <option value="crm_zxkhxx.cqbm">��������</option>
                  <option value="crm_zxkhxx.xqbm">С��</option>
                  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
                  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
                  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
                  <option value="crm_zxkhxx.lfdjbz desc">���������־</option>
                  <option value="crm_zxkhxx.hddjbz desc">������־</option>
                  <option value="crm_zxkhxx.sjfbz desc">��Ʒѱ�־</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
                  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
                  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_zxkhxx.nlqjbm">��������</option>
                  <option value="crm_zxkhxx.ysrbm">������</option>
                  <option value="crm_zxkhxx.zybm">ְҵ</option>
                  <option value="crm_zxkhxx.sjs">���ʦ</option>
                  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
                  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
                  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
                  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
                  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
                  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
                  <option value="crm_zxkhxx.cqbm">��������</option>
                  <option value="crm_zxkhxx.xqbm">С��</option>
                  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
                  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
                  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
                  <option value="crm_zxkhxx.lfdjbz desc">���������־</option>
                  <option value="crm_zxkhxx.hddjbz desc">������־</option>
                  <option value="crm_zxkhxx.sjfbz desc">��Ʒѱ�־</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')" name="button">
                <input type="reset"  value="����" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" bgcolor="#FFFFCC"> 
                <div align="right">�ͻ������ֹ�˾</div>
              </td>
              <td width="30%">
				<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeFgs(selectform)">
				<%
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
				%> 
				</select>
			  </td>
              <td width="18%"> 
                <div align="right">��ѯ����</div>
              </td>
              <td width="32%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeDwbh(selectform)">
				  <%
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
					%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >
              </td>
              <td width="18%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ͻ�����</td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="18%" align="right">�ͻ�����</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">����С��</td>
              <td width="30%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
			if (kfgssq.equals("3"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
%>
                </select>
              </td>
              <td width="18%" align="right">��Ϣ��˱�־</td>
              <td width="32%"> 
                <input type="radio" name="shbz" value="Y">
                ����� 
                <input type="radio" name="shbz" value="N">
                δ��� </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">��ѯ״̬</td>
              <td width="30%"> 
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">δ�������</option>
                  <option value="1">�������</option>
                  <option value="2">���ʦ�ύ�ɵ�</option>
                  <option value="3">��ǩԼ</option>
                  <option value="4">�ɵ�</option>
                  <option value="5">�ɵ����δͨ��</option>
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">�Ƿ������ӱ���</td>
              <td width="30%"> 
                <input type="radio" name="sfzdzbj" value="N">
                δ������ 
                <input type="radio" name="sfzdzbj" value="Y">
                ���� </td>
              <td width="18%" align="right">���ۼ���</td>
              <td width="32%"> 
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">��װ��־</td>
              <td width="30%"> 
                <input type="radio" name="jzbz" value="1">
                ��װ 
                <input type="radio" name="jzbz" value="2">
                ��װ </td>
              <td width="18%" align="right">�Ƿ�ǩ��</td>
              <td width="32%"> 
                <input type="radio" name="sfqd" value="1">
                δǩ�� 
                <input type="radio" name="sfqd" value="2">
                ǩ�� 
                <input type="radio" name="sfqd" value="3">
                ʧ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF">�����������־</td>
              <td colspan="3"> 
                <input type="radio" name="lfdjbz" value="N">
                δ������ 
                <input type="radio" name="lfdjbz" value="Y">
                �ѽ����� 
                <input type="radio" name="lfdjbz" value="T">
                �˶��� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����������ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jlfdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="jlfdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�Ƿ񽻻����</td>
              <td width="30%"> 
                <input type="radio" name="hddjbz" value="N">
                δ�� 
                <input type="radio" name="hddjbz" value="Y">
                �ѽ� 
                <input type="radio" name="hddjbz" value="T">
                �˶��� </td>
              <td width="18%" align="right">�μӴ����</td>
              <td width="32%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'��'||DECODE(jsbz,'N','δ����','Y','����')||'��' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�������ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jhddjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="jhddjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��Ʒѱ�־</td>
              <td colspan="3"> 
                <input type="radio" name="sjfbz" value="N">
                δ�� 
                <input type="radio" name="sjfbz" value="Y">
                �ѽ� 
                <input type="radio" name="sjfbz" value="T">
                ����Ʒ� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����Ʒ�ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="jsjfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="jsjfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">������־</td>
              <td width="30%"><%
		cf.radioToken(out, "lfbz","N+δ����&Y+������","");
%></td>
              <td width="18%" align="right">��ƽ��ͼ��־</td>
              <td width="32%"><%
		cf.radioToken(out, "ctbz","N+δ��ͼ&Y+�ѳ�ͼ","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000FF">�Ƿ���ҵ��Ա</font></td>
              <td width="30%"> 
                <input type="radio" name="sfyywy" value="Y">
                �� 
                <input type="radio" name="sfyywy" value="N">
                �� </td>
              <td width="18%" align="right">ҵ��Ա</td>
              <td width="32%"> 
                <input type="text" name="ywy" value="" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���ʦ</td>
              <td width="30%"> 
                <input type="text" name="sjs" value="" size="20" maxlength="100" >
              </td>
              <td width="18%" align="right"><font color="#0000FF">��Ϣ��Դ</font></td>
              <td width="32%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�������ʱ�� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zxdmfpsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zxdmfpsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ʦ����ʱ�� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="sjsfpsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sjsfpsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="30%"> <%
	cf.radioToken(out, "crm_zxkhxx_xb","M+��&W+Ů","");
%> </td>
              <td width="18%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��������</td>
              <td width="30%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">С��</td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">�ȵ����</td>
              <td width="30%" bgcolor="#E8E8FF"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">����λ��</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nianling)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#E8E8FF">������</td>
              <td width="30%" bgcolor="#E8E8FF"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td width="32%" bgcolor="#E8E8FF">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">��������</td>
              <td width="30%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">ְҵ</td>
              <td width="32%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��������</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">װ��Ԥ��</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">����</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">���ڽ������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_fwmj" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���Ҫ��</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">ʧ��ԭ��</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ʧ��ԭ������</td>
              <td colspan="3"> 
                <input type="text" name="sbyyxs" size="71" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ϵ�ͻ�</td>
              <td width="30%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">�Ƿ񼯳�ת��װ�ͻ�</td>
              <td width="32%"> 
                <input type="radio" name="sfjczjz" value="1">
                �� 
                <input type="radio" name="sfjczjz" value="2">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="30%"><%
	cf.radioToken(out, "crm_zxkhxx_sfxhf","Y+��ط�&N+����ط�","");
%> </td>
              <td width="18%"> 
                <div align="right">���»ط�ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">�ط����� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ص���־</div>
              </td>
              <td width="30%"> 
                <select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�ǻص�</option>
                  <option value="3">ʩ���ӻص�</option>
                  <option value="2">���ʦ�ص�</option>
                  <option value="4">�Ͽͻ��ص�</option>
                  <option value="5">Ա���ص�</option>
                  <option value="6">�೤�ص�</option>
                  <option value="7">��¥��</option>
                  <option value="8">������</option>
                  <option value="9">����</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�ص���</div>
              </td>
              <td width="32%"> 
                <input name="hdr" type="text" value="" maxlength="20" size="20">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ѯ�Ǽǲ���</td>
              <td width="30%"> 
                <select name="crm_zxkhxx_zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
              <td width="18%" align="right">��Ϣ¼����</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" bgcolor="#FFFFCC"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">ǩ��ʧ��ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_zxkhxx_sbsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_sbsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ƻ�����ʱ�� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="jhjfsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jhjfsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">Ԥ��װ��ʱ�� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yjzxsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="yjzxsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��Ч��Ϣ��־</td>
              <td width="30%"> 
                <select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">��Ч��Ϣ</option>
                  <option value="N">��Ч��Ϣ</option>
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')" name="button">
                <input type="reset"  value="����" name="reset">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	czlx=1;

	FormName.zxdm.length=1;
	FormName.sjsbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	czlx=2;

	FormName.sjsbh.length=1;

	if (FormName.zxdm.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+FormName.zxdm.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
}

function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "���ڽ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj2, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj, "����Ʒ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj2, "����Ʒ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "���»ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj, "ǩ��ʧ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_sbsj2, "ǩ��ʧ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxdmfpsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj, "���ʦ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsfpsj2, "���ʦ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj2, "Ԥ��װ��ʱ��"))) {
		return false;
	}


	FormName.action="Crm_zxkhxxPYwyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
