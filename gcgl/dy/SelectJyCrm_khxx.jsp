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
	String kkbbz=(String)session.getAttribute("kkbbz");
	String dwbh=(String)session.getAttribute("dwbh");
	String jzbm=(String)session.getAttribute("jzbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=request.getParameter("ssfgs");
	String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+ssfgs+"'");

	String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'��'||b.dwmc||'��',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') and a.ssfgs='"+ssfgs+"'  order by a.ssdw,a.dwbh");
	
	String ppstr=cf.getItemData("select gysbh,gysmc,gyslb from sq_gysxx where ssfgs='"+ssfgs+"' order by gyslb,gysmc");
%>
<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050103'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ǩ���ͻ�--��ѯ]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ǩ����ѯ-���ټ���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxJyList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCFFFF"> 
              <td width="21%" align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_khxx.lrsj desc">¼��ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">���̵���</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">���̵���</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="crm_khxx.lrsj">¼��ʱ��</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">���̵���</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.gcjdbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="crm_khxx.lrsj">¼��ʱ��</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                  <option value="crm_khxx.cxhdbm">�μӴ����</option>
                  <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
              </td>
            </tr>
            <%
			if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
			{
				%> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="21%" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <%
			}
			%> 
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'gccx')" name="button">
                <input type="reset"  value="����" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">ͳ�Ʊ�</td>
              <td colspan="3"> ��һ�� 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">�����ֹ�˾</option>
                  <option value="b.dwmc">����</option>
                  <option value="sjs">���ʦ</option>
                  <option value="sgdmc">ʩ����</option>
                  <option value="zjxm">���̵���</option>
                  <option value="ysgcjdmc">���̽���</option>
                  <option value="khlxmc">��ϵ�ͻ�</option>
                  <option value="cqmc">����</option>
                  <option value="xqmc">С��</option>
                  <option value="nlqjmc">��������</option>
                  <option value="ysrmc">������</option>
                  <option value="zymc">ְҵ</option>
                  <option value="hxmc">����</option>
                  <option value="cxhdbm">�μӴ����</option>
                  <option value="DECODE(crm_khxx.jzbz,'1','��װ','2','��װ')">��װ��־ 
                  <option value="DECODE(crm_khxx.sffj,'Y','��','N','��')">�Ƿ�ȯ 
                  <option value="DECODE(crm_khxx.sfyrz,'Y','��','N','��')">�Ƿ�����֤ 
                  <option value="c.dwmc">��֤�г�</option></option>
                  
                </select>
                �ڶ��� 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">�����ֹ�˾</option>
                  <option value="b.dwmc">����</option>
                  <option value="sjs">���ʦ</option>
                  <option value="sgdmc">ʩ����</option>
                  <option value="zjxm">���̵���</option>
                  <option value="ysgcjdmc">���̽���</option>
                  <option value="khlxmc">��ϵ�ͻ�</option>
                  <option value="cqmc">����</option>
                  <option value="xqmc">С��</option>
                  <option value="nlqjmc">��������</option>
                  <option value="ysrmc">������</option>
                  <option value="zymc">ְҵ</option>
                  <option value="hxmc">����</option>
                  <option value="cxhdbm">�μӴ����</option>
                  <option value="DECODE(crm_khxx.jzbz,'1','��װ','2','��װ')">��װ��־ 
                  <option value="DECODE(crm_khxx.sffj,'Y','��','N','��')">�Ƿ�ȯ 
                  <option value="DECODE(crm_khxx.sfyrz,'Y','��','N','��')">�Ƿ�����֤ 
                  <option value="c.dwmc">��֤�г�</option></option>
                  
                </select>
                ������ 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="a.dwmc">�����ֹ�˾</option>
                  <option value="b.dwmc">����</option>
                  <option value="sjs">���ʦ</option>
                  <option value="sgdmc">ʩ����</option>
                  <option value="zjxm">���̵���</option>
                  <option value="ysgcjdmc">���̽���</option>
                  <option value="khlxmc">��ϵ�ͻ�</option>
                  <option value="cqmc">����</option>
                  <option value="xqmc">С��</option>
                  <option value="nlqjmc">��������</option>
                  <option value="ysrmc">������</option>
                  <option value="zymc">ְҵ</option>
                  <option value="hxmc">����</option>
                  <option value="cxhdbm">�μӴ����</option>
                  <option value="DECODE(crm_khxx.jzbz,'1','��װ','2','��װ')">��װ��־ 
                  <option value="DECODE(crm_khxx.sffj,'Y','��','N','��')">�Ƿ�ȯ 
                  <option value="DECODE(crm_khxx.sfyrz,'Y','��','N','��')">�Ƿ�����֤ 
                  <option value="c.dwmc">��֤�г�</option></option>
                  
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">��ӡ��־</td>
              <td width="29%">
                <input type="radio" name="dybz" value="N" checked>
                δ��ӡ
				<input type="radio" name="dybz" value="Y">
                �Ѵ�ӡ </td>
              <td width="17%" align="right">��װ��־</td>
              <td width="33%">
                <input type="radio" name="jzbz" value="1">
                ��װ 
                <input type="radio" name="jzbz" value="2">
                ��װ </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="29%"> <%
	out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	out.println("        </select>");
