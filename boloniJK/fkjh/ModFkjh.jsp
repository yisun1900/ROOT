<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<html>
<head>
<title>����ƻ��޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	
	    String yhmc=(String)session.getAttribute("yhmc");
		String fkjhxh=request.getParameter("fkjhxh");
		
			//String orderId;  //�������
			//String id=null;//�տ����
			String contractId=null;  //��ͬ���
			Double amount=0.00;// �տ���
			java.util.Date payTime=null;// �տ�����
			String payType=null;// ���ʽ
			String billNo=null;// Ʊ�ݱ��
			String payForUse=null;// ������;
			String remark=null;// ��ע��Ϣ
			String person=null;// ¼����
			java.util.Date time=null;// ¼��ʱ��
		
			String khbh=null;
			
            try {
                 
					
					Connection conn  = null;
					PreparedStatement ps=null;
					ResultSet rs=null;
					String ls_sql=null;
					//String khbh=null;
					conn=cf.getConnection();
					ls_sql="select fkjhxh,cw_jzfkjh.khbh,fklxbm,fkcs,yfksj,yfkje,fkzt,cw_jzfkjh.bz,hth ";
					ls_sql+=" from cw_jzfkjh,crm_khxx ";
					ls_sql+=" where fkjhxh='"+fkjhxh+"' and cw_jzfkjh.khbh=crm_khxx.khbh ";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						khbh=rs.getString("khbh");
						fkjhxh=rs.getString("fkjhxh");
						amount=rs.getDouble("yfkje");;// �տ���
						payTime=rs.getDate("yfksj");// �տ�����
						payType=null;// ���ʽ
						billNo=null;// Ʊ�ݱ��
						payForUse=rs.getString("fkcs");// ������;
						remark=rs.getString("bz");// ��ע��Ϣ
						
						contractId=rs.getString("hth");
					}
					rs.close();
					ps.close();
					//out.println("a"+remark+"a");
					if(remark==null||"null".equals(remark))
							remark="";
					 %>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">����ƻ��޸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

		<form method="post" action="../SaveFkjh.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr  bgcolor="#FFFFFF"> 
			
              <td width="18%"> 
                <div align="right">�������</div> </td>
				<td width="32%"><%=fkjhxh%><input type="hidden" name="id" value="<%=fkjhxh%>"></td>
               <td width="18%"> 
                <div align="right">��ͬ��</div>              </td>
				<td width="32%"><%=contractId%><input type="hidden" name="hth" value="<%=contractId%>"></td>
				</tr>
				  <tr  bgcolor="#FFFFFF"> 
				   <td > 
                <div align="right"><font color="#FF0000">*</font>������;</div>              </td>
				<td ><select name="fkcs" onChange="f_getYfk(insertform);">
                <%
	cf.selectItem(out,"select cw_fkfamx.fkcs,cw_fkcs.fkcsmc||':'||cw_fkfamx.bqfkbl||'%' from cw_fkcs,cw_fkfamx,cw_khfkfa where cw_fkcs.fkcs=cw_fkfamx.fkcs and cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"'  order by cw_fkfamx.fkcs",payForUse);
			%> 
					</select>
				</td>
				 <td > 
                <div align="right"><font color="#FF0000">*</font><font color="#0000FF">����Ӧ�տ���</font></div>              </td>
				<td ><input type="text" name="yfkje" value="<%=amount%>" ></td>
				</tr>
				<tr bgcolor="#FFFFFF">
				 <td > 
                <div align="right"><font color="#FF0000">*</font>�ƻ���������</div>              </td>
					<td colspan=3><input type="text" name="sksj"value="<%=payTime%>" ondblclick="JSCalendar(this)"></td>
					</tr>
				<tr  bgcolor="#FFFFFF">
				
				 <td > 
                <div align="right">�ƻ�����</div>              </td>
				<td colspan=3><textarea name="jhms" cols="73" rows="6" width="70%"><%=remark%></textarea></td>
				</tr>
			

			<tr><td align="center" colspan="4"><input type="button" value="����" onclick="f_do(insertform)"></td></tr>		 
					
					 <%
					 
			}catch (Exception e) {
			out.println(e.getMessage());
			return;
			}
				 
		%>

           
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
	String.prototype.trim  =  function()
	{
 	       return  this.replace(/(^\s*)|(\s*$)/g,  "");
	} 
	var http_request=false;
	function send_request(url){
		http_request=false;
		if(window.XMLHttpRequest){
			http_request=new XMLHttpRequest();
			if(http_request.overrideMimeType){
				http_request.overrideMimeType("text/xml");
			}
		}
		else if(window.ActiveXObject){
			try{
				http_request=new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch(e){
				try{
					http_request=new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch(e){}
			}

		}
		if(!http_request){
			window.alert("���ܴ���XMLHttpRequest����ʵ����");
			return false;
		}
		http_request.onreadystatechange=processRequest;
		http_request.open("POST",url,true);
		http_request.send(null);
	}

	function processRequest(){
		if(http_request.readyState==4){
			if(http_request.status==200){
					doactions(http_request.responseText);
			}
			else{
				alert("���������ҳ�����쳣��");
			}
		}
	}

function f_getYfk(FormName)
{
	FormName.yfkje.value="";
	//FormName.yfkbl.value="";

	var str="../CxFkjeByAjax.jsp?hth=<%=contractId%>&fkcs="+FormName.fkcs.value;
	//open(str);
	send_request(str);
	
}

  function doactions(v)
	  {
		
        document.insertform.yfkje.value=v;
      
      }

function f_do(FormName)//����FormName:Form������
{


	
	if(	javaTrim(FormName.fkcs)=="") {
		alert("��ѡ��[�տ�����]��");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "�տ�����"))) {
		return false;
	}
	
	


	if(!(isFloat(FormName.yfkje, "Ӧ�տ���"))) {
		return false;
	}

	


	
	
	if(	javaTrim(FormName.sksj)=="") {
		alert("������[�տ�ʱ��]��");
		FormName.sksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sksj, "�տ�ʱ��"))) {
		return false;
	}
	
	

	FormName.target="_blank";
	FormName.action="../SaveFkjh.jsp";
	FormName.submit();
	
	return true;
}

//-->
</SCRIPT>
