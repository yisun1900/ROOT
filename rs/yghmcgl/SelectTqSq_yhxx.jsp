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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	
	//����Ƿ�����ĩ��ת
	//���أ� -1:����;0:�����ѽ�ת��1:�����ѽ�ת������δ��ת;2:����δ��ת 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("����û�н��С���ת����");
		return;
	}
	else if (count==-1)
	{
		out.println("����");
		return;
	}
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ά�������ᣭ��Ȩ</div>
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
              <td width="31%">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
              <td width="19%" align="right">������λ</td>
              <td width="31%"> 
                <select name="sq_yhxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
					}
					else if (kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwlx,dwbh","");
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
              <td width="19%" align="right">Ա��״̬</td>
              <td width="31%"> 
                <select name="sfzszg" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="M">ʵϰ��</option>
                  <option value="Y">ת��</option>
                  <option value="N">������</option>
                  <option value="D">����</option>
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
                ��Ա�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ͻ�������Ȩ��Χ</td>
              <td width="31%"> 
                <select name="kfgssq" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">����Ȩ</option>
                  <option value="1">��Ȩ�����ֹ�˾</option>
                  <option value="2">��Ȩ����ֹ�˾</option>
                  <option value="3">��Ȩ��������</option>
                  <option value="4">��Ȩĳһ�ֹ�˾�������</option>
                  <option value="5">��Ȩ����ֹ�˾�������</option>
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
                <input type="text" name="sq_yhxx_ygbh" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">Ա������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_bianhao" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">�û���¼��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_yhdlm" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">�Ͷ���ͬ���</td>
              <td width="31%"> 
                <input type="text" name="ldhtbh" value="" size="20" maxlength="14">
              </td>
              <td align="right" width="19%">&nbsp;</td>
              <td width="31%">&nbsp; </td>
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
            <tr bgcolor="#E8E8FF"> 
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
                <select name="sq_yhxx_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_zz" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_sjsbh" size="20" maxlength="5" >
              </td>
              <td width="19%"> 
                <div align="right">�ɵ�½ϵͳ��־</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_kdlxtbz","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_xb","M+��&W+Ů","");
%> </td>
              <td width="19%"> 
                <div align="right"> ��� </div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_hf","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������ڴ�</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_csrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_csrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_mz" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">���֤��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_sfzh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_dh" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">email</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����ְ��</div>
              </td>
              <td width="31%"> 
                <select name="sq_yhxx_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <select name="sq_yhxx_xlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_hjszd" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">������ŵ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_dacfd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ҵԺУ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_byyx" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">רҵ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_zy" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">��ҵʱ�� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_cjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_cjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������� ��</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_tjrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_tjrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">��ְ���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_rzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_rzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���ý������� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="syjzrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="syjzrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">��ְ���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_lzrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_lzrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�빫˾��Ա��������ϵ</td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_sfqs","Y+��&N+��","");
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
	cf.radioToken(out, "sq_yhxx_ylbx","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ�������ϱ���</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_jylbx","Y+��&N+��","");
%> </td>
              <td width="19%"> 
                <div align="right">�Ƿ����ʧҵ����</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_sybx","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ���ɹ��˱���</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_gsby","Y+��&N+��","");
%> </td>
              <td width="19%"> 
                <div align="right">�Ƿ������������</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_syx","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">�籣����ʱ�� ��</td>
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
                <input type="text" name="sq_yhxx_shbxh" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">�ɱ��յص�</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jbxdd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">������ϵ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jjlxr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">����ϵ���ֻ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_lxrdh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����鿴�۸���ϸ</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_ckjgbz","Y+�ɿ�&N+����","");
%> </td>
              <td width="19%"> 
                <div align="right">�ص��û���־</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_zdyhbz","Y+��&N+��","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�����ۿ���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_zkl" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">���ۼ���</div>
              </td>
              <td width="31%"> 
                <select name="sq_yhxx_bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_glgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">��λ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_gwgz" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jbgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">���ʦְ��</div>
              </td>
              <td width="31%"> 
                <select name="sq_yhxx_sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_yjsxe" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">��ͨ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jtbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ÿ�ղͲ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_cb" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">�ֻ�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_dhbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ��е�����</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_sfydbs","Y+��&N+��","");
