<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF"  style="FONT-SIZE:14">
<div align="center">
  <p>������ͻ�����</p>
  <p>ע�⣺<1>������[����]��[��ͬ��]�����س���ȫ��������ɺ�һ�������ť[<font color="#FF0000">����</font>] 
    <BR>
    <2>����ͨ���ͻ�[����]��[��ͬ��]ǰ��[<font color="#FF0000">ѡ���</font>]��ȷ����[����]����[��ͬ��]������Ϣ
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr>
      <td>
<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="53%" valign="top" bgcolor="#FFFFFF"> 
                <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="32%"> 
                      <input type="radio" name="xz" value="xzkhxm" checked>
                      �ͻ�����</td>
                    <td width="68%"> 
                      <input type="text" name="khxm" size="16" maxlength="50"  onKeyUp="singleAdd(selectform)">
                      <input type="text" name="count"  size="4">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="32%"> 
                      <input type="radio" name="xz" value="xzhth">
                      �� ͬ ��</td>
                    <td width="68%"> 
                      <input type="text" name="hth" size="16" maxlength="20"  onKeyUp="singleAdd(selectform)">
                    </td>
                  </tr>
                </table>
                <p>&nbsp; </p>
              </td>
              <td width="11%" align="center"> 
                <p> 
                  <input type="button"  value="����" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="ɾ��" onClick="remove(selectform)" name="button2" >
                </p>
              </td>
              <td width="36%"> 
                <select name="khxmlist" size="32" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="3"> 
                <div align="center">
                  <input type="button"  value="����" onClick="f_do(selectform)" >
                </div>
              </td>
            </tr>
          </table>
        </form>
	  
	  </td>
    </tr>
  </table>
  
</div>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

//��������ѡ��Ʒ��������б�               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//�س�
	{
		if (FormName.xz[0].checked)
		{
			if(	javaTrim(FormName.khxm)=="") {
				alert("������[�ͻ�����]��");
				FormName.khxm.focus();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.hth)=="") {
				alert("������[��ͬ��]��");
				FormName.hth.focus();
				return false;
			}
		}

		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//����FormName:Form������
{
	if (FormName.xz[0].checked)
	{
		if (isExisted(FormName.khxmlist,FormName.khxm.value)!=-1){        
			alert("��[�ͻ�����]�ѱ�ɨ�뵽�б��У�");        
			FormName.khxm.select() ;              
			return        
		}        
		var op1=document.createElement("OPTION");
		op1.value=FormName.khxm.value;
		op1.text=FormName.khxmlist.options.length+1+":"+FormName.khxm.value;
		FormName.khxmlist.add(op1);

		FormName.count.value=FormName.khxmlist.options.length ;              
		FormName.khxm.value="" ;              
		FormName.khxm.select() ;              
	}
	else{
		if (isExisted(FormName.khxmlist,FormName.hth.value)!=-1){        
			alert("��[��ͬ��]�ѱ�ɨ�뵽�б��У�");        
			FormName.hth.select() ;              
			return        
		}        
		var op1=document.createElement("OPTION");
		op1.value=FormName.hth.value;
		op1.text=FormName.khxmlist.options.length+1+":"+FormName.hth.value;
		FormName.khxmlist.add(op1);

		FormName.count.value=FormName.khxmlist.options.length ;              
		FormName.hth.value="" ;              
		FormName.hth.select() ;              
	}

	
}
function remove(FormName)//����FormName:Form������
{
	for (var i=FormName.khxmlist.options.length-1; i>=0; i--)
	{
		if (FormName.khxmlist.options[i].selected)
		{
			FormName.khxmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.khxmlist.options.length; i++)
	{
		FormName.khxmlist.options[i].text=i+1+":"+FormName.khxmlist.options[i].value;
	}
	FormName.count.value=FormName.khxmlist.options.length ;              
}

//�ж��ظ�¼��                                          
  
function isExisted(o,val){//�ڳ����Ʒ�б����ж�        
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
	if (FormName.xz[0].checked)
	{
		if (FormName.khxmlist.length==0)
		{
			alert("������[�ͻ�����]��");
			FormName.khxm.focus();
			return false;
		}
	}
	else{
		if (FormName.khxmlist.length==0)
		{
			alert("������[��ͬ��]��");
			FormName.hth.focus();
			return false;
		}
	}

	for(i=0;i<FormName.khxmlist.length;i++){                                                                         
		FormName.khxmlist.options[i].selected = true;                                                                         
	}                                                                        

	FormName.target="";
	FormName.action="KhxmList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