%> </td>
              <td width="17%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_khxx_dwbh,sjsbh,<%=sjsstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1") || yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwbh='"+dwbh+"' OR dwbh='"+jzbm+"')","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">���������</td>
              <td width="29%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by dwbh","");
%> 
                </select>
              </td>
              <td width="17%" align="right">��ͬ��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right" bgcolor="#FFFFCC">ǩԼ���� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="21%" align="right">��ϵ�ͻ�</td>
              <td width="29%"> 
                <select name="crm_khxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">�ص���־</td>
              <td width="33%"> 
                <select name="crm_khxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" bgcolor="#E8E8FF" align="right">�ɵ�����״̬</td>
              <td width="29%"> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ�ɵ�&2+�ɵ�&4+�����ɵ�","");
%> 
                </select>
              </td>
              <td width="17%" align="right">������֤��־</td>
              <td width="33%"> 
                <select name="kgzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ������֤</option>
                  <option value="Y">�ѳ�����֤</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" bgcolor="#E8E8FF" align="right">���ݵ�ַ</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right">��ϵ��ʽ</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">��������</td>
              <td width="29%" bgcolor="#E8E8FF"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right" bgcolor="#E8E8FF">С��/�ֵ�</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">�����ȵ����</td>
              <td width="29%" bgcolor="#E8E8FF"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right" bgcolor="#E8E8FF">��������λ��</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nianling)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">������</td>
              <td width="29%" bgcolor="#E8E8FF"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right" bgcolor="#E8E8FF">����֤����</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <input type="text" name="sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">��������</td>
              <td width="29%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">ְҵ</td>
              <td width="33%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
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
              <td width="17%"> 
                <div align="right">���̵���</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ְʩ����</td>
              <td width="29%"> 
                <select name="zzsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
%> 
                </select>
              </td>
              <td width="17%" align="right">��ְʩ����</td>
              <td width="33%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='Y' order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">ʩ�����Ƿ���ְ</div>
              </td>
              <td width="29%"> 
                <input type="radio" name="cxbz" value="N">
                ��ְ 
                <input type="radio" name="cxbz" value="Y">
                ��ְ </td>
              <td width="17%"> 
                <div align="right">ʩ������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">������� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fwmj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">����ǩԼ�� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" bgcolor="#FFFFCC"> 
                <div align="right">��ͬ�������� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">ʵ�ʿ������� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right" bgcolor="#FFFFCC">��ͬ�������� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">ʵ�ʿ������� ��</td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">ʵ������� ��</td>
              <td width="29%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="sjwjrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
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
              <td width="17%"> 
                <div align="right">ҵ��Ա</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ywy" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">�깤��־</td>
              <td width="29%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ�깤&2+���깤","");
