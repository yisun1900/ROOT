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
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050109'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[����Ѳ�ѯ]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxListfwf.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
                <input type="reset"  value="����">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="21%" height="2">��ʾ���</td>
              <td colspan="3" height="2"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="29%"> <%
	cf.radioToken(out, "crm_khxx_xb","M+��&W+Ů","");
%> </td>
              <td width="20%"> 
                <div align="right">ְҵ</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_zybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" bgcolor="#E8E8FF" align="right">��������</td>
              <td width="29%"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%>
                </select>
              </td>
              <td width="20%" align="right">С��</td>
              <td width="30%"> 
                <select name="crm_khxx_xqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqbm,xqmc from dm_xqbm where dqbm='"+dqbm+"' order by xqbm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
              <td width="20%"> 
                <div align="right">����֤����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" bgcolor="#FFFFCC"> 
                <div align="right">���� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_fj" size="20" maxlength="8" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">��ϵ�ͻ�</td>
              <td width="29%" bgcolor="#E8E8FF"> 
                <select name="crm_khxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%>
                </select>
              </td>
              <td width="20%" align="right">��Ϣ��Դ</td>
              <td width="30%"> 
                <select name="crm_khxx_xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="29%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,crm_khxx_dwbh,<%=dwstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
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
              <td width="21%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">���̵���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td width="20%"> 
                <div align="right">ÿƽ�׾���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_pmjj" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">����ǩԼ�� ��</td>
              <td width="29%" bgcolor="#FFFFCC"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">���ɼҾ�ǩԼ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_jcjjqye" size="20" maxlength="17" >
              </td>
              <td width="20%"> 
                <div align="right">ǩԼ���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qyxh" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�Ƿ����Ż�</div>
              </td>
              <td width="29%"> <%
	cf.radioToken(out, "crm_khxx_sfyyh","Y+��&N+��","");
%> </td>
              <td width="20%"> 
                <div align="right">�Ż�ԭ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_yhyy" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">�ۿ��ʣ�&gt;0��&lt;=10�� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_zkl" size="20" maxlength="9" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_zkl2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">������Ŀ</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fzxm" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�Ƿ�ȯ</div>
              </td>
              <td width="29%"> <%
	cf.radioToken(out, "crm_khxx_sffj","Y+��&N+��","");
%> </td>
              <td width="20%"> 
                <div align="right">�Ƿ�����֤</div>
              </td>
              <td width="30%"> <%
	cf.radioToken(out, "crm_khxx_sfyrz","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">ǩԼ���� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value=""  >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ͬ�������� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">ʵ�ʿ������� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�׿���</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_skje" size="20" maxlength="17" >
              </td>
              <td width="20%"> 
                <div align="right">�׿�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_skrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�п���</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_zkje" size="20" maxlength="17" >
              </td>
              <td width="20%"> 
                <div align="right">���ڿ�Ӧ������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_zkrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">���ڿ�ʵ������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_sjzkrq" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">�������</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_fkjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ����&1+���׿�&2+���п�&3+��β��","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">��ͬ�������� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">ʵ�ʿ������� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">����ͬ���� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_jhtrq" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jhtrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���޽�ֹʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_bxjzsj" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_bxjzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_zxje" size="20" maxlength="17" >
              </td>
              <td width="20%"> 
                <div align="right">������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jxje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">β����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_wkje" size="20" maxlength="17" >
              </td>
              <td width="20%"> 
                <div align="right">ˮ�������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sdjsje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">������ ��</div>
              </td>
              <td width="29%" bgcolor="#FFFFCC"> 
                <input type="text" name="crm_khxx_jsje" size="20" maxlength="17" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jsje2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">���̽���</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">�깤��־</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ����&2+�ѿ���&3+���깤","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">�ɵ�����״̬</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�����ɵ�&2+�ɵ�&3+�ܾ��ɵ�&4+�����ɵ�&5+����ԭ��&6+ͬ�����","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right"></div>
              </td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">�ɵ�����</td>
              <td width="29%"> 
                <select name="crm_khxx_pdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�����ɵ�&2+ָ���ɵ�","");
