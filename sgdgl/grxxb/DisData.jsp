<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String ssfgs = null;
String fgsmc=null;


String[][] outStr=null; 
String bgcolor=null;

String sgd=null;
String sgdmc=null;
String bzmc=null;

String xm=null;
String xb=null;
String jg=null;
String csrq=null;
String gz=null;
String rzsj=null;
String dj=null;
String lx=null;
String sfzh=null;
String dh=null;
String zz=null;
String jjlxr=null;
String jjlxrdh=null;
String jjlxrdz=null;
String pxsm=null;
String sgzbh=null;
String yhk=null;
String _sfqdlwpqht=null;
String sfqdlwpqht=null;
String _sfkstg=null;
String sfkstg=null;

String mark=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ssfgs =up.getParameter("ssfgs");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dwmc" ;
	sql+=" from sq_dwxx " ;
	sql+=" where dwbh='"+ssfgs+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		fgsmc = rs.getString("dwmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>���빤��</p>
    <p><font color="#FF0000">[<%=fgsmc%>]
	<BR>���Ѵ��ڣ�������滻�������������</b></font></p>
  </div>
	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="170%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

	<tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%"><font color="#CC0000">*</font>����ʩ����</td>
      <td width="4%">�೤����</td>
	  <td width="4%"><font color="#CC0000">*</font>����</td>
	  <td width="3%">�Ա�</td>
	  <td width="4%">����</td>
	  <td width="5%">��������</td>
	  <td width="4%"><font color="#CC0000">*</font>����</td>
	  <td width="5%">��ְʱ��</td>
	  <td width="4%">�ȼ�</td>

	  <td width="5%"><font color="#CC0000">*</font>����</td>
      <td width="9%"><font color="#CC0000">*</font>���֤��</td>

      <td width="10%"><font color="#CC0000">*</font>�绰</td>
      <td width="6%"><font color="#CC0000">*</font>סַ</td>
      <td width="4%"><font color="#CC0000">*</font>������ϵ��</td>
      <td width="6%"><font color="#CC0000">*</font>��ϵ�˵绰</td>
      <td width="8%"><font color="#CC0000">*</font>������ϵ�˵�ַ</td>
       <td width="10%"><font color="#CC0000">*</font>��ѵ˵��</td>
       <td width="5%">�ϸ�֤���</td>
	   <td width="10%"><font color="#CC0000">*</font>���п�</td>
       <td width="5%">�Ƿ�ǩ��������ǲ��ͬ</td>
		  <td width="5%">�Ƿ�ͨ������</td>

    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] sgdjbbmStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][2].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		row++;

		sgdmc=outStr[i][0].trim();
		bzmc  =outStr[i][1].trim();

		xm=outStr[i][2].trim();
		xb=outStr[i][3].trim();

		jg=outStr[i][4].trim();

		csrq=outStr[i][5].trim();

		gz=outStr[i][6].trim();
		rzsj=outStr[i][7].trim();

		dj=outStr[i][8].trim();
		lx=outStr[i][9].trim();

		sfzh=outStr[i][10].trim();
		dh=outStr[i][11].trim();

		zz=outStr[i][12].trim();
		jjlxr=outStr[i][13].trim();
		jjlxrdh=outStr[i][14].trim();
		jjlxrdz=outStr[i][15].trim();
		pxsm=outStr[i][16].trim();
		sgzbh=outStr[i][17].trim();
		yhk=outStr[i][18].trim();
		_sfqdlwpqht=outStr[i][19].trim();
		_sfkstg=outStr[i][20].trim();



		mark="";

		if (xm.equals(""))
		{
			out.println("�������к�["+row+"]����[����]Ϊ��");
			return;
		}

		sql=" select sgd" ;
		sql+=" from sq_sgd " ;
		sql+=" where sgdmc='"+sgdmc+"' and ssfgs='"+ssfgs+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgd = rs.getString("sgd");			    
		}
		else{
			out.println("�����������ڵ�[ʩ����]��"+sgdmc);
			return;
		}
		rs.close();
		ps.close();

