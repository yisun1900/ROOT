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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
	String tsxlstr=cf.getItemData("select tsxlbm,tsxlmc,tslxbm from dm_tsxlbm order by tslxbm,tsxlbm");
	String tsyystr=cf.getItemData("select tsyybm,tsyymc,tsxlbm from dm_tsyybm order by tsxlbm,tsyybm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="17%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="19%" align="right">�ͻ����</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="17%" align="right">��ͬ��</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
					if (yhjs.equals("A0") || yhjs.equals("A1"))
					{
//						cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd order by sgdmc","");
					}
					else{
						cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
					}
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�ʼ�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">���̽���</div>
              </td>
              <td width="31%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sfxhf" value="Y" >��ط�
                <input type="radio" name="sfxhf" value="N" >����ط�
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ط�����</td>
              <td width="31%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">�ͻ�����</td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߼�¼��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_tsjlh" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">����</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="crm_tsjl_lx" value="1">
                Ͷ�� 
                <input type="radio" name="crm_tsjl_lx" value="2">
                ���� </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">���س̶�</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsjl_yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">������ʽ</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsjl_sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ط�&N+����ط�","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�Ƿ��������</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sftsqk" value="Y">
                �� 
                <input type="radio" name="sftsqk" value="N">
                �� </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">��ط�ʱ�� ��</div>
              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_hfsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_hfsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">�ͻ�Ҫ����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_yqjjsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_yqjjsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">������</div>
              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_slr" size="20" maxlength="16" >
              </td>
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsjl_slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">�᰸ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_jasj" size="20" maxlength="10" >
              </td>
              <td width="17%" bgcolor="#E8E8FF" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_jasj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">�Ƿ����ʩ����</div>
              </td>
              <td width="31%"> 
                <select name="sffpsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ����</option>
                  <option value="Y">�ѷ���</option>
                </select>
              </td>
              <td width="17%"> 
                <div align="right">ά��ʩ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="wxsgd" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱��޴���</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_tsbm_tslxbm,crm_tsbm_tsxlbm,<%=tsxlstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">Ͷ�߱���С��</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsbm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_tsbm_tsxlbm,crm_tsbm_tsyybm,<%=tsyystr%>)">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm order by tsxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱���ԭ��</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsbm_tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm order by tsyybm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">Ͷ��Ʒ��</div>
              </td>
              <td width="33%"> 
                <select name="crm_tspp_tspp" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">�ͷ��طý��</div>
              </td>
              <td width="31%"> 
                <select name="hfjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�Ƿ�ʱ��ϵ</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsbm_sfjslx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ʱ��ϵ&N+δ��ʱ��ϵ&W+���δ֪","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">�᰸�ͻ��Ƿ�����</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsbm_zzjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">������⼰ʱ��</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsbm_jsxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">���β���</td>
              <td width="31%"> 
                <select name="crm_tsbm_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right">���β��Ŵ������</td>
              <td width="33%"> 
                <select name="crm_tsbm_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+δ֪ͨ&1+��֪ͨδ����&2+�ڴ���&3+�ѽ��","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">�᰸״̬</div>
              </td>
              <td width="31%"> 
                <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+�ǿͷ��Ǽ�&1+�ͷ�����&2+�ڴ���&3+�᰸&9+������","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">��˾����״̬</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsjl_zrbmclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+δ����&2+�ڴ���&3+�ѽ��","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�����׼</td>
              <td width="31%"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="crm_khxx.khbh">�ͻ�����</option>
                  <option value="crm_tsjl.yzcdbm desc">���س̶�</option>
                  <option value="crm_tspp.tspp">Ͷ�߱���Ʒ��</option>
                  <option value="crm_tsjl.slsj">����ʱ��</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                </select>
              </td>
              <td width="17%" align="right">��ʾ���</td>
              <td width="33%"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
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
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj, "�ͻ�Ҫ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj2, "�ͻ�Ҫ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj, "��ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj2, "��ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj, "�᰸ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj2, "�᰸ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Crm_tsjlCxList.jsp";
	}
	else{
		FormName.action="Crm_tsjlDyList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>