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
%>


<body bgcolor="#FFFFFF" onload="selectform.jc_zcjgb_xh.select()" style="FONT-SIZE:14">

        <form method="post" action="xhcpmainList.jsp" name="selectform" target="cpmain">
        
          
      <div align="center">�����ͺţ������س�����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td > 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%"> 
        <input type="radio" name="mhcx" value="N" checked>
        ��ȷ��ѯ
		<input type="radio" name="mhcx" value="Y">
        ģ����ѯ </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%">�ͺ� 
        <input type="text" name="jc_zcjgb_xh" size="20" maxlength="100" onKeyUp="singleAdd(selectform)" >
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%"> 
        <select name="xhlist" size="24" multiple style="FONT-SIZE:12px;WIDTH:152px">
        </select>
      </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="66%">������� 
        <input type="text" name="ddbh" size="12" maxlength="20" value="<%=ddbh%>" readonly>
      </td>
    </tr>
  </table>
</form>


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


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
