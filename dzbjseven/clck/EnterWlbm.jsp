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
String ckdh=request.getParameter("ckdh");
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
%>

<body bgcolor="#FFFFFF" >
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> 
		  <p>���ϳ��ⵥ�����ⵥ�ţ�<%=ckdh%>��</p>
		  <p>����[�������ϱ���]��[��������]�����س���ȫ��������ɺ󣬵����ť[<font color="#FF0000">����</font>] <BR>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="53%" valign="top" bgcolor="#FFFFFF"> 
                <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="32%">�������ϱ���</td>
                    <td width="68%"> 
                      <input type="text" name="wlbm" size="16" maxlength="50"  onKeyUp="go(selectform)">
                      <input type="text" name="count"  size="4">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="32%">��������</td>
                    <td width="68%"> 
                      <input type="text" name="sl" size="16" maxlength="10"  onKeyUp="singleAdd(selectform)">
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
                <select name="wlbmlist" size="25" multiple style="FONT-SIZE:12px;WIDTH:180px">
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="3"> 
				<input type="hidden" name="ckdh"  value="<%=ckdh%>" >
				<input type="hidden" name="sgd"  value="<%=sgd%>" >
				<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
                <input type="button"  value="����" onClick="f_do(selectform)" >
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
function go(FormName)
{               
	if (event.keyCode==13)//�س�
	{
		if (isExisted(FormName.wlbmlist,FormName.wlbm.value)!=-1){        
			alert("���������ϱ����ѱ�ɨ�뵽�б��У�");        
			FormName.wlbm.select() ;              
			return        
		}   
		
		if(	javaTrim(FormName.wlbm)=="") {
			FormName.wlbm.focus();
			return false;
		}

		FormName.sl.select();

		
	}
}                                                                                                                                                       


//��������ѡ��Ʒ��������б�               
function singleAdd(FormName)
{               
	if (event.keyCode==13)//�س�
	{
		if(	javaTrim(FormName.wlbm)=="") {
			alert("������[�������ϱ���]��");
			FormName.wlbm.focus();
			return false;
		}

		if(	javaTrim(FormName.sl)=="") {
			alert("������[��������]��");
			FormName.sl.focus();
			return false;
		}
		if(!(isFloat(FormName.sl, "��������"))) {
			return false;
		}

		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//����FormName:Form������
{
	if (isExisted(FormName.wlbmlist,FormName.wlbm.value)!=-1){        
		alert("���������ϱ����ѱ�ɨ�뵽�б��У�");        
		FormName.wlbm.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.wlbm.value+":"+FormName.sl.value;
	op1.text=FormName.wlbmlist.options.length+1+":"+FormName.wlbm.value+":"+FormName.sl.value;
	FormName.wlbmlist.add(op1);

	FormName.count.value=FormName.wlbmlist.options.length ;              
	FormName.wlbm.value="" ;              
	FormName.wlbm.select() ;              
}
function remove(FormName)//����FormName:Form������
{
	for (var i=FormName.wlbmlist.options.length-1; i>=0; i--)
	{
		if (FormName.wlbmlist.options[i].selected)
		{
			FormName.wlbmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.wlbmlist.options.length; i++)
	{
		FormName.wlbmlist.options[i].text=i+1+":"+FormName.wlbmlist.options[i].value;
	}
	FormName.count.value=FormName.wlbmlist.options.length ;              
}

//�ж��ظ�¼��                                          
  
function isExisted(o,val){//�ڳ����Ʒ�б����ж�        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value.substring(0,o.options[index].value.indexOf(":"))==val) 
			return index;  
		index++;  
	}    
	return -1;    
}        


function f_do(FormName)//����FormName:Form������
{
	if (FormName.wlbmlist.length==0)
	{
		alert("������[�������ϱ���]��");
		FormName.wlbm.focus();
		return false;
	}


	for(i=0;i<FormName.wlbmlist.length;i++){                                                                         
		FormName.wlbmlist.options[i].selected = true;                                                                         
	}                                                                        

	FormName.target="";
	FormName.action="WlbmList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
