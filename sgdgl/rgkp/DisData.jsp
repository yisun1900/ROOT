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

String yhdlm=(String)session.getAttribute("yhdlm");

String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String kpjlh=null;

String fgsbh =null;
String sgd =null;
String sgdmc =null;
String gcjxjestr =null;
String gcjxdfstr =null;
String phjcdfstr =null;
String tsgxdfstr =null;

double gcjxje=0;
int gcjxdf=0;
int phjcdf=0;
int tsgxdf=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;
String[][] outStr=null; 
String bgcolor=null;

String dwmc=null;

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	kpjlh =up.getParameter("kpjlh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	ls_sql=" SELECT dwmc,kp_pdkpjl.fgsbh ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx ";
	ls_sql+=" where kp_pdkpjl.fgsbh=sq_dwxx.dwbh and kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">�ɵ������˹���֣�<%=dwmc%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="6" > 
		<input type="hidden" name="kpjlh" value="<%=kpjlh%>">
        <input type="button"  value="����" onClick="f_do(editform)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset"  value="����">
    </tr>
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="5%"> <b>���</b></td>
      <td width="15%"><b>ʩ����</b></td>
      <td width="20%"><b>���̼�����</b></td>
      <td width="15%"><b>���̼���÷�<BR>
        ��<font color="#0000CC">����������12</font>��</b></td>
      <td width="15%"><b>��ϼ��ɵ÷�<BR>
        ��<font color="#0000CC">����������10</font>��</b></td>
      <td width="15%"><b>���⹱�׵÷�<BR>
        ��<font color="#0000CC">����������10</font>��</b></td>

    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 

	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}

		sgdmc=outStr[i][0].trim();
		gcjxjestr=outStr[i][1].trim();
		gcjxdfstr=outStr[i][2].trim();
		phjcdfstr=outStr[i][3].trim();
		tsgxdfstr=outStr[i][4].trim();
		if (gcjxdfstr.endsWith(".0"))
		{
			gcjxdfstr=gcjxdfstr.substring(0,gcjxdfstr.length()-2);
		}
		if (phjcdfstr.endsWith(".0"))
		{
			phjcdfstr=phjcdfstr.substring(0,phjcdfstr.length()-2);
		}
		if (tsgxdfstr.endsWith(".0"))
		{
			tsgxdfstr=tsgxdfstr.substring(0,tsgxdfstr.length()-2);
		}

		ls_sql=" select sgd" ;
		ls_sql+=" from sq_sgd " ;
		ls_sql+=" where sgdmc='"+sgdmc+"' and ssfgs='"+fgsbh+"' and cxbz='N'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgd = rs.getString("sgd");			    
		}
		else{
			sgd="";
			out.println("<BR>����[ʩ���ӣ�"+sgdmc+"]������");
		}
		rs.close();
		ps.close();

		int count=0;
		ls_sql=" select count(*)" ;
		ls_sql+=" from sq_sgd " ;
		ls_sql+=" where sgdmc='"+sgdmc+"' and ssfgs='"+fgsbh+"' and cxbz='N'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			sgd="";
			out.println("<BR>����[ʩ���ӣ�"+sgdmc+"]�ж��");
		}



		if (!gcjxjestr.equals(""))
		{
			try{
				gcjxje=Double.parseDouble(gcjxjestr);
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����̼�������벻��ȷ:"+gcjxjestr);
			}
		}

		if (!gcjxdfstr.equals(""))
		{
			try{
				gcjxdf=Integer.parseInt(gcjxdfstr);

				if (gcjxdf<0 || gcjxdf>12)
				{
					out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����̼���÷֡�ֻ��λ��0��12֮��");
				}
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����̼���÷֡����벻��ȷ:"+gcjxdfstr);
			}
		}

		if (!phjcdfstr.equals(""))
		{
			try{
				phjcdf=Integer.parseInt(phjcdfstr);

				if (phjcdf<0 || phjcdf>10)
				{
					out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡���ϼ��ɵ÷֡�ֻ��λ��0��10֮��");
				}
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡���ϼ��ɵ÷֡����벻��ȷ:"+phjcdfstr);
			}
		}

		if (!tsgxdfstr.equals(""))
		{
			try{
				tsgxdf=Integer.parseInt(tsgxdfstr);

				if (tsgxdf<0 || tsgxdf>10)
				{
					out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����⹱�׵÷֡�ֻ��λ��0��10֮��");
				}
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����⹱�׵÷֡����벻��ȷ:"+tsgxdfstr);
			}
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=row%></td>
      <td ><%=sgdmc%> 
          <input type="hidden" name="sgd" value="<%=sgd%>">
          <input type="hidden" name="sgdmc" value="<%=sgdmc%>">
      </td>
      <td> 
        <input type="text" name="gcjxje" size="13" maxlength="13" value="<%=gcjxjestr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gcjxdf[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="gcjxdf" size="13" maxlength="13" value="<%=gcjxdfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(phjcdf[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="phjcdf" size="13" maxlength="13" value="<%=phjcdfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(tsgxdf[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="tsgxdf" size="13" maxlength="13" value="<%=tsgxdfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gcjxje[<%=row%>])">
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="6" > 
        <input type="button"  value="����" onClick="f_do(editform)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset"  value="����">
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
