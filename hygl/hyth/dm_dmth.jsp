<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp"%>
<!--���ղ���-->
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhdlm=(String) session.getAttribute("yhdlm");
String dwlx=(String) session.getAttribute("dwlx");
String dwmc=(String) session.getAttribute("dwmc");
String gzrq=(String) session.getAttribute("gzrq");
String yhmc=(String) session.getAttribute("yhmc");

%>
<html>
<head>
<title>��д��Ʒ����</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" >
<form name="thd" method="post" action="dm_thlb.jsp">
<p align="center">�˻���</p>
<div align="center"></div>
<div align="center">
  <table style="FONT-SIZE: 12px"  width=100% bgcolor=#999999 border=0 >
    <tr bgcolor=#ffffff> 
      <td height="19" width=20%> 
          <p align="right">�˻�����</p>
      </td>
      <td height="19" width=30%> 
        <input type="text" name="thrq" size="10"  value=<%=gzrq%> maxlength="10">
      </td>
      <td height="19" width=20% align=center>
          <div align="right">����Ա</div>
        </td>
      <td height="19" width=30%><%=yhmc%></td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td height="1" bgcolor="#C0C0C0" colspan="4" width=100%>&nbsp; </td>
    </tr>
    <tr bgcolor=#ffffff> 
        <td height="23" colspan="4" width=100%> 
          <div align="center">�˻��б�</div>
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
        <td width=15% height="20"> 
          <div align="right">��Ʒ���� </div>
        </td>
      <td width=35% height="20"> 
        <div align="left"> 
          <input type="text" name="cpbm" size="13"  maxlength="13" onfocus="enableButton(document.thd.jrthlb);">
            <input type="checkbox" name="ydth" value="checkbox" onClick="enableText(document.thd)">
            �������</div>
      </td>
        <td width=20% height="20"> 
          <div align="right">�˻��۸� </div>
        </td>
      <td width=30% height="20"> 
        <div align="left"> 
          <input type="text" name="thj" size="16"  maxlength="50" onkeyup="enableButton(document.thd.jrthlb);">
        </div>
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td width=15% height="20"> 
          <p align="right">�˻�ԭ�� 
        </td>
      <td colspan="3" height="20" width=85%> 
        <input type="text" name="thyy" size="58"  maxlength="500" onkeyup="enableButton(document.thd.jrthlb);">
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td height=43 align="center" valign="middle" width=20%> 
          <p align="right"> 
            <input type="button" name="jrthlb" value="�����б�" onClick="addProcuct(document.thd);">
          </p>
          <p align="right"> 
            <input type="button" name="sc" value="ɾ��" onClick="delItem(document.thd.thlb);">
          </p>
          <p align="right"> 
            <input type="button" name="qkthlb" value="����б�" onClick="resetList(document.thd.thlb);">
          </p>
        </td>
      <td height=43 align="center" valign="middle" colspan="3" width=80%> 
        <select  name="thlb" style="font-size: width 188; height: 156; width: 415"  size="12" multiple>
        </select>
      </td>
    </tr>
    <tr> 
      <td height=1 colspan=4 width=100%> 
        <p align="center"> 
          <input  type=button  value=��һ�� name="xyb" onClick="submit_Check(document.thd);" >
          <input type=reset value='��  ��' name=reset>
        </p>
      </td>
    </tr>
  </table>
</div>
<p>&nbsp;</p>
<input type="hidden" name="yhdlm" value=<%=yhdlm%>>
<input type="hidden" name="dwbh" value=<%=dwbh%>>
<input type="hidden" name="dwmc" value=<%=dwmc%>>
<input type="hidden" name="yhmc" value=<%=yhmc%>>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>                                                                                                                                 
<SCRIPT language=javascript > 
//����༭���еĿո���
function check(field){   
   var num=0;   
   for(i=0;i<field.length;i++){   
      cha=field.charAt(i);   
	  if(cha==' '){num=num+1;}   
   }   
   return num;   
} 

