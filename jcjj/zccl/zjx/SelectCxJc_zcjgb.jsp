<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String dqbm=cf.executeQuery("select sq_dwxx.dqbm from jc_zcdd,crm_khxx,sq_dwxx where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");

	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
	String cldlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	
	String clzt=cf.executeQuery("select clzt from jc_zczjx where zjxbh='"+zjxbh+"'");
	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}
%>


<body bgcolor="#FFFFFF" onLoad="selectform.jxc_clbm_xh.select()">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�������ѯ�ͺţ�������ţ�<%=ddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_zcjgbCxList.jsp" name="selectform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
                <input type="hidden" name="ddbh" size="20"  value="<%=ddbh%>">
                <input type="hidden" name="zjxbh" size="20"  value="<%=zjxbh%>">
				</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">ÿҳ��ʾ����</td>
              <td colspan="3"> 
                <input type="text" name="myxssl" size="7" maxlength="13" value="50">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�������</td>
              <td width="32%"> 
                <select name="jgpx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <OPTION  value=",jxc_clbm.clbm">���ı���</OPTION>
                  <OPTION  value=",jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.clbm">���ϵ�У��ͺ�</OPTION>
                  <OPTION  value=",jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm">���ϵ�У��ͺţ����</OPTION>
                  <OPTION  value=",jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clbm" selected>�ͺţ����</OPTION>
                  <OPTION  value=",jxc_clbm.xh,jxc_clbm.clbm">�ͺ�</OPTION>
                </select>              </td>
              <td width="17%" align="right">�ͺ��Ƿ�ģ����ѯ</td>
              <td width="33%"> 
                <input type="radio" name="mhcx" value="Y" checked>
                ģ����ѯ 
                <input type="radio" name="mhcx" value="N">
                ��ȷ��ѯ </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><strong><font color="#0000CC">�Ƿ��Ƽ���Ʒ</font></strong></td>
              <td bgcolor="#CCCCFF"><input type="radio" name="sftjcp" value="Y">
��
  <input type="radio" name="sftjcp" value="N">
��</td>
              <td rowspan="10" align="center" bgcolor="#CCCCFF"> 
                <p>��ѡ�ͺ�</p>
                <p> 
                  <input type="button"  value="����" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="ɾ��" onClick="remove(selectform)" name="button2" >
                </p>              </td>
              <td rowspan="10" align="center" valign="middle" bgcolor="#CCCCFF"> 
                <select name="xhlist" size="16" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">�ͺ�</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="jxc_clbm_xh" size="20" maxlength="100"  onKeyUp="singleAdd(selectform)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ڲ�����</td>
              <td><input type="text" name="jxc_clbm_nbbm" size="20" maxlength="100"  ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">��������</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm",dqbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">���Ĵ���</span></td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_cldlbm" value="<%=cldlbm%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">Ʒ��</span></td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_ppmc" value="<%=ppbm%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�Ƿ��д���</td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+û����&Y+�д���","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�Ƿ��л�</td>
              <td width="32%"> 
                <input type="radio" name="sfyh" value="Y">
                �л� 
                <input type="radio" name="sfyh" value="N">
                �޻�</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ı���</td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_clbm" size="20" maxlength="7" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������</td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_clmc" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���/ϵ��</td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_cllbbm" size="20" maxlength="100" >              </td>
              <td width="17%" align="right">���</td>
              <td width="33%"> 
                <input type="text" name="jxc_clbm_gg" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ��ɫ              </td>
              <td width="32%"> 
                <input type="text" name="jxc_clbm_clysbm" value="" size="20" maxlength="20" >              </td>
              <td width="17%" align="right">��Ƭ����</td>
              <td width="33%"><input type="text" name="jxc_clbm_zp" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> �Ƿ������� </td>
              <td><%
	cf.radioToken(out, "jxc_clbm_sfbhpj","Y+����&N+������","");
%>              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ������� �� </td>
              <td><input type="text" name="jxc_clbm_pjts" size="20" maxlength="8" >              </td>
              <td align="right"> �� </td>
              <td><input type="text" name="jxc_clbm_pjts2" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="right">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                �г���� ��              </td>
              <td width="32%"> 
                <input type="text" name="jxc_cljgb_lsj" size="20" maxlength="9" >              </td>
              <td width="17%" align="right"> 
                ��              </td>
              <td width="33%"> 
                <input type="text" name="jxc_cljgb_lsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ���ۼ� ��              </td>
              <td width="32%"> 
                <input type="text" name="jxc_cljgb_xsj" size="20" maxlength="9" >              </td>
              <td width="17%" align="right"> 
                ��              </td>
              <td width="33%"> 
                <input type="text" name="jxc_cljgb_xsj2" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�������� ��</td>
              <td width="32%"> 
                <input type="text" name="cxhdbl" size="10" maxlength="10" >
                % </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="cxhdbl2" size="10" maxlength="10" >
                % </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
//���ͺż����б�               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//�س�
	{
		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jxc_clbm_xh)=="") {
		alert("������[�ͺ�]��");
		FormName.jxc_clbm_xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.jxc_clbm_xh.value)!=-1){        
		alert("��[�ͺ�]�ѱ�ѡ��");        
		FormName.jxc_clbm_xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jxc_clbm_xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.jxc_clbm_xh.value;
	FormName.xhlist.add(op1);


	FormName.jxc_clbm_xh.value="" ;              
	FormName.jxc_clbm_xh.select() ;              
}
function remove(FormName)//����FormName:Form������
{
	for (var i=FormName.xhlist.options.length-1; i>=0; i--)
	{
		if (FormName.xhlist.options[i].selected)
		{
			FormName.xhlist.remove(i);
		}
	}
	for (var i=0;i<FormName.xhlist.options.length; i++)
	{
		FormName.xhlist.options[i].text=i+1+":"+FormName.xhlist.options[i].value;
	}

}

//�ж��ظ�¼��                                          
  
function isExisted(o,val){//���б����ж�        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value==val) 
			return index;  
		index++;  
	}    
	return -1;    
}        


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jxc_clbm_cldlbm)=="") {
		alert("��ѡ��[���Ĵ���]��");
		FormName.jxc_clbm_cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jxc_clbm_ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.jxc_clbm_ppmc.focus();
		return false;
	}

	for(i=0;i<FormName.xhlist.length;i++){                                                                         
		FormName.xhlist.options[i].selected = true;                                                                         
	}                                                                        


	if(!(isFloat(FormName.jxc_cljgb_lsj, "�г����"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_cljgb_lsj2, "�г����"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_cljgb_xsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_cljgb_xsj2, "���ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_clbm_pjts, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_clbm_pjts2, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.cxhdbl2, "��������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
