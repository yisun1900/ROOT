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
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));

	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
	String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	
	String clzt=cf.executeQuery("select clzt from jc_zczjx where zjxbh='"+zjxbh+"'");
	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}
%>

<body bgcolor="#FFFFFF" onload="selectform.jc_zcjgb_xh.select()">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���� ��׼��Ŀ��������ţ�<%=ddbh%>���������ţ�<%=zjxbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_zcjgbCxList.jsp" name="selectform" target="_blank">
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
              <td width="18%" align="right">�������</td>
              <td width="32%">
                <select name="jgpx" style="FONT-SIZE:12PX;WIDTH:152PX">
				 <OPTION  value=",jc_zcjgb.zcbm">���ı���</OPTION>
				 <OPTION  value=",jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.zcbm">���ϵ�У��ͺ�</OPTION>
				 <OPTION  value=",jc_zcjgb.zclbbm,jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm">���ϵ�У��ͺţ����</OPTION>
				 <OPTION  value=",jc_zcjgb.xh,jc_zcjgb.gg,jc_zcjgb.zcbm" selected>�ͺţ����</OPTION>
				 <OPTION  value=",jc_zcjgb.xh,jc_zcjgb.zcbm">�ͺ�</OPTION>
                </select>
              </td>
              <td width="17%" align="right">�ͺ��Ƿ�ģ����ѯ</td>
              <td width="33%">
                <input type="radio" name="mhcx" value="Y" checked>
                ģ����ѯ 
                <input type="radio" name="mhcx" value="N">
                ��ȷ��ѯ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">�ͺ�</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100"  onKeyUp="singleAdd(selectform)">
              </td>
              <td rowspan="7" align="center" bgcolor="#CCCCFF"> 
                <p>��ѡ�ͺ�</p>
                <p> 
                  <input type="button"  value="����" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="ɾ��" onClick="remove(selectform)" name="button2" >
                </p>
              </td>
              <td rowspan="7" align="center" valign="middle" bgcolor="#CCCCFF"> 
                <select name="xhlist" size="13" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���Ĵ���</td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_zcdlbm" value="<%=zcdlbm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ʒ��</td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_dwbh" value="<%=ppbm%>" readonly>
              </td>
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
                <input type="text" name="jc_zcjgb_zcbm" size="20" maxlength="7" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������</td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_zcmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���/ϵ��</td>
              <td colspan="3"> 
                <input type="text" name="jc_zcjgb_zclbbm" value="" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���</td>
              <td colspan="3"> 
                <input type="text" name="jc_zcjgb_gg" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_zcysbm" value="" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">������λ</div>
              </td>
              <td width="33%"> 
                <select name="jc_zcjgb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�г�ͳһ�޼� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_lsj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_lsj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Żݼ� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_yhj" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_yhj2" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ƿ�������</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "jc_zcjgb_sfbhpj","Y+����&N+������","");
%> </td>
              <td width="17%"> 
                <div align="right">��Ƭ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_zp" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_zcjgb_pjts" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jc_zcjgb_pjts2" size="20" maxlength="8" >
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
	if(	javaTrim(FormName.jc_zcjgb_xh)=="") {
		alert("������[�ͺ�]��");
		FormName.jc_zcjgb_xh.focus();
		return false;
	}

	if (isExisted(FormName.xhlist,FormName.jc_zcjgb_xh.value)!=-1){        
		alert("��[�ͺ�]�ѱ�ѡ��");        
		FormName.jc_zcjgb_xh.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.jc_zcjgb_xh.value;
	op1.text=FormName.xhlist.options.length+1+":"+FormName.jc_zcjgb_xh.value;
	FormName.xhlist.add(op1);


	FormName.jc_zcjgb_xh.value="" ;              
	FormName.jc_zcjgb_xh.select() ;              
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
	for(i=0;i<FormName.xhlist.length;i++){                                                                         
		FormName.xhlist.options[i].selected = true;                                                                         
	}                                                                        

	if(!(isFloat(FormName.jc_zcjgb_lsj, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_lsj2, "�г�ͳһ�޼�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_yhj, "�Żݼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_zcjgb_yhj2, "�Żݼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.jc_zcjgb_pjts2, "�������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