//����˻�ʱ���˻��۸���˻�ԭ�򲻿���
function enableText(fm){
    if(fm.ydth.checked){
	    fm.thj.disabled=true;
		fm.thyy.disabled=true;
	}else{
	    fm.thj.disabled=false;
		fm.thyy.disabled=false;
	}
}

//���б����ж��Ƿ��Ѵ��ڸò�Ʒ   
function isExistedInLb(o,val){    
  var index=0;     
  var bm;     
  while (index<o.length){     
     bm=o.options[index].value.substr(0,13);     
     if (bm==val) return index;     
     index++; 
  }     
  return -1;     
}   

//���б��м���һ��	   
function addOne(o,addValue,addText){     
   o.length = o.length+1;     
   o.options[o.length-1].value = addValue;  
   o.options[o.length-1].text =o.length+"/"+ addText;  
}     

//��һ����Ʒ�Ĳ�Ʒ���롢�˻����Լ��˻�ԭ������˻��б�    
function addProcuct(fm){   
   if((fm.cpbm.value=="")||(fm.cpbm.value.length==check(fm.cpbm.value))){   
      alert("�������Ʒ���룡");   
	  fm.cpbm.focus();   
	  return false;   
   }   
   if (!isNumber(fm.cpbm,"��Ʒ����")){     
     fm.cpbm.select();     
     return false;   
   }   
   if(fm.ydth.checked){
      fm.thj.value=0;
	  fm.thyy.value="�������";
   }
   if (fm.cpbm.value.length!=13){   
      alert("������Ĳ�Ʒ����λ������ȷ�����������룡");   
	  fm.cpbm.select();   
	  return false;   
   } 
   if(isExistedInLb(fm.thlb,fm.cpbm.value)!=-1){ 
      alert("�˻��б����Ѵ��ڸò�Ʒ��"); 
      fm.cpbm.select(); 
      return false; 
   } 
   if((fm.thj.value=="")||fm.thj.value.length==check(fm.thj.value)){   
      alert("�������˻��۸�");   
	  fm.thj.focus();   
	  return false;   
   }   
   if(!(isFloat(fm.thj,"�˻��۸�"))){   
	  fm.thj.select();   
	  return false;   
   }   
   if((fm.thyy.value=="")||(fm.thyy.value.length==check(fm.thyy.value))){   
      alert("�������˻�ԭ��");   
	  fm.thyy.focus();   
	  return false;   
   }

   if(fm.ydth.checked){
      thlb="��������˻�";
	  thlb_value="1";
   }else{
      thlb="";
	  thlb_value="0";
   }
   addValue=fm.cpbm.value+"/"+fm.thj.value+"/"+fm.thyy.value+"/"+thlb_value;
   addText=fm.cpbm.value+"/"+fm.thj.value+"/"+fm.thyy.value+"/"+thlb;
   addOne(fm.thlb,addValue,addText); 
   fm.cpbm.value="";
   fm.thj.value="";
   fm.thyy.value="";
   fm.jrthlb.disabled=true;   
}   

//ɾ���б���   
function delItem(listname){   
   index = listname.selectedIndex;   
   while (index != -1){   
      listname.options[index]=null;   
	  index=listname.selectedIndex;   
   } //end of while loop   
}   
 
//����б�   
function resetList(listname){   
   while (listname.length>0){   
      listname.options[0]=null;   
   } //end of while loop   
}   

//ʹ��ť���� 
function enableButton(bu){   
   bu.disabled=false;   
}   

//�ύ��֮ǰ���кϷ��Լ���
function submit_Check(fm){  
   if((fm.thrq.value=="")||fm.thrq.value.length==check(fm.thrq.value)){   
      alert("�������˻����ڣ�");   
	  fm.thrq.focus();   
	  return   
   }   
   if (!(isDatetime(fm.thrq,"�˻�����"))){     
     fm.thrq.select();     
     return      
   }
   if(fm.thlb.length==0){   
      alert("��ѡ���˻���Ʒ��");   
	  return   
   }else{   
      for(i=0;i<fm.thlb.length;i++){                                                                      
        fm.thlb.options[i].selected = true;                                                                      
      }                                                                                                                     
   }   
   fm.submit();   
}   

</SCRIPT>