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
String sgdlx=null;
String bqpmstr =null;
String bqdfstr =null;
String sgdjbmc =null;
String bqjdzestr =null;
String bqddestr =null;
String bqzdestr =null;
String bqxdestr =null;

int bqpm=0;
int bqdf=0;
String sgdjbbm =null;
double bqjdze=0;
double bqdde=0;
double bqzde=0;
double bqxde=0;

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
<div align="center">ʩ���ӿ�����ʼ����<%=dwmc%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="10" > 
		<input type="hidden" name="kpjlh" value="<%=kpjlh%>">
        <input type="button"  value="����" onClick="f_do(editform)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset"  value="����">
    </tr>
    <tr bgcolor="CCCCCC" align="center"> 
      <td width="5%"> <b>���</b></td>
      <td width="8%"><b>ʩ����</b></td>
      <td width="7%"><b>ʩ��������</b></td>
      <td width="9%"><b>��������</b></td>
      <td width="9%"><b>���ڵ÷�</b></td>
      <td width="10%"><b>ʩ���Ӽ���</b></td>
      <td width="13%"><b>���ڽӵ��ܶ�</b></td>
      <td width="13%"><b>���ڴ󵥶�</b></td>
      <td width="13%"><b>�����е���</b></td>
      <td width="13%"><b>����С����</b></td>

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
		sgdlx=outStr[i][1].trim();
		bqpmstr=outStr[i][2].trim();
		bqdfstr=outStr[i][3].trim();
		sgdjbmc=outStr[i][4].trim();
		bqjdzestr=outStr[i][5].trim();
		bqddestr=outStr[i][6].trim();
		bqzdestr=outStr[i][7].trim();
		bqxdestr=outStr[i][8].trim();

		if (bqpmstr.endsWith(".0"))
		{
			bqpmstr=bqpmstr.substring(0,bqpmstr.length()-2);
		}
		if (bqdfstr.endsWith(".0"))
		{
			bqdfstr=bqdfstr.substring(0,bqdfstr.length()-2);
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


		if (!bqpmstr.equals(""))
		{
			try{
				bqpm=Integer.parseInt(bqpmstr);
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡��������������벻��ȷ:"+bqpmstr);
			}
		}

		if (!bqdfstr.equals(""))
		{
			try{
				bqdf=Integer.parseInt(bqdfstr);

				if (bqdf<0 || bqdf>110)
				{
					out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����ڵ÷֡�ֻ��λ��0��110֮��");
				}
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����ڵ÷֡����벻��ȷ:"+bqdfstr);
			}
		}


		ls_sql=" select sgdjbbm" ;
		ls_sql+=" from sq_sgdjbbm " ;
		ls_sql+=" where sgdjbmc='"+sgdjbmc+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgdjbbm = rs.getString("sgdjbbm");			    
		}
		else{
			sgdjbbm="";
			out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡�ʩ���Ӽ��𡿲���ȷ��["+sgdjbmc+"]");
		}
		rs.close();
		ps.close();
		

		if (!bqddestr.equals(""))
		{
			try{
				bqdde=Double.parseDouble(bqddestr);
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����ڴ󵥶���벻��ȷ:"+bqddestr);
			}
		}

		if (!bqjdzestr.equals(""))
		{
			try{
				bqjdze=Double.parseDouble(bqjdzestr);
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡����ڽӵ��ܶ���벻��ȷ:"+bqjdzestr);
			}
		}

		if (!bqzdestr.equals(""))
		{
			try{
				bqzde=Double.parseDouble(bqzdestr);
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡������е�����벻��ȷ:"+bqzdestr);
			}
		}

		if (!bqxdestr.equals(""))
		{
			try{
				bqxde=Double.parseDouble(bqxdestr);
			}
			catch (Exception e){
				out.println("<BR>[ʩ���ӣ�"+sgdmc+"]���󣡡�����С������벻��ȷ:"+bqxdestr);
			}
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=row%></td>
      <td ><%=sgdmc%> 
          <input type="hidden" name="sgd" value="<%=sgd%>">
          <input type="hidden" name="sgdmc" value="<%=sgdmc%>">
      </td>
      <td ><%=sgdlx%></td>
      <td> 
        <input type="text" name="bqpm" size="6" maxlength="6" value="<%=bqpmstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bqdf[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="bqdf" size="6" maxlength="6" value="<%=bqdfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bqjdze[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="sgdjbmc" size="8" maxlength="8" value="<%=sgdjbmc%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bqdde[<%=(row-1)%>])">
      </td>
      <td > 
        <input type="text" name="bqjdze" size="12" maxlength="13" value="<%=bqjdzestr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bqpm[<%=row%>])">
      </td>
      <td > 
        <input type="text" name="bqdde" size="12" maxlength="13" value="<%=bqddestr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bqpm[<%=row%>])">
      </td>
      <td > 
        <input type="text" name="bqzde" size="12" maxlength="13" value="<%=bqzdestr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bqpm[<%=row%>])">
      </td>
      <td > 
        <input type="text" name="bqxde" size="12" maxlength="13" value="<%=bqxdestr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bqpm[<%=row%>])">
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
      <td colspan="10" > 
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