%>
                </select>
              </td>
              <td width="20%" align="right">�ɵ�����</td>
              <td width="30%"> 
                <select name="crm_khxx_jlbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�ص�����&2+��˾����","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">�ɵ�ʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_pdsj" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_pdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">�ɵ���</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_pdr" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">�ɵ�˵��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_pdsm" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd order by sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">ʩ������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">���»طü�¼��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_hfjlh" size="20" maxlength="9" >
              </td>
              <td width="20%"> 
                <div align="right">���»ط�ʱ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_zxhfsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_sfxhf" size="20" maxlength="1" >
              </td>
              <td width="20%"> 
                <div align="right">�ط�����</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">�ط����� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_hfrq" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_hfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">����</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">����</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">���</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">װ�޼�λ</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">���</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">������־</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_ybjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��&N+��","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right"></div>
              </td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">�����Ǽ�ʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_ybjdjsj" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_ybjdjsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">�������Ч�� ��</td>
              <td width="29%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_khxx_ybjyxq" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_ybjyxq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�ι��������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_ybjbh" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">������Ƿ���ʵ</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_ybjss" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ��ʵ&Y+��ʵ&N+����ʵ","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�ص���־</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">�ص��Ƿ���ʵ</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_hdsfss" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ��ʵ&Y+��ʵ&N+����ʵ","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�ι۵�ַ</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_cgdz" size="20" maxlength="100" >
              </td>
              <td width="20%"> 
                <div align="right">�ص�ʩ����</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_hdsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd order by sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">�˵���־</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"2+ǩԼ�ͻ�&3+�˵��ͻ�","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">�˵����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_tdxh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">Ͷ�߱�־</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_tsbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��Ͷ��&N+��Ͷ��","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">Ͷ�߼�¼��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_tsjlh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">���ޱ�־</div>
              </td>
              <td width="29%"> 
                <select name="crm_khxx_bxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+�б���&N+�ޱ���","");
%>
                </select>
              </td>
              <td width="20%"> 
                <div align="right">���޼�¼��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_bxjlh" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" bgcolor="#FFFFCC" align="right">��Ϣ¼����</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_lrr" size="20" maxlength="20" >
              </td>
              <td width="20%" bgcolor="#FFFFCC" align="right">ҵ��Ա</td>
              <td width="30%"> 
                <input type="text" name="ywy" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_lrsj" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ѯ�ͻ����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_zxkhbh" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">������־</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_kpbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+δ����&Y+�ѿ���","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">�طö����־</td>
              <td width="29%"> 
                <select name="crm_khxx_hfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ����&1+���̻طö���&2+Ͷ�߱��޻طö���&3+ȫ������","");
%>
                </select>
              </td>
              <td width="20%" align="right">������</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_djr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">���¶�����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_djbh" size="20" maxlength="9" >
              </td>
              <td width="20%"> 
                <div align="right">����ԭ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_djyy" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">����ʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_djsj" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_djsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">�ƻ��ⶳʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_jhjdsj" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jhjdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">ʵ�ʽⶳʱ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_sjjdsj" size="20" maxlength="10" >
              </td>
              <td width="20%"> 
                <div align="right">�ⶳ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jdr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ע</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_bz" size="71" value="">
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
                <input type="reset"  value="����">
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
	if(!(isNumber(FormName.crm_khxx_fj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fj2, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_qyxh, "ǩԼ���"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fwmj, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_pmjj, "ÿƽ�׾���"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye, "����ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "����ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jcjjqye, "���ɼҾ�ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkl, "�ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkl2, "�ۿ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_skje, "�׿���"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_skrq, "�׿�����"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zkje, "�п���"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_zkrq, "���ڿ�Ӧ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjzkrq, "���ڿ�ʵ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq2, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhtrq, "����ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhtrq2, "����ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_bxjzsj, "���޽�ֹʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_bxjzsj2, "���޽�ֹʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_zxje, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jxje, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_wkje, "β����"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jsje, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_jsje2, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_sdjsje, "ˮ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj2, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_zxhfsj, "���»ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_hfrq, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_hfrq2, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjyxq, "�������Ч��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjyxq2, "�������Ч��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjdjsj, "�����Ǽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjdjsj2, "�����Ǽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_djsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_djsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhjdsj, "�ƻ��ⶳʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jhjdsj2, "�ƻ��ⶳʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjdsj, "ʵ�ʽⶳʱ��"))) {
		return false;
	}

	if (lx=='cx')
	{
		FormName.action="Crm_khxxCxListfwf.jsp";
	}
	else if (lx=='dy'){
		FormName.action="Crm_khxxDyList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
