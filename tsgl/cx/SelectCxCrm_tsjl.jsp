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
	String tsxlstr=cf.getItemData("select tsxlbm,tsxlmc,tslxbm from dm_tsxlbm order by tslxbm,tsxlbm");
	String tsyystr=cf.getItemData("select tsyybm,tsyymc,tsxlbm from dm_tsyybm order by tsxlbm,tsyybm");

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<div align="center">��ѯͶ�߱��޼�¼
</div>
<table width="100%">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                �ֹ�˾              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
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
				%> 
				</select>              
			  </td> 
              <td width="18%" align="right" bgcolor="#FFFFCC"> 
                ǩԼ����              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">��ͬ��</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="hth" size="20" maxlength="20">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">�ͻ����</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="khbh" size="20" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">���ʦ</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="sjs" size="20" maxlength="20">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">�ʼ�</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="zjxm" size="20" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>�ͻ�����</b></font></td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="khxm" size="20" maxlength="50">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">�ͻ�����</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                <font color="#0000CC"><b>��ϵ��ʽ</b></font>              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="lxfs" size="20" maxlength="50">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"> 
                ��ϵ��ʽ              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <input type="text" name="fwdz" size="71" maxlength="100">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                ���ݵ�ַ              </td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                Ͷ�߼�¼��              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_tsjlh" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                ����              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="radio" name="crm_tsjl_lx" value="1">
                Ͷ�� 
                <input type="radio" name="crm_tsjl_lx" value="2">
                ���� </td>
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
		String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
		cf.selectItem(out,sql,"");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="18%" align="right">���β��Ŵ������</td>
              <td width="32%"> 
                <select name="crm_tsbm_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">δ����</option>
                  <option value="2">�ڴ���</option>
                  <option value="3">�ѽ��</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                �᰸״̬              </td>
              <td width="31%"> 
                <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">δ����</option>
                  <option value="1">������</option>
                  <option value="2">�ڴ���</option>
                  <option value="3">�᰸</option>
                  <option value="9">������</option>
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr>
              <td width="19%" bgcolor="#E8E8FF" align="right"><b><font color="#0000CC">Ͷ�߱���Ʒ��</font></b></td>
              <td width="31%" bgcolor="#E8E8FF">
                <input type="text" name="crm_tsbm_tspp" size="20" maxlength="50" >
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">Ͷ�߱���Ʒ��</td>
              <td width="32%" bgcolor="#E8E8FF">
                <input type="text" name="crm_tsbm_tspp2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                ���س̶�              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                Ͷ����Դ              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                �Ƿ���ط�              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ط�&N+����ط�","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">              </td>
              <td width="32%" bgcolor="#E8E8FF"> </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                ��ط�ʱ�� ��              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                ��              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_hfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">�ͻ�Ҫ����ʱ�� ��</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_yqjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">��</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_yqjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">�ͷ�����ʱ�� ��</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">��</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                �ͷ�������              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_slr" size="20" maxlength="16" >
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">              </td>
              <td width="32%" bgcolor="#E8E8FF">&nbsp; </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">¼����</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_lrr" size="20" maxlength="20" >
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">¼�벿��</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">¼��ʱ�� ��</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">��</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">�᰸ʱ�� ��</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_jasj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">��</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_jasj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                �Ƿ����ʩ����              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="sffpsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ����</option>
                  <option value="Y">�ѷ���</option>
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                ά��ʩ����              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="wxsgd" size="20" maxlength="30" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                Ͷ�߱��޴���              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_tsbm_tslxbm,crm_tsbm_tsxlbm,<%=tsxlstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                Ͷ�߱���С��              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_tsbm_tsxlbm,crm_tsbm_tsyybm,<%=tsyystr%>)">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm order by tsxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                Ͷ�߱���ԭ��              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm order by tsyybm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">              </td>
              <td width="32%" bgcolor="#CCCCFF">&nbsp; </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                �ͷ��طý��              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="hfjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                �Ƿ�ʱ��ϵ              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_sfjslx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ʱ��ϵ&N+δ��ʱ��ϵ&W+���δ֪","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                �᰸�ͻ��Ƿ�����              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_zzjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                ������⼰ʱ��              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_jsxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">�����׼</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="crm_khxx.khbh">�ͻ�����</option>
                  <option value="crm_tsjl.yzcdbm desc">���س̶�</option>
                  <option value="crm_tsbm.tspp">Ͷ�߱���Ʒ��</option>
                  <option value="crm_tsjl.lrsj desc" selected>¼��ʱ��</option>
                  <option value="crm_tsjl.slsj desc">�ͷ�����ʱ��</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="32%" bgcolor="#FFFFFF">&nbsp; </td>
            </tr>
            <tr> 
              <td align="right" width="19%" bgcolor="#FFFFFF" >��ʾ���</td>
              <td colspan="3" bgcolor="#FFFFFF" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
              </td>
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


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

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

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
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
	if(!(isDatetime(FormName.crm_tsjl_slsj, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj, "�᰸ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj2, "�᰸ʱ��"))) {
		return false;
	}

	FormName.action="Crm_tsjlCxList.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
