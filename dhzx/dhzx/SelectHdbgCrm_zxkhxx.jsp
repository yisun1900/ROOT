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
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='030110'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[��ѯ�ͻ�--��Ȩά��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'��'||b.dwmc||'��',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by a.ssdw,a.dwbh");
String sjs=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='04'");
if (sjs==null)
{
	sjs="";
}
String ywy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='19'");
if (ywy==null)
{
	ywy="";
}

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_zxkhxxHdbgList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">�ͻ������ֹ�˾</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,crm_zxkhxx_zxdm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="18%"> 
                <div align="right">��ѯ����</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_zxkhxx_zxdm,sjsbh,<%=sjsstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">���������</td>
              <td width="31%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
//		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.ssfgs='"+ssfgs+"' and a.dwlx in('F3') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.ssdw='"+dwbh+"' and a.dwlx in('F3') order by dwbh","");
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
              <td width="19%" align="right">�Ƿ������ӱ���</td>
              <td width="31%"> 
                <input type="radio" name="sfzdzbj" value="N">
                δ������ 
                <input type="radio" name="sfzdzbj" value="Y">
                ���� </td>
              <td width="18%" align="right">��װ��־</td>
              <td width="32%"> 
                <input type="radio" name="jzbz" value="1">
                ��װ 
                <input type="radio" name="jzbz" value="2">
                ��װ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="31%"> 
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
              <td width="19%" align="right">�ͻ�����</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="18%" align="right">�ͻ�����</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��������</td>
              <td width="31%"> 
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
              <td width="19%" align="right">��ѯ״̬</td>
              <td width="31%"> 
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">δ�������</option>
                  <option value="1">�������</option>
                  <option value="2">���ʦ�ύ�ɵ�</option>
                  <option value="5">�ɵ����δͨ��</option>
                </select>
              </td>
              <td width="18%" align="right">�����������־</td>
              <td width="32%"> 
                <select name="lfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">δ����������</option>
                  <option value="1">�ѽ���������</option>
                  <option value="2">���˶���</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ѯ�Ǽǲ���</td>
              <td width="31%"> 
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
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="31%"> <%
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
              <td width="19%" align="right">��������</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">ʧ��ԭ��</td>
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
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
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
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
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
              <td width="19%"> 
                <div align="right">���Ҫ��</div>
              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">��ϵ�ͻ�</div>
              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">���ʦ</td>
              <td width="31%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>
              </td>
              <td width="18%" align="right">ҵ��Ա</td>
              <td width="32%"> 
                <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="100" <% if (!ywy.equals("")) out.println("readonly");%>>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "crm_zxkhxx_sfxhf","Y+��ط�&N+����ط�","");
%> </td>
              <td width="18%"> 
                <div align="right">���»ط�ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ط����� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ص���־</div>
              </td>
              <td width="31%"> 
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
              <td width="19%" align="right">��Ч��Ϣ��־</td>
              <td width="31%"> 
                <select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">��Ч��Ϣ</option>
                  <option value="N">��Ч��Ϣ</option>
                </select>
              </td>
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
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">��ѯ�������</td>
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
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "���ڽ������"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