%> 
                </select>
              </td>
              <td width="17%" align="right">����־</td>
              <td width="33%"> 
                <select name="crm_khxx_wjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ���&2+�����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">���ι������ս���</td>
              <td width="29%"> 
                <select name="ybysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='3' order by gcjdbm,gcyszxmbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">�������ս���</td>
              <td width="33%"> 
                <select name="zqysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='4' order by gcjdbm,gcyszxmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right" bgcolor="#FFFFCC">ͣ����־</td>
              <td width="29%"> 
                <select name="tgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="W">����</option>
                  <option value="Y">��ͣ��</option>
                  <option value="N">ͣ���Ѹ���</option>
                </select>
              </td>
              <td width="17%" align="right">�ͻ�����</td>
              <td width="33%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="2">��װ�ͻ�</option>
                  <option value="3">�˵��ͻ�</option>
                  <option value="4">�Ǽ�װ�ͻ�</option>
                  <option value="5">��ƿͻ�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">Ͷ�߱�־</td>
              <td width="29%"> 
                <input type="radio" name="tsbz" value="Y">
                ��Ͷ�� 
                <input type="radio" name="tsbz" value="N">
                ��Ͷ�� </td>
              <td width="17%" align="right">���ޱ�־</td>
              <td width="33%"> 
                <input type="radio" name="bxbz" value="Y">
                �б��� 
                <input type="radio" name="bxbz" value="N">
                �ޱ��� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�����Ƿ�����</td>
              <td width="29%"> 
                <input type="radio" name="gcsfyq" value="1">
                δ���� 
                <input type="radio" name="gcsfyq" value="2">
                ���� </td>
              <td width="17%" align="right">��������ԭ��</td>
              <td width="33%"> 
                <select name="gcyqyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyqyybm,gcyqyymc from dm_gcyqyybm order by gcyqyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">���������� ��</td>
              <td width="29%"> 
                <input type="text" name="yqts" value="" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="yqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">ĳ��ԭ���������� ��</td>
              <td width="29%"> 
                <input type="text" name="yyyqts" value="" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="yyyqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">ˮ�ʷ������Ƿ񷢷�</td>
              <td width="29%"> 
                <input type="radio" name="sffk" value="Y">
                ���� 
                <input type="radio" name="sffk" value="N">
                δ���� </td>
              <td width="17%" align="right">�Ǽǿ���</td>
              <td width="33%"> 
                <input type="text" name="djkh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">�������� ��</td>
              <td width="29%"> 
                <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="fkrq2" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�Ƿ�ȯ</td>
              <td width="29%"> 
                <input type="radio" name="sffj"  value="Y">
                �� 
                <input type="radio" name="sffj"  value="N" >
                �� </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�Ƿ�����֤</td>
              <td width="29%"> 
                <input type="radio" name="sfyrz"  value="Y">
                �� 
                <input type="radio" name="sfyrz"  value="N" >
                �� </td>
              <td width="17%" align="right">��֤�г�</td>
              <td width="33%"> 
                <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�Ƿ����ϱ���</td>
              <td width="29%"> 
                <input type="radio" name="sfysbx" value="1">
                δ�ϱ��� 
                <input type="radio" name="sfysbx" value="2">
                �ѱ��� </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���տ�ʼʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="baokssj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="baokssj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">������ֹʱ�� ��</td>
              <td width="29%"> 
                <input type="text" name="baozzsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="baozzsj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">���ɶ���/��ͬ���� ��</td>
              <td width="29%"> 
                <input type="text" name="ddrq" size="20" maxlength="10" value=""  ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="ddrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">��ĿרԱ</td>
              <td width="29%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='10' and sfzszg in('Y','N') order by yhmc","");
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">�������ɼҾӲ�Ʒ</td>
              <td width="33%"> 
                <select name="jcjjcp" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(jcjjcp,gysbh,<%=ppstr%>);selectItem(jcjjcp,jcddzt,'[1]¼��δ���%00+Ԥ�������%01+���ɵ�%02+����ɳ���%03+ǩ����ͬ%04+�տ�ȷ��%23+��������%05+�����%06+��ȷ����װʱ��%07+��֪ͨ��װ%09+��ʼ��װ%11+��װ���%15+�����%20+ȡ������%99[2]Ԥ����δ���%00+Ԥ���������%01+�������ʦ%03+ȷ������ʱ��%05+�ѳ���%07+��֪ͨ����%09+�Ѹ���%11+ǩ����ͬ%13+������ȷ��%15+���ɹ���%17+��������%19+�����%25+ȷ����װʱ��%27+��֪ͨ��װ%29+��ʼ��װ%31+��װ���%33+�����%35+�˵�%99[3]Ԥ����δ���%00+Ԥ���������%01+�������ʦ%03+ȷ������ʱ��%05+�ѳ���%07+ǩ����ͬ%13+������ȷ��%15+���ɹ���%17+��������%19+�����%25+ȷ����װʱ��%27+��֪ͨ��װ%29+��ʼ��װ%31+��װ���%33+�����%35+�˵�%99[4]¼��Ԥ����%00+������֪ͨ%01+�Ѳ���%02+��ͬδ���%03+��ͬ�����%04+��ͬ��ȷ��%05+ȷ���ͻ�ʱ��%06+��֪ͨ�ͻ�%07+���ͻ�%09+��֪ͨ�˲���%11+���˲���%13+�������%20+�˵�%99');">
                  <option value=""></option>
                  <option value="1">ľ��</option>
                  <option value="2">����</option>
                  <option value="3">�Ҿ�</option>
                  <option value="4">����</option>
                  <option value="5">ȫ��</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">��ĿרԱ�Ƿ�����ϵ</td>
              <td width="29%"> 
                <select name="sfylx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ��ϵ</option>
                  <option value="Y">����ϵ</option>
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">�ͻ�������ϵ��ʽ</td>
              <td width="33%"> 
                <select name="jslxfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�绰��ϵ</option>
                  <option value="2">������</option>
                  <option value="3">��������</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">����/Ʒ��</td>
              <td width="29%"> 
                <select name="gysbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">�Ҿ����ʦ</td>
              <td width="33%"> 
                <input type="text" name="jjsjs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="21%" align="right">����״̬</td>
              <td width="29%"> 
                <select name="jcddzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                </select>
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">�μӴ����</td>
              <td width="33%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'��'||DECODE(jsbz,'N','δ����','Y','����')||'��' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'gccx')" name="button">
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button22">
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
	if(!(isNumber(FormName.crm_khxx_fwmj, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fwmj2, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye, "����ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "����ǩԼ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.ddrq, "������ͬ���� "))) {
		return false;
	}
	if(!(isDatetime(FormName.ddrq2, "������ͬ���� "))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "¼��ʱ��"))) {
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
	if(!(isDatetime(FormName.sjwjrq, "ʵ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "ʵ���������"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.baokssj, "���տ�ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.baokssj2, "���տ�ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.baozzsj, "������ֹʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.baozzsj2, "������ֹʱ��"))) {
		return false;
	}

	if (lx=='gccx')
	{
		if (FormName.ddrq.value=="" && FormName.ddrq2.value=="" && FormName.xmzy.value=="" && FormName.jcjjcp.value=="" && FormName.sfylx.value=="" && FormName.jslxfs.value=="")
		{
			FormName.action="Crm_khxxJyList.jsp";
		}
		else{
			FormName.action="Crm_khxxJcList.jsp";
		}
	}
	else if (lx=='tj')
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="Crm_khxxTjList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>