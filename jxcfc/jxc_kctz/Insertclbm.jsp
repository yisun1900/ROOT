<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tzph = request.getParameter("tzph");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=null;
String ckbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,ckbh ";
	ls_sql+=" from  jxc_hjtzjl";
	ls_sql+=" where tzph='"+tzph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<html>
<head>
<title>�޸Ĳ�Ʒ��Ϣ </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<BODY bgColor=#ffffff >
<FORM name="kcpdForm" action="" method="post">
  <table style="FONT-SIZE: 12px" cellspacing="2" cellpadding="2" width="100%" bgcolor="#999999" border="0">
    <tbody> 
    <tr bgcolor=#ffffff align="center"> 
      <td colspan="2" >���������ţ�<%=tzph%>�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td width="237"  align="center" valign="middle">���ϱ��� 
        <input type="text" name="clbm" maxlength="13" size="15" onKeyUp="add(kcpdForm)">
        <input type="text" name="count"  size="4">
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" size="10" readonly>
		<input type="hidden" name="ckbh"  value="<%=ckbh%>" size="10" readonly>
      </td>
      <td rowspan="2" width="752" > 
        <div align="center"> 
          <center>
            <iframe width="100%" height="100%" src="/jxc/ViewJxc_cljgb.jsp" name="centerframe" marginwidth="0" marginheight="0" scrolling="NO" FrameBorder="0"> 
            <p>��Ʒ��Ϣ��ѯ 
            </iframe> 
          </center>
        </div>
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td width="237"  align="center" valign="middle"> 
        <p> 
          <select style="font-size: 12px; width: 200" name="clbmlist" size="33" multiple>
          </select>
          <input name="button" type="button" onClick="remove(kcpdForm)"  value="ɾ������">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="button"  value="ȫ��ɾ��" onClick="deleteAll(kcpdForm)">
      </td>
    </tr>
    <tr align="center"> 
      <td  colspan="2"> 
        <input  type="button"  value='������������'  onclick="submit_Check(kcpdForm);" >
        &nbsp;&nbsp; 
        <input type="reset" value=' �� �� '>
        <input type="hidden" name="tzph"  value="<%=tzph%>" size="10" readonly=true>
      </td>
    </tr>
    </tbody> 
  </table>                                                                                              </FORM>                                                             
</BODY>     
     
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>                                                                                               
<SCRIPT language=javascript >                                                                                               
<!--                                                                                                                  

//��һ����Ʒ����pdjl        
function add(fm)
{  
	if (event.keyCode==13)	
	{

        kcpdForm.target="centerframe";
	    kcpdForm.action="/jxc/ViewJxc_cljgb.jsp?";
		kcpdForm.submit();
		val=fm.clbm.value;
		if (isExisted(fm.clbmlist,val)){
			alert("�����ظ����룡");
			fm.clbm.select();
		}
		else{
			addOne(fm.clbmlist,val,val)
			fm.clbm.value="";
			fm.clbm.select();
			fm.count.value=fm.clbmlist.options.length ;              
		}
	}

}  

function addOne(clbmlist,val,txt)
{  
	clbmlist.length =clbmlist.length+1;  
	clbmlist.options[clbmlist.length-1].value =val;  
	clbmlist.options[clbmlist.length-1].text =txt;

}  
  
//�ж��ظ�¼��                                    
  
function isExisted(o,val){  
  index=0;  
  while(index<o.length){  
     if (o.options[index++].value.substr(0,13)==val.substr(0,13)) return true;  
  }  
  return false;  
}  
  
//��һ����Ʒ��pdjl��ɾ��  
function deleteOne(o,index){                                                                                                                                                 
	o.options[index]=null;   
}                                                                                                                                                 
         
//��pdjl��ɾ��ѡ���̵��¼ 
function remove(fm)
{                                                                                                                                                                              
	index = fm.clbmlist.selectedIndex;         
	while (index != -1){         
		rkItem=fm.clbmlist.options[index];         
		deleteOne(fm.clbmlist,index);//ɾ������Ŀ         
		index = fm.clbmlist.selectedIndex;         
	}          
	fm.count.value=fm.clbmlist.options.length ;              
}         
			           
//  ��pdjl��ɾ�������̵��¼ 
function deleteAll(fm)
{                                                                                                                                                                                    
	while (fm.clbmlist.length>0){         
		rkItem=fm.clbmlist.options[0];         
		deleteOne(fm.clbmlist,0);//ɾ������Ŀ         
	}          
	fm.count.value=fm.clbmlist.options.length ;              
}                                                                                                                                                 
         
//�б�pdjl�Ƿ�Ϊ��                                                                            
function submit_Check(FormName) {                                     
	if (FormName.clbmlist.length<1){                                     
		alert("������[���ϱ���]��");                                     
		FormName.clbm.focus();
	}
	else{                                     
		for(i=0;i<FormName.clbmlist.length;i++){                                     
			FormName.clbmlist.options[i].selected = true;                                     
		} 
		FormName.target="";
		FormName.action="Insertclbmsl.jsp";
		FormName.submit();                                
	}                                     
}                                     
 
   
//-->                                                                                               
</SCRIPT>                                                                                               
</HTML>                                                                                                                  

