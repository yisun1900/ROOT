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
	String ssfgs=(String)session.getAttribute("ssfgs");
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��ѯ��ת��ϸ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯԱ��������" onClick="f_do(selectform,'cxhmc')">
                <input type="reset"  value="����" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ֹ�˾</td>
              <td width="31%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,rs_yhxxqmjz_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
              <td width="19%" align="right">������λ</td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
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
              <td width="19%" align="right">Ա��״̬</td>
              <td width="31%"> 
                <select name="sfzszg" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="M">ʵϰ��</option>
                  <option value="Y">ת��</option>
                  <option value="N">������</option>
                  <option value="S">��ְ</option>
                  <option value="T">����</option>
                </select>
              </td>
              <td width="19%" align="right">�Ƿ���ְ</td>
              <td width="31%"> 
                <input type="radio" name="sflz" value="1" checked>
                Ա�� 
                <input type="radio" name="sflz" value="2">
                ��ְ 
                <input type="radio" name="sflz" value="3">
                ʵϰ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ְ����</td>
              <td width="31%"> 
                <select name="jzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.ssfgs='"+ssfgs+"' and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.dwlx,a.dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="19%" align="right">�绰�Ƿ񹫲�</td>
              <td width="31%"><%
	cf.radioToken(out, "dhsfgb","1+����˾��&2+��������&9+������","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_ygbh" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">Ա������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_yhmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_bianhao" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">�û���¼��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_yhdlm" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">�Ͷ���ͬ���</td>
              <td width="31%"> 
                <input type="text" name="ldhtbh" value="" size="20" maxlength="14">
              </td>
              <td align="right" width="19%"><b>��ת����</b></td>
              <td width="31%">
                <input type="text" name="jzrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">�Ͷ���ͬ����</td>
              <td width="31%"> 
                <select name="ldhtlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ldhtlx c1,ldhtlx c2 from dm_ldhtlx order by ldhtlxbm","");
%> 
                </select>
              </td>
              <td align="right" width="19%"><font color="#000099"></font>�Ͷ���ͬ����</td>
              <td width="31%"> 
                <select name="ldhtqx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ldhtqx c1,ldhtqx c2  from dm_ldhtqx order by ldhtqxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">��ͬ��ʼ���� ��</td>
              <td width="31%"> 
                <input type="text" name="htksrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="19%">��</td>
              <td width="31%"> 
                <input type="text" name="htksrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">��ͬ�������� ��</td>
              <td width="31%"> 
                <input type="text" name="htdqrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="19%">��</td>
              <td width="31%"> 
                <input type="text" name="htdqrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�û���ɫ</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A0+�ܲ�&A1+�ܲ�����&F0+�ֹ�˾&F1+�ֹ�˾����&F2+�ֹ�˾����&F3+�����&G0+��Ӧ��&J0+������","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">סַ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_zz" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_sjsbh" size="20" maxlength="5" >
              </td>
              <td width="19%"> 
                <div align="right">�ɵ�½ϵͳ��־</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_kdlxtbz","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_xb","M+��&W+Ů","");
%> </td>
              <td width="19%"> 
                <div align="right"> ��� </div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_hf","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������ڴ�</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_csrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_csrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_mz" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">���֤��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_sfzh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_dh" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">email</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����ְ��</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">ְ�����</div>
              </td>
              <td width="31%"> 
                <select name="zwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwflbm,zwflmc from dm_zwflbm order by zwflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">����</td>
              <td width="31%"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">ѧ��</td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_xlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������ڵ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_hjszd" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">������ŵ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_dacfd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ҵԺУ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_byyx" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">רҵ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_zy" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ְ���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_rzsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_rzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ְ���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_lzrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_lzrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�빫˾��Ա��������ϵ</td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_sfqs","Y+��&N+��","");
%></td>
              <td width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ�μӱ���</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sfcjbx","Y+�α�&N+δ����&T+ͣ��&Z+ת��","");
%> </td>
              <td width="19%"> 
                <div align="right">�Ƿ����ҽ�Ʊ���</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_ylbx","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ�������ϱ���</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_jylbx","Y+��&N+��","");
%> </td>
              <td width="19%"> 
                <div align="right">�Ƿ����ʧҵ����</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_sybx","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ���ɹ��˱���</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_gsby","Y+��&N+��","");
%> </td>
              <td width="19%"> 
                <div align="right">�Ƿ������������</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_syx","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" bgcolor="#FFFFFF" align="right">�籣����ʱ�� ��</td>
              <td width="31%">
                <input type="text" name="sbblsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%">
                <input type="text" name="sbblsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">��ᱣ�պ�</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_shbxh" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">�ɱ��յص�</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jbxdd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">������ϵ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jjlxr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">����ϵ���ֻ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_lxrdh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����鿴�۸���ϸ</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_ckjgbz","Y+�ɿ�&N+����","");
