<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����µ�Ա������</title>

</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">

<%

ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;



String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String fgsmc=null;
String fgsbh = null;
String dwmc=null;
String dwbh = null;
String bianhao=null;
String yhmc=null;
String xbmc=null;
String xb=null;
String sfzh=null;
String xzzwbm=null;
String zwbm=null;
String bjjb=null;
String bjjbbm=null;
String bgdh=null;
String nxdh=null;
String wxdh=null;
String dh=null;
String email=null;
String csrq=null;
String rzsj=null;
String hjszd=null;
String xlbm=null;
String xlmc=null;
String zy=null;

String ls=null;

String dqbm="";



int count=0;
int k=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\rs\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();
	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">�����µ�Ա������</div>
  <table width="180%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="6%">������˾</td>
	  <td width="8%">��������</td>
      <td width="4%">����</td>
      <td width="4%">����</td>
	  <td width="3%">�Ա�</td>
      <td width="9%">���֤��</td>
      <td width="5%">ְλ</td>
      <td width="4%">���ۼ���</td>
      <td width="8%">����</td>
      <td width="8%">����</td>
      <td width="8%">�ƶ��绰</td>
	  <td width="8%">����</td>
	  <td width="4%">��������</td>
	  <td width="4%">��ְ����</td>
	  <td width="6%">�������ڵ�</td>
	  <td width="5%">�Ļ��̶�</td>
	  <td width="10%">��ѧרҵ</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
		k=i;
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}

		int len=outStr[i].length;
		if (len<17)
		{
			out.println("�����������µ�Excelģ��:"+len);
			return;
		}


		fgsmc=outStr[i][0].trim();
		dwmc=outStr[i][1].trim();

		bianhao=outStr[i][2].trim();
		yhmc=outStr[i][3].trim();
		xbmc=outStr[i][4].trim();
		sfzh=outStr[i][5].trim();
		xzzwbm=outStr[i][6].trim();

		bjjb=outStr[i][7].trim();
		wxdh=outStr[i][8].trim();
		nxdh=outStr[i][9].trim();
		dh=outStr[i][10].trim();
		email=outStr[i][11].trim();
		csrq=outStr[i][12].trim();
		rzsj=outStr[i][13].trim();
		hjszd=outStr[i][14].trim();
		xlmc=outStr[i][15].trim();
		zy=outStr[i][16].trim();


		if (!csrq.equals(""))
		{
			java.sql.Date.valueOf(csrq);
		}
		if (!rzsj.equals(""))
		{
			java.sql.Date.valueOf(rzsj);
		}

		if (yhmc.equals(""))
		{
			out.println("<BR>���������["+i+"]����[����]����Ϊ��");
			return;
		}

		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+fgsmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			fgsbh = rs.getString(1);			    
		}
		else{
			rs.close();
			ps.close();
			out.println("<BR>���������["+i+"]����[������˾]������:"+fgsmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+dwmc+"' and ssfgs='"+fgsbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			dwbh = rs.getString(1);			    
		}
		else{
			rs.close();
			ps.close();
			out.println("<BR>���������["+i+"]����[��������]������:"+dwmc);
			return;
		}
		rs.close();
		ps.close();

		xb="";
		if (!xbmc.equals(""))
		{
			if (xbmc.equals("��"))
			{
				xb="M";
			}
			else if (xbmc.equals("Ů"))
			{
				xb="W";
			}
			else{
				out.println("<BR>���������["+i+"]����[�Ա�]ֻ�����С�Ů��"+xbmc);
				return;
			}
		}

		sql=" select gzbm" ;
		sql+=" from dm_xzzwbm " ;
		sql+=" where xzzwmc='"+xzzwbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			zwbm = rs.getString(1);			    
		}
		else{
			rs.close();
			ps.close();
			out.println("<BR>���������["+i+"]����[ְλ]�����ڣ�"+xzzwbm);
			return;
		}
		rs.close();
		ps.close();

		bjjbbm="";
		if (!bjjb.equals(""))
		{
			sql=" select bjjbbm" ;
			sql+=" from bdm_bjjbbm " ;
			sql+=" where bjjbmc='"+bjjb+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				bjjbbm = rs.getString(1);			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>���������["+i+"]����[���ۼ���]�����ڣ�"+bjjb);
				return;
			}
			rs.close();
			ps.close();
		}

		xlbm="";
		if (!xlmc.equals(""))
		{
			sql=" select xlbm" ;
			sql+=" from dm_xlbm " ;
			sql+=" where xueli='"+xlmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				xlbm = rs.getString(1);			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>���������["+i+"]����[�Ļ��̶�]�����ڣ�"+xlmc);
				return;
			}
			rs.close();
			ps.close();
		}
%> 

	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fgsmc%> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
      </td>
      <td><%=dwmc%> 
        <input name="dwbh" type="hidden" value="<%=dwbh%>">
      </td>
      <td><%=bianhao%> 
        <input name="bianhao" type="hidden" value="<%=bianhao%>">
      </td>
      <td><%=yhmc%> 
        <input name="yhmc" type="hidden" value="<%=yhmc%>">
      </td>
      <td><%=xbmc%>
	   <input name="xb" type="hidden" value="<%=xb%>">
      </td>
     
 
      <td><%=sfzh%>
	   <input name="sfzh" type="hidden" value="<%=sfzh%>">
      </td>
       <td><%=xzzwbm%>
	   <input name="xzzwbm" type="hidden" value="<%=xzzwbm%>">
	   <input name="zwbm" type="hidden" value="<%=zwbm%>">
      </td> 
	  <td><%=bjjb%>
	   <input name="bjjb" type="hidden" value="<%=bjjb%>">
	   <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>">
      </td>
	  <td><%=nxdh%>
	   <input name="nxdh" type="hidden" value="<%=nxdh%>">
      </td>
	  <td><%=wxdh%>
	   <input name="wxdh" type="hidden" value="<%=wxdh%>">
      </td>
		
	   <td><%=dh%>
	   <input name="dh" type="hidden" value="<%=dh%>">
      </td>
	   <td><%=email%>
	   <input name="email" type="hidden" value="<%=email%>">
      </td>
	  <td><%=csrq%>
	   <input name="csrq" type="hidden" value="<%=csrq%>">
      </td>
	  <td><%=rzsj%>
	   <input name="rzsj" type="hidden" value="<%=rzsj%>">
      </td>
	  <td><%=hjszd%>
	   <input name="hjszd" type="hidden" value="<%=hjszd%>">
      </td>
	  <td><%=xlmc%>
	   <input name="xlbm" type="hidden" value="<%=xlbm%>">
      </td>
	  <td><%=zy%>
	   <input name="zy" type="hidden" value="<%=zy%>">
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("���["+k+"]����" + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	try{
		f.close();
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
        <input type="button"  value="����" name="bc" onClick="f_do(editform)">
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
