<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;
String[][] outStr=null; 
String ls=null;

String scbkhbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String sfxhf=null;
String sfxhfStr=null;
java.sql.Date xchfsj=null;
String xchfsjStr=null;
String sckhyxbm=null;
String sckhyxbmStr=null;
java.sql.Date yyddsj=null;
String yyddsjStr=null;
String gzsm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveDisHfData.jsp" name="editform" target="_blank">
<div align="center">����طý��</div>
  <table width="150%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">*�ͻ����</td>
      <td width="6%">*�ͻ�����</td>
      <td width="18%">*���ݵ�ַ</td>
	  <td width="12%">�绰</td>
	  <td width="5%">ҵ��Ա</td>
	  <td width="4%">*�Ƿ���ط�</td>
	  <td width="6%">�´λط�ʱ��</td>
	  <td width="7%">*�ͻ�����</td>
	  <td width="6%">ԤԼ����ʱ��</td>
      <td width="66%">*����˵��</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 
	String bgcolor="";
	String row="";

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}
		
		scbkhbh=outStr[i][0].trim();
		khxm=outStr[i][1].trim();
		fwdz=outStr[i][2].trim();
		lxfs=outStr[i][3].trim();
		ywy=outStr[i][4].trim();
		sfxhfStr=outStr[i][5].trim();
		xchfsjStr=outStr[i][6].trim();
		sckhyxbmStr=outStr[i][7].trim();
		yyddsjStr=outStr[i][8].trim();
		gzsm=outStr[i][9].trim();

		if(khxm==null||khxm.equals(""))
		{
//			out.print("<BR>���ѣ���š�"+row+"���ͻ�����Ϊ�գ����������Զ�������");
			break;
		}

		int count=0;
		String getkhxm="";
		sql="select khxm";
		sql+=" from  crm_scbkhxx";
		sql+=" where scbkhbh='"+scbkhbh+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkhxm=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (getkhxm.equals(""))
		{
			out.print("<BR>�ͻ���š�"+scbkhbh+"�������ڣ�");
			return;
		}
		else{
			if (!getkhxm.equals(khxm))
			{
				out.print("<BR>���ѣ��ͻ���š�"+scbkhbh+"��������ϵͳ��һ�£�ϵͳΪ��"+getkhxm+"��������Ϊ��"+khxm+"����");
			}
		}

		if (count==0)
		{
		}

		//��顺�ͻ������Ƿ���ȷ
		sql="select sckhyxbm";
		sql+=" from  dm_sckhyxbm";
		sql+=" where sckhyxmc='"+sckhyxbmStr+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sckhyxbm=rs.getString("sckhyxbm");
		}
		else{
			out.print("<BR>�ͻ���š�"+scbkhbh+"�����󣡿ͻ�����"+sckhyxbmStr+"�������ڣ�");
			return;
		}
		rs.close();
		ps.close();

		//��顺�Ƿ���طá��Ƿ���ȷ
		if (sfxhfStr==null || sfxhfStr.equals(""))//Y����طã�N������ط�
		{
			out.print("<BR>�ͻ���š�"+scbkhbh+"�����󣡡��Ƿ���طá�����Ϊ�գ�");
			return;
		}
		else if (sfxhfStr.trim().equals("��Ҫ"))
		{
			sfxhf="Y";

			//��顺�ط����ڡ��Ƿ���ȷ
			if (xchfsjStr==null || xchfsjStr.equals(""))
			{
				out.print("<BR>�ͻ���š�"+scbkhbh+"�����󣡡��ط����ڡ�����Ϊ�գ�");
				return;
			}
			else{
				try{
					xchfsj=java.sql.Date.valueOf(xchfsjStr.trim());
				}
				catch (Exception e){
					out.print("<BR>�ͻ���š�"+scbkhbh+"�����󣡻ط����ڡ�"+xchfsjStr+"�������������͸�ʽ��YYYY-MM-DD����");
					return;
				}
			}
		}
		else if (sfxhfStr.trim().equals("��"))
		{
			sfxhf="N";
			xchfsjStr="";
			xchfsj=null;
		}
		else{
			out.print("<BR>�ͻ���š�"+scbkhbh+"�����󣡡��Ƿ���طá�����ȷ��ֻ���ǡ���Ҫ��������֮һ��");
			return;
		}

		if (yyddsjStr==null || yyddsjStr.equals(""))
		{
			yyddsj=null;
		}
		else{
			try{
				yyddsj=java.sql.Date.valueOf(yyddsjStr);
			}
			catch (Exception e){
				out.print("<BR>�ͻ���š�"+scbkhbh+"������ԤԼ����ʱ�䡺"+yyddsjStr+"�������������͸�ʽ��YYYY-MM-DD����");
				return;
			}
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=scbkhbh%> 
        <input name="scbkhbh" type="hidden" value="<%=scbkhbh%>">
      </td>
      <td><%=khxm%> 
        <input name="khxm" type="hidden" value="<%=khxm%>">
      </td>
      <td><%=fwdz%> 
        <input name="fwdz" type="hidden" value="<%=fwdz%>">
      </td>
      <td><%=lxfs%>
        <input name="lxfs" type="hidden" value="<%=lxfs%>" >
      </td>
	  <td><%=ywy%>
        <input name="ywy" type="hidden" value="<%=ywy%>" >
      </td>
	  <td><%=sfxhfStr%>
        <input name="sfxhf" type="hidden" value="<%=sfxhf%>" >
      </td>
	  <td><%=xchfsjStr%>
        <input name="xchfsj" type="hidden" value="<%=xchfsjStr%>" >
      </td>
	  <td><%=sckhyxbmStr%>
        <input name="sckhyxbm" type="hidden" value="<%=sckhyxbm%>" >
      </td>
      <td><%=yyddsjStr%>
        <input name="yyddsj" type="hidden" value="<%=yyddsjStr%>" >
      </td>
 	  <td  align="left"> <%=gzsm%>
        <input name="gzsm" type="hidden" value="<%=gzsm%>" >
      </td>
      </td> 
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	try{
		f.close();
		if (f != null) f.close(); 
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
