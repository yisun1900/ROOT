<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���ˣ��޸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_khfkjlXgDzList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">�ֹ�˾</div>              </td>
              <td width="32%">
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
				</select>			  </td>
              <td width="17%"> 
                <div align="right">ǩԼ����</div>              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�տλ</td>
              <td width="32%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>              </td>
              <td width="17%" align="right">�տ����</td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_fkxh" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ����</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_khbh" size="20" maxlength="20" >              </td>
              <td width="17%"> 
                <div align="right">��ͬ��</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ�����</div>              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td width="17%"> 
                <div align="right"></div>              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�����¼��</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_jsjlh" size="20" maxlength="9" >              </td>
              <td width="17%"> 
                <div align="right">�վݱ��</div>              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_sjbh" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">�տ���</td>
              <td> 
                <input type="text" name="cw_khfkjl_fkje" size="20" maxlength="17" >              </td>
              <td align="right">�տ�����</td>
              <td> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">Ʒ������</td>
              <td colspan="3"> 
                <INPUT type="radio" name="pplx" value="21" >
                ľ�� 
                <INPUT type="radio" name="pplx" value="22" >
                ���� 
                <INPUT type="radio" name="pplx" value="23" >
                ���� 
                <INPUT type="radio" name="pplx" value="24" >
                �Ҿ� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">�������</td>
              <td> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm order by zcdlbm","");
%> 
                </select>              </td>
              <td align="right">�տ�Ʒ��</td>
              <td> 
                <input type="text" name="gysbh" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">֧����ʽ</td>
              <td width="32%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%> 
                </select>              </td>
              <td width="17%" align="right">ת�ʿ���</td>
              <td width="33%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�տ���</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_skr" size="20" maxlength="20" >              </td>
              <td width="17%"> 
                <div align="right">�����</div>              </td>
              <td width="33%"> 
                <input type="text" name="sjr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">¼����</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrr" size="20" maxlength="20" >              </td>
              <td width="17%"> 
                <div align="right">ɾ����־</div>              </td>
              <td width="33%"> 
                <select name="scbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N" selected>δɾ��</option>
                  <option value="Y">��ɾ��</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�տ�ʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sksj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_sksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="sjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="sjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">¼��ʱ�� ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%"> 
                <div align="right">��</div>              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ƿ������</div>              </td>
              <td width="32%"> 
                <select name="skdd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">�������</option>
                  <option value="2">�����</option>
                </select>              </td>
              <td width="17%"> 
                <div align="right">��˱�־</div>              </td>
              <td width="33%"> 
                <select name="dsksjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">��</option>
                  <option value="Y">��</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ч�ͻ���־</td>
              <td width="32%"> 
                <select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">��Ч��Ϣ</option>
                  <option value="N">��Ч��Ϣ</option>
                </select>              </td>
              <td width="17%" align="right">ǩ��״̬</td>
              <td width="33%"> 
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">δ�������</option>
                  <option value="1">�������</option>
                  <option value="2">���ʦ�ύ�ɵ�</option>
                  <option value="3">��ǩԼ</option>
                  <option value="4">�ɵ�</option>
                  <option value="5">�ɵ����δͨ��</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right">��ѯ�������</td>
              <td width="32%"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="hth">��ͬ��</option>
                  <option value="fkxh">�տ����</option>
                  <option value="khxm">�ͻ�����</option>
                  <option value="khlx">�ͻ�����</option>
                  <option value="dwmc">�տλ</option>
                  <option value="sksj">�տ�ʱ��</option>
                  <option value="fklxbm">�տ�����</option>
                  <option value="zffsmc">֧����ʽ</option>
                  <option value="fkje">�տ���</option>
                </select>              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
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
	if(!(isNumber(FormName.cw_khfkjl_fkxh, "�տ����"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_khfkjl_fkje, "�տ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj, "�տ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj2, "�տ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj2, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_lrsj, "¼��ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