%> </td>
              <td width="19%"> 
                <div align="right">�Ƿ������</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_sfytj","Y+��&N+��","");
%> </td>
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
            <tr bgcolor="#E8E8FF"> 
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
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.zz">סַ</option>
                  <option value="sq_yhxx.hjszd">�������ڵ�</option>
                  <option value="sq_yhxx.dacfd">������ŵ�</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.xzzwbm">����ְ��</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.csrq">��������</option>
                  <option value="sq_yhxx.cjgzsj">��ҵʱ��</option>
                  <option value="sq_yhxx.rzsj">��ְ����</option>
                  <option value="sq_yhxx.syjzrq">���ý�������</option>
                  <option value="sq_yhxx.htksrq">��ͬ��ʼ����</option>
                  <option value="sq_yhxx.htdqrq">��ͬ��������</option>
                  <option value="sq_yhxx.lzrq">��ְ����</option>
                  <option value="sq_yhxx.xlbm">ѧ��</option>
                  <option value="sq_yhxx.byyx">��ҵԺУ</option>
                  <option value="sq_yhxx.zy">רҵ</option>
                  <option value="sq_yhxx.xb">�Ա�</option>
                  <option value="sq_yhxx.hf">���</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                  <option value="sq_yhxx.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">����</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.zz">סַ</option>
                  <option value="sq_yhxx.hjszd">�������ڵ�</option>
                  <option value="sq_yhxx.dacfd">������ŵ�</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.xzzwbm">����ְ��</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.csrq">��������</option>
                  <option value="sq_yhxx.cjgzsj">��ҵʱ��</option>
                  <option value="sq_yhxx.rzsj">��ְ����</option>
                  <option value="sq_yhxx.syjzrq">���ý�������</option>
                  <option value="sq_yhxx.htksrq">��ͬ��ʼ����</option>
                  <option value="sq_yhxx.htdqrq">��ͬ��������</option>
                  <option value="sq_yhxx.lzrq">��ְ����</option>
                  <option value="sq_yhxx.xlbm">ѧ��</option>
                  <option value="sq_yhxx.byyx">��ҵԺУ</option>
                  <option value="sq_yhxx.zy">רҵ</option>
                  <option value="sq_yhxx.xb">�Ա�</option>
                  <option value="sq_yhxx.hf">���</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                  <option value="sq_yhxx.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">����</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.zz">סַ</option>
                  <option value="sq_yhxx.hjszd">�������ڵ�</option>
                  <option value="sq_yhxx.dacfd">������ŵ�</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.xzzwbm">����ְ��</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.csrq">��������</option>
                  <option value="sq_yhxx.cjgzsj">��ҵʱ��</option>
                  <option value="sq_yhxx.rzsj">��ְ����</option>
                  <option value="sq_yhxx.syjzrq">���ý�������</option>
                  <option value="sq_yhxx.htksrq">��ͬ��ʼ����</option>
                  <option value="sq_yhxx.htdqrq">��ͬ��������</option>
                  <option value="sq_yhxx.lzrq">��ְ����</option>
                  <option value="sq_yhxx.xlbm">ѧ��</option>
                  <option value="sq_yhxx.byyx">��ҵԺУ</option>
                  <option value="sq_yhxx.zy">רҵ</option>
                  <option value="sq_yhxx.xb">�Ա�</option>
                  <option value="sq_yhxx.hf">���</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                  <option value="sq_yhxx.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">����</option>
                </select>
                <BR>
                ������ 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.zz">סַ</option>
                  <option value="sq_yhxx.hjszd">�������ڵ�</option>
                  <option value="sq_yhxx.dacfd">������ŵ�</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.xzzwbm">����ְ��</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.csrq">��������</option>
                  <option value="sq_yhxx.cjgzsj">��ҵʱ��</option>
                  <option value="sq_yhxx.rzsj">��ְ����</option>
                  <option value="sq_yhxx.syjzrq">���ý�������</option>
                  <option value="sq_yhxx.htksrq">��ͬ��ʼ����</option>
                  <option value="sq_yhxx.htdqrq">��ͬ��������</option>
                  <option value="sq_yhxx.lzrq">��ְ����</option>
                  <option value="sq_yhxx.xlbm">ѧ��</option>
                  <option value="sq_yhxx.byyx">��ҵԺУ</option>
                  <option value="sq_yhxx.zy">רҵ</option>
                  <option value="sq_yhxx.xb">�Ա�</option>
                  <option value="sq_yhxx.hf">���</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                  <option value="sq_yhxx.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">����</option>
                </select>
                ������ 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.zz">סַ</option>
                  <option value="sq_yhxx.hjszd">�������ڵ�</option>
                  <option value="sq_yhxx.dacfd">������ŵ�</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.xzzwbm">����ְ��</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.csrq">��������</option>
                  <option value="sq_yhxx.cjgzsj">��ҵʱ��</option>
                  <option value="sq_yhxx.rzsj">��ְ����</option>
                  <option value="sq_yhxx.syjzrq">���ý�������</option>
                  <option value="sq_yhxx.htksrq">��ͬ��ʼ����</option>
                  <option value="sq_yhxx.htdqrq">��ͬ��������</option>
                  <option value="sq_yhxx.lzrq">��ְ����</option>
                  <option value="sq_yhxx.xlbm">ѧ��</option>
                  <option value="sq_yhxx.byyx">��ҵԺУ</option>
                  <option value="sq_yhxx.zy">רҵ</option>
                  <option value="sq_yhxx.xb">�Ա�</option>
                  <option value="sq_yhxx.hf">���</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                  <option value="sq_yhxx.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">����</option>
                </select>
                ������ 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.zz">סַ</option>
                  <option value="sq_yhxx.hjszd">�������ڵ�</option>
                  <option value="sq_yhxx.dacfd">������ŵ�</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.xzzwbm">����ְ��</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.csrq">��������</option>
                  <option value="sq_yhxx.cjgzsj">��ҵʱ��</option>
                  <option value="sq_yhxx.rzsj">��ְ����</option>
                  <option value="sq_yhxx.syjzrq">���ý�������</option>
                  <option value="sq_yhxx.htksrq">��ͬ��ʼ����</option>
                  <option value="sq_yhxx.htdqrq">��ͬ��������</option>
                  <option value="sq_yhxx.lzrq">��ְ����</option>
                  <option value="sq_yhxx.xlbm">ѧ��</option>
                  <option value="sq_yhxx.byyx">��ҵԺУ</option>
                  <option value="sq_yhxx.zy">רҵ</option>
                  <option value="sq_yhxx.xb">�Ա�</option>
                  <option value="sq_yhxx.hf">���</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                  <option value="sq_yhxx.gzlb">�������</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">����</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯԱ��������" onClick="f_do(selectform,'cxhmc')">
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
	cf.ajax(out);//����AJAX
%>


function changeFgs(FormName) 
{
	FormName.sq_yhxx_dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwlx,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.sq_yhxx_dwbh,ajaxRetStr);
}

function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.sq_yhxx_ygbh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_csrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_csrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_rzsj, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_rzsj2, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.syjzrq, "���ý�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.syjzrq2, "���ý�������"))) {
		return false;
	}

	if(!(isDatetime(FormName.sq_yhxx_lzrq, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_lzrq2, "��ְ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_zkl, "�����ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_glgz, "���乤��"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_gwgz, "��λ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_jbgz, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_yjsxe, "���ɻ���"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_jtbt, "��ͨ����"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_cb, "ÿ�ղͲ�"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_dhbt, "�ֻ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_tjrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_tjrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_cjgzsj, "��ҵʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_cjgzsj2, "��ҵʱ��"))) {
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


	FormName.action="Sq_yhxxTqList.jsp"


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
