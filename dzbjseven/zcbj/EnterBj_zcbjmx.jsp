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
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");

%>
<body bgcolor="#FFFFFF"  style="FONT-SIZE:14" onload="selectform.zcmc.focus();">
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
              <td width="52%" valign="top" bgcolor="#FFFFFF"> 
                <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%"> ��������</td>
                    <td width="73%"> 
                      <input type="text" name="zcmc" size="45" maxlength="50"  onKeyUp="keyGo(jldwbm)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">������λ</td>
                    <td width="73%"> 
                      <input type="text" name="jldwbm" size="16" maxlength="20"  onKeyUp="keyGo(dj)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">����</td>
                    <td width="73%"> 
                      <input type="text" name="dj" size="16" maxlength="20"  onKeyUp="keyGo(sl)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">����</td>
                    <td width="73%"> 
                      <input type="text" name="sl" size="16" maxlength="8"  onKeyUp="keyGo(bz)">
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td align="right" width="27%">��ע</td>
                    <td width="73%"> 
                      <input type="text" name="bz" size="45" maxlength="300"  onKeyUp="singleAdd(selectform)">
                    </td>
                  </tr>
                </table>
                <p>&nbsp; </p>
              </td>
              <td width="8%" align="center"> 
                <p> 
                  <input type="button"  value="����" onClick="add(selectform)" name="button" >
                </p>
                <p> 
                  <input type="button"  value="ɾ��" onClick="remove(selectform)" name="button2" >
                </p>
              </td>
              <td width="40%"> 
                <select name="zcxmlist" size="32" multiple style="FONT-SIZE:12px;WIDTH:360px">
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="3"> 
                <div align="center">
                  <input type="hidden" name="khbh"  value="<%=khbh%>">
                  <input type="hidden" name="dqbm"  value="<%=dqbm%>">
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
		if(	javaTrim(FormName.zcmc)=="") {
			alert("������[��������]��");
			FormName.zcmc.focus();
			return false;
		}
		if(	javaTrim(FormName.jldwbm)=="") {
			alert("������[������λ]��");
			FormName.jldwbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dj)=="") {
			alert("������[����]��");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "����"))) {
			return false;
		}
		if(	javaTrim(FormName.sl)=="") {
			alert("������[����]��");
			FormName.sl.focus();
			return false;
		}
		if(!(isFloat(FormName.sl, "����"))) {
			return false;
		}

		add(FormName);
	}        
}                                                                                                                                                       

function add(FormName)//����FormName:Form������
{
	if (isExisted(FormName.zcxmlist,FormName.zcmc.value)!=-1){        
		alert("��[�ͻ�����]�ѱ�ɨ�뵽�б��У�");        
		FormName.zcmc.select() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.zcmc.value+"^"+FormName.jldwbm.value+"^"+FormName.dj.value+"^"+FormName.sl.value+"^"+FormName.bz.value;
	op1.text=FormName.zcxmlist.options.length+1+":"+FormName.zcmc.value+"/"+FormName.jldwbm.value+"/"+FormName.dj.value+"/"+FormName.sl.value+"/"+FormName.bz.value;
	FormName.zcxmlist.add(op1);

	FormName.zcmc.select() ;              
	
}
function remove(FormName)//����FormName:Form������
{
	for (var i=FormName.zcxmlist.options.length-1; i>=0; i--)
	{
		if (FormName.zcxmlist.options[i].selected)
		{
			FormName.zcxmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.zcxmlist.options.length; i++)
	{
		FormName.zcxmlist.options[i].text=i+1+":"+FormName.zcxmlist.options[i].value;
	}
	FormName.count.value=FormName.zcxmlist.options.length ;              
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
	if (FormName.zcxmlist.length==0)
	{
		alert("������[��������]��");
		FormName.zcmc.select();
		return false;
	}

	for(i=0;i<FormName.zcxmlist.length;i++){                                                                         
		FormName.zcxmlist.options[i].selected = true;                                                                         
	}                                                                        

	FormName.target="";
	FormName.action="InsertBj_zcbjmx.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