/*
		sql=" select bzmc" ;
		sql+=" from sq_bzxx " ;
		sql+=" where bzmc ='"+bzmc +"' and sgd='"+sgd+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
		}
		else{
			out.println("�����������ڵ�[�೤]��"+bzmc);
			return;
		}
		rs.close();
		ps.close();
*/
		sql=" select xm" ;
		sql+=" from sq_grxxb " ;
		sql+=" where bzmc ='"+bzmc +"' and sgd='"+sgd+"' and xm='"+xm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			mark="<BR><font color=\"#FF0000\">���Ѵ��ڣ�</font>";
		}
		else{
			mark="";
		}
		rs.close();
		ps.close();


		if (!xb.equals("��") && !xb.equals("Ů"))
		{
			out.println("������["+xm+"]����[�Ա�]ֻ��Ϊ����/�񡿣�ĿǰΪ["+xb+"]");
			return;
		}
		
		if("��".equals(_sfqdlwpqht)){
			sfqdlwpqht="Y";
		}
		else{
			sfqdlwpqht="N";
		}

		if("��".equals(_sfkstg)){
			sfkstg="Y";
		}
		else{
			sfkstg="N";
		}


		if (!gz.equals("ľ��") && !gz.equals("���Ṥ") && !gz.equals("�߹�") && !gz.equals("ˮ�繤") && !gz.equals("�ӹ�"))//ľ����ˮ�繤�����Ṥ���߹����ӹ�
		{
			out.println("�������೤["+bzmc+"]����[����]ֻ��Ϊ��ľ��/ˮ�繤/���Ṥ/�߹�/�ӹ�����ĿǰΪ["+gz+"]");
			return;
		}


		if (!lx.equals("��ʱ") && !lx.equals("����"))
		{
			out.println("<BR>������["+xm+"]����[����]ֻ��Ϊ������/��ʱ����ĿǰΪ["+lx+"]");
//			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=sgdmc%> 
        <input name="sgd" type="hidden" value="<%=sgd%>">
      </td>
      <td><%=bzmc%> 
        <input name="bzmc" type="hidden" value="<%=bzmc%>">
      </td>
      <td><%=xm%><%=mark%>
        <input name="xm" type="hidden" value="<%=xm%>" >
      </td>
	  <td><%=xb%>
        <input name="xb" type="hidden" value="<%=xb%>" >
      </td>
	  <td><%=jg%>
        <input name="jg" type="hidden" value="<%=jg%>" >
      </td>
	  <td><%=csrq%>
        <input name="csrq" type="hidden" value="<%=csrq%>" >
      </td>
      <td> <%=gz%>
        <input name="gz" type="hidden" value="<%=gz%>" >
      </td>
      <td> <%=rzsj%>
        <input name="rzsj" type="hidden" value="<%=rzsj%>" >
      </td>
      <td> <%=dj%> 
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td ><%=lx%>
        <input name="lx" type="hidden" value="<%=lx%>" >
      </td>
      <td ><%=sfzh%>
        <input name="sfzh" type="hidden" value="<%=sfzh%>" >
      </td>
      <td ><%=dh%>
        <input name="dh" type="hidden" value="<%=dh%>" >
      </td>
      <td ><%=zz%>
        <input name="zz" type="hidden" value="<%=zz%>" >
      </td>
      <td ><%=jjlxr%>
        <input name="jjlxr" type="hidden" value="<%=jjlxr%>" >
      </td>
      <td ><%=jjlxrdh%>
        <input name="jjlxrdh" type="hidden" value="<%=jjlxrdh%>" >
      </td>
      <td ><%=jjlxrdz%>
        <input name="jjlxrdz" type="hidden" value="<%=jjlxrdz%>" >
      </td>
      <td ><%=pxsm%>
        <input name="pxsm" type="hidden" value="<%=pxsm%>" >
      </td>
      <td ><%=sgzbh%>
        <input name="sgzbh" type="hidden" value="<%=sgzbh%>" >
      </td>
	  <td ><%=yhk%>
        <input name="yhk" type="hidden" value="<%=yhk%>" >
      </td>
	  <td ><%=_sfqdlwpqht%>
        <input name="sfqdlwpqht" type="hidden" value="<%=sfqdlwpqht%>" >
      </td>
	<td ><%=_sfkstg%>
        <input name="sfkstg" type="hidden" value="<%=sfkstg%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	out.print("<BR>SQL=" + sql);
	out.print("<BR>bzmc =" + bzmc );
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
        <input type="button"  value="����" onClick="f_do(editform)">
      ��������Ŀ����<%=row%>
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