%> </td>
              <td width="19%"> 
                <div align="right">�ص��û���־</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_zdyhbz","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�����ۿ���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_zkl" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">���ۼ���</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A+��ͨ&B+��ͨ����Ʒ&C+�ֻ�÷��&D+��ͨ����Ʒ���ֻ�÷��&E+��Ʒ���ֻ�÷��","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���乤��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_glgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_gwgz" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jbgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">���ʦְ��</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���ɻ���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_yjsxe" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">��ͨ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jtbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ÿ�ղͲ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_cb" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">�ֻ�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_dhbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ��е�����</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_sfydbs","Y+��&N+��","");
%> </td>
              <td width="19%"> 
                <div align="right">�Ƿ������</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_sfytj","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������� ��</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_tjrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_tjrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ҵʱ�� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_cjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_cjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">�������</td>
              <td width="31%"> 
                <input type="radio" name="gzlb"  value="1">
                �̶����� 
                <input type="radio" name="gzlb"  value="2" >
                ��������</td>
              <td width="19%" align="right">���ں���</td>
              <td width="31%"> 
                <input type="text" name="kqhm" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="rs_yhxxqmjz.dwbh">������λ</option>
                  <option value="rs_yhxxqmjz.yhmc">Ա������</option>
                  <option value="rs_yhxxqmjz.bianhao">����</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP�û���</option>
                  <option value="rs_yhxxqmjz.zz">סַ</option>
                  <option value="rs_yhxxqmjz.hjszd">�������ڵ�</option>
                  <option value="rs_yhxxqmjz.dacfd">������ŵ�</option>
                  <option value="rs_yhxxqmjz.sjsjb">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.ygbh">���</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">�ɵ�½</option>
                  <option value="rs_yhxxqmjz.yhjs">�û���ɫ</option>
                  <option value="rs_yhxxqmjz.csrq">��������</option>
                  <option value="rs_yhxxqmjz.cjgzsj">��ҵʱ��</option>
                  <option value="rs_yhxxqmjz.rzsj">��ְ����</option>
                  <option value="rs_yhxxqmjz.htksrq">��ͬ��ʼ����</option>
                  <option value="rs_yhxxqmjz.htdqrq">��ͬ��������</option>
                  <option value="rs_yhxxqmjz.lzrq">��ְ����</option>
                  <option value="rs_yhxxqmjz.xlbm">ѧ��</option>
                  <option value="rs_yhxxqmjz.byyx">��ҵԺУ</option>
                  <option value="rs_yhxxqmjz.zy">רҵ</option>
                  <option value="rs_yhxxqmjz.xb">�Ա�</option>
                  <option value="rs_yhxxqmjz.hf">���</option>
                  <option value="rs_yhxxqmjz.sfzszg">Ա��״̬</option>
                  <option value="rs_yhxxqmjz.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">����</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">������λ</option>
                  <option value="rs_yhxxqmjz.yhmc">Ա������</option>
                  <option value="rs_yhxxqmjz.bianhao">����</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP�û���</option>
                  <option value="rs_yhxxqmjz.zz">סַ</option>
                  <option value="rs_yhxxqmjz.hjszd">�������ڵ�</option>
                  <option value="rs_yhxxqmjz.dacfd">������ŵ�</option>
                  <option value="rs_yhxxqmjz.sjsjb">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.ygbh">���</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">�ɵ�½</option>
                  <option value="rs_yhxxqmjz.yhjs">�û���ɫ</option>
                  <option value="rs_yhxxqmjz.csrq">��������</option>
                  <option value="rs_yhxxqmjz.cjgzsj">��ҵʱ��</option>
                  <option value="rs_yhxxqmjz.rzsj">��ְ����</option>
                  <option value="rs_yhxxqmjz.htksrq">��ͬ��ʼ����</option>
                  <option value="rs_yhxxqmjz.htdqrq">��ͬ��������</option>
                  <option value="rs_yhxxqmjz.lzrq">��ְ����</option>
                  <option value="rs_yhxxqmjz.xlbm">ѧ��</option>
                  <option value="rs_yhxxqmjz.byyx">��ҵԺУ</option>
                  <option value="rs_yhxxqmjz.zy">רҵ</option>
                  <option value="rs_yhxxqmjz.xb">�Ա�</option>
                  <option value="rs_yhxxqmjz.hf">���</option>
                  <option value="rs_yhxxqmjz.sfzszg">Ա��״̬</option>
                  <option value="rs_yhxxqmjz.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">����</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">������λ</option>
                  <option value="rs_yhxxqmjz.yhmc">Ա������</option>
                  <option value="rs_yhxxqmjz.bianhao">����</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP�û���</option>
                  <option value="rs_yhxxqmjz.zz">סַ</option>
                  <option value="rs_yhxxqmjz.hjszd">�������ڵ�</option>
                  <option value="rs_yhxxqmjz.dacfd">������ŵ�</option>
                  <option value="rs_yhxxqmjz.sjsjb">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.ygbh">���</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">�ɵ�½</option>
                  <option value="rs_yhxxqmjz.yhjs">�û���ɫ</option>
                  <option value="rs_yhxxqmjz.csrq">��������</option>
                  <option value="rs_yhxxqmjz.cjgzsj">��ҵʱ��</option>
                  <option value="rs_yhxxqmjz.rzsj">��ְ����</option>
                  <option value="rs_yhxxqmjz.htksrq">��ͬ��ʼ����</option>
                  <option value="rs_yhxxqmjz.htdqrq">��ͬ��������</option>
                  <option value="rs_yhxxqmjz.lzrq">��ְ����</option>
                  <option value="rs_yhxxqmjz.xlbm">ѧ��</option>
                  <option value="rs_yhxxqmjz.byyx">��ҵԺУ</option>
                  <option value="rs_yhxxqmjz.zy">רҵ</option>
                  <option value="rs_yhxxqmjz.xb">�Ա�</option>
                  <option value="rs_yhxxqmjz.hf">���</option>
                  <option value="rs_yhxxqmjz.sfzszg">Ա��״̬</option>
                  <option value="rs_yhxxqmjz.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">����</option>
                </select>
                <BR>
                ������ 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">������λ</option>
                  <option value="rs_yhxxqmjz.yhmc">Ա������</option>
                  <option value="rs_yhxxqmjz.bianhao">����</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP�û���</option>
                  <option value="rs_yhxxqmjz.zz">סַ</option>
                  <option value="rs_yhxxqmjz.hjszd">�������ڵ�</option>
                  <option value="rs_yhxxqmjz.dacfd">������ŵ�</option>
                  <option value="rs_yhxxqmjz.sjsjb">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.ygbh">���</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">�ɵ�½</option>
                  <option value="rs_yhxxqmjz.yhjs">�û���ɫ</option>
                  <option value="rs_yhxxqmjz.csrq">��������</option>
                  <option value="rs_yhxxqmjz.cjgzsj">��ҵʱ��</option>
                  <option value="rs_yhxxqmjz.rzsj">��ְ����</option>
                  <option value="rs_yhxxqmjz.htksrq">��ͬ��ʼ����</option>
                  <option value="rs_yhxxqmjz.htdqrq">��ͬ��������</option>
                  <option value="rs_yhxxqmjz.lzrq">��ְ����</option>
                  <option value="rs_yhxxqmjz.xlbm">ѧ��</option>
                  <option value="rs_yhxxqmjz.byyx">��ҵԺУ</option>
                  <option value="rs_yhxxqmjz.zy">רҵ</option>
                  <option value="rs_yhxxqmjz.xb">�Ա�</option>
                  <option value="rs_yhxxqmjz.hf">���</option>
                  <option value="rs_yhxxqmjz.sfzszg">Ա��״̬</option>
                  <option value="rs_yhxxqmjz.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">����</option>
                </select>
                ������ 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">������λ</option>
                  <option value="rs_yhxxqmjz.yhmc">Ա������</option>
                  <option value="rs_yhxxqmjz.bianhao">����</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP�û���</option>
                  <option value="rs_yhxxqmjz.zz">סַ</option>
                  <option value="rs_yhxxqmjz.hjszd">�������ڵ�</option>
                  <option value="rs_yhxxqmjz.dacfd">������ŵ�</option>
                  <option value="rs_yhxxqmjz.sjsjb">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.ygbh">���</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">�ɵ�½</option>
                  <option value="rs_yhxxqmjz.yhjs">�û���ɫ</option>
                  <option value="rs_yhxxqmjz.csrq">��������</option>
                  <option value="rs_yhxxqmjz.cjgzsj">��ҵʱ��</option>
                  <option value="rs_yhxxqmjz.rzsj">��ְ����</option>
                  <option value="rs_yhxxqmjz.htksrq">��ͬ��ʼ����</option>
                  <option value="rs_yhxxqmjz.htdqrq">��ͬ��������</option>
                  <option value="rs_yhxxqmjz.lzrq">��ְ����</option>
                  <option value="rs_yhxxqmjz.xlbm">ѧ��</option>
                  <option value="rs_yhxxqmjz.byyx">��ҵԺУ</option>
                  <option value="rs_yhxxqmjz.zy">רҵ</option>
                  <option value="rs_yhxxqmjz.xb">�Ա�</option>
                  <option value="rs_yhxxqmjz.hf">���</option>
                  <option value="rs_yhxxqmjz.sfzszg">Ա��״̬</option>
                  <option value="rs_yhxxqmjz.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">����</option>
                </select>
                ������ 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">������λ</option>
                  <option value="rs_yhxxqmjz.yhmc">Ա������</option>
                  <option value="rs_yhxxqmjz.bianhao">����</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP�û���</option>
                  <option value="rs_yhxxqmjz.zz">סַ</option>
                  <option value="rs_yhxxqmjz.hjszd">�������ڵ�</option>
                  <option value="rs_yhxxqmjz.dacfd">������ŵ�</option>
                  <option value="rs_yhxxqmjz.sjsjb">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.ygbh">���</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">�ɵ�½</option>
                  <option value="rs_yhxxqmjz.yhjs">�û���ɫ</option>
                  <option value="rs_yhxxqmjz.csrq">��������</option>
                  <option value="rs_yhxxqmjz.cjgzsj">��ҵʱ��</option>
                  <option value="rs_yhxxqmjz.rzsj">��ְ����</option>
                  <option value="rs_yhxxqmjz.htksrq">��ͬ��ʼ����</option>
                  <option value="rs_yhxxqmjz.htdqrq">��ͬ��������</option>
                  <option value="rs_yhxxqmjz.lzrq">��ְ����</option>
                  <option value="rs_yhxxqmjz.xlbm">ѧ��</option>
                  <option value="rs_yhxxqmjz.byyx">��ҵԺУ</option>
                  <option value="rs_yhxxqmjz.zy">רҵ</option>
                  <option value="rs_yhxxqmjz.xb">�Ա�</option>
                  <option value="rs_yhxxqmjz.hf">���</option>
                  <option value="rs_yhxxqmjz.sfzszg">Ա��״̬</option>
                  <option value="rs_yhxxqmjz.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��ʾ���</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯԱ��������" onClick="f_do(selectform,'cxhmc')">
                <input type="reset"  value="����" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">ͳ�Ʊ�</td>
              <td colspan="3"> ��һ�� 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">������λ</option>
                  <option value="zz">סַ</option>
                  <option value="hjszd">�������ڵ�</option>
                  <option value="dacfd">������ŵ�</option>
                  <option value="sjsjbmc">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','��','N','��')">�ɵ�½</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������')">�û���ɫ</option>
                  <option value="csrq">��������</option>
                  <option value="cjgzsj">��ҵʱ��</option>
                  <option value="rzsj">��ְ����</option>
                  <option value="lzrq">��ְ����</option>
                  <option value="htksrq">��ͬ��ʼ����</option>
                  <option value="htdqrq">��ͬ��������</option>
                  <option value="xueli">ѧ��</option>
                  <option value="byyx">��ҵԺУ</option>
                  <option value="zy">רҵ</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','��','N','��')">���</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����')">Ա��״̬</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','�̶�����','2','��������')">�������</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="zwflmc">ְ�����</option>
                </select>
                �ڶ��� 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">������λ</option>
                  <option value="zz">סַ</option>
                  <option value="hjszd">�������ڵ�</option>
                  <option value="dacfd">������ŵ�</option>
                  <option value="sjsjbmc">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','��','N','��')">�ɵ�½</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������')">�û���ɫ</option>
                  <option value="csrq">��������</option>
                  <option value="cjgzsj">��ҵʱ��</option>
                  <option value="rzsj">��ְ����</option>
                  <option value="lzrq">��ְ����</option>
                  <option value="htksrq">��ͬ��ʼ����</option>
                  <option value="htdqrq">��ͬ��������</option>
                  <option value="xueli">ѧ��</option>
                  <option value="byyx">��ҵԺУ</option>
                  <option value="zy">רҵ</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','��','N','��')">���</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����')">Ա��״̬</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','�̶�����','2','��������')">�������</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="zwflmc">ְ�����</option>
                </select>
                ������ 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">������λ</option>
                  <option value="zz">סַ</option>
                  <option value="hjszd">�������ڵ�</option>
                  <option value="dacfd">������ŵ�</option>
                  <option value="sjsjbmc">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','��','N','��')">�ɵ�½</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������')">�û���ɫ</option>
                  <option value="csrq">��������</option>
                  <option value="cjgzsj">��ҵʱ��</option>
                  <option value="rzsj">��ְ����</option>
                  <option value="lzrq">��ְ����</option>
                  <option value="htksrq">��ͬ��ʼ����</option>
                  <option value="htdqrq">��ͬ��������</option>
                  <option value="xueli">ѧ��</option>
                  <option value="byyx">��ҵԺУ</option>
                  <option value="zy">רҵ</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','��','N','��')">���</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����')">Ա��״̬</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','�̶�����','2','��������')">�������</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="zwflmc">ְ�����</option>
                </select>
                <BR>
                ������ 
                <input type="hidden" name="tj4name" value="">
                <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">������λ</option>
                  <option value="zz">סַ</option>
                  <option value="hjszd">�������ڵ�</option>
                  <option value="dacfd">������ŵ�</option>
                  <option value="sjsjbmc">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','��','N','��')">�ɵ�½</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������')">�û���ɫ</option>
                  <option value="csrq">��������</option>
                  <option value="cjgzsj">��ҵʱ��</option>
                  <option value="rzsj">��ְ����</option>
                  <option value="lzrq">��ְ����</option>
                  <option value="htksrq">��ͬ��ʼ����</option>
                  <option value="htdqrq">��ͬ��������</option>
                  <option value="xueli">ѧ��</option>
                  <option value="byyx">��ҵԺУ</option>
                  <option value="zy">רҵ</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','��','N','��')">���</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����')">Ա��״̬</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','�̶�����','2','��������')">�������</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="zwflmc">ְ�����</option>
                </select>
                ������ 
                <input type="hidden" name="tj5name" value="">
                <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">������λ</option>
                  <option value="zz">סַ</option>
                  <option value="hjszd">�������ڵ�</option>
                  <option value="dacfd">������ŵ�</option>
                  <option value="sjsjbmc">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','��','N','��')">�ɵ�½</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������')">�û���ɫ</option>
                  <option value="csrq">��������</option>
                  <option value="cjgzsj">��ҵʱ��</option>
                  <option value="rzsj">��ְ����</option>
                  <option value="lzrq">��ְ����</option>
                  <option value="htksrq">��ͬ��ʼ����</option>
                  <option value="htdqrq">��ͬ��������</option>
                  <option value="xueli">ѧ��</option>
                  <option value="byyx">��ҵԺУ</option>
                  <option value="zy">רҵ</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','��','N','��')">���</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����')">Ա��״̬</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','�̶�����','2','��������')">�������</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="zwflmc">ְ�����</option>
                </select>
                ������ 
                <input type="hidden" name="tj6name" value="">
                <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">������λ</option>
                  <option value="zz">סַ</option>
                  <option value="hjszd">�������ڵ�</option>
                  <option value="dacfd">������ŵ�</option>
                  <option value="sjsjbmc">���ʦְ��</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','��','N','��')">�ɵ�½</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������')">�û���ɫ</option>
                  <option value="csrq">��������</option>
                  <option value="cjgzsj">��ҵʱ��</option>
                  <option value="rzsj">��ְ����</option>
                  <option value="lzrq">��ְ����</option>
                  <option value="htksrq">��ͬ��ʼ����</option>
                  <option value="htdqrq">��ͬ��������</option>
                  <option value="xueli">ѧ��</option>
                  <option value="byyx">��ҵԺУ</option>
                  <option value="zy">רҵ</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','��','N','��')">���</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����')">Ա��״̬</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','�̶�����','2','��������')">�������</option>
                  <option value="rs_yhxxqmjz.xzzwbm">����ְ��</option>
                  <option value="zwflmc">ְ�����</option>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.jzrq, "��ת����"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_yhxxqmjz_ygbh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_csrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_csrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_rzsj, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_rzsj2, "��ְ����"))) {
		return false;
	}

	if(!(isDatetime(FormName.rs_yhxxqmjz_lzrq, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_lzrq2, "��ְ����"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_zkl, "�����ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_glgz, "���乤��"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_gwgz, "��λ����"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_jbgz, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_yjsxe, "���ɻ���"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_jtbt, "��ͨ����"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_cb, "ÿ�ղͲ�"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_dhbt, "�ֻ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_tjrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_tjrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_cjgzsj, "��ҵʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_cjgzsj2, "��ҵʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.kqhm, "���ں���"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq, "��ͬ��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq2, "��ͬ��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbblsj, "�籣����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbblsj2, "�籣����ʱ��"))) {
		return false;
	}

	if (lx=="cxhmc")
	{
		FormName.action="Rs_yhxxqmjzCxList.jsp"
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="tjb.jsp"
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
