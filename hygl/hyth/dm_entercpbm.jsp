<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp"%>

<%
String dwbh=(String) session.getAttribute("dwbh");
String yhdlm=(String) session.getAttribute("yhdlm");
String gzrq=(String) session.getAttribute("gzrq");
String yhjs=(String)session.getAttribute("yhjs");
String zgsbh=(String)session.getAttribute("zgsbh");
if (yhjs.equals("00"))//00���ܹ�˾
{
	dwbh=zgsbh;
}

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

try{
	conn=cf.getConnection();

	int count=0;

	sql="select count(*) ";
	sql+="  from cp_qmjzjl where  kcrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1)))";  
//	out.println(sql);
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//�����ݿ���ȡ����ǰ������� 
	} 
	rs.close();
	ps.close();
	if (count==0)
	{
		out.println("����û�н��п���ת�����ܽ��п�������");
		return;
	}
}
catch (Exception e) { 
	   out.print("���ݿ����ʧ�ܣ�" + e); 
	   return;
}finally{ 
 try{ 
	 if(rs!=null) rs.close();
	 if (ps!= null) ps.close();  
	 if (conn != null) cf.close(conn);   
   }catch (Exception e){  
	  out.println("���ݿ����ʧ�ܣ�"+e.getMessage());  
   }  
} 
%>  
<html>
<head>
<title>��д��Ʒ����</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" >
<form name="thd" method="post" action="thcpbmList.jsp">
<p align="center">�˻���</p>
<div align="center"></div>
<div align="center">
    <table style="FONT-SIZE: 12px"  width=100% bgcolor=#999999 border=0 >
      <tr bgcolor=#ffffff> 
        <td height="19" width=20% align="right">�˻���λ</td>
        <td height="19" width=30%> 
          <select name="thdw" style="FONT-SIZE:12px;WIDTH:152px">
            <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
          </select>
        </td>
        <td height="19" width=20% align=center>&nbsp;</td>
        <td height="19" width=30%>&nbsp;</td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td height="19" width=20%> 
          <p align="right">�˻�����</p>
        </td>
        <td height="19" width=30%> 
          <input type="text" name="thrq" size="20"  value=<%=gzrq%> maxlength="10">
        </td>
        <td height="19" width=20% align=center> 
          <div align="right">����Ա</div>
        </td>
        <td height="19" width=30%> 
          <input type="text" name="czy" value="<%=yhdlm%>" size="20">
        </td>
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
            <input type="text" name="cpbm" size="20"  maxlength="13" >
          </div>
        </td>
        <td width=20% height="20"> 
          <div align="right">
            <input type="button"  value="�����б�" onClick="add(thd)">
          </div>
        </td>
        <td width=30% height="20"> 
          <div align="left"> </div>
        </td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td height=43 align="center" valign="middle" width=20%> 
          <p align="right"> 
            <input type="button"  value="ɾ������" onClick="remove(thd)">
          </p>
          <p align="right"> 
            <input type="button"   value="����б�" onClick="resetList(document.thd.cpbmlist);">
          </p>
        </td>
        <td height=43 align="center" valign="middle" colspan="3" width=80%> 
          <select  name="cpbmlist" style="font-size: height: 156; width: 415"  size="12" multiple>
          </select>
        </td>
      </tr>
      <tr> 
        <td height=1 colspan=4 width=100%> 
          <p align="center"> 
            <input  type="button"  value="��һ��"  onClick="submit_Check(thd);" >
            <input type=reset value='��  ��' >
          </p>
        </td>
      </tr>
    </table>
</div>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>                                                                                                                                 
<SCRIPT language=javascript > 


//����б�   
function resetList(listname){   
   while (listname.length>0){   
      listname.options[0]=null;   
   } //end of while loop   
}   

function add(FormName)//����FormName:Form������
{
	if (FormName.cpbm.value.length<13){                                                                                                         
		alert("����Ӧ��Ϊ13λ��");        
		FormName.cpbm.focus() ;  
		return;
	}        
	if (isExisted(FormName.cpbmlist,FormName.cpbm.value)!=-1){        
		alert("�������ѱ�ɨ�뵽�б��У�");        
//		FormName.cpbm.value="";        
		FormName.cpbm.focus() ;              
		return        
	}        
	var op1=document.createElement("OPTION");
	op1.value=FormName.cpbm.value;
	op1.text=FormName.cpbmlist.options.length+1+":"+FormName.cpbm.value;
	FormName.cpbmlist.add(op1);
	FormName.cpbm.select();
}
function remove(FormName)//����FormName:Form������
{
	for (var i=FormName.cpbmlist.options.length-1; i>=0; i--)
	{
		if (FormName.cpbmlist.options[i].selected)
		{
			FormName.cpbmlist.remove(i);
		}
	}
	for (var i=0;i<FormName.cpbmlist.options.length; i++)
	{
		FormName.cpbmlist.options[i].text=i+1+":"+FormName.cpbmlist.options[i].value;
	}
}

//�ж��ظ�¼��                                          
  
function isExisted(o,val){//�ڳ����Ʒ�б����ж�        
	index=0;    
	while(index<o.length){  
		if ( o.options[index].value.substring(0,13)==val) return index;  
		index++;  
	}    
	return -1;    
}        


//�ύ��֮ǰ���кϷ��Լ���
function submit_Check(fm){  
	if(	javaTrim(fm.thrq)=="") {
		alert("������[�˻�����]��");
		fm.thrq.focus();
		return false;
	}
	if (!(isDatetime(fm.thrq,"�˻�����"))){     
		fm.thrq.select();     
		return      
	}
   if(fm.cpbmlist.length==0){   
      alert("�������˻���Ʒ���룬����������б���ť��");   
		fm.cpbm.select();     
	  return   
   }
   else{   
      for(i=0;i<fm.cpbmlist.length;i++){                                                                      
        fm.cpbmlist.options[i].selected = true;                                                                      
      }                                                                                                                     
   }   
   fm.submit();   
}   

</SCRIPT>